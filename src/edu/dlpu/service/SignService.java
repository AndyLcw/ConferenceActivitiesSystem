package edu.dlpu.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.dlpu.bean.Sign;
import edu.dlpu.dao.SignDao;

@Service
public class SignService {

	@Autowired
	private SignDao signDao;

	// 插入签到数据
	public void insertSignByIdService(Sign sign) {
		signDao.insertSignByIdDao(sign);
	}

	// 查询数据（通过riskId）
	public Sign selectSignByRiskIdService(int riskId) {
		Sign sign = signDao.selectSignByRiskIdDao(riskId);
		return sign;
	}

	// 插入用户_签到数据
	public void insertUserSignService(Sign sign) {
		signDao.insertUserSignDao(sign);
	}

	public Sign selectUserSignDataDao(int userId, int signId) {
		Sign sign = signDao.selectUserSignDataDao(userId, signId);
		return sign;
	}
}
