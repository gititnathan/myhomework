package my.shop;

import java.sql.*;
import java.util.ArrayList;

import my.db.ConnectionPoolBean;

public class CategoryBean {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private ConnectionPoolBean pool;
	
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public int insertCategory(CategoryDTO dto) throws SQLException{
		String sql = "insert into category values(cate_seq.nextval, ?,?)";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getCode());
			ps.setString(2, dto.getCname());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public ArrayList<CategoryDTO> listCategory() throws SQLException{
		String sql = "select * from category";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<CategoryDTO> list = new ArrayList<>();
			while(rs.next()) {
				CategoryDTO dto = new CategoryDTO();
				dto.setCnum(rs.getInt("cnum"));
				dto.setCode(rs.getString("code"));
				dto.setCname(rs.getString("cname"));
				list.add(dto);
			}
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public int deleteCategory(int cnum) throws SQLException {
		String sql = "delete from category where cnum = ?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, cnum);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
}	













