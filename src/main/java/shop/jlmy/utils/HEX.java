package shop.jlmy.utils;

public class HEX {
	/*public static void main(String[] args) {
		String a="jlmt_6";
		String[] aa={"jlmt_1","jlmt_2","jlmt_3","jlmt_4","jlmt_5","jlmt_6"};
		for (int i = 0; i < aa.length; i++) {
			String b=stringToHexString(aa[i]);
			System.out.println(b);
			System.out.println(hexStringToString(b));
		}
		
		//String oldImageName="jlmt_1.JPG";
		//String prefix=oldImageName.substring(oldImageName.lastIndexOf("."));
		//System.out.println(prefix);
	}*/

	/** 
     * 字符串转换为16进制字符串 
     *  
     * @param s 
     * @return 
     */  
    public static String stringToHexString(String s) {  
        String str = "";
        for (int i = 0; i < s.length(); i++) {  
            int ch = (int) s.charAt(i);  
            String s4 = Integer.toHexString(ch);  
            str = str + s4;  
        }  
        return str;  
    }  
  
    /** 
     * 16进制字符串转换为字符串 
     *  
     * @param s 
     * @return 
     */  
    public static String hexStringToString(String s) {  
        if (s == null || s.equals("")) {  
            return null;  
        }  
        s = s.replace(" ", "");  
        byte[] baKeyword = new byte[s.length() / 2];  
        for (int i = 0; i < baKeyword.length; i++) {  
            try {  
                baKeyword[i] = (byte) (0xff & Integer.parseInt(  
                        s.substring(i * 2, i * 2 + 2), 16));  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
        try {  
            s = new String(baKeyword, "utf-8");	//支持中文必须填utf-16
            new String();  
        } catch (Exception e1) {  
            e1.printStackTrace();  
        }  
        return s;  
    }
}