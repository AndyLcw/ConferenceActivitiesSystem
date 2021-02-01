package edu.dlpu.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import edu.dlpu.bean.Admin;
import edu.dlpu.bean.Apply;
import edu.dlpu.bean.Conference;
import edu.dlpu.bean.Risk;
import edu.dlpu.bean.User;
import edu.dlpu.service.ApplyService;
import edu.dlpu.service.ConferenceService;
import edu.dlpu.service.RiskService;
import edu.dlpu.service.UserService;

@Controller
public class ApplyController {
	@Autowired
	private ConferenceService conferenceService;

	@Autowired
	private RiskService riskService;

	@Autowired
	private ApplyService applyService;

	@Autowired
	private UserService userService;

	// 跳转到后端报名管理页面
	@RequestMapping("/jumpTo_BE_apply.action")
	public String jumpTo_BE_apply(HttpServletRequest request) {
		putAllConferenceToSession(request);
		return "BE_apply";
	}

	// session机制是重写覆盖
	private void putAllConferenceToSession(HttpServletRequest request) {
		// TODO Auto-generated method stub
		ArrayList<Conference> allConference = conferenceService.selectAllConferenceService();
		// 由于在其他页面还会用到该数据，所有放在Session中
		HttpSession session = request.getSession();
		session.setAttribute("AllConference", allConference);
		// model.addAttribute("AllConference", allConference);
		System.out.println("=============>>>" + allConference);
	}

	// 跳转到后端开放报名（增加）--查询
	@RequestMapping("/jumpTo_BE_apply_add.action")
	public String jumpTo_BE_apply_add(HttpServletRequest request, Model model) {
		// 管理员添加报名数据时，应该有身份验证（验证机制：非该活动创建者不可开放报名）

		// 获取key-value值
		int confId = Integer.parseInt(request.getParameter("confId"));
		String confIntro = request.getParameter("confIntro");
		// 取出Session中的管理员id
		int adminId = getAdminIdInSession(request, confId);
		// 查询admin_conference表，对比是否为创建者
		int returnAdminId = conferenceService.selectAdminByConfIdService(confId);
		if (returnAdminId == adminId) {
			// 存放在model中，加载页面时调用（一次）
			model.addAttribute("confId", confId);
			model.addAttribute("confIntro", confIntro);
			return "BE_apply_add";
		}
		model.addAttribute("Message", "非该会议活动创建者，不可开放报名！");
		return "BE_apply";
	}

	// 之后考虑把这个放在Service中（暂时还没想好放在哪个Service中）
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

	// 后端开放报名（增加报名）
	@RequestMapping("/insertApply.action")
	public String insertApply(HttpServletRequest request, Model model) {
		int confId = Integer.parseInt(request.getParameter("confId"));
		String applyInfo = request.getParameter("applyInfo");
		System.out.println(confId + "=============" + applyInfo);
		// 应该有检验机制（不能重复创建报名）
		ArrayList<Apply> allApply = applyService.selectAllApplyService();
		for (Apply a : allApply) {
			if (a.getConfId().equals(confId)) {
				model.addAttribute("Message", "报名已经开放，不可重复提交！");
				return "BE_apply";
			}
		}
		// 不存在，就添加数据
		Apply apply = new Apply();
		apply.setConfId(confId);
		apply.setApplyInfo(applyInfo);
		applyService.insertApplyService(apply);
		// 为维护报名表和会议活动表的参照完整性，需要动态更新会议表中applyId
		// 再写一个通过confId查询报名表的接口
		Apply temp = applyService.selectApplyByConfIdService(confId);
		int applyId = temp.getApplyId();
		// 由于在不同mapper中，applyId是自增的，无法将SQL语句写在一起，
		// 所以先查出来，再插入
		Conference conf = new Conference();
		conf.setApplyId(applyId);
		// 由于更新是动态的，所以不用担心其他数据改动
		// 由于更新是通过confId更新的，需要传入confId
		conf.setConfId(confId);
		conferenceService.updateConferenceByIdService(conf);
		return "redirect:selectAllApply.action";
	}

	// 查询所有开放报名数据(放Session中，别的Controller和Jsp页面要使用)
	@RequestMapping("/selectAllApply.action")
	public String selectAllApply(HttpServletRequest request) {
		ArrayList<Apply> allApply = applyService.selectAllApplyService();
		// 放Session中
		HttpSession session = request.getSession();
		session.setAttribute("AllApply", allApply);
		return "BE_apply_list";
	}

