package org.kh.test.board.model.vo;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;

@Component
public class UploadFile {
	private static final Logger logger = LoggerFactory.getLogger(UploadFile.class);

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();

		String savedName =  uid.toString() + "_" + originalName;
		String savedPath = calcPath(uploadPath);

		 File target = new File(uploadPath+savedPath, savedName);

		// 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
		 FileCopyUtils.copy(fileData, target);

		String uploadedFileName = null;

		uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		return uploadedFileName;
	}

	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));

		int width = 200;
		int height = 200;

		int ownwidth = sourceImg.getWidth();
		int ownheight = sourceImg.getHeight();

		int pd = 0;
		if (ownwidth > ownheight) {
			pd = (int) (Math.abs((height * ownwidth / (double) width) - ownheight) / 2d);
		} else {
			pd = (int) (Math.abs((width * ownheight / (double) height) - ownwidth) / 2d);
		}

		sourceImg = Scalr.pad(sourceImg, pd, Color.WHITE, Scalr.OP_ANTIALIAS);

		ownwidth = sourceImg.getWidth();
		ownheight = sourceImg.getHeight();

		int nw = ownwidth;
		int nh = (ownwidth * height) / width;
		if (nh > ownheight) {
			nw = (ownheight * width) / height;
			nh = ownheight;
		}

		// 섬네일 크기 조정
		BufferedImage scarledImage = Scalr.crop(sourceImg, (ownwidth - nw) / 2, (ownheight - nh) / 2, nw, nh);
		BufferedImage destImg = Scalr.resize(scarledImage, width, height);

		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;

		File newFile = new File(thumbnailName); // 섬네일의 경로를 newFile변수에 저장

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		ImageIO.write(destImg, formatName.toUpperCase(), newFile);

		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);

		// "월"이랑 "일"은 10보다 작을때가 있으므로 (1월,2월....은 01월, 02월 이런식으로 붙이기 위해)
		// 그러니까 자릿수를 맞춰주기 위해서 DecimalFormat를 사용

		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		// 디렉토리를 생성
		 makeDir(uploadPath, yearPath, monthPath , datePath);
		logger.info(datePath);
		return datePath;
	}

	private static void makeDir(String uploadPath, String... paths) {

		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
}
