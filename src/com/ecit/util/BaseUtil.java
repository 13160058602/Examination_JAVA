package com.ecit.util;

public class BaseUtil {
	public static String addZeroForNum(String str, int strLength) {
	    int strLen = str.length();
	    StringBuffer sb = null;
	     while (strLen < strLength) {
	           sb = new StringBuffer();
	           sb.append("0").append(str);// ื๓ฒน0
	           str = sb.toString();
	           strLen = str.length();
	     }
	    return str;
	}
}
