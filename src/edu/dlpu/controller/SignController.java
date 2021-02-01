package edu.dlpu.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import edu.dlpu.bean.Admin;
import edu.dlpu.bean.Conference;
import edu.dlpu.bean.Risk;
import edu.dlpu.bean.Sign;
import edu.dlpu.bean.User;
import edu.dlpu.service.ConferenceService;
import edu.dlpu.service.RiskService;
import edu.dlpu.service.SignService;
import edu.dlpu.service.UserService;

@Controller
public class SignController {

	@Autowired
	private ConferenceService conferenceService;

	@Autowired
	private RiskService riskService;

	@Autowired
	private SignService signService;
	
	@Autowired
	private UserService userService;
	
	// 查询所有开放报名的会议活动
	@RequestMapping("/selectAllOpenConference.action")
	public String selectAllOpenConference(Model model) {
		ArrayList<Conference> allOpenConference = conferenceService.selectAllOpenConfService();
		model.addAttribute("AllOpenConf", allOpenConference);
		return "BE_sign";
	}

	// 创建签到任务之查询
	@RequestMapping("/jumpTo_BE_sign_risk.action")
	public String jumpTo_BE_sign_risk(HttpServletRequest request, Model model, RedirectAttributes attr) {
		// 先需要对身份进行判定
		// 获取jsp带来的修改会议活动ID号
		int confId = Integer.parseInt(request.getParameter("confId"));
		// 取出Session中的管理员id
		int adminId = getAdminIdInSession(request);
		// 查询admin_conference表，对比是否为创建者
		int returnAdminId = conferenceService.selectAdminByConfIdService(confId);
		if (returnAdminId == adminId) {
			Conference conference = conferenceService.selectConferenceByIdService(confId);
			// 由于数据只用一次，放在Model中，刷新数据就不存在了
			model.addAttribute("Conference", conference);
			return "BE_sign_risk";
		}
		attr.addFlashAttribute("Message", "非该会议活动创建者，不可创建签到任务！");
		return "redirect:selectAllOpenConference.action";
	}

	private int getAdminIdInSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object object = session.getAttribute("Admin");
		// 利用 com.fasterxml.jackson.databind.ObjectMapper 包下的
		// convertValue方法可将对象转换为对应的实体类对象
		ObjectMapper objectMapper = new ObjectMapper();
		Admin admin = objectMapper.convertValue(object, Admin.class);
		Integer adminId = admin.getAdminId();

