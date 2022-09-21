package com.entity;

public class bookorder {
	
private int id;
private String orderid;
private String name;
private String email;
private String phone;
private String fulladdress;
private String bookname;
private String author;
private String price;
private String payment;
public String getBookname() {
	return bookname;
}
public void setBookname(String bookname) {
	this.bookname = bookname;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public String getPrice() {
	return price;
}
public void setPrice(String price) {
	this.price = price;
}
public String getOrderid() {
	return orderid;
}
public void setOrderid(String orderid) {
	this.orderid = orderid;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getFulladdress() {
	return fulladdress;
}
public void setFulladdress(String fulladdress) {
	this.fulladdress = fulladdress;
}
public String getPayment() {
	return payment;
}
public void setPayment(String payment) {
	this.payment = payment;
}
public bookorder() {
	super();
	// TODO Auto-generated constructor stub
}
@Override
public String toString() {
	return "bookorder [id=" + id + ", orderid=" + orderid + ", name=" + name + ", email=" + email + ", phone=" + phone
			+ ", fulladdress=" + fulladdress + ", bookname=" + bookname + ", author=" + author + ", price=" + price
			+ ", payment=" + payment + "]";
}

}
