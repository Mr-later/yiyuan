package com.sltas.web.bpm.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;

/**
 * @Description VerifyImage.java
 * @author wx
 * @createdDate 2013-11-26 上午10:14:02
 */
public class VerifyImage {

	// 获取生成的图片,返回生成的验证码，并将ImageOutputStream写入
	public String GetImage(OutputStream outputStream) {
		int width = 60, height = 20;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		Random random = new Random();
		g.setColor(getRandColor(200, 250));
		g.fillRect(0, 0, width, height);
		g.setFont(new Font("Times New Roman", Font.PLAIN, 18));

		g.setColor(getRandColor(160, 200));
		for (int i = 0; i < 155; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			g.drawLine(x, y, x + xl, y + yl);
		}
		String sRand = "";
		for (int i = 0; i < 4; i++) {
			String rand = String.valueOf(random.nextInt(10));
			sRand += rand;
			g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));// µ÷ÓÃº¯Êý³öÀ´µÄÑÕÉ«ÏàÍ¬£¬¿ÉÄÜÊÇÒòÎªÖÖ×ÓÌ«½Ó½ü£¬ËùÒÔÖ»ÄÜÖ±½ÓÉú³É
			g.drawString(rand, 13 * i + 6, 16);
		}
		g.dispose();
		try {
			ImageIO.write(image, "JPEG", outputStream);
			// outputStream.flush();
			return sRand;
		} catch (IOException e) {
			return "fail";
		}
	}

	@SuppressWarnings("unused")
	public BufferedImage getImage() {
		int width = 60, height = 20;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		Random random = new Random();
		g.setColor(getRandColor(200, 250));
		g.fillRect(0, 0, width, height);
		g.setFont(new Font("Times New Roman", Font.PLAIN, 18));

		g.setColor(getRandColor(160, 200));
		for (int i = 0; i < 155; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			g.drawLine(x, y, x + xl, y + yl);
		}
		String sRand = "";
		for (int i = 0; i < 4; i++) {
			String rand = String.valueOf(random.nextInt(10));
			sRand += rand;
			g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));// µ÷ÓÃº¯Êý³öÀ´µÄÑÕÉ«ÏàÍ¬£¬¿ÉÄÜÊÇÒòÎªÖÖ×ÓÌ«½Ó½ü£¬ËùÒÔÖ»ÄÜÖ±½ÓÉú³É
			g.drawString(rand, 13 * i + 6, 16);
		}
		g.dispose();
		return image;
	}

	// 获取指定范围内的随机颜色
	public Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}
}
