package com.sister.web.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.acegisecurity.Authentication;
import org.acegisecurity.context.SecurityContext;
import org.acegisecurity.context.SecurityContextHolder;
import org.acegisecurity.userdetails.UserDetails;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class WebUtil {
	private static Log log = LogFactory.getLog(WebUtil.class);
	
	public static final String GUEST = "GUEST";

	protected static Log logger = LogFactory.getLog(WebUtil.class);

	@Deprecated
	public static String getPassword(){
		return getPassword(null);
	}
	
	@Deprecated
	public static String getPassword(HttpServletRequest request) {
		return null;
	}
	
	/**
	 * 设置cookie
	 * 
	 */
	public static void setCookie(HttpServletResponse response, String key, String value){
		setCookie(response, key, value, null);
	}
	
	/**
	 * 设置cookie
	 * maxAge == null表示使用默认有效时长，即仅在关闭浏览器前有效
	 */
	public static void setCookie(HttpServletResponse response, String key, String value, Integer maxAge){
		setCookie(response, key, value, maxAge, null, "/");
	}
	
	public static void setCookie(HttpServletResponse response, String key, String value, Integer maxAge, String domain, String path){
		Cookie cookie = new Cookie(key, value);
		if(maxAge != null){
			cookie.setMaxAge(maxAge);
		}
		if(!StringUtil.isNull(domain)){
			cookie.setDomain(domain);
		}
		if(!StringUtil.isNull(path)){
			cookie.setPath(path);
		}
		response.addCookie(cookie);
	}
	
	/**
	 * 获取cookie
	 */
	public static Cookie getCookie(HttpServletRequest request, String key){
		if(StringUtil.isNull(key)){
			return null;
		}
		Cookie[] cookies = request.getCookies();
		if(cookies == null){
			return null;
		}
		for(Cookie cookie: cookies){
			if(key.equals(cookie.getName())){
				return cookie;
			}
		}
		return null;
	}
	
	/**
	 * 获取cookie的值
	 */
	public static String getCookieValue(HttpServletRequest request, String key){
		Cookie cookie = getCookie(request, key);
		if(cookie == null){
			return "";
		}
		return cookie.getValue();
	}
	
	/**
	 * 删除cookie
	 */
	public static void removeCookie(HttpServletResponse response, String key){
		removeCookie(response, key, null, "/");
	}
	
	public static void removeCookie(HttpServletResponse response, String key, String domain, String path){
		setCookie(response, key, "", 0, domain, path);
	}
	
	public static String getUserId(HttpServletRequest request) {
		// FIXME fix it further
		String userName = GUEST;
		SecurityContext ctx = SecurityContextHolder.getContext();
		log.debug("ctx:" + ctx);
		if (ctx != null) {
			Authentication auth = ctx.getAuthentication();
			log.debug("auth:" + auth);
			if (auth != null) {
				Object principal = auth.getPrincipal();
				if (principal instanceof UserDetails) {
					userName = ((UserDetails) principal).getUsername();
				}
			}
		}
		log.debug("username:" + userName);
		return userName;

	}
	
	public static boolean isGuest() {
		boolean isGuest = getUserId(null).equalsIgnoreCase(GUEST);
		return isGuest;
	}

	/**
	 * 获取request下的UTF-8编码过的完整URL（包含queryString）
	 * 
	 * @param request
	 * @return
	 */
	public static String getEncodedRequestURL(HttpServletRequest request) {
		String currentURL = getRequestURL(request);
		if (StringUtil.isNull(currentURL))
			return currentURL;
		try {
			currentURL = URLEncoder.encode(currentURL, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return currentURL;
	}
	
	/**
	 * 获取request下的完整URL（包含queryString）
	 * 
	 * @param request
	 * @return
	 */
	public static String getRequestURL(HttpServletRequest request) {
		String currentURL = null;
		if (request == null)
			return currentURL;
		currentURL = (String) request.getAttribute("currentURL");
		return currentURL;
	}
	
	
	public static boolean fromMobile(HttpServletRequest request){
		String[] MOBILE_USER_AGENT=new String[]{
			    "Nokia",//诺基亚，有山寨机也写这个的，总还算是手机，Mozilla/5.0 (Nokia5800 XpressMusic)UC AppleWebkit(like Gecko) Safari/530
			    "SAMSUNG",//三星手机 SAMSUNG-GT-B7722/1.0+SHP/VPP/R5+Dolfin/1.5+Nextreaming+SMM-MMS/1.2.0+profile/MIDP-2.1+configuration/CLDC-1.1
			    "MIDP-2",//j2me2.0，Mozilla/5.0 (SymbianOS/9.3; U; Series60/3.2 NokiaE75-1 /110.48.125 Profile/MIDP-2.1 Configuration/CLDC-1.1 ) AppleWebKit/413 (KHTML like Gecko) Safari/413
			    "CLDC1.1",//M600/MIDP2.0/CLDC1.1/Screen-240X320
			    "SymbianOS",//塞班系统的，
			    "MAUI",//MTK山寨机默认ua
			    "UNTRUSTED/1.0",//疑似山寨机的ua，基本可以确定还是手机
			    "Windows CE",//Windows CE，Mozilla/4.0 (compatible; MSIE 6.0; Windows CE; IEMobile 7.11)
			    "iPhone",//iPhone是否也转wap？不管它，先区分出来再说。Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_1 like Mac OS X; zh-cn) AppleWebKit/532.9 (KHTML like Gecko) Mobile/8B117
			    "iPad",//iPad的ua，Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; zh-cn) AppleWebKit/531.21.10 (KHTML like Gecko) Version/4.0.4 Mobile/7B367 Safari/531.21.10
			    "Android",//Android是否也转wap？Mozilla/5.0 (Linux; U; Android 2.1-update1; zh-cn; XT800 Build/TITA_M2_16.22.7) AppleWebKit/530.17 (KHTML like Gecko) Version/4.0 Mobile Safari/530.17
			    "BlackBerry",//BlackBerry8310/2.7.0.106-4.5.0.182
			    "UCWEB",//ucweb是否只给wap页面？ Nokia5800 XpressMusic/UCWEB7.5.0.66/50/999
			    "ucweb",//小写的ucweb貌似是uc的代理服务器Mozilla/6.0 (compatible; MSIE 6.0;) Opera ucweb-squid
			    "BREW",//很奇怪的ua，例如：REW-Applet/0x20068888 (BREW/3.1.5.20; DeviceId: 40105; Lang: zhcn) ucweb-squid
			    "J2ME",//很奇怪的ua，只有J2ME四个字母
			    "YULONG",//宇龙手机，YULONG-CoolpadN68/10.14 IPANEL/2.0 CTC/1.0
			    "YuLong",//还是宇龙
			    "COOLPAD",//宇龙酷派YL-COOLPADS100/08.10.S100 POLARIS/2.9 CTC/1.0
			    "TIANYU",//天语手机TIANYU-KTOUCH/V209/MIDP2.0/CLDC1.1/Screen-240X320
			    "TY-",//天语，TY-F6229/701116_6215_V0230 JUPITOR/2.2 CTC/1.0
			    "K-Touch",//还是天语K-Touch_N2200_CMCC/TBG110022_1223_V0801 MTK/6223 Release/30.07.2008 Browser/WAP2.0
			    "Haier",//海尔手机，Haier-HG-M217_CMCC/3.0 Release/12.1.2007 Browser/WAP2.0
			    "DOPOD",//多普达手机
			    "Lenovo",// 联想手机，Lenovo-P650WG/S100 LMP/LML Release/2010.02.22 Profile/MIDP2.0 Configuration/CLDC1.1
			    "LENOVO",// 联想手机，比如：LENOVO-P780/176A
			    "HUAQIN",//华勤手机
			    "AIGO-",//爱国者居然也出过手机，AIGO-800C/2.04 TMSS-BROWSER/1.0.0 CTC/1.0
			    "CTC/1.0",//含义不明
			    "CTC/2.0",//含义不明
			    "CMCC",//移动定制手机，K-Touch_N2200_CMCC/TBG110022_1223_V0801 MTK/6223 Release/30.07.2008 Browser/WAP2.0
			    "DAXIAN",//大显手机DAXIAN X180 UP.Browser/6.2.3.2(GUI) MMP/2.0
			    "MOT-",//摩托罗拉，MOT-MOTOROKRE6/1.0 LinuxOS/2.4.20 Release/8.4.2006 Browser/Opera8.00 Profile/MIDP2.0 Configuration/CLDC1.1 Software/R533_G_11.10.54R
			    "SonyEricsson",// 索爱手机，SonyEricssonP990i/R100 Mozilla/4.0 (compatible; MSIE 6.0; Symbian OS; 405) Opera 8.65 [zh-CN]
			    "GIONEE",//金立手机
			    "HTC",//HTC手机
			    "ZTE",//中兴手机，ZTE-A211/P109A2V1.0.0/WAP2.0 Profile
			    "HUAWEI",//华为手机，
			    "webOS",//palm手机，Mozilla/5.0 (webOS/1.4.5; U; zh-CN) AppleWebKit/532.2 (KHTML like Gecko) Version/1.0 Safari/532.2 Pre/1.0
			    "GoBrowser",//3g GoBrowser.User-Agent=Nokia5230/GoBrowser/2.0.290 Safari
			    "IEMobile",//Windows CE手机自带浏览器，
			    "WAP2.0"//支持wap 2.0的
			    };
		
		String userAgent = request.getHeader("User-Agent");
		if(userAgent == null){
			return false;
		}
		for (int i = 0; i < MOBILE_USER_AGENT.length; i++) {
            if(userAgent.contains(MOBILE_USER_AGENT[i])){
            	return true;
            }
        }
		return false;
	}
	
}
