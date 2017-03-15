package com.netsdar.hospital.utils;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class UploadUtil {
	@Value("${netsdar.filepath}")
	private  String url;
	
	public static String path;// 文件路径
	@PostConstruct
	public void init() {
		path = url;
	}

	public static String uploadFile(MultipartFile file,
			HttpServletRequest request) {
		try {
			if (file != null) {// 判断上传的文件是否为空
				String type = null;// 文件类型
				String fileName = file.getOriginalFilename();// 文件原名称
				System.out.println("上传的文件原名称:" + fileName);
				// 判断文件类型
				type = fileName.indexOf(".") != -1 ? fileName.substring(
						fileName.lastIndexOf(".") + 1, fileName.length())
						: null;
				if (type != null) {// 判断文件类型是否为空
					if ("GIF".equals(type.toUpperCase())
							|| "PNG".equals(type.toUpperCase())
							|| "JPG".equals(type.toUpperCase())) {
						// 项目在容器中实际发布运行的根路径
//						String realPath = request.getSession()
//								.getServletContext().getRealPath("/");
						// 自定义的文件名称
						String trueFileName = String.valueOf(System
								.currentTimeMillis()) + fileName;
						// 设置存放图片文件的路径
						path = path
								+ /* System.getProperty("file.separator")+ */trueFileName;
						System.out.println("存放图片文件的路径:" + path);
						// 转存文件到指定的路径
						file.transferTo(new File(path));
						System.out.println("文件成功上传到指定目录下");
					} else {
						System.out.println("不是我们想要的文件类型,请按要求重新上传");
						return null;
					}
				} else {
					System.out.println("文件类型为空");
					return null;
				}
			} else {
				System.out.println("没有找到相对应的文件");
				return null;
			}
		} catch (IOException e) {
			System.out.println(e);
		}
		return path;
	}

	public static String GenerateKey(MultipartFile multipartFile) {
		StringBuffer keyName = new StringBuffer();
		LocalDate localDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String date = localDate.format(formatter);
		keyName.append(date)
				.append("/")
				.append(String.valueOf(System.currentTimeMillis())
						+ (int) ((Math.random() * 9 + 1) * 100000)).append(".")
				.append((multipartFile.getContentType().split("/")[1]));
		return keyName.toString();
	}

	public static String GenerateKey(String fileSuffix) {
		StringBuffer keyName = new StringBuffer();
		LocalDate localDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String date = localDate.format(formatter);
		keyName.append(date)
				.append("/")
				.append(String.valueOf(System.currentTimeMillis())
						+ (int) ((Math.random() * 9 + 1) * 100000))
				.append(fileSuffix);
		return keyName.toString();
	}
}
