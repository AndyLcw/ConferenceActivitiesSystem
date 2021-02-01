package edu.dlpu.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
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
import edu.dlpu.bean.Conference;
import edu.dlpu.bean.User;
import edu.dlpu.service.ConferenceService;

@Controller
public class ConferenceController {

	@Autowired
	private ConferenceService conferenceService;

	// 跳转到前端首页面（FE_index.jsp）
	/**
	 * 跳转页面的时候，需要先将公用的数据先放在Session中 1.会议活动信息（这里的和后端的不一样，前端是分类查询，需要重写查询语句）
	 * 
	 */
	@RequestMapping("/jumpTo_FE_index.action")
	public String jumpToFE_index(HttpServletRequest request) {
		String confType = "学术会议";
		ArrayList<Conference> confTypeSchool = conferenceService.selectConferenceByTypeService(confType);
		// 测试取出来没有
		System.out.println("==================>" + confTypeSchool);
		// 将学术会议类型放在Session中，供页面显示
		HttpSession session = request.getSession();
		session.setAttribute("ConfTypeSchool", confTypeSchool);
		confType = "教务活动";
		ArrayList<Conference> confTypeEducation = conferenceService.selectConferenceByTypeService(confType);
		// 将教务活动类型放在Session中，供页面显示
		session.setAttribute("ConfTypeEducation", confTypeEducation);
		confType = "校园生活";
		ArrayList<Conference> confTypeLife = conferenceService.selectConferenceByTypeService(confType);
		// 将校园生活类型放在Session中，供页面显示
		session.setAttribute("ConfTypeLife", confTypeLife);
		confType = "其他";
		ArrayList<Conference> confTypeOther = conferenceService.selectConferenceByTypeService(confType);
		// 将教务活动类型放在Session中，供页面显示
		session.setAttribute("ConfTypeOther", confTypeOther);
		return "FE_index";
	}

