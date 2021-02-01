package edu.dlpu.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.dlpu.bean.Risk;
import edu.dlpu.dao.RiskDao;

@Service
public class RiskService {

	@Autowired
	private RiskDao riskDao;

	// 创建签到任务
	public void insertRiskService(Risk risk) {
		riskDao.insertRiskDao(risk);
	}

	// 查询所有签到任务
	public ArrayList<Risk> selectAllRiskService() {
		ArrayList<Risk> allRiskDao = riskDao.selectAllRiskDao();
		return allRiskDao;
	}

	// 修改签到任务（动态SQL）
	public void updateRiskService(Risk risk) {
		riskDao.updateRiskDao(risk);
	}

	// 对比签到任务创建者身份
	public int selectAdminIdByRiskIdService(int riskId) {
		int adminIdByRiskIdDao = riskDao.selectAdminIdByRiskIdDao(riskId);
		return adminIdByRiskIdDao;
	}

	// 通过riskId查签到任务表
	public Risk selectRiskByIdService(int riskId) {
		Risk selectRiskByIdDao = riskDao.selectRiskByIdDao(riskId);
		return selectRiskByIdDao;
	}

	// 通过riskId删除签到任务表及其对应关系
	public void deleteRiskByIdService(int riskId) {
		riskDao.deleteRiskByIdDao(riskId);
		riskDao.deleteAdmin_RiskRalationDao(riskId);
	}

	// 通过会议id查询签到任务表
	public Risk selectRiskByConfIdService(int confId) {
		Risk selectRiskByConfIdDao = riskDao.selectRiskByConfIdDao(confId);
		return selectRiskByConfIdDao;
	}

	// 查询用户所有的签到（连接查询）
	public ArrayList<Risk> selectAllUserSignService(int userId) {
		ArrayList<Risk> allUserSignDao = riskDao.selectAllUserSignDao(userId);
		return allUserSignDao;

	}
}
