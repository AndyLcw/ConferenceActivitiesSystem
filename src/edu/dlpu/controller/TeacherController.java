package edu.dlpu.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.dlpu.bean.Admin;
import edu.dlpu.bean.Teacher;
import edu.dlpu.service.AdminService;
import edu.dlpu.service.TeacherService;

@Controller
public class TeacherController {

	@Autowired
	TeacherService teacherService;
	@Autowired
	AdminService adminService;

	@RequestMapping("/getTeacher.action")
	public String getTeacher(@RequestParam(value = "id", defaultValue = "1") Integer id, Model model) {
		Teacher teacher = teacherService.getTeacher(id);
		model.addAttribute("teacher", teacher);

		return "success";
	}

	// 测试注入多个对象
	@RequestMapping("/testAutoWired.action")
	public String testAutoWired() {
		ArrayList<Admin> list = adminService.selectAllAdminService();
		// toString
		System.out.println("=======================》" + list);
		return "success";
	}
}
