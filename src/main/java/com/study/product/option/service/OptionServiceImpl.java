package com.study.product.option.service;

import com.study.product.option.dao.IOptionDAO;
import com.study.product.option.service.IOptionService;
import com.study.product.option.vo.OptionVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class OptionServiceImpl implements IOptionService {
@Inject
    IOptionDAO optionDAO;
    @Override
    public List<OptionVO> getOptList(int prodNo) {
        return optionDAO.getOptList(prodNo);
    }

    @Override
    public OptionVO getOpt(int optNo) {
        return optionDAO.getOpt(optNo);
    }

    @Override
    public OptionVO getOptPrice(int prodNo, String opt_first, String opt_second) {
        return optionDAO.getOptPrice(prodNo,opt_first,opt_second);
    }

    @Override
    public void addReviNo(String userId, int parentNo, int buyNo, int optNo, int reviNo) {
        optionDAO.addReviNo(userId, parentNo, buyNo, optNo, reviNo);
    }

    @Override
    public int deleteReviNo(String userId, int parentNo, int buyNo, int optNo) {
       return optionDAO.deleteReviNo(userId, parentNo, buyNo, optNo);
    }
}
