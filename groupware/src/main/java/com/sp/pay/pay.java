package com.sp.pay;

public class pay {
	private int listmemberNum;
	
	private String memberNum;
	
	//지급 연월일
	private int year;
	private int month;
	private int day;
	
	//기본급 , 수당
	private int basicpay;
	private int extrapay;
	
	//세금 
	private int healthTax; //건강
	private int employTax; //고용
	private int accidentTax; //산재
	private int pensionTax; //국민
	private int incomeTax; //소득
	
	
	public int getListmemberNum() {
		return listmemberNum;
	}
	public void setListmemberNum(int listmemberNum) {
		this.listmemberNum = listmemberNum;
	}
	public String getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getBasicpay() {
		return basicpay;
	}
	public void setBasicpay(int basicpay) {
		this.basicpay = basicpay;
	}
	public int getExtrapay() {
		return extrapay;
	}
	public void setExtrapay(int extrapay) {
		this.extrapay = extrapay;
	}
	public int getHealthTax() {
		return healthTax;
	}
	public void setHealthTax(int healthTax) {
		this.healthTax = healthTax;
	}
	public int getEmployTax() {
		return employTax;
	}
	public void setEmployTax(int employTax) {
		this.employTax = employTax;
	}
	public int getAccidentTax() {
		return accidentTax;
	}
	public void setAccidentTax(int accidentTax) {
		this.accidentTax = accidentTax;
	}
	public int getPensionTax() {
		return pensionTax;
	}
	public void setPensionTax(int pensionTax) {
		this.pensionTax = pensionTax;
	}
	public int getIncomeTax() {
		return incomeTax;
	}
	public void setIncomeTax(int incomeTax) {
		this.incomeTax = incomeTax;
	}
	
}
