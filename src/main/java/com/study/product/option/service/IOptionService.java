package com.study.product.option.service;

import com.study.product.option.vo.OptionVO;

import java.util.List;

public interface IOptionService {
    public List<OptionVO> getOptList(int prodNo);

    public OptionVO getOpt(int optNo);

    public OptionVO getOptPrice(int prodNo, String opt_first, String opt_second);


}
