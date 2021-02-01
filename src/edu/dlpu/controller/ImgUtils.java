package edu.dlpu.controller;

import java.util.ArrayList;
import java.util.List;

public class ImgUtils {

	// 保存了所有的图片路径
	private static List<String> paths = new ArrayList<String>();

	public static void addImgPath(String path) {
		paths.add(path);
	}

	public static List<String> getAllPath() {
		return paths;
	}
}
