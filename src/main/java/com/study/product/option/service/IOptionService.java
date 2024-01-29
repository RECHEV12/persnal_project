package com.study.product.option.service;

import com.study.common.vo.CodeVO;
import com.study.product.option.vo.OptionVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IOptionService {
    public List<OptionVO> getOptList(int prodNo);
    public List<CodeVO> getCodeList();

    public OptionVO getOpt(int optNo);
    public void insertOpt(OptionVO option);

    public OptionVO getOptPrice(int prodNo, String opt_first, String opt_second);

    public void addReviNo(@Param("userId") String userId, @Param("parentNo") int parentNo, @Param("buyNo") int buyNo, @Param("optNo") int optNo, @Param("reviNo") int reviNo);
    public int deleteReviNo(@Param("userId") String userId, @Param("parentNo") int parentNo, @Param("buyNo") int buyNo, @Param("optNo") int optNo);




}
