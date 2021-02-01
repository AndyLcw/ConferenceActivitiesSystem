package edu.dlpu.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.dlpu.bean.Feedback;
import edu.dlpu.dao.FeedbackDao;

@Service
public class FeedbackService {

	@Autowired
	private FeedbackDao feedbackDao;

	// 提交反馈
	public void insertFeedbackService(Feedback fb) {
		feedbackDao.insertFeedbackDao(fb);
	}

	// 查询所有反馈
	public ArrayList<Feedback> selectAllFeedbackService() {
		ArrayList<Feedback> selectAllFeedbackDao = feedbackDao.selectAllFeedbackDao();
		return selectAllFeedbackDao;
	}
}
