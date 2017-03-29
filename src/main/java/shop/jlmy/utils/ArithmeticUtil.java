package shop.jlmy.utils;

import java.math.BigDecimal;

/*
 * 运算工具
 */
public class ArithmeticUtil {

	//解决float加减运算精度丢失的问题
	public static float float_subtraction(float param_big,float param_small){
		BigDecimal num1=new BigDecimal(Float.toString(param_big));
		BigDecimal num2=new BigDecimal(Float.toString(param_small));
		return num1.subtract(num2).floatValue();
	}
	
	//float加法
	public static float float_addition(float param_0,float param_1){
		BigDecimal num1=new BigDecimal(Float.toString(param_0));
		BigDecimal num2=new BigDecimal(Float.toString(param_1));
		return num1.add(num2).floatValue();
	}
	
	public static void main(String[] args) {
		System.out.println(float_subtraction(10.90f, 1.10f));
		System.out.println(float_addition(1.67f, 2.03f));
		System.out.println(100*0.88f);
	}
}
