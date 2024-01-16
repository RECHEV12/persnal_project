package com.study.user.dao;

import com.study.user.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IUserDAO {
    public UserVO getUser(String userId);
}
