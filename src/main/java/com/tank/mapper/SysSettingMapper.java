package com.tank.mapper;


import com.bs.util.annotation.BatisRepository;
import com.tank.model.SysSetting;
import com.tank.model.SysSettingExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@BatisRepository
public interface SysSettingMapper {
    int countByExample(SysSettingExample example);

    int deleteByExample(SysSettingExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SysSetting record);

    int insertSelective(SysSetting record);
    
    List<SysSetting> selectByExample(SysSettingExample example);

    SysSetting selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SysSetting record, @Param("example") SysSettingExample example);

    int updateByExample(@Param("record") SysSetting record, @Param("example") SysSettingExample example);

    int updateByPrimaryKeySelective(SysSetting record);

    int updateByPrimaryKey(SysSetting record);
}