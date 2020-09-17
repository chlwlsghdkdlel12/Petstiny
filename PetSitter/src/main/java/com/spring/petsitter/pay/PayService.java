package com.spring.petsitter.pay;

import java.util.List;
public interface PayService {
	public void insertPay(PayVO pay);
	public PayVO selectPay(String id);
	public void updatePay(String id);
	public void memberAmount(int amount, int point, String m_id);
	public void memberAmountRemove(int amount, int point, String m_id);
	public void petsitterAmount(int amount, String p_id);
	public void petsitterAmountRemove(int amount, String p_id);
	public List<PayVO> getPayList(PayVO pay);
}
	
