package edu.dlpu.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import edu.dlpu.bean.Apply;

public interface ApplyDao {

	// 生成发布报名数据
	public void insertApplyDao(Apply apply);

	// 查询所有报名数据（校验、显示）
	public ArrayList<Apply> selectAllApplyDao();

	// 修改报名表数据
	public void updateApplyDao(Apply apply);

	// 删除报名表数据
	public void deleteApplyByIdDao(int applyId);

	// 查询单条报名表数据
	public Apply selectApplyByIdDao(int applyId);

	// 查询单条报名表数据（通过会议id）
	public Apply selectApplyByConfIdDao(int confId);

	// 记录用户报名数据
	public void insertUserApplyDao(Apply apply);
	
	// 查询用户是否已经报名
	public Apply selectUserApplyDataDao(@Param("userId")int userId,@Param("applyId")int applyId);
}
