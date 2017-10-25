package my.shop.mall;

import java.util.*;
import my.shop.*;

public class CartBean {
	Hashtable<Integer, ProductDTO> ht; // integer키 값과 객체값으로써 ProductDTO를 넣는다.
	ProductList plist;
	
	public CartBean() {
		ht = new Hashtable<>();
	}
	
	public void setPlist(ProductList plist) {
		this.plist = plist;
	}
	
	public boolean addCart(int pnum, int qty, String select) {
		if (ht.containsKey(pnum)) {
			ProductDTO dto = plist.getProduct(pnum, select);
			int newNum = qty + 1;
			dto.setPqty(newNum);// 키가 이미 있는 녀석이면 그 키에 해당하는 객체값의 수량만 더해준다.
		}else {
			ProductDTO dto = plist.getProduct(pnum, select);
			dto.setPqty(qty);
			ht.put(pnum, dto);
		}
		return true;
	}
	
	public int deleteCart(int pnum) {
		if(ht.containsKey(pnum)) {
			ht.remove(pnum);
			return 1;
		}else {
			return 0;
		}
	}
	
	public int updateCart(int pnum, int qty) {
		if(qty == 0 || qty < 0) {
			return deleteCart(pnum);
		}else {
			ProductDTO dto = ht.get(pnum);
			if (dto == null) return 0;
			dto.setPqty(qty);
			return 1;
		}
	}
	
	
	public Hashtable<Integer, ProductDTO> listCart(){
		return ht;
	}
	
}