	// 修改报名表之查询（需要加验证）
	@RequestMapping("/jumpTo_BE_apply_update.action")
	public String jumpTo_BE_apply_update(HttpServletRequest request, Model model) {
		// 先获取jsp中传过来的值
		int appId = Integer.parseInt(request.getParameter("appId"));
		int confId = Integer.parseInt(request.getParameter("confId"));
		String applyInfo = request.getParameter("applyInfo");
		// 获取管理员id，对比是否创建者
		int adminId = getAdminIdInSession(request, confId);
		int returnAdminId = conferenceService.selectAdminByConfIdService(confId);
		if (adminId == returnAdminId) {
			model.addAttribute("appId", appId);
			model.addAttribute("confId", confId);
			model.addAttribute("applyInfo", applyInfo);
			return "BE_apply_update";
		}
		model.addAttribute("Message", "非报名创建者，不可更改！");
		return "BE_apply_list";
	}

	// 修改报名表之真正修改（动态sql）
	@RequestMapping("/updateApply.action")
	public String updateApply(HttpServletRequest request) {
		// 把jsp的数据取出来
		int applyId = Integer.parseInt(request.getParameter("appId"));
		String applyInfo = request.getParameter("applyInfo");
		// 更新报名表数据（就不放会议id了，动态sql不更改原数据）
		Apply apply = new Apply();
		apply.setApplyId(applyId);
		apply.setApplyInfo(applyInfo);
		applyService.updateApplyService(apply);
		return "redirect:selectAllApply.action";
	}

	// 删除报名表数据（验证身份）
	@RequestMapping("/deleteApplyById.action")
	public String deleteApplyById(HttpServletRequest request, RedirectAttributes attr) {
		// 把报名表的id取出来
		int applyId = Integer.parseInt(request.getParameter("applyId"));
		// 会议活动表的id用于判断是否创建者
		int confId = Integer.parseInt(request.getParameter("confId"));
		// 获取管理员id，对比是否创建者
		int adminId = getAdminIdInSession(request, confId);
		int returnAdminId = conferenceService.selectAdminByConfIdService(confId);
		if (adminId == returnAdminId) {
			applyService.deleteApplyByIdService(applyId);
			// 我需要重定向传参数，普通Model不适用
			// model.addAttribute("Message", "删除成功！");
			attr.addFlashAttribute("Message", "删除成功！");
		} else {
			// model.addAttribute("Message", "非报名创建者，不可删除！");
			attr.addFlashAttribute("Message", "非报名创建者，不可删除！");
		}
		return "redirect:selectAllApply.action";
	}

	// 记录用户报名数据--验证、跳转
	@RequestMapping("jumpTo_FE_user_apply.action")
	public String jumpToUserApply(HttpServletRequest request, Model model) {
		// 1.取session，看用户是否登录，未登录提示
		int userId = getUserIdInSession(request);
		System.out.println("============>>>>" + userId);
		if (userId == 9999) {
			model.addAttribute("ApplyTips", "请先登录！");
			return "FE_index";
		}
		// 2.跳转用户报名界面，查询报名信息
		// 获取jsp带来的需要查询的报名id

		// 需要进行空串判别（没开放报名）
		String string = request.getParameter("TranApplyId");
		System.out.println("===========>>>>" + string);
		if (string.equalsIgnoreCase("")) {
			model.addAttribute("ApplyTips", "该报名未开放！");
			return "FE_index";
		}
		// 非空，进行转换
		int applyId = Integer.parseInt(string);
		// 测试
		System.out.println("=============>>>" + applyId);
		Apply apply = applyService.selectApplyByIdService(applyId);
		model.addAttribute("Apply", apply);
		return "FE_user_apply";
	}

