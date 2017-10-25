package my.scope;

public class Counter {
	private int num;
	public Counter() {
		System.out.println("객체가 생성되었습니다.");
	}
	public void setCount(int i) {
		num += i;
	}
	public int getCount() {
		return num;
	}
}
