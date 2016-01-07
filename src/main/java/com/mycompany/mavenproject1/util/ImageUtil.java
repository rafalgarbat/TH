/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.awt.Graphics2D;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import org.primefaces.event.FileUploadEvent;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
public class ImageUtil {

    private static final int IMG_WIDTH = 100;
    private static final int IMG_HEIGHT = 100;

    public static String destination = "E:\\roboczy\\traininglib\\mavenproject1\\src\\main\\webapp\\resources\\images\\";

    public static void imageResize(String aPath, String aOutputPath) throws IOException {
        BufferedImage originalImage = ImageIO.read(new File(aPath));
        int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();

        BufferedImage resizeImageJpg = resizeImage(originalImage, type);
        ImageIO.write(resizeImageJpg, "jpg", new File(aOutputPath));
    }

    private static BufferedImage resizeImage(BufferedImage originalImage, int type) {
        BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
        Graphics2D g = resizedImage.createGraphics();
        g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
        g.dispose();

        return resizedImage;
    }

    static public void handleFileUpload(String aUname, FileUploadEvent event) {
        FacesMessage message = new FacesMessage("Succesful", event.getFile().getFileName() + " is uploaded.");
        ServletContext pCont = (ServletContext) FacesContext.getCurrentInstance().getExternalContext().getContext();

        try {
            copyFile(aUname + "_avatar.jpg", event.getFile().getInputstream());
            ImageUtil.imageResize(destination + "ala_avatar.jpg", destination + "ala_small_avatar.jpg");
        } catch (IOException e) {
            e.printStackTrace();
        }
        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    static public void copyFile(String fileName, InputStream in) {
        try {
            File pCurrentFile = new File(destination + fileName);
            pCurrentFile.delete();

            OutputStream out = new FileOutputStream(new File(destination + fileName));

            int read = 0;
            byte[] bytes = new byte[1024];

            while ((read = in.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }

            in.close();
            out.flush();
            out.close();

            System.out.println("New file created!");
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }

}
