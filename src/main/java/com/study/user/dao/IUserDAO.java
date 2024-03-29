package com.study.user.dao;

import com.study.user.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

@Mapper
public interface IUserDAO {
    public UserVO getUser(String userId);
    public int insertUser(UserVO user);
    public void insertIntroduce(String userId);
    public int userModify(UserVO user);
    public int passChange(@Param("newPass") String newPass, @Param("userId") String userId);
}
