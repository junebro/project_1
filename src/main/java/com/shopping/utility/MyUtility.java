package com.shopping.utility;

import java.io.FileInputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.shopping.common.SuperController;

public class MyUtility {

	public static Map<String, SuperController> getTodolistMap(String filename) {
		Map<String, SuperController> map = new HashMap<String, SuperController>();

		Properties prop = getPropertiesData(filename);
		System.out.println("77777777777777777777777");
		Enumeration<Object> keys = prop.keys();
		System.out.println("8888888888888888888888888");
		while (keys.hasMoreElements()) {
			System.out.println("9999999999999999999");
			String command = keys.nextElement().toString();
			String className = prop.getProperty(command);
			System.out.println("className :" + className );	
			try {
				System.out.println("110000000000000000000000000");	
				Class<?> handleClass = Class.forName(className);
				SuperController instance = (SuperController) handleClass.newInstance();
				System.out.println("120000000000000000000");		
				map.put(command, instance);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return map;
	}

	private static Properties getPropertiesData(String filename) {
		// 해당 파일의 내용을 읽어 들여서 프로퍼티 목록으로 반환해 줍니다.
		FileInputStream fis = null;
		Properties prop = null;

		try {
			fis = new FileInputStream(filename);

			prop = new Properties();
			prop.load(fis);

			System.out.println("22222222222222222222222222");
			System.out.println("prop.size() : " + prop.size());

		} catch (Exception e) {
			System.out.println("33333333333333333333");
			e.printStackTrace();
		} finally {
			System.out.println("444444444444444444444");
			try {
				if (fis != null) {
					System.out.println("5555555555555555555");
					fis.close();
				}
			} catch (Exception e2) {
				System.out.println("6666666666666666666666");
				e2.printStackTrace();
			}
		}
		return prop;
	}

}
