package com.jinw0909.portfolio.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String FILE_UPLOAD_PATH = "/Users/jinwoo/jinwoo/workspace_javaSpringPortfolio/upload/images/";
	
	public String saveFile(String loginId, MultipartFile file) {
		
		String directoryName = loginId + "_" + System.currentTimeMillis() + "/";
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(filePath);
		
		if (directory.mkdir() == false) {
			logger.error("[FileManagerService saveFile 디렉토리 생성 실패]");
			return null;
		}
		
		
		byte[] bytes;
		
		try {
			bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
		} catch (IOException e) {
			logger.error("[FileManagerService saveFile] 파일 생성 실패");
			e.printStackTrace();
			return null;
		}
		
		
		return "/images/" + directoryName + file.getOriginalFilename();
		
	}
	
	public void removeFile(String filePath) {
		
		
		String actualFilePath = FILE_UPLOAD_PATH + filePath.replace("/images/", "");
		
		Path path = Paths.get(actualFilePath);
		
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				logger.error("[FileManagerService saveFile] file delete failed ");
				e.printStackTrace();
			}
		}
		
		path = path.getParent();
		
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				logger.error("[FileManagerService saveFile] directory delete failed ");
				e.printStackTrace();
			}
		}
	}
}
