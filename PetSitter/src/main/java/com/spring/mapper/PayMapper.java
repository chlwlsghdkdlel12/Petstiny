package com.spring.mapper;

import org.apache.ibatis.annotations.Param;
import java.util.List;

import com.spring.petsitter.pay.PayVO;

public interface PayMapper {
	public void insertPay(PayVO pay);
	public PayVO selectPay(String id);
	public void updatePay(String id);
	public void memberAmount(@Param("amount") int amount, @Param("point") int point, @Param("MEMBER_ID") String m_id);
	public void memberAmountRemove(@Param("amount") int amount, @Param("point") int point, @Param("MEMBER_ID") String m_id);
	public void petsitterAmount(@Param("amount") int amount, @Param("PETSITTER_ID") String p_id);
	public void petsitterAmountRemove(@Param("amount") int amount, @Param("PETSITTER_ID") String p_id);
	public List<PayVO> getPayList(PayVO pay);
}
