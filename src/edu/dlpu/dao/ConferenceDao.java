package edu.dlpu.dao;

import java.util.ArrayList;

import edu.dlpu.bean.Conference;

public interface ConferenceDao {
	
	// 添加会议活动
	public void insertConferenceDao(Conference conf);

	// 查询所有会议活动
	public ArrayList<Conference> selectAllConferenceDao();
	
	// 查询单条会议活动记录
	public Conference selectConferenceByIdDao(int id);
	
	// 查询活动_管理员表（验证身份）
	public int selectAdminByConfIdDao(int confId);
	
	// 修改会议活动记录
	public void updateConferenceByIdDao(Conference conf);
	
	// 删除会议活动记录
	public void deleteConferenceByIdDao(int confId);
	
	//删除管理员_会议活动对应关系
	public void deleteAdminConferenceRelationDao(int confId);
	
	//按照会议类型查询会议活动（传入=》字符串）
	public ArrayList<Conference> selectConferenceByTypeDao(String confType);
	
	// 多表连接--查询用户报名数据(用户角度)
	public ArrayList<Conference> selectAllApplyByUserDao(int userId);
	
	// 签到管理--查询所有开放了报名的会议活动
	public ArrayList<Conference> selectAllOpenConfDao();
	
	// 统计管理=》统计报名--查询所有开放了报名的会议活动（代码复用就好）
	//public ArrayList<Conference> selectAllOpenConfDao();
	
	// 统计管理=》统计签到--查询所有开放了签到的会议活动
	// 由于外键约束性，只用将有签到任务id的记录查出来就好
	public ArrayList<Conference> selectAllOpenSignConfDao();
}
