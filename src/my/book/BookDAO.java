package my.book;

import java.sql.*;
import java.util.ArrayList;

public class BookDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private String url, user, pass;
	
	public BookDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		user = "java7";
		pass = "java7";
	}
	
	public boolean isBookname(String bookname) throws SQLException{
		String sql = "select * from jsp_book where bookname = ?";
		try {
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			ps.setString(1, bookname);
			rs = ps.executeQuery();
			if (rs.next()) return true;
			else return false;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int insertBook(BookDTO dto) throws SQLException{
		boolean isBookname = isBookname(dto.getBookname());
		if (!isBookname) {
			//String sql = "insert into jsp_book values(?,?,?,?,?)";
			//java.util.Date date = new java.util.Date();
			//java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat	("yyyy-MM-dd");
			String sql = "insert into jsp_book values(?,?,?,?,sysdate)";
			try {
				con = DriverManager.getConnection(url, user, pass);
				ps = con.prepareStatement(sql);
				ps.setString(1, dto.getBookname());
				ps.setString(2, dto.getWriter());
				ps.setString(3, dto.getPublisher());
				ps.setInt(4, dto.getPrice());
				//ps.setString(5, sdf.format(date));
				int res = ps.executeUpdate();
				return res;
			}finally {
				if (ps != null) ps.close();
				if (con != null) con.close();
			}
		}else {
			return -1;
		}
	}
	
	public int deleteBook(String bookname) throws SQLException{
		String sql = "delete from jsp_book where bookname = ?";
		try {
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			ps.setString(1, bookname);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public ArrayList<BookDTO> listBook() throws SQLException{
		String sql = "select * from jsp_book";
		try {
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<BookDTO> list = makeArrayList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public ArrayList<BookDTO> findBook(String search, String searchString)
																				throws SQLException{
		String sql = "select * from jsp_book where    "+search+" = ?";
		try {
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			ps.setString(1, searchString);
			rs = ps.executeQuery();
			ArrayList<BookDTO> list = makeArrayList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	
	}
	
	protected ArrayList<BookDTO> makeArrayList(ResultSet rs) 
																				throws SQLException{
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		while(rs.next()) {
			BookDTO dto = new BookDTO();
			dto.setBookname(rs.getString(1));
			dto.setWriter(rs.getString(2));
			dto.setPublisher(rs.getString(3));
			dto.setPrice(rs.getInt(4));
			dto.setIndate(rs.getString(5));
			list.add(dto);
		}
		return list;
	}
}











