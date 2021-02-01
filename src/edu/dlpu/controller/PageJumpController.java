package edu.dlpu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageJumpController {

	// 跳转到前端首页面（FE_index.jsp）
	/**
	 * 跳转页面的时候，需要先将公用的数据先放在Session中 1.会议活动信息（这里的和后端的不一样，前端是分类查询，需要重写查询语句）
	 * 
	 */
//	@RequestMapping("/jumpTo_FE_index.action")
//	public String jumpToFE_index() {
//		
//		return "FE_index";
//	}

	// 跳转到前端登录页面（FE_login.jsp）
	@RequestMapping("/jumpToFE_login.action")
	public String jumpToFE_login() {
		return "FE_login";
	}

	// 跳转到后端登录页面（BE_login.jsp）
	@RequestMapping("/jumpTo_BE_login.action")
	public String jumpTo_BE_login() {
		return "BE_login";
	}

	// 跳转到后端首页面（BE_index.jsp）
	@RequestMapping("/jumpTo_BE_index.action")
	public String jumpToBE_index() {
		return "BE_index";
	}

	// 跳转到后端管理员界面
	@RequestMapping("/jumpTo_BE_admin_info.action")
	public String jumpTo_BE_admin_info() {
		return "BE_admin_info";
	}

	// 跳转到后端会议活动管理页面（BE_conference.jsp）
//	@RequestMapping("/jumpTo_BE_conference.action")
//	public String jumpTo_BE_conference() {
//		return "BE_conference";
//	}

	// 跳转到后端添加会议活动页面（BE_conference_add.jsp）
	@RequestMapping("/jumpTo_BE_conference_add.action")
	public String jumpTo_BE_conference_add() {
		return "BE_conference_add";
	}

	// 跳转到后端修改会议活动页面（BE_conference_update.jsp）
//	@RequestMapping("/jumpTo_BE_conference_update.action")
//	public String jumpTo_BE_conference_update() {
//		return "BE_conference_update";
//	}

}
