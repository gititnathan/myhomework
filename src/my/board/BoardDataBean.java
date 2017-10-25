package my.board;

import java.io.File;
import java.sql.*;
import java.util.ArrayList;

import com.oreilly.servlet.MultipartRequest;

import my.db.ConnectionPoolBean;

public class BoardDataBean {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private ConnectionPoolBean pool;
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public ArrayList<BoardDBBean> listBoard(int start, int end) throws SQLException{
		String sql = "select * from (select rownum rn, A.* from " +
				"(select * from board order by re_step asc)A) " +
				"where rn between ? and ?"; // 1) select ~ 의 결과를 A라고 한다. 2) rownum이란걸 
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			ArrayList<BoardDBBean> list = makeArrayList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	
	protected ArrayList<BoardDBBean> makeArrayList(ResultSet rs) throws SQLException{
		ArrayList<BoardDBBean> list = new ArrayList<>();
		while(rs.next()) {
			BoardDBBean dto = new BoardDBBean();
			dto.setNum(rs.getInt("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setEmail(rs.getString("email"));
			dto.setSubject(rs.getString("subject"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setReadcount(rs.getInt("readcount"));
			dto.setContent(rs.getString("content"));
			dto.setIp(rs.getString("ip"));
			dto.setFilename(rs.getString("filename"));
			dto.setFilesize(rs.getInt("filesize"));
			dto.setRe_step(rs.getInt("re_step"));
			dto.setRe_level(rs.getInt("re_level"));
			list.add(dto);
		}
		return list;
	}
	
	public int insertBoard(MultipartRequest mr, String ip) throws SQLException{
		String sql = null;
		int num = Integer.parseInt(mr.getParameter("num"));
		int re_step = Integer.parseInt(mr.getParameter("re_step"));
		int re_level = Integer.parseInt(mr.getParameter("re_level"));
		if (num==0) {
			sql = "update board set re_step = re_step + 1";
		}else {
			sql = "update board set re_step = re_step + 1 where re_step>"+re_step;
			re_step++;
			re_level++;
		}
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			
			sql ="insert into board values"
				+ "( board_seq.nextval, ?,?,?,?,sysdate,0,?,?,?,?, ?,?)";
					
			ps = con.prepareStatement(sql);
			ps.setString(1, mr.getParameter("writer"));
			ps.setString(2, mr.getParameter("email"));
			ps.setString(3, mr.getParameter("subject"));
			ps.setString(4, mr.getParameter("passwd"));
			ps.setString(5, mr.getParameter("content"));
			ps.setString(6, ip);
			ps.setInt(9, re_step);
			ps.setInt(10, re_level);
			ps.setString(7, mr.getFilesystemName("filename"));
			int filesize = 0;
			File file = mr.getFile("filename");
			if (file != null) {
				filesize = (int)file.length();
			}
			ps.setInt(8, filesize);
			return ps.executeUpdate();
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	protected void plusReadcount(int num) throws SQLException{
		String sql = "update board set readcount = readcount + 1 "
																			+ "where num = ?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.executeUpdate();
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public BoardDBBean getBoard(int num, String mode) throws SQLException{
		if (mode.equals("content")) {
			plusReadcount(num);
		}
		String sql = "select * from board where num = ?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			ArrayList<BoardDBBean> list = makeArrayList(rs);
			return list.get(0);
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	protected boolean isPassword(int num, String passwd) throws SQLException{
		String sql = "select passwd from board where num = ?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if (rs.next()) {
				String dbPass = rs.getString(1);
				if (dbPass.equals(passwd)) {
					return true;
				}
			}
			return false;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public int deleteBoard(int num, String passwd) throws SQLException{
		boolean isPass = isPassword(num, passwd);
		if (isPass) {
			try {
				String sql = "delete from board where num = ?";
				con = pool.getConnection();
				ps = con.prepareStatement(sql);
				ps.setInt(1, num);
				return ps.executeUpdate();
			}finally {
				if (ps != null) ps.close();
				if (con != null) pool.returnConnection(con);
			}
		}else {
			return -1;
		}
	}
	
	public int updateBoard(BoardDBBean dto) throws SQLException{
		boolean isPass = isPassword(dto.getNum(), dto.getPasswd());
		if (isPass) {
			try {
				String sql = "update board set writer=?, subject=?, "
											+ "email=?, content=? where num = ?";
				con = pool.getConnection();
				ps = con.prepareStatement(sql);
				ps.setString(1, dto.getWriter());
				ps.setString(2, dto.getSubject());
				ps.setString(3, dto.getEmail());
				ps.setString(4, dto.getContent());
				ps.setInt(5, dto.getNum());
				return ps.executeUpdate();
			}finally {
				if (ps != null) ps.close();
				if (con != null) pool.returnConnection(con);
			}
		}else {
			return -1;
		}
	}
	
	
	public int getCount() throws SQLException{
		String sql = "select count(*) from board";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count;
		} finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
}















