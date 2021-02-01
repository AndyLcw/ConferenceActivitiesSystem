package edu.dlpu.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.dlpu.bean.Admin;
import edu.dlpu.dao.AdminDao;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;

	// 查询所有管理员
	public ArrayList<Admin> selectAllAdminService() {
		ArrayList<Admin> allAdmin = adminDao.selectAllAdminDao();
		return allAdmin;
	}

	// 修改管理员密码
	public void updateAdminService(Admin admin) {
		adminDao.updateAdminDao(admin);
	}
}
