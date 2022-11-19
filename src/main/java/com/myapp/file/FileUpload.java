package com.myapp.file;

import com.myapp.dao.MemberDAO;
import com.myapp.member.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {
    public MemberVO uploadPhoto(HttpServletRequest request) {
        String filename = "";
        int sizeLimit = 15 * 1024 * 1024;

        String realPath = request.getServletContext().getRealPath("upload");
        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();

        MemberVO one = null;
        MultipartRequest multipartRequest = null;
        try {
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

            filename = multipartRequest.getFilesystemName("photo");
            one = new MemberVO();
            String seq = multipartRequest.getParameter("seq");
            if(seq!=null && !seq.equals("")) one.setSeq(Integer.parseInt(seq));
            one.setCategory(multipartRequest.getParameter("category"));
            one.setTitle(multipartRequest.getParameter("title"));
            one.setWriter(multipartRequest.getParameter("writer"));
            one.setContent(multipartRequest.getParameter("content"));
            one.setPhoto(multipartRequest.getParameter("photo"));

            if (seq != null && seq.equals("")) {
                MemberDAO dao = new MemberDAO();
                String oldFilename = dao.getPhotoFilename(Integer.parseInt(seq));
                if(filename != null && oldFilename != null) FileUpload.deleteFile(request, oldFilename);
                else if(filename==null && oldFilename!=null) filename = oldFilename;
            }
            one.setPhoto(filename);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return one;
    }

    public static void deleteFile(HttpServletRequest request, String filename) {
        String filePath = request.getServletContext().getRealPath("upload");
        File f = new File(filePath + "/" + filename);
        if(f.exists()) f.delete();
    }
}

