package edu.dlpu.dao;

import org.apache.ibatis.annotations.Param;

import edu.dlpu.bean.Sign;

public interface SignDao {

	// 插入签到数据
	public void insertSignByIdDao(Sign sign);

	// 查询数据（通过riskId）
	public Sign selectSignByRiskIdDao(int riskId);

	// 插入用户_签到数据
	public void insertUserSignDao(Sign sign);

	// 查询用户是否已经签到
	public Sign selectUserSignDataDao(@Param("userId") int userId, @Param("signId") int signId);
}
