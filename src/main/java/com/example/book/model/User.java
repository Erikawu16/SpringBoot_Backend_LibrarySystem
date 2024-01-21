package com.example.book.model;

import java.util.Date;

import lombok.*;


@Getter
@Setter
public class User {
	private Integer  UserId;// 唯一值,用來資料庫關聯用
	private String UserName;// 使用者名稱
	private String PhoneNumber;// 手機註冊時須檢查不可重複。為登入帳號識別用
	private String  Password;// 密碼
	private Date RegistrationTime;// 註冊日期時間
	private Date LastLoginTime;// 最後登入時間

}