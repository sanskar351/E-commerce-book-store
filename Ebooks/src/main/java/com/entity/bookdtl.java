package com.entity;

public class bookdtl {
private int id;
private String bookname;
private String author;
private String price;
private String category;
private String status;
private String  photo;
private String email;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
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
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getPhoto() {
	return photo;
}
public void setPhoto(String photo) {
	this.photo = photo;
}

public bookdtl(String bookname, String author, String price, String category, String status, String photo,
		String email) {
	super();
	this.bookname = bookname;
	this.author = author;
	this.price = price;
	this.category = category;
	this.status = status;
	this.photo = photo;
	this.email = email;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public bookdtl() {
	super();
	// TODO Auto-generated constructor stub
}


@Override
public String toString() {
	return "bookdtl [id=" + id + ", bookname=" + bookname + ", author=" + author + ", price=" + price + ", category="
			+ category + ", status=" + status + ", photo=" + photo + ", email=" + email + "]";
}

}
