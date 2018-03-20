package com.test.Singleton;

public class Checknum {
	private static volatile Checknum checknum;
	private Checknum(){}
	public static Checknum getChecknum(){
		if(checknum == null){
			synchronized (Checknum.class) {
				if(checknum == null){
					checknum = new Checknum();
				}
			}
		}
		
		return checknum;
	}
	public int getnum() {
		return (int) (Math.random()*10000);
	}
}
