package com.imooc.mvcdemo.service;

import org.springframework.stereotype.Service;

import com.imooc.mvcdemo.model.Teacher;
@Service
public interface TeacherService {

	
	Teacher getTeacherbyId(Integer teacherId);
}
