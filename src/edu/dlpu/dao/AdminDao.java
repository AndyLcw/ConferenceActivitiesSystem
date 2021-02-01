package edu.dlpu.dao;

import java.util.ArrayList;

import edu.dlpu.bean.Admin;

public interface AdminDao {

	// 查询所有管理员
	public ArrayList<Admin> selectAllAdminDao();

	// 修改管理员密码
	public void updateAdminDao(Admin admin);
}
