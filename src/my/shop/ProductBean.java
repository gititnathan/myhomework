package my.shop;

import java.sql.*;
import java.util.ArrayList;

import com.oreilly.servlet.MultipartRequest;

import my.db.ConnectionPoolBean;

public class ProductBean{
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private ConnectionPoolBean pool;
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public ProductBean() {
	}
	
	
	public int insertProduct(MultipartRequest mr) throws SQLException{ // 이건 수정한거다잉
		String sql = "insert into product values (prod_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, mr.getParameter("pname"));
			String pcategory_fk = mr.getParameter("pcategory_fk");
			pcategory_fk += mr.getParameter("pcode");
			ps.setString(2, pcategory_fk);
			ps.setString(3, mr.getParameter("pcompany"));
			ps.setString(4, mr.getFilesystemName("pimage"));
			ps.setInt(5, Integer.parseInt(mr.getParameter("pqty")));
			ps.setInt(6, Integer.parseInt(mr.getParameter("price")));
			ps.setString(7, mr.getParameter("pspec"));
			ps.setString(8, mr.getParameter("pcontents"));
			ps.setInt(9, Integer.parseInt(mr.getParameter("point")));
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	
	public int updateProduct(MultipartRequest mr) throws SQLException{
		//쿼리문을 만듭시다
		String sql = "update product set pname=?, pcompany=?,"
				+ "pimage=?, pqty=?, price=?, pspec=?, pcontents=?, "
				+ "point=? where pnum=?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, mr.getParameter("pname"));
			ps.setString(2, mr.getParameter("pcompany"));
			String pimage = mr.getFilesystemName("pimage");
			if (pimage == null) {
				pimage = mr.getParameter("pimage2");
			}
			ps.setString(3, pimage);
			ps.setInt(4, Integer.parseInt(mr.getParameter("pqty")));
			ps.setInt(5, Integer.parseInt(mr.getParameter("price")));
			ps.setString(6, mr.getParameter("pspec"));
			ps.setString(7, mr.getParameter("pcontents"));
			ps.setInt(8, Integer.parseInt(mr.getParameter("point")));
			ps.setInt(9, Integer.parseInt(mr.getParameter("pnum")));
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	
	public ArrayList<ProductDTO> listProduct() throws SQLException{
		String sql = "select * from product";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<ProductDTO> list = makeArrayList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public int deleteProduct(int pnum) throws SQLException{
		String sql = "delete from product where pnum = ?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, pnum);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
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
	
	
	public ProductDTO getProduct(int pnum) throws SQLException{
		String sql = "select * from product where pnum = ?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, pnum);
			rs = ps.executeQuery();
			ArrayList<ProductDTO> list = makeArrayList(rs);
			return list.get(0);
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
}