	// 添加会议活动（多部件）
	@RequestMapping("/insertConference.action")
	public String insertConferenceController(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("UTF-8");
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		System.out.println("=======>>>" + isMultipart);
		// 导包：使用commons-fileupload.jar
		// 预解析
		// 创建一个FileItem的工厂（创造对象）
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 创建一个ServletFileUpload
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 把文件上传请求解析后形成一个fileItem的list
		// 一个FileItem就是代表一个表单项的详细信息
		try {
			List<FileItem> items = upload.parseRequest(request);
			System.out.println(items.size());
			// System.out.println(items);
			int option = 111;
			readFileItems(items, request, option);
			// 文件上传完成以后，还要去查询显示
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:jumpTo_BE_conference.action";
	}

	// 解析readFileItems
	public void readFileItems(List<FileItem> items, HttpServletRequest request, int option) throws IOException {
		request.setCharacterEncoding("UTF-8");
		Conference conf = new Conference();
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
				if (name.equals("confId")) {
					int temp = Integer.parseInt(value);
					System.out.println("======》》》修改获取到了confId");
					conf.setConfId(temp);
				}
				if (name.equals("confName"))
					conf.setConfName(value);
				if (name.equals("confPerson"))
					conf.setConfPerson(value);
				if (name.equals("confTime"))
					conf.setConfTime(value);
				if (name.equals("confLocation"))
					conf.setConfLocation(value);
				if (name.equals("confLength"))
					conf.setConfLength(value);
				if (name.equals("confMaxPerson")) {
					int val = Integer.parseInt(value);
					conf.setConfMaxPerson(val);
				}
				if (name.equals("confDevice"))
					conf.setConfDevice(value);
				if (name.equals("confType"))
					conf.setConfType(value);
				if (name.equals("confIntro"))
					conf.setConfIntro(value);
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
				if (name.equals("confLocationImg") && name != null)
					conf.setConfLocationImg(fileName);
				// 如果有多个文件项目，可以追加

				FileOutputStream outputStream = new FileOutputStream(realPath + "/" + fileName);

				IOUtils.copy(inputStream, outputStream);
				outputStream.close();
				inputStream.close();

				// ImgUtils.addImgPath("/pics/" + fileName);
			}
		}
		// 把管理员id存进去（session）
		HttpSession session = request.getSession();
		Object object2 = session.getAttribute("Admin");
		// 利用 com.fasterxml.jackson.databind.ObjectMapper 包下的
		// convertValue方法可将对象转换为对应的实体类对象
		ObjectMapper objectMapper = new ObjectMapper();
		Admin admin = objectMapper.convertValue(object2, Admin.class);
		Integer adminId = admin.getAdminId();
		conf.setAdminId(adminId);
		// 添加选项option（int）：111为插入，222为更新
		// 调用Service
		if (option == 111) {
			conferenceService.insertConferenceService(conf);
		}
		if (option == 222) {
			conferenceService.updateConferenceByIdService(conf);
		}
	}

	// 查询所有会议活动
	@RequestMapping("/jumpTo_BE_conference.action")
	public String selectAllConference(HttpServletRequest request) {
		// 代码复用
		putAllConferenceToSession(request);
		return "BE_conference";
	}

	private void putAllConferenceToSession(HttpServletRequest request) {
		// TODO Auto-generated method stub
		ArrayList<Conference> allConference = conferenceService.selectAllConferenceService();
		// 由于在其他页面还会用到该数据，所有放在Session中
		HttpSession session = request.getSession();
		session.setAttribute("AllConference", allConference);
		// model.addAttribute("AllConference", allConference);
		System.out.println("=============>>>" + allConference);
	}

	// 修改会议活动之查询
	@RequestMapping("/jumpTo_BE_conference_update.action")
	public String selectConferenceById(HttpServletRequest request, Model model) {
		// 获取jsp带来的修改会议活动ID号
		int confId = Integer.parseInt(request.getParameter("confId"));
		// 取出Session中的管理员id
		int adminId = getAdminIdInSession(request, confId);
		// 查询admin_conference表，对比是否为创建者
		int returnAdminId = conferenceService.selectAdminByConfIdService(confId);
		System.out.println("==========》返回的管理员id：" + returnAdminId);
		if (returnAdminId == adminId) {
			Conference conference = conferenceService.selectConferenceByIdService(confId);
			// 由于数据只用一次，放在Model中，刷新数据就不存在了
			model.addAttribute("Conference", conference);
			return "BE_conference_update";
		}
		model.addAttribute("Message", "非该会议活动创建者，不可更改！");
		return "BE_conference";
	}

	private int getAdminIdInSession(HttpServletRequest request, int confId) {
		HttpSession session = request.getSession();
		Object object = session.getAttribute("Admin");
		// 利用 com.fasterxml.jackson.databind.ObjectMapper 包下的
		// convertValue方法可将对象转换为对应的实体类对象
		ObjectMapper objectMapper = new ObjectMapper();
		Admin admin = objectMapper.convertValue(object, Admin.class);
		Integer adminId = admin.getAdminId();

		return adminId;
	}

	// 修改会议活动记录
	@RequestMapping("/updateConferenceById.action")
	public String updateConferenceById(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("UTF-8");
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		System.out.println("=======>>>" + isMultipart);
		// 导包：使用commons-fileupload.jar
		// 预解析
		// 创建一个FileItem的工厂（创造对象）
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 创建一个ServletFileUpload
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 把文件上传请求解析后形成一个fileItem的list
		// 一个FileItem就是代表一个表单项的详细信息
		try {
			List<FileItem> items = upload.parseRequest(request);
			System.out.println(items.size());
			// System.out.println(items);
			int option = 222;
			readFileItems(items, request, option);
			// 文件上传完成以后，还要去查询显示
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:jumpTo_BE_conference.action";
	}

	// 删除会议活动记录
	@RequestMapping("/deleteConferenceById.action")
	public String deleteConferenceById(HttpServletRequest request, Model model) {
		// 获取jsp带来的会议活动id
		int confId = Integer.parseInt(request.getParameter("confId"));
		// 取出Session中的管理员id
		int adminId = getAdminIdInSession(request, confId);
		// 查询admin_conference表，对比是否为创建者
		int returnAdminId = conferenceService.selectAdminByConfIdService(confId);
		if (adminId == returnAdminId) {
			conferenceService.deleteConferenceByIdService(confId);
			conferenceService.deleteAdminConferenceRelationService(confId);
			return "redirect:jumpTo_BE_conference.action";
		}
		model.addAttribute("Message", "非该会议活动创建者，不可删除！");
		return "BE_conference";
	}
}
