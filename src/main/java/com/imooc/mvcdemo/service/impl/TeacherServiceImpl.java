package com.imooc.mvcdemo.service.impl;

import org.springframework.stereotype.Service;

import com.imooc.mvcdemo.model.Teacher;
import com.imooc.mvcdemo.service.TeacherService;

@Service("TeacherService")
public class TeacherServiceImpl implements TeacherService {

	
	public Teacher getTeacherbyId(Integer teacherId) {
		
		Teacher teacher = new Teacher();
		
		teacher.setTeacherID(teacherId);
		teacher.setName("suncl");
		teacher.setExperience("现在正在认真的学习springMVC框架的搭建与使用");
		return teacher;
	}

}
