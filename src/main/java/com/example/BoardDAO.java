package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class BoardDAO {

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    private final String BOARD_UPDATE = "update board set title=?, writer=?, content=?, category=? where seq=?";
    @Autowired
    private JdbcTemplate jdbcTemplate;
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    
    public int insertBoard(BoardVO vo) {
        System.out.println("===> JDBC로 insertBoard() 기능 처리");
        String sql="insert into board (title, writer, content, category) values ("
                    +"'"+vo.getTitle()+"',"
                    +"'"+vo.getWriter()+"',"
                    +"'"+vo.getContent()+"',"
                    +"'"+vo.getCategory()+"')";
            return jdbcTemplate.update(sql);
        }

    // 글 삭제
    public int deleteBoard(int seq) {
        String sql="delete from board  where seq= "+seq;
        return jdbcTemplate.update(sql);
    }
    public int updateBoard(BoardVO vo) {
        return jdbcTemplate.update(BOARD_UPDATE,new Object[]{vo.getTitle(), vo.getWriter(), vo.getContent(), vo.getCategory(), vo.getSeq()});
    }

    class BoardRowMapper implements RowMapper <BoardVO>{
        @Override
        public BoardVO mapRow(ResultSet resultSet, int rowNum) throws SQLException{
            BoardVO vo=new BoardVO();
            vo.setSeq(resultSet.getInt("seq"));
            vo.setTitle(resultSet.getString("title"));
            vo.setContent(resultSet.getString("content"));
            vo.setWriter(resultSet.getString("writer"));
            vo.setCategory(resultSet.getString("category"));
            vo.setRegdate(resultSet.getDate("regdate"));
            return vo;
        }
    }

    public BoardVO getBoard(int seq) {
        String sql="select * from board  where seq="+seq;
        return jdbcTemplate.queryForObject(sql,new BoardRowMapper());
    }

    public List<BoardVO> getBoardList(){
        String sql="select * from board order by seq desc";
        return jdbcTemplate.query(sql,new BoardRowMapper());
    }
}

