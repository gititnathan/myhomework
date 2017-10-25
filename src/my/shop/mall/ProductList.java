package my.shop.mall;

import java.sql.*;
import java.util.*;

import my.db.ConnectionPoolBean;
import my.shop.*;

public class ProductList {
	Hashtable<String, Vector<ProductDTO>> ht;
	Vector<ProductDTO> p_list, p_list2;
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private ConnectionPoolBean pool;
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public ProductList() {
		ht = new Hashtable<>();
		p_list = new Vector<>(5,3);
		p_list2 = new Vector<>(5,3);
	}
	
	public Vector<ProductDTO> selectBySpec(String pspec) throws SQLException{
		String sql = "select * from product where pspec=?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, pspec);
			rs = ps.executeQuery();
			p_list = makeVector(rs);
			ht.put(pspec, p_list);
			return p_list;
		}finally {
			if( rs != null) rs.close();
			if( ps != null) ps.close();
			if( con != null) pool.returnConnection(con);
		}
	}
	
	public Vector<ProductDTO> selectByCategory(String code) throws SQLException{
		String sql = "select * from product where pcategory_fk like ?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, code+"%"); // category별로 구별이 되서 category code만 있으면 뒤에 뭐가있든지 이 카테고리 애들만 꺼내줘~
			rs = ps.executeQuery();
			p_list = makeVector(rs);
			ht.put(code, p_list);
			return p_list;
		}finally {
			if( rs != null) rs.close();
			if( ps != null) ps.close();
			if( con != null) pool.returnConnection(con);
		}
	}
	
	public Vector<ProductDTO> makeVector(ResultSet rs) throws SQLException{
		Vector<ProductDTO> list = new Vector<>();
		while(rs.next()) {
			ProductDTO dto = new ProductDTO();
			dto.setPnum(rs.getInt("pnum"));
			dto.setPname(rs.getString("pname"));
			dto.setPcategory_fk(rs.getString("pcategory_fk"));
			dto.setPcompany(rs.getString("pcompany"));
			dto.setPimage(rs.getString("pimage"));
			dto.setPqty(rs.getInt("pqty"));
			dto.setPrice(rs.getInt("price"));
			dto.setPspec(rs.getString("pspec"));
			dto.setPcontent(rs.getString("pcontents"));
			dto.setPoint(rs.getInt("point"));
			dto.setPinputdate(rs.getString("pinputdate"));
			list.add(dto);
		}
		return list;
	}
	
	public ProductDTO getProduct(int pnum, String select) {
		p_list2 = ht.get(select);
		for(ProductDTO dto : p_list2) {
			if (dto.getPnum() == pnum) {
				return dto;
			}
		}
		return null;
	}
	
	public ArrayList<ProductDTO> makeArrayList(ResultSet rs) throws SQLException{
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		while(rs.next()) {
			ProductDTO dto = new ProductDTO();
			dto.setPnum(rs.getInt("pnum"));
			dto.setPname(rs.getString("pname"));
			dto.setPcategory_fk(rs.getString("pcategory_fk"));
			dto.setPcompany(rs.getString("pcompany"));
			dto.setPimage(rs.getString("pimage"));
			dto.setPqty(rs.getInt("pqty"));
			dto.setPrice(rs.getInt("price"));
			dto.setPspec(rs.getString("pspec"));
			dto.setPcontent(rs.getString("pcontents"));
			dto.setPoint(rs.getInt("point"));
			dto.setPinputdate(rs.getString("pinputdate"));
			list.add(dto);
		}
		return list;	
	}
	
	
}