		return adminId;
	}

	// 创建签到任务之真正创建

	// 加判断是否已经存在签到任务

	// 应该实现会议表的参照性，把riskId查出来，插入到会议表
	@RequestMapping("/insertRisk.action")
	public String insertRisk(HttpServletRequest request, Model model, RedirectAttributes attr) {
		int confId = Integer.parseInt(request.getParameter("confId"));
		// 判断
		Risk riskByConfIdService = riskService.selectRiskByConfIdService(confId);
		System.out.println("空指针异常是啥类型呢？？？=====》" + riskByConfIdService);
		// 空指针异常是啥类型呢？？？=====》null
		// 为什么不能使用equals函数呢？
		if (riskByConfIdService == null) {
			String riskName = request.getParameter("riskName");
			String riskIntro = request.getParameter("riskIntro");
			// 实现参照完整性，把管理员id带入
			int adminId = getAdminIdInSession(request);
			Risk risk = new Risk();
			risk.setAdminId(adminId);
			risk.setConfId(confId);
			risk.setRiskName(riskName);
			risk.setRiskIntro(riskIntro);
			riskService.insertRiskService(risk);
			// 参照完整性
			Risk selectRiskByConfId = riskService.selectRiskByConfIdService(confId);
			int riskId = selectRiskByConfId.getRiskId();
			Conference conf = new Conference();
			conf.setConfId(confId);
			conf.setRiskId(riskId);
			conferenceService.updateConferenceByIdService(conf);
			attr.addFlashAttribute("Message", "创建成功！");
			return "redirect:selectAllRisk.action";

		}
		model.addAttribute("Message", "签到任务已存在，不可重复创建");
		return "BE_sign_risk";

	}

	// 查询所有签到任务
	@RequestMapping("/selectAllRisk.action")
	public String selectAllRisk(Model model) {
		ArrayList<Risk> allRisk = riskService.selectAllRiskService();
		model.addAttribute("AllRisk", allRisk);
		return "BE_sign_risk_list";
	}

	// 修改签到任务（判断身份）--跳转
	@RequestMapping("/jumpTo_BE_sign_risk_update.action")
	public String jumpTo_BE_sign_risk_update(HttpServletRequest request, Model model, RedirectAttributes attr) {
		int riskId = Integer.parseInt(request.getParameter("riskId"));
		// 对比身份，admin_risk关系表
		int adminIdByRiskIdService = riskService.selectAdminIdByRiskIdService(riskId);
		System.out.println("数据库中的值：" + adminIdByRiskIdService);
		// 获取session中的值（管理员登录）
		int adminId = getAdminIdInSession(request);
		if (adminIdByRiskIdService == adminId) {

			Risk risk = riskService.selectRiskByIdService(riskId);
			// 由于数据只用一次，放在Model中，刷新数据就不存在了
			model.addAttribute("Risk", risk);
			return "BE_sign_risk_update";
		}
		attr.addFlashAttribute("Message", "非该签到任务创建者，不可更改！");
		return "redirect:selectAllRisk.action";
	}

	// 修改签到任务之真正修改
	@RequestMapping("/updateRiskById.action")
	public String updateRiskById(HttpServletRequest request, RedirectAttributes attr) {
		int riskId = Integer.parseInt(request.getParameter("riskId"));
		String riskName = request.getParameter("riskName");
		String riskIntro = request.getParameter("riskIntro");
		Risk risk = new Risk();
		risk.setRiskId(riskId);
		risk.setRiskName(riskName);
		risk.setRiskIntro(riskIntro);
		riskService.updateRiskService(risk);
		attr.addFlashAttribute("Message", "修改成功！");
		return "redirect:selectAllRisk.action";
	}

	// 删除签到任务数据(加判断)
	@RequestMapping("/deleteRiskById.action")
	public String deleteRiskById(HttpServletRequest request, RedirectAttributes attr) {
		int riskId = Integer.parseInt(request.getParameter("riskId"));
		// 对比身份，admin_risk关系表
		int adminIdByRiskIdService = riskService.selectAdminIdByRiskIdService(riskId);
		// 获取session中的值（管理员登录）
		int adminId = getAdminIdInSession(request);
		if (adminIdByRiskIdService == adminId) {
			riskService.deleteRiskByIdService(riskId);
			attr.addFlashAttribute("Message", "删除成功！");
		} else {
			attr.addFlashAttribute("Message", "非该签到任务创建者，不可删除！");
		}
		return "redirect:selectAllRisk.action";
	}

	// 开放签到之身份验证，数据查询
	@RequestMapping("/jumpTo_BE_sign_open.action")
	public String jumpTo_BE_sign_open(HttpServletRequest request, Model model, RedirectAttributes attr) {
		int riskId = Integer.parseInt(request.getParameter("riskId"));
		// 对比身份
		int adminIdByRiskId = riskService.selectAdminIdByRiskIdService(riskId);
		int adminId = getAdminIdInSession(request);
		if (adminId == adminIdByRiskId) {
			// 查询签到任务表中的数据，进行显示
			Risk risk = riskService.selectRiskByIdService(riskId);
			model.addAttribute("Risk", risk);
			return "BE_sign_open";
		}
		attr.addFlashAttribute("Message", "非该签到任务创建者，不可打开签到！");
		return "redirect:selectAllRisk.action";
	}

	// 开放签到之真正打开签到(加判断，不能反复创建)
	// 1.创建签到表，插入数据
	// 2.将签到表中的signId获取出
	// 3.更新签到任务表：将任务状态设置为1，插入系统时间到开放时间字段
	// 还应该更新会议活动表
	@RequestMapping("/openSignRisk.action")
	public String openSignRisk(HttpServletRequest request, RedirectAttributes attr) {
		int riskId = Integer.parseInt(request.getParameter("riskId"));
		int confId = Integer.parseInt(request.getParameter("confId"));
		String signInfo = request.getParameter("signInfo");
		// 判断签到数据是否已经创建(为空，则创建)
		Sign signByRiskIdService = signService.selectSignByRiskIdService(riskId);
		if (signByRiskIdService == null) {
			// 1.创建签到表，插入数据（signId自增）
			Sign sign = new Sign();
			sign.setRiskId(riskId);
			sign.setConfId(confId);
			sign.setSignInfo(signInfo);
			signService.insertSignByIdService(sign);
			// 2.将签到表中的signId获取出
			Sign selectSignByRiskIdService = signService.selectSignByRiskIdService(riskId);
			int signId = selectSignByRiskIdService.getSignId();
			String state = "open";
			java.util.Date openTime = new java.util.Date();
			System.out.println("java.util.Date--->>" + openTime);
			java.sql.Timestamp riskOpenTime = new java.sql.Timestamp(openTime.getTime());
			System.out.println("java.sql.Timestamp--->>" + riskOpenTime);
			// 3.更新签到任务表：将任务状态设置为open，插入系统时间到开放时间字段
			Risk risk = new Risk();
			risk.setRiskId(riskId);
			risk.setSignId(signId);
			risk.setRiskState(state);
			risk.setRiskOpenTime(riskOpenTime);
			riskService.updateRiskService(risk);
			// 4.更新会议活动表
			Conference conf = new Conference();
			conf.setConfId(confId);
			conf.setSignId(signId);
			conferenceService.updateConferenceByIdService(conf);
			attr.addFlashAttribute("Message", "打开签到任务成功！");
		} else {
			attr.addFlashAttribute("Message", "签到任务已打开，请勿反复操作！");
		}
		return "redirect:selectAllRisk.action";
	}

	// 关闭签到
	// 1.非创建用户不可更改
	// 2.根据签到任务id（riskId）更新结束时间、任务状态

	@RequestMapping("/closeSignRisk.action")
	public String closeSignRisk(HttpServletRequest request, RedirectAttributes attr) {
		int riskId = Integer.parseInt(request.getParameter("riskId"));
		// 对比身份
		int adminIdByRiskId = riskService.selectAdminIdByRiskIdService(riskId);
		int adminId = getAdminIdInSession(request);
		if (adminId == adminIdByRiskId) {
			String state = "close";
			java.util.Date closeTime = new java.util.Date();
			System.out.println("java.util.Date--->>" + closeTime);
			java.sql.Timestamp riskEndTime = new java.sql.Timestamp(closeTime.getTime());
			// 更新签到任务表：将任务状态设置为close，插入系统时间到关闭时间字段
			Risk risk = new Risk();
			risk.setRiskId(riskId);
			risk.setRiskState(state);
			risk.setRiskEndTime(riskEndTime);
			riskService.updateRiskService(risk);
			attr.addFlashAttribute("Message", "关闭签到任务成功！");
		} else {
			attr.addFlashAttribute("Message", "非签到任务创建者，不可关闭！");
		}
		return "redirect:selectAllRisk.action";
	}

	// 用户签到之跳转查询（FE_sign_info.jsp）

	// 1.从用户_报名表关系中取出会议id
	// 2.通过会议id查询签到任务表中数据并显示
	@RequestMapping("/jumpTo_FE_sign_info.action")
	public String jumpTo_FE_sign_info(HttpServletRequest request, Model model) {
		// 前端是遍历查询取值，可以带出confId
		int confId = Integer.parseInt(request.getParameter("confId"));
		// 查询签到任务表
		Risk risk = riskService.selectRiskByConfIdService(confId);
		model.addAttribute("Risk", risk);
		return "FE_sign_info";
	}

	// 用户实现真正签到
	// 需要加判断，是否重复签到
	// 1.查询签到任务状态（open则可以进行签到）
	// 2.获取签到id、签到时间、用户id插入到用户_签到表
	// 3.查询签到数据（列表）(FE_sign_list.jsp)
	@RequestMapping("/addUserSign.action")
	public String addUserSign(HttpServletRequest request, Model model, RedirectAttributes attr) {
		String riskState = request.getParameter("riskState");
		if (riskState.equals("open")) {
			int signId = Integer.parseInt(request.getParameter("signId"));
			java.util.Date time = new java.util.Date();
			java.sql.Timestamp signTime = new java.sql.Timestamp(time.getTime());
			// 获取用户id--session中
			int userId = getUserIdInSession(request);
			// 判断是否重复签到
			Sign userSignDataDao = signService.selectUserSignDataDao(userId, signId);
			if (userSignDataDao == null) {
				Sign sign = new Sign();
				sign.setUserId(userId);
				sign.setSignTime(signTime);
				sign.setSignId(signId);
				signService.insertUserSignService(sign);
				attr.addFlashAttribute("Message", "签到成功！");
			} else {
				attr.addFlashAttribute("Message", "你已经签到过了！");
			}
			return "redirect:selectAllUserSign.action";
		} else {
			model.addAttribute("Message", "签到还未开放！");
		}

		return "FE_sign_info";
	}

	private int getUserIdInSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object object = session.getAttribute("User");
		// 利用 com.fasterxml.jackson.databind.ObjectMapper 包下的
		// convertValue方法可将对象转换为对应的实体类对象
		ObjectMapper objectMapper = new ObjectMapper();
		User user = objectMapper.convertValue(object, User.class);
		int userId = user.getUserId();
		return userId;
	}

	// 查询用户的所有签到记录
	@RequestMapping("/selectAllUserSign.action")
	public String selectAllUserSign(HttpServletRequest request, Model model) {
		// 获取用户id
		int userId = getUserIdInSession(request);
		// 查询数据
		ArrayList<Risk> allUserSign = riskService.selectAllUserSignService(userId);
		// 把数据放在Model中供JSP显示
		model.addAttribute("AllUserSign", allUserSign);
		return "FE_sign_list";
	}
	
	/**
	 * 备注：
	 * 有改变BE_sign_list==》FE_sign_list
	 * BE_sign_info==》FE_sign_info
	 * 
	 * BE_sign_info被更改后使用！！！
	 */
	
	// 查询某个会议活动的所有签到信息
	// 1.显示所有开放签到的会议活动【页面（BE_sign_management.jsp）,加一个按钮（签到数据）】
	// 2.连接查询（设计只查询用户名、学院、学号、签到时间）【这个要一个页面（BE_sign_info.jsp）】【applyId】
	
	@RequestMapping("/jumpTo_BE_sign_management.action")
	public String jumpTo_BE_sign_management(Model model) {
		ArrayList<Conference> allOpenSignConference = conferenceService.selectAllOpenSignConfService();
		model.addAttribute("AllOpenSignConference", allOpenSignConference);
		return "BE_sign_management";
	}
	
	// 查询某条会议活动记录的所有签到用户（带条件的连接查询）
	@RequestMapping("/selectAllSignUserData.action")
	public String selectAllSignUserData(HttpServletRequest request,Model model) {
		int signId = Integer.parseInt(request.getParameter("signId"));
		ArrayList<User> allSignUserData = userService.selectAllSignUserService(signId);
		model.addAttribute("SignUserData", allSignUserData);
		return "BE_sign_info";
	}
}