	private int getUserIdInSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object object = session.getAttribute("User");
		// 对空指针异常处理
		int userId = 0;
		if (object == null) {
			// 随便赋值，赋着玩
			userId = 9999;
		} else {
			// 利用 com.fasterxml.jackson.databind.ObjectMapper 包下的
			// convertValue方法可将对象转换为对应的实体类对象
			ObjectMapper objectMapper = new ObjectMapper();
			User user = objectMapper.convertValue(object, User.class);
			userId = user.getUserId();

			// 空指针异常==》测试
			System.out.println("============>>>>" + userId);
		}
		return userId;
	}

	// 用户报名
	@RequestMapping("/insertUserApply.action")
	public String insertUserApply(HttpServletRequest request, Model model) {
		// 获取前端参数
		int userId = Integer.parseInt(request.getParameter("userId"));
		int applyId = Integer.parseInt(request.getParameter("applyId"));
		int confId = Integer.parseInt(request.getParameter("confId"));
		// 要判断报名是否打开（前面已经完成判断）

//

		/**
		 * 打开报名、打开签到
		 */
		// 然后判断该任务是否关闭
		Risk risk = riskService.selectRiskByConfIdService(confId);
		if (risk == null) {
			/**
			 * 打开报名、还没打开签到
			 */

			// 判断并进行报名
			judgeApply(userId, applyId, model);
		} else {
			/**
			 * 打开报名、打开签到
			 */
			try {
				// 判断签到任务是否关闭
				// 这里其实可以优化，目前使用的方案是：当签到任务关闭时，报名关闭。
				// 改报名表：增加报名开放时间、报名结束时间
				String state = risk.getRiskState();
				if (state.equals("close"))
					model.addAttribute("ApplyTips", "该任务已经关闭！");
				if (state.equals("open")) {
					System.out.println("报名打开、签到打开");
					// 判断并进行报名
					judgeApply(userId, applyId, model);
				}
			} catch (Exception e) {
				System.out.println("签到任务已存在，但并未开放签到！");
				// 判断并进行报名
				judgeApply(userId, applyId, model);
			}

		}

//
		return "FE_index";
	}

	private void judgeApply(int userId, int applyId, Model model) {
		// 获取当前系统时间并插入到Oracle数据库（MyBatis实现）
		// 应该加一个判断，用户不能重复报名(从数据库中取值对比)
		// 数据库中无数据导致的空指针异常（try-catch一下）

		Apply applyInDB = new Apply();
		try {
			applyInDB = applyService.selectUserApplyDataService(userId, applyId);
			Date time = applyInDB.getApplyTime();
			System.out.println("测试输出数据库中的时间：" + time);
			// 给时间格式化一下
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String formatTime = formatter.format(time);
			String message = "你已经在" + formatTime + "参与过此报名! ";
			model.addAttribute("ApplyTips", message);
		} catch (Exception ex) {
			System.out.println("数据库中没有报名数据！");
			Apply apply = new Apply();
			apply.setUserId(userId);
			apply.setApplyId(applyId);
			applyService.insertUserApplyService(apply);
			model.addAttribute("ApplyTips", "报名成功！");
		}
	}

	// 查询用户所有报名数据
	@RequestMapping("/selectAllApplyByUser.action")
	public String selectAllApplyByUser(HttpServletRequest request, Model model) {
		// 从session中取用户id
		int userIdInSession = getUserIdInSession(request);
		ArrayList<Conference> allApplyByUser = conferenceService.selectAllApplyByUserService(userIdInSession);
		model.addAttribute("AllApplyByUser", allApplyByUser);
		return "FE_user_apply_data";
	}

	// 查询某个会议活动的所有报名信息
	// 1.显示所有开放报名的会议活动【这个要一个页面(BE_apply_management.jsp)，加一个按钮(报名数据)】
	// 2.连接查询（设计只查询用户名、学院、学号、报名时间）【这个要一个页面（BE_apply_info.jsp）】【applyId】

	// 设计思路：报名数据，看看也没什么，不加身份判别
	// 由于数据多是会议活动表中的数据，在Conference中写查询条件(代码复用)

	@RequestMapping("/jumpTo_BE_apply_management.action")
	public String jumpTo_BE_apply_management(Model model) {
		ArrayList<Conference> allOpenConference = conferenceService.selectAllOpenConfService();
		model.addAttribute("AllOpenConf", allOpenConference);
		return "BE_apply_management";
	}

	// 查询某个会议活动的所有报名信息（带条件的连接查询）
	@RequestMapping("/selectAllApplyUserData.action")
	public String selectAllApplyUserData(HttpServletRequest request, Model model) {
		int applyId = Integer.parseInt(request.getParameter("applyId"));
		ArrayList<User> allApplyUserData = userService.selectAllApplyUserService(applyId);
		model.addAttribute("ApplyUserData", allApplyUserData);
		return "BE_apply_info";
	}
}
