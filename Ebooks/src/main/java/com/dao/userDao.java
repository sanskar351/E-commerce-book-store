package com.dao;


import com.entity.user;

public interface userDao {
public boolean usereguster(user us);
public user login(String email,String password);
public boolean update(user us);
user getUserByUserId(int userId);
public boolean checkuser(String em);
}
