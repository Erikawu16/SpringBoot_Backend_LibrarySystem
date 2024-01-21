package com.example.book.model;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class Book {
	private String ISBN; // 國際標準書號，作為主鍵
    private String Name; // 書名
    private String Author; // 作者
    private String Introduction; // 書籍內容簡介
}