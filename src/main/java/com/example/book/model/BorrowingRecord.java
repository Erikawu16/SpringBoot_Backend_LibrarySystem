package com.example.book.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class BorrowingRecord {
	private Integer  UserId;
	private Integer  InventoryId;
	private Date BorrowingTime;
	private Date ReturnTime;
}