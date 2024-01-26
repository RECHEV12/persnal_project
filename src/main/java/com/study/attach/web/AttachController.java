package com.study.attach.web;

import com.study.attach.dao.IAttachDAO;
import com.study.attach.vo.AttachVO;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@Controller
public class AttachController {
    @Inject
    IAttachDAO attachDAO;

    @RequestMapping("/attach/download/{atchNo}")
    public void download(@PathVariable("atchNo") int atchNo, HttpServletResponse resp) throws IOException {
        //1. atchNo attachVO 찾기 _파일경로 파일이름 원래이름 크기 등등
        //2. attachVO로 파일 찾기
        //3. resp에 다운로드 파일 추가
        //4. resp에 다운로드하라는 헤더 세팅
        AttachVO attach = attachDAO.getAttach(atchNo);
        String filePath = attach.getAtchPath();
        String fileName = attach.getAtchFileName();
        File file = new File(filePath, fileName);

        resp.setHeader("Content-Type", "application/octet-stream;");
        String atchOriginalName = new String(attach.getAtchOriginalName().getBytes("UTF-8"), "ISO-8859-1");
        resp.setHeader("Content-Disposition", "attachment;filename=\"" + atchOriginalName + "\";");
        resp.setHeader("Content-Transfer-Encoding", "binary;");
        resp.setContentLength((int) file.length()); // 진행율
        resp.setHeader("Pragma", "no-cache;");
        resp.setHeader("Expires", "-1;");

        FileUtils.copyFile(file, resp.getOutputStream());
        resp.getOutputStream().close();

    }

    @RequestMapping("attach/showImg.wow")
    public ResponseEntity<byte[]> showImg(String fileName, String filePath) throws IOException {
        File file = new File(filePath,fileName);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", Files.probeContentType(file.toPath()));
        ResponseEntity<byte[]> result = new ResponseEntity<>(FileUtils.readFileToByteArray(file),headers, HttpStatus.OK);
        return result;
    }

}
