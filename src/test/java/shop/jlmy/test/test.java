package shop.jlmy.test;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.LineNumberReader;
import java.util.Random;

public class test {
	public static void main(String[] args) {
//		Random random = new Random();
//		int result=random.nextInt(900)+100;
//		System.out.println(result);
		// 指定读取的行号  
        int lineNumber = 2;  
          // 读取文件  
          //File sourceFile = new File("D:/java/test.txt");  
        File sourceFile = new File("G:/JLMY_Images/FRONT_INDEX/NAVIMAGE");  
         
        try {   
        	readForPage(sourceFile, 1, 2);
        } catch (IOException e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
	}
	public static void readForPage(File sourceFile, int pageNo,int pageSize) throws IOException {  
		FileReader in = new FileReader(sourceFile);  
		LineNumberReader reader = new LineNumberReader(in);  
		String s = "";  
		/*if (lineNumber <= 0 || lineNumber > getTotalLines(sourceFile)) {  
		    System.out.println("不在文件的行数范围(1至总行数)之内。");  
		    System.exit(0);  
		}  */
		int startRow = (pageNo - 1) * pageSize + 1;
		int endRow = pageNo * pageSize;
		int lines = 0;  
		System.out.println("startRow:"+startRow);
		System.out.println("endRow:"+endRow);
		while (s != null) {  
		    lines++;  
		    s = reader.readLine();  
		    if(lines >= startRow && lines <= endRow) {  
		        System.out.println("line:"+lines+":"+s);  
		        //System.exit(0);  
		    }  
		}  
		reader.close();  
		in.close();  
    }
}
