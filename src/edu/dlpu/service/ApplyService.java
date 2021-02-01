package edu.dlpu.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.dlpu.bean.Apply;
import edu.dlpu.dao.ApplyDao;

@Service
public class ApplyService {

	@Autowired
	private ApplyDao applyDao;

	// 生成发布报名数据
	public void insertApplyService(Apply apply) {
		applyDao.insertApplyDao(apply);
	}

	// 查询所有报名数据（校验、显示）
	public ArrayList<Apply> selectAllApplyService() {
		ArrayList<Apply> allApply = applyDao.selectAllApplyDao();
		return allApply;
	}

	// 修改报名表数据
	public void updateApplyService(Apply apply) {
		applyDao.updateApplyDao(apply);
	}

	// 删除报名表数据
	public void deleteApplyByIdService(int applyId) {
		applyDao.deleteApplyByIdDao(applyId);
	}

	// 查询单条报名表数据
	public Apply selectApplyByIdService(int applyId) {
		Apply apply = applyDao.selectApplyByIdDao(applyId);
		return apply;
	}

	// 查询单条报名表数据（通过会议id）
	public Apply selectApplyByConfIdService(int confId) {
		Apply apply = applyDao.selectApplyByConfIdDao(confId);
		return apply;
	}

	// 记录用户报名数据
	public void insertUserApplyService(Apply apply) {
		applyDao.insertUserApplyDao(apply);
	}

	// 查询用户是否已经报名
	public Apply selectUserApplyDataService(int userId, int applyId) {
		Apply apply = applyDao.selectUserApplyDataDao(userId, applyId);
		return apply;
	}
}
