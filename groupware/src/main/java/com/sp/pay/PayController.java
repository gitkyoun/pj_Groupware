package com.sp.pay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("pay.payController")
public class PayController {

	//급여 조회 리스트
	@RequestMapping(value="/pay/main")
	public String payList() {
		
		
		return ".workhelper.paymain";
	}
	
	@RequestMapping(value="/pay/adminMain")
	public String adminPayList() {
		return ".workhelper.adminMain";
		
		
	}
	
	@RequestMapping(value="/pay/insertpay",method=RequestMethod.GET)
	public String insertPayForm() {
		
		return ".workhelper.insertPay";
	}
	
	@RequestMapping(value="/pay/insertPay",method=RequestMethod.POST)
	public String insertPaySubmit() {
		return ".workhelper.main";
		
		
	}
	
	public String updatePay() {
		return null;
	}
	
	
}
