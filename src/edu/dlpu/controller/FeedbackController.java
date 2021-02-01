package edu.dlpu.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;

import edu.dlpu.bean.Feedback;
import edu.dlpu.bean.User;
import edu.dlpu.service.FeedbackService;

@Controller
public class FeedbackController {

	@Autowired
	private FeedbackService feedbackService;

	// 提交反馈
	@RequestMapping("/sendFeedback.action")
	public String insertFeedbackController(HttpServletRequest request) {
		// 登录用户从session中取userId
		Boolean loginState = false;
		HttpSession session = request.getSession();
		Object object = session.getAttribute("loginState");
		if (object != null) {
			loginState = Boolean.valueOf(object.toString());
			System.out.println("============" + loginState);
		}
		Integer userId = null;
		if (loginState == true) {
			Object object2 = session.getAttribute("User");
			// 利用 com.fasterxml.jackson.databind.ObjectMapper 包下的
			// convertValue方法可将对象转换为对应的实体类对象
			ObjectMapper objectMapper = new ObjectMapper();
			User user = objectMapper.convertValue(object2, User.class);
			System.out.println("===============" + user);
			System.out.println(user.getClass());
			userId = user.getUserId();
		}

		// jsp页面获得的参数值
		String userCall = request.getParameter("userCall");
		String fbContact = request.getParameter("fbContact");
		String fbSubject = request.getParameter("fbSubject");
		String fbContent = request.getParameter("fbContent");
		Feedback fb = new Feedback();
		if (userId != null) {
			fb.setUserId(userId);
		}
		fb.setUserCall(userCall);
		fb.setFbContact(fbContact);
		fb.setFbSubject(fbSubject);
		fb.setFbContent(fbContent);
		feedbackService.insertFeedbackService(fb);
		return "FE_index";
	}
	
	// 查询所有反馈
	@RequestMapping("/selectAllFeedback.action")
	public String selectAllFeedback(Model model) {
		ArrayList<Feedback> allFeedback = feedbackService.selectAllFeedbackService();
		model.addAttribute("AllFeedback", allFeedback);
		return "BE_feedback";
	}
}
