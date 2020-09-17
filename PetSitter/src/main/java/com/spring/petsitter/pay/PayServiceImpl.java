package com.spring.petsitter.pay;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.PayMapper;

@Service("payService")
public class PayServiceImpl implements PayService {

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public void insertPay(PayVO pay) {
		PayMapper payMapper = sqlsession.getMapper(PayMapper.class);
		payMapper.insertPay(pay);
	}

	@Override
	public PayVO selectPay(String id) {
		PayMapper payMapper = sqlsession.getMapper(PayMapper.class);
		PayVO payvo = payMapper.selectPay(id);
		return payvo;
	}

	@Override
	public void updatePay(String id) {
		PayMapper payMapper = sqlsession.getMapper(PayMapper.class);
		payMapper.updatePay(id);
	}

	@Override
	public void memberAmount(int amount, int point, String m_id) {
		PayMapper payMapper = sqlsession.getMapper(PayMapper.class);
		payMapper.memberAmount(amount, point, m_id);
	}

	@Override
	public void memberAmountRemove(int amount, int point, String m_id) {
		PayMapper payMapper = sqlsession.getMapper(PayMapper.class);
		payMapper.memberAmountRemove(amount, point, m_id);
	}

	@Override
	public void petsitterAmount(int amount, String p_id) {
		PayMapper payMapper = sqlsession.getMapper(PayMapper.class);
		payMapper.petsitterAmount(amount, p_id);
	}

	@Override
	public void petsitterAmountRemove(int amount, String p_id) {
		PayMapper payMapper = sqlsession.getMapper(PayMapper.class);
		payMapper.petsitterAmountRemove(amount, p_id);
	}

	public List<PayVO> getPayList(PayVO pay) {
		PayMapper payMapper = sqlsession.getMapper(PayMapper.class);
		return payMapper.getPayList(pay);
	}
}
