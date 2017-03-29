package shop.jlmy.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

/*
 * JSON时间类型过滤
 */
public class JsonDateValueProcessor implements JsonValueProcessor{

	private String pattern = "yyyy-MM-dd";  
	  
    public Object processArrayValue(Object value, JsonConfig config) {  
        return process(value);  
    }  
  
    public Object processObjectValue(String key, Object value, JsonConfig config) {  
        return process(value);  
    }

    private Object process(Object value){  
        if(value instanceof Date){  
            SimpleDateFormat sdf = new SimpleDateFormat(pattern, Locale.UK);  
            return sdf.format(value);  
        }  
        return value == null ? "" : value.toString();  
    }
}
