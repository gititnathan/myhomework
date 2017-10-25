package my.db;
import java.sql.*;
import java.util.*;
public class ConnectionPoolBean {
	private String url, user, pass;
	private Hashtable<Connection, Boolean> ht;//pool장 만들기
	private int increment;//pool장에 con객체를 더 입력해줘야할때 그 크기
	
	public ConnectionPoolBean() throws ClassNotFoundException, SQLException {
		increment = 3;//pool장에 con객체가 더 필요하면 3개 증가 시키기 위해
		ht = new Hashtable<Connection, Boolean>(5);//pool장에 5개의 객체를 넣기 위해
		url = "jdbc:oracle:thin:@localhost:1521:xe";
		user = "java7";
		pass = "java7";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		for(int i=0; i<5; ++i){
			Connection con = DriverManager.getConnection(url, user, pass);
			ht.put(con, Boolean.FALSE);//노는 con객체를 생성
		}
	}
	
	public synchronized Connection getConnection() throws SQLException { // synchronized는 동기화. 여러명이 접속하려고 하는데 2개의 클라이언트가 1개의 서버 커넥션에 접속할 수 없게끔 줄 세우는 것.
		Enumeration<Connection> enkey = ht.keys();  // 키 가져와서
		Connection con = null;		
		while(enkey.hasMoreElements()){ // 해당 키 안에 뭐가 있니?
			con = enkey.nextElement(); // 다음꺼 가져와라
			Boolean b = ht.get(con);   // connection 객체를 
			if (b == Boolean.FALSE){
				ht.put(con, Boolean.TRUE);
				return con;
			} // if문에서 노는 커넥션이 없으면 return하지 못하고 바로 밖으로 나온다.
		}
		for(int i=0; i<increment; ++i){
			Connection con2 = DriverManager.getConnection(url, user, pass);
			ht.put(con2, Boolean.FALSE);
		} // 컨넥션을 3개 추가로 만들어 준다.
		return getConnection(); // 재귀호출. (커네션을 추가로 생성했으니 다시 getConnection메서드를 처음부터 실행해서 연결할 수 있게끔 해주는 거)
	}
	
	public void returnConnection(Connection returnCon) throws SQLException{ // 노는 커넥션으로 만들어 주는 것
		Connection con = null;
		Enumeration<Connection> enkey = ht.keys();
		while(enkey.hasMoreElements()){
			con = enkey.nextElement();
			if (returnCon == con) { // 애당초 returnCon이랑 con이랑 똑같은 건데 클라이언트에서 returnCon을 잘 쓰다가 돌려주면 서버에서 받아가지고 그게 서버가 클라이언트한테 줬던 con이 맞는지 확인해보고 맞으면 false!
				ht.put(con, Boolean.FALSE);
				break;
			}
		}
		removeCon();
	}
	
	public void removeCon() throws SQLException { // false인 컨넥션의 갯수를 세어보고 5개보다 이상이면 삭제)
		int count = 0;//노는 객체 숫자 카운트
		Connection con = null;
		Enumeration<Connection> enkey = ht.keys();
		while(enkey.hasMoreElements()){
			con = enkey.nextElement();
			Boolean b = ht.get(con);
			if(b == Boolean.FALSE){
				count++;
				if(count>5){
					ht.remove(con);
					con.close();
				}
			}
		}
	}
	
	public void closeAll() throws SQLException {
		Connection con = null;
		Enumeration<Connection> enkey = ht.keys();
		while(enkey.hasMoreElements()){
			con = enkey.nextElement();
			con.close();
		}
	}
}















