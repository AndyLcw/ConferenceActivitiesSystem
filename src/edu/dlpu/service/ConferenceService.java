package edu.dlpu.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.dlpu.bean.Conference;
import edu.dlpu.dao.ConferenceDao;

@Service
public class ConferenceService {

	@Autowired
	private ConferenceDao conferencedao;

	// 添加会议活动
	public void insertConferenceService(Conference conf) {
		conferencedao.insertConferenceDao(conf);
	}

	// 查询所有会议活动
	public ArrayList<Conference> selectAllConferenceService() {
		ArrayList<Conference> allConference = conferencedao.selectAllConferenceDao();
		return allConference;
	}

	// 查询单条会议活动记录
	public Conference selectConferenceByIdService(int id) {
		Conference conference = conferencedao.selectConferenceByIdDao(id);
		return conference;
	}

	// 查询活动_管理员表（验证身份）
	public int selectAdminByConfIdService(int confId) {
		int adminId = conferencedao.selectAdminByConfIdDao(confId);
		return adminId;
	}

	// 修改会议活动记录
	public void updateConferenceByIdService(Conference conf) {
		conferencedao.updateConferenceByIdDao(conf);
	}

	// 删除会议活动记录
	public void deleteConferenceByIdService(int confId) {
		conferencedao.deleteConferenceByIdDao(confId);
	}

	// 删除管理员_会议活动对应关系
	public void deleteAdminConferenceRelationService(int confId) {
		conferencedao.deleteAdminConferenceRelationDao(confId);
	}

	// 按照会议类型查询会议活动（传入=》字符串）
	public ArrayList<Conference> selectConferenceByTypeService(String confType) {
		ArrayList<Conference> allConference = conferencedao.selectConferenceByTypeDao(confType);
		return allConference;
	}

	// 多表连接--查询用户报名数据(用户角度)
	public ArrayList<Conference> selectAllApplyByUserService(int userId) {
		ArrayList<Conference> allApplyByUserDao = conferencedao.selectAllApplyByUserDao(userId);
		return allApplyByUserDao;
	}

	// 签到管理--查询所有开放了报名的会议活动
	public ArrayList<Conference> selectAllOpenConfService() {
		ArrayList<Conference> allOpenConfDao = conferencedao.selectAllOpenConfDao();
		return allOpenConfDao;
	}

	// 统计管理=》统计签到--查询所有开放了签到的会议活动
	public ArrayList<Conference> selectAllOpenSignConfService() {
		ArrayList<Conference> allOpenSignConfDao = conferencedao.selectAllOpenSignConfDao();
		return allOpenSignConfDao;
	}
}
