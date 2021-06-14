package com.converter;

import java.text.Normalizer;
import java.util.regex.Pattern;

public class ConverterToURL {
	public static String toUrl(String value) {
		try {
			String temp = Normalizer.normalize(value, Normalizer.Form.NFD);
			Pattern pattern = Pattern.compile("\\{InCombiningDiacriticalMarks}+");
			return pattern.matcher(temp).replaceAll("").toLowerCase().replaceAll(" ", "-").replaceAll("đ", "d");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
}
