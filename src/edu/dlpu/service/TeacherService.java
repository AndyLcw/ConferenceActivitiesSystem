package edu.dlpu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.dlpu.bean.Teacher;
import edu.dlpu.dao.TeacherDao;

@Service
public class TeacherService {

	@Autowired
	private TeacherDao teacherDao;

	public Teacher getTeacher(Integer id) {
		// TODO Auto-generated method stub
		Teacher teacher = teacherDao.getTeacherById(id);
		return teacher;
	}
}
