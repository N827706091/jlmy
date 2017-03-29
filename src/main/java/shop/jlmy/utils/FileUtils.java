package shop.jlmy.utils;

import java.io.File;
import java.io.FileFilter;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class FileUtils {

	/*
	 * 	---文件分页读取---
	 * path     路径
	 * pageNow  当前页
	 * pageSize 读取的文件数
	 */
	public static File[] filePage(String path,String[] fileTypes, int pageNow,int pageSize){
        File f=new File(path);
        File[] allFiles=f.listFiles(new FileFilter() {//过滤掉目录 
        	@Override
            public boolean accept(File f) {
        		if (f.isFile()) {
        			for(int i=0;i<fileTypes.length;i++){
        				String suffix=f.getName().substring(f.getName().lastIndexOf("."));
                    	if (suffix.equals(fileTypes[i])) {
                    		return true;
                    	}
                    }  
				}
            	return false;
                //return f.isFile()?true:false;
            }
        });
        System.out.println("文件个数："+allFiles.length);
        int init=(pageNow-1)*pageSize;
        //页数太大
        if(init>allFiles.length){
            return new File[0];
        }
        File[] output=Arrays.copyOfRange(allFiles, init, init+pageSize);
        if(init+pageSize>allFiles.length){
        	//不足一页的情况 去掉null
            int size=allFiles.length-init;
            output=Arrays.copyOf(output, size);
        }
        return output;
    }

	 /*
     * 函数名：getFile
     * 作用：使用递归，输出指定文件夹内的所有文件
     * 参数：path：文件夹路径   deep：表示文件的层次深度，控制前置空格的个数
     * 前置空格缩进，显示文件层次结构
     */
    public static List<String> getFile(String path){   
        // 获得指定文件对象  
        File file = new File(path);   
        // 获得该文件夹内的所有文件   
        File[] array = file.listFiles();
        if (null==array) {
			return null;
		}
        List<String> colourList=new ArrayList<>();
        for(int i=0;i<array.length;i++)
        {   
            if(array[i].isFile())//如果是文件
            {
                System.out.println( array[i].getName());   
                colourList.add(array[i].getName());
                // 输出当前文件的完整路径   
               // System.out.println("#####" + array[i]);   
                // 同样输出当前文件的完整路径   大家可以去掉注释 测试一下   
               // System.out.println(array[i].getPath());   
            }
            else if(array[i].isDirectory())//如果是文件夹
            {  
                    System.out.println( array[i].getName());
                    //System.out.println(array[i].getPath());
                    //文件夹需要调用递归 ，深度+1
                getFile(array[i].getPath());  
            }   
        }
        return colourList;
    }

    /*public static boolean deleteFile(String path,String fileName){
    	// 获得指定文件对象  
        File file = new File(path);   
        // 获得该文件夹内的所有文件   
        File[] array = file.listFiles();
        for (int i = 0; i < array.length; i++) {
        	File fileTemp=array[i];
        	if (fileTemp.getName().equals(fileName)) {
				return fileTemp.delete();
			}
		}
    	return false;
    }
    */

    public static boolean deleteFile(String sPath) {  
        boolean flag = false;  
        File file = new File(sPath);
        // 路径为文件且不为空则进行删除  
        if (file.exists() && file.isFile()) {  
            file.delete();
            flag = true;
        }
        return flag;
    }
    
    //删除空目录
    public static boolean deleteNullDirectory(String path){
    	File file=new File(path);
    	if (file.exists() && file.isDirectory()) {
    		 String[] files = file.list();
             if (files.length == 0) {
 				file.delete();
 				return true;
             }
		}
    	return false;
    }
    /** 
     * 删除目录（文件夹）以及目录下的文件 
     * @param   sPath 被删除目录的文件路径 
     * @return  目录删除成功返回true，否则返回false 
     */  
    public static boolean deleteDirectoryAndFile(String sPath) {  
        //如果sPath不以文件分隔符结尾，自动添加文件分隔符  
        if (!sPath.endsWith(File.separator)) {  
            sPath = sPath + File.separator;  
        }  
        File dirFile = new File(sPath);  
        //如果dir对应的文件不存在，或者不是一个目录，则退出  
        if (!dirFile.exists() || !dirFile.isDirectory()) {  
            return false;  
        }  
        boolean flag = true;  
        //删除文件夹下的所有文件(包括子目录)  
        File[] files = dirFile.listFiles();  
        for (int i = 0; i < files.length; i++) {  
            //删除子文件  
            if (files[i].isFile()) {  
                flag = deleteFile(files[i].getAbsolutePath());  
                if (!flag) break;  
            } //删除子目录  
            else {  
                flag = deleteDirectoryAndFile(files[i].getAbsolutePath());  
                if (!flag) break;  
            }  
        }  
        if (!flag) return false;  
        //删除当前目录  
        if (dirFile.delete()) {  
            return true;  
        } else {  
            return false;  
        }  
    }

    //修改文件或文件夹名称
    public static boolean renameDirectoryOrFile(String oldPath,String newPath){
    	File oldFileOrDir=new File(oldPath);
    	if (oldFileOrDir.exists()) {
    		System.out.println("111");
			return oldFileOrDir.renameTo(new File(newPath));
		}
    	System.out.println("222");
    	return false;
    }

    public static List<String> getSuffixFiles(String path,String[] fileTypes){
    	//要进行过滤的文件目录  
        File folder = new File(path);  
       //存储所有符合条件的文件名  
        List<String> allfilename = new ArrayList<String>();  
            //过滤文件类型列表  
        //String[] Filetypes = {"sql","dmp"};  
        MyFileSuffixFilter filter = null;  
        for(int i=0;i<fileTypes.length;i++){  
           filter = new MyFileSuffixFilter(fileTypes[i]);  
           String[] filenames = folder.list(filter);
           allfilename.addAll(Arrays.asList(filenames));  
        }  
        return allfilename;
    }
}

//实现FilenameFilter接口,可用于过滤器文件名
//本方法实现的是筛选指定格式结尾的文件
class MyFileSuffixFilter implements FilenameFilter {
	
	String extension;  

	MyFileSuffixFilter(String extension){  
        this.extension = extension;  
    }  
      
    public boolean accept(File directory, String filname) {  
        // TODO Auto-generated method stub  
        return filname.endsWith(extension);  
    }  
}
