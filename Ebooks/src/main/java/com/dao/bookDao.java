package com.dao;

import java.util.List;


import com.entity.bookdtl;

public interface bookDao {
public boolean addbooks(bookdtl btl);
public List<bookdtl> getbooks();
public bookdtl getbook(int id);
public boolean updatebook(bookdtl b);
public boolean delete(int id);
public List<bookdtl> newbook();
public List<bookdtl> oldbook();
public List<bookdtl> recent();
public List<bookdtl> allnewbook();
public List<bookdtl> alloldbook();
public List<bookdtl> allrecent();
public bookdtl viewbook(int id);
public List<bookdtl> getoldbooks(String email, String cat );
public boolean removeold(int id);
public bookdtl getProductById(int productId);
}
