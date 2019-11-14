package com.gul.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gul.entity.UploadedFile;

@Controller
public class HomeController {

	private Logger logger = Logger.getLogger(HomeController.class);

	@GetMapping("/")
	public String view() {
		logger.info("View method called");
		System.out.println("testing");
		return "list";
	}
	
	@GetMapping("/alert")
	public String alert() {
		System.out.println("alert");
		return "index";
	}

	@PostMapping(value = "/fileUpload")
	@ResponseBody
	public String fileUpload(@RequestParam("filename") MultipartFile file,@RequestParam("fname") String fname,@RequestParam("lname") String lname) {
		System.out.println(">>>>>>>>"+fname+": "+lname);
		System.out.println(">>>>>>>>"+file.getOriginalFilename());
		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "submitFiles", method = RequestMethod.POST)
	public String submitPapers(MultipartHttpServletRequest request) {
		List<MultipartFile> papers = request.getFiles("papers");
		try {
			saveFilesToServer(papers);
		} catch (Exception e) {
			return "error";
		}
		return "success";
	}

	public void saveFilesToServer(List<MultipartFile> multipartFiles) throws IOException {
//	  	String directory = "/home/user/uploadedFilesDir/";
		String directory = "D:/Upload/SingleFileUpload/";
		File file = new File(directory);
		file.mkdirs();
		for (MultipartFile multipartFile : multipartFiles) {
			file = new File(directory + multipartFile.getOriginalFilename());
			IOUtils.copy(multipartFile.getInputStream(), new FileOutputStream(file));
		}
	}

	@RequestMapping("/save-product")
	public void saveFile(HttpServletRequest request, @ModelAttribute UploadedFile uploadedFile,
			BindingResult bindingResult, Model model) {

		MultipartFile multipartFile = uploadedFile.getMultipartFile();
		String fileName = multipartFile.getOriginalFilename();
		try {
			File file = new File(request.getSession().getServletContext().getRealPath("/image"), fileName);
			multipartFile.transferTo(file);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/product-input-form")
	public String inputProduct(Model model) {
		return "productForm";
	}
}
