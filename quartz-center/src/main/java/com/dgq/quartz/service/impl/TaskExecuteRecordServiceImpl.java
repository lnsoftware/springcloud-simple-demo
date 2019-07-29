package com.dgq.quartz.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgq.quartz.commons.Exception.BusinessException;
import com.dgq.quartz.commons.service.BaseAbstractServiceImpl;
import com.dgq.quartz.entity.TaskExecuteRecord;
import com.dgq.quartz.mapper.TaskExecuteRecordMapper;
import com.dgq.quartz.service.TaskExecuteRecordService;

@Service
public class TaskExecuteRecordServiceImpl extends BaseAbstractServiceImpl<TaskExecuteRecord	, TaskExecuteRecordMapper> implements TaskExecuteRecordService{
	
	@Autowired
	public TaskExecuteRecordMapper mapper;
	
	@Override
	public TaskExecuteRecord addTaskExecuteRecord(TaskExecuteRecord record) throws BusinessException{
		try {
			List<TaskExecuteRecord> records = mapper.find(record.getTaskId());
			if(records.size() < 5) {
				record.setCreateTime(LocalDateTime.now());
				record.setLastExecuteTime(LocalDateTime.now());
				mapper.insert(record);
				return record;
			}else{
				TaskExecuteRecord tr = records.get(0);
				tr.setLastExecuteTime(LocalDateTime.now());
				tr.setUrl(record.getUrl());
				tr.setCronExpression(record.getCronExpression());
				tr.setExecuteParameter(record.getExecuteParameter());
				tr.setExecuteStatus(record.getExecuteStatus());
				mapper.updateByPrimaryKey(tr);
				return tr;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException(e.getMessage());
		}
	}

	@Override
	public void updateTaskExecuteRecord(TaskExecuteRecord record) {
		
	}
}
