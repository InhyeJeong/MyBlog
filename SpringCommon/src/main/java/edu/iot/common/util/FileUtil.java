package edu.iot.common.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;

// 파일과 관련된 기능은 여기로
/** FileSelect션 클래스의 BufferedReader를 FileUtil 클래스에 readLine()로 범용화함.**/

/** 라인별로 읽고 싶을때 BufferedReader 사용 **/
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.util.FileCopyUtils;




public class FileUtil {

	public static List<String> readLines(File file) {

		return readLines(file, "utf-8"); // 코드 중복이 심함 > 특수한 경우가 범용적인 것을 호출

//		List<String> list = new ArrayList<>();
//		//try 밖에서 List
//		try (
//				BufferedReader br = new BufferedReader( //utf-8로 읽어들임
//										new FileReader(file)); // new FileReader(고정되지않음)
//		){ // 라인별 읽기, 출력하기
//			String lineString;
//			while ((lineString = br.readLine()) != null) {
//				System.out.println(lineString);
//				// List에 담아서 add로 읽고 라인별로
//				list.add(lineString);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list;
	}

	// 위와 같음 문자셋만 다름
	public static List<String> readLines(File file, String charset) {
		List<String> list = new ArrayList<>();
		try (BufferedReader br = new BufferedReader( // 문자셋을 받아서 처리함 not utf-8
				new InputStreamReader(new FileInputStream(file), charset)); // 적용할 문자셋을 지정
		) {
			String line;
			while ((line = br.readLine()) != null) {
				list.add(line);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 직렬, 역직렬화와 관련된 메서드 TourPlanServiceImpl에서 필요해서 넘어옴
	/** 직렬화 **/
	public static void serialize(String path, Object obj) throws Exception { // 매개변수( 파일경로, 저장할 객체인스턴스) // 예외던지기
		try (ObjectOutputStream oos = new ObjectOutputStream(
				new FileOutputStream(path))
		){
			oos.writeObject(obj);

		}

//		oos.flush();
	}

	/** 역직렬화 
	 * @return **/
	public static Object deserialize(String path) throws Exception { // 매개번수(파일경로), 리턴타입은 오브젝트

		try (ObjectInputStream ois = new ObjectInputStream(
				new FileInputStream(path))
		){
			return ois.readObject();

		}
	}
	
	/**오라클&자바 : Gson */
	public static String readAll(String path) throws Exception {
		StringBuilder sb = new StringBuilder();
		try(BufferedReader br = new BufferedReader(
				new FileReader(path));
		){
			int ch;
			while((ch=br.read()) !=-1) {
				sb.append((char)ch);
			}
		}
		return sb.toString();
	}
	/**소스폴더에 있는json파일을 읽기위한 파일경로를 알아내는 메서드*/
	public static String readResource(String path) throws Exception {
		//fileutil기준으로 실제 경로를 얻어내서 readAll로 읽어냄
		//database.java 파일을 범용화시킨것
		//System.out.println(path);//famoussaying.json
		path = FileUtil.class.getResource(path).getPath();
		//System.out.println(path);//C:/iot-workspace/java-study/jdbc_test/target/classes/famoussaying.json
		return readAll(path);
	
	}
	
	//메모리를 STREAM으로 운영하겠다는 것
	//IO와똑같이 운영된다., STRINGBUILDER와 똑같다.
	//table에 넣을때 필요
	public static byte[] bytes(File file) throws Exception {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		try(BufferedInputStream bis = new BufferedInputStream(
				new FileInputStream(file)) 
		){
			int data;
			while ((data=bis.read())!=-1) {
				out.write(data);
			}
			return out.toByteArray();
		} 
	}
	//byte[] 배열을 파일에 저장하기
	//table에 꺼낼때 필요 즉, 파일로 저장할때
	public static void save(File file, byte[] data)throws Exception {
		try(
			FileOutputStream fos = new FileOutputStream(file)
		){
			fos.write(data);
		}
	}
	
	/**Aqurius 프로젝트>app.view 패키지>FileView클래스에서 사용됨
	 * 사용자 정의 뷰에서 사용되는 copy메서드 만들기
	 * @param <ServletOutputStream>*/
	public static void copy(String path, OutputStream out) throws Exception {
		try(
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(path));
			BufferedOutputStream bos = new BufferedOutputStream(out)
		){
			int data;
			while((data=bis.read())!= -1) {
				bos.write(data);
			}
			bos.flush();
		} 
	}
}
