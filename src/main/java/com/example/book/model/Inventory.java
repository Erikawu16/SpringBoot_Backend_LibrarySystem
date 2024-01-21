package com.example.book.model;


import java.util.Date;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class Inventory {
	
	private Integer InventoryId;// 庫存 ID 唯一值
	private String ISBN ;// 國際標準書號
	private String Status;// 在庫、出借中、整理中(歸還後未入庫)、遺失、
	private Date StoreTime;// 書籍入庫(購買)日期時間


}
