package com.dao;

import java.util.List;

import com.entity.bookdtl;
import com.entity.cartt;

public interface cartdao {
public boolean addcart(cartt c);
public List<cartt> getbook(int userid);
public boolean removebook(int uid,int bid);
//public bookdtl getProductById(int productId);
public String totalPriceFromCart(int userId);
}
