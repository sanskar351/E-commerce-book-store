
package com.dao;

import java.util.List;

import com.entity.bookorder;

public interface orderdao {
public boolean saveorder(List<bookorder> bo);
public List<bookorder> getbooks(String emial);
public List<bookorder> getbook();

}
