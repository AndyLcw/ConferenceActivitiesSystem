package edu.dlpu.dao;

import java.util.ArrayList;

import edu.dlpu.bean.User;

public interface UserDao {
	
	//注册用户（非全字段）
	public void insertUserSimpleDao(User user);
	
	//查询所有用户
	public ArrayList<User> selectAllUserDao();

	//更改用户信息(只更新相关字段)
	public void updateUserInfoDao(User user);
	
	// 查询某条会议活动记录的所有报名用户（带条件的连接查询）
	public ArrayList<User> selectAllApplyUserDao(int applyId);
	
	// 查询某条会议活动记录的所有签到用户（带条件的连接查询）
	public ArrayList<User> selectAllSignUserDao(int signId);
}
