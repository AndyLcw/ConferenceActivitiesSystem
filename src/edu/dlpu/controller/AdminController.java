package edu.dlpu.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;

import edu.dlpu.bean.Admin;
import edu.dlpu.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	// 管理员登录
	@RequestMapping("adminLogin.action")
	public String adminLogin(HttpServletRequest request) {
		// 获取前端输入数据
		String adminName = request.getParameter("adminName");
		String adminPasswd = request.getParameter("adminPasswd");
		// 获得所有管理员
		ArrayList<Admin> allAdmin = adminService.selectAllAdminService();
		// 数据比对
		for (Admin admin : allAdmin) {
			if (admin.getAdminName().equals(adminName) && admin.getAdminPasswd().equals(adminPasswd)) {
				// 将管理员信息放在session中，提供使用
				HttpSession session = request.getSession();
				session.setAttribute("Admin", admin);
				return "BE_index";
			}
			// 这里可以设置提示字段
		}
		return "BE_login";
	}

	// 修改管理员密码
	@RequestMapping("/updateAdmin.action")
	public String updateAdminInfo(HttpServletRequest request, Model model) throws IOException {

		// 获取前端带来的数据（多部件）
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List<FileItem> items = upload.parseRequest(request);
			parseFileItems(items, request);
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("Message", "修改管理员信息成功，请重新登录！");
		return "BE_admin_info";
	}

	// 解析多部件的表单项目
	private void parseFileItems(List<FileItem> items, HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("UTF-8");
		Admin admin = new Admin();
		int count = 1;
		String name = null, value = null;
		String oldPasswd = null, newPasswd = null, adminIcon = null;
		for (FileItem fileItem : items) {
			// 判断当前是普通表单项还是文件项
			if (fileItem.isFormField()) {
				System.out.println("解析到第" + (count++) + "个表单项");
				name = fileItem.getFieldName();
				System.out.println("表单提交的key：" + fileItem.getFieldName());
				value = fileItem.getString();
				value = new String(value.getBytes("iso8859-1"), "utf-8");
				System.out.println("表单提交的value：" + fileItem.getString());
				if (name.equals("mpass"))
					oldPasswd = value;
				if (name.equals("newpass"))
					newPasswd = value;
			} else {
				System.out.println("解析到第" + (count++) + "个文件项");
				name = fileItem.getFieldName();
				System.out.println("表单提交的key：" + fileItem.getFieldName());
				System.out.println("上传的文件名：" + fileItem.getName());
				System.out.println("文件信息：大小【" + fileItem.getSize() + "】字节");
				// 获取到文件流并保存到当前项目项的pics中
				InputStream inputStream = fileItem.getInputStream();
				// 应该是动态网站的路径：tomcat镜像位置
				// 当前工作空间\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\ConferenceActivitiesSystem
				// new FileOutputStream(file);
				// 【1.】获取某个文件或者文件夹在服务器中真正的位置；
				// 一个项目对应一个SevletContext
				ServletContext servletContext = request.getServletContext();
				// /pics/xxx.jpg
				String realPath = servletContext.getRealPath("/pics");
				System.out.println("真实路径：" + realPath);
				String fileName = fileItem.getName();
				// 控制台输出文件名（测试Edge浏览器）
				// 【2.】Edge获取的文件是带路径的
				int lastIndexOf = fileName.lastIndexOf("\\");
				fileName = fileName.substring(lastIndexOf + 1);
				// 【3.】防止同名文件覆盖；可以给文件名加UUID
				fileName = UUID.randomUUID().toString().replace("-", "") + fileName;
				System.out.println("文件名:" + fileName);

				// 将文件名存储在数据库对应列中
				if (name.equals("adminIcon") && name != null)
					adminIcon = fileName;
				// 如果有多个文件项目，可以追加

				FileOutputStream outputStream = new FileOutputStream(realPath + "/" + fileName);

				IOUtils.copy(inputStream, outputStream);
				outputStream.close();
				inputStream.close();

				//ImgUtils.addImgPath("/pics/" + fileName);
			}
		}
		// 把session中的adminId、原始密码取出来
		HttpSession session = request.getSession();
		Object object = session.getAttribute("Admin");
		ObjectMapper objectMapper = new ObjectMapper();
		Admin ad = objectMapper.convertValue(object, Admin.class);
		Integer adminId = ad.getAdminId();
		String passwd = ad.getAdminPasswd();
		if (passwd.equals(oldPasswd)) {
			System.out.println("正常更改管理员密码！！！");
			admin.setAdminId(adminId);
			admin.setAdminPasswd(newPasswd);
			admin.setAdminIcon(adminIcon);
			adminService.updateAdminService(admin);
		} else {
			System.out.println("原始密码不正确！！！");
		}
	}

	// 用户退出（session中的账户清理就好）
	@RequestMapping("/logoutAdmin.action")
	public String logoutAdmin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("Admin");
		// 测试是否移除了session
		Object object = session.getAttribute("Admin");
		ObjectMapper objectMapper = new ObjectMapper();
		Admin ad = objectMapper.convertValue(object, Admin.class);
		System.out.println("测试移除session=======》》》" + ad);
		return "BE_login";
	}

}
