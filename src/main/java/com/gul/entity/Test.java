package com.gul.entity;

import java.util.Date;

public class Test implements Runnable {
	private String name;

	public Test(String name) {
	        this.name = name;
	    }

	public Test() {
		super();
	}

	public String getName() {
		return name;
	}

	@Override
	public void run() {
		try {
			System.out.println("Doing a task during : " + name + " - Time - " + new Date());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
