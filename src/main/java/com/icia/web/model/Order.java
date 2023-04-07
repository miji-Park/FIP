package com.icia.web.model;

import java.io.Serializable;


public class Order implements Serializable
{
	private static final long serialVersionUID = 1L;

	private int orderNo;					//주문번호
	private String userId;					//회원아이디
	private int totalOrderPrice;			//총주문금액
	private String orderDate;				//주문날짜
	private String shoppingAddress;			//배송지
	
	private int shoppingPostcode;   //우편번호
	private String shoppingDetailAddress;  //상세주소
	private String shoppingExtraAddress;  //참고항목
	
	private long startRow;		//오라클 RNUM
	private long endRow;			//오라클 RNUM
	
	
	public Order() {
		orderNo = 0;
		userId = "";
		totalOrderPrice = 0;
		orderDate = "";
		shoppingAddress = "";
		
		shoppingPostcode = 0;
		shoppingDetailAddress = "";
		shoppingExtraAddress = "";
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getTotalOrderPrice() {
		return totalOrderPrice;
	}

	public void setTotalOrderPrice(int totalOrderPrice) {
		this.totalOrderPrice = totalOrderPrice;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getShoppingAddress() {
		return shoppingAddress;
	}

	public void setShoppingAddress(String shoppingAddress) {
		this.shoppingAddress = shoppingAddress;
	}

	public long getStartRow() {
		return startRow;
	}

	public void setStartRow(long startRow) {
		this.startRow = startRow;
	}

	public long getEndRow() {
		return endRow;
	}

	public void setEndRow(long endRow) {
		this.endRow = endRow;
	}

	public int getShoppingPostcode() {
		return shoppingPostcode;
	}

	public void setShoppingPostcode(int shoppingPostcode) {
		this.shoppingPostcode = shoppingPostcode;
	}

	public String getShoppingDetailAddress() {
		return shoppingDetailAddress;
	}

	public void setShoppingDetailAddress(String shoppingDetailAddress) {
		this.shoppingDetailAddress = shoppingDetailAddress;
	}

	public String getShoppingExtraAddress() {
		return shoppingExtraAddress;
	}

	public void setShoppingExtraAddress(String shoppingExtraAddress) {
		this.shoppingExtraAddress = shoppingExtraAddress;
	}
	
	
}
