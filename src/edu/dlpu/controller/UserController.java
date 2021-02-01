package edu.dlpu.controller;

import java.io.FileOutputStream;
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
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.dlpu.bean.User;
import edu.dlpu.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	// 注册用户（非全字段）
	@RequestMapping("/addUser.action")
	public String insertUserSimple(HttpServletRequest request) {
		String userName = request.getParameter("userName");
		String userPasswd = request.getParameter("userPasswd");
		String stuNumber = request.getParameter("stuNumber");
		User user = new User();
		user.setUserName(userName);
		// user.setUserPasswd(userPasswd);
		user.setUserPasswd(DigestUtils.md5DigestAsHex(userPasswd.getBytes()));
		user.setStuNumber(stuNumber);
		userService.insertUserSimpleService(user);

		return "FE_login";
	}

	// 登录用户
	@RequestMapping("/loginUser.action")
	public String userLogin(HttpServletRequest request, Model model) {
		// 获得前端带来的用户/密码
		String userName = request.getParameter("userName");
		String userPasswd = request.getParameter("userPasswd");
		System.out.println(userName);
		System.out.println(userPasswd);
		// 把密码转换位MD5进行比对
		userPasswd = DigestUtils.md5DigestAsHex(userPasswd.getBytes());
		// 数据库查询所有用户进行比对
		ArrayList<User> allUser = userService.selectAllUserService();
		for (User user : allUser) {
			while (user.getUserName().equals(userName) && user.getUserPasswd().equals(userPasswd)) {
//				System.out.println("==========" + userName);
//				System.out.println("==========" + userPasswd);
				// 设置用户状态、id、头像、用户名（前端使用）
				HttpSession session = request.getSession();
				session.setAttribute("loginState", "true");
				session.setAttribute("User", user);
				return "FE_index";
			}
			// model.addAttribute("message", "出错啦！");
		}
		return "FE_login";
	}

	// 重置密码
	@RequestMapping("/forgetPasswd.action")
	public String forgetPasswd(HttpServletRequest request) {
		// 获取用户信息
		String userName = request.getParameter("userName");
		String code = request.getParameter("code");
		String rePassword = request.getParameter("rePassword");
		// 把密码转换位MD5进行比对
		rePassword = DigestUtils.md5DigestAsHex(rePassword.getBytes());
//		System.out.println(rePassword);
		// 数据库查询所有用户进行比对
		ArrayList<User> allUser = userService.selectAllUserService();
		for (User user : allUser) {
			if (user.getUserName().equals(userName) && user.getStuNumber().equals(code)) {
				// 修改密码
				Integer id = user.getUserId();
				user.setUserId(id);
				user.setUserPasswd(rePassword);
//				System.out.println(id +"----"+ rePassword);
				userService.updateUserInfoService(user);
			}
			// model.addAttribute("message", "用户不存在或学号/工号不正确！");
		}
		return "FE_login";
	}

	// 用户退出（只用把session的状态改了，把session中的账户清理就好）
	@RequestMapping("/logoutUser.action")
	public String logoutUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginState");
		session.removeAttribute("User");
		return "FE_index";
	}

	// 用户更新个人信息之查询
	@RequestMapping("/selectUserInfo.action")
	public String selectUserInfo() {
		// 由于用户登录时，User的数据就存在session中了，所以不用写查询语句，直接转发页面就好
		return "FE_user_info";
	}

	// 用户更新数据（多部件实现）
	// 重用动态SQL代码
	@RequestMapping("/updateUserInfo.action")
	public String updateUserInfo(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List<FileItem> items = upload.parseRequest(request);
			System.out.println(items.size());
			// System.out.println(items);
			parseUserFormItems(items, request);
			// 文件上传完成以后，还要去查询显示
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "FE_index";
	}

	// 解析用户修改信息的表单（多部件）
	private void parseUserFormItems(List<FileItem> items, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		User user = new User();
		int count = 1;
		String name = null, value = null;
		for (FileItem fileItem : items) {
			// 判断当前是普通表单项还是文件项
			if (fileItem.isFormField()) {
				System.out.println("解析到第" + (count++) + "个表单项");
				name = fileItem.getFieldName();
				System.out.println("表单提交的key：" + fileItem.getFieldName());
				value = fileItem.getString();
				value = new String(value.getBytes("iso8859-1"), "utf-8");
				System.out.println("表单提交的value：" + fileItem.getString());
				if (name.equals("userId")) {
					int temp = Integer.parseInt(value);
					user.setUserId(temp);
				}
				if (name.equals("userName"))
					user.setUserName(value);
				if (name.equals("userGender"))
					user.setUserGender(value);
				if (name.equals("userType"))
					user.setUserType(value);
				if (name.equals("userCollege"))
					user.setUserCollege(value);
				if (name.equals("stuNumber"))
					user.setStuNumber(value);
				if (name.equals("userPhone"))
					user.setUserPhone(value);
				if (name.equals("userEmail"))
					user.setUserEmail(value);
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
//				String[] split = fileName.split("\\");
//				fileName = split[split.length - 1];
				int lastIndexOf = fileName.lastIndexOf("\\");
				fileName = fileName.substring(lastIndexOf + 1);
				// 【3.】防止同名文件覆盖；可以给文件名加UUID
				fileName = UUID.randomUUID().toString().replace("-", "") + fileName;
				System.out.println("文件名:" + fileName);

				// 将文件名存储在数据库对应列中
				if (name.equals("userIcon") && name != null)
					user.setUserIcon(fileName);
				// 如果有多个文件项目，可以追加

				FileOutputStream outputStream = new FileOutputStream(realPath + "/" + fileName);

				IOUtils.copy(inputStream, outputStream);
				outputStream.close();
				inputStream.close();

			}
		}
		// 调用service层更新数据
		userService.updateUserInfoService(user);
		// 重写session（User个人数据刷新）
		HttpSession session = request.getSession();
		session.setAttribute("User", user);
	}

}
