package edu.dlpu.dao;

import java.util.ArrayList;

import edu.dlpu.bean.Feedback;

public interface FeedbackDao {

	// 提交反馈
	public void insertFeedbackDao(Feedback fb);
	
	// 查询所有反馈
	public ArrayList<Feedback> selectAllFeedbackDao();
}
