package com.study.attach.dao;

import com.study.attach.vo.AttachVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IAttachDAO {
    public int insertAttach(AttachVO attach);
    public List<AttachVO> getAttaches(@Param("category") String atchCategory, @Param("boNo") String atchParentNo);
    public AttachVO getAttach(int atchNo);
    public AttachVO getAttachByUserId(String atchParentNo);
    public int deleteAtches(@Param("delAtchNos") int[] delAtchNos);
}
