package edu.dlpu.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.dlpu.bean.User;
import edu.dlpu.dao.UserDao;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	// 注册用户（非全字段）
	public void insertUserSimpleService(User user) {
		userDao.insertUserSimpleDao(user);
	}

	// 查询所有用户
	public ArrayList<User> selectAllUserService() {
		ArrayList<User> allUserDao = userDao.selectAllUserDao();
		return allUserDao;
	}

	// 更改用户信息(只更新相关字段)
	public void updateUserInfoService(User user) {
		userDao.updateUserInfoDao(user);
	}

	// 查询某条会议活动记录的所有报名用户（带条件的连接查询）
	public ArrayList<User> selectAllApplyUserService(int applyId) {
		ArrayList<User> allApplyUserDao = userDao.selectAllApplyUserDao(applyId);
		return allApplyUserDao;
	}

	// 查询某条会议活动记录的所有签到用户（带条件的连接查询）
	public ArrayList<User> selectAllSignUserService(int signId) {
		ArrayList<User> allSignUserDao = userDao.selectAllSignUserDao(signId);
		return allSignUserDao;
	}
}
