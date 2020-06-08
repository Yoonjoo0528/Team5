package com.community.common;

/*
 * DB 접속 정보, 쿼리문, 테이블명, 컬럼명 등은
 * 별도로 관리하든지
 * 
 * XML, 초기화 파라미터 등에서 관리하는 것이 좋다.
 * 
 */

/*  Question DB 속성명
	Qno Number	// 게시글 No
	Qtitle varchar2(20)	// 제목 -> 20자 미만 받으면 안됨
	Qcontent clob	// 내용물
	Qregdate date	// 날짜
	Qclickcnt number	// 조회수
	Qkeyword varchar2(50) // 키워드
*/

/*
	private int no;			// 게시글 No
	private String title; 	// 게시글 제목 글자수 : 7 ~ 20자
	private String content;	// 게시글 안의 내용물 : 제한 없음
	private String date;	// 날짜
	private int clickCnt;	// 클릭수
	private String keyword;	// 키워드
*/
/*
 * CREATE SEQUENCE SEQ_question_Qno INCREMENT BY 1 START WITH 1;
 * */

public class CommunityD {
	
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver"; // JDBC 드라이버 클래스
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE"; // DB 접속 URL
	public static final String USERID = "team5"; // DB 접속 계정 정보
	public static final String USERPW = "team5";
	
	// 쿼리문 작성하기
	// Insert 쿼리문
	public static final String SQL_WRITE_INSERT = "INSERT INTO Question"
		+ "(Qno, Qtitle, Qcontent, Qkeyword, Qmember_id) "
		+ "VALUES(SEQ_question_Qno.nextval, ?, ?, ?, ?)";
	
	
	// View 화면에서 사용하는 쿼리문
	// no으로 데이터 조회하기(View에서도 사용하지면 update에서도 사용..!!, 기존 사용 내역 불러올때)
	public static final String SQL_SELECT_BY_QNO 
		= "SELECT * FROM Question WHERE Qno = ?";
	
	// click 수 증가
	public static final String SQL_INC_QCLICKCNT = "UPDATE Question SET "
			+ "Qclickcnt = Qclickcnt + 1 WHERE Qno = ?";

	
	// list.jsp
	// 전체 검색하기 (Insert문에서 사용 : Qno를 추출하기 위해) 
	public static final String SQL_WRITE_SELECT 
		= "SELECT * FROM Question ORDER BY Qno DESC";  
	
	// 페이징
	// 글 목록 전체 개수 가져오기
	public static final String SQL_COUNT_ALL = "SELECT count(*) FROM Question";
	
	// fromRow 부터 pageRows 만큼 SELECT
	// (몇번째) 부터 (몇개) 만큼
	public static final String SQL_SELECT_FROM_ROW =  "SELECT * FROM "
		+ "(SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM Question ORDER BY Qno DESC) T) "
		+ "WHERE RNUM >= ? AND RNUM < ?";
	
	
	/* Update.jsp */
	public static final String SQL_WRITE_UPDATE = "UPDATE Question " 
		+ "SET Qtitle = ?, Qcontent = ?, Qkeyword = ? WHERE Qno = ?";
	
	/* delete.jsp */
	public static final String SQL_DELETE_BY_QNO
		= "DELETE FROM Question WHERE Qno = ?";
	
	/* 댓글 삽입하기 */
	public static final String SQL_COMMENT_INSERT = "INSERT INTO QComment(Cno, Cqno, Ccontent, Cmember_id) "
		+ "VALUES(SEQ_QComment_Cno.nextval, ?, ?, ?)";
	
	/* 각각의 게시글에 맞는 댓글 전체 조회하기 */
	public static final String SQL_COMMENT_SELECT_ALL
		= "SELECT * FROM QComment WHERE Cqno=?";

	
	
}























