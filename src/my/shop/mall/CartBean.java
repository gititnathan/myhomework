package my.shop.mall;

import java.util.*;
import my.shop.*;

public class CartBean {
	Hashtable<Integer, ProductDTO> ht; // integerŰ ���� ��ü�����ν� ProductDTO�� �ִ´�.
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
			dto.setPqty(newNum);// Ű�� �̹� �ִ� �༮�̸� �� Ű�� �ش��ϴ� ��ü���� ������ �����ش�.
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