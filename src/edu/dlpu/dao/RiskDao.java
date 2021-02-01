package edu.dlpu.dao;

import java.util.ArrayList;

import edu.dlpu.bean.Risk;

public interface RiskDao {

	// 创建签到任务
	// 插入的是两张表（dlpu_risk、dlpu_admin_risk）
	public void insertRiskDao(Risk risk);

	// 查询所有签到任务
	public ArrayList<Risk> selectAllRiskDao();

	// 修改签到任务（动态SQL）
	public void updateRiskDao(Risk risk);

	// 对比签到任务创建者身份
	public int selectAdminIdByRiskIdDao(int riskId);

	// 通过riskId查签到任务表
	public Risk selectRiskByIdDao(int riskId);

	// 通过riskId删除签到任务
	public void deleteRiskByIdDao(int riskId);

	// 通过riskId删除管理员_签到任务表对应关系
	public void deleteAdmin_RiskRalationDao(int riskId);

	// 通过会议id查询签到任务表
	public Risk selectRiskByConfIdDao(int confId);

	// 查询用户所有的签到（连接查询）
	public ArrayList<Risk> selectAllUserSignDao(int userId);
}
