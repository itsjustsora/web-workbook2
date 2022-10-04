package org.zerock.springex.mapper;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.zerock.springex.domain.TodoVO;
import org.zerock.springex.dto.PageRequestDTO;
import org.zerock.springex.dto.PageResponseDTO;
import org.zerock.springex.dto.TodoDTO;

import java.time.LocalDate;
import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class TodoMapperTests {

    @Autowired(required = false)
    private TodoMapper todoMapper;

    @Test
    void testGetTime() {
        log.info("todoMapper.getTime(): {}", todoMapper.getTime());
    }

    @Test
    void testInsert() {
        TodoVO todoVO = TodoVO.builder()
                .title("스프링 테스트")
                .dueDate(LocalDate.of(2022,10,1))
                .writer("user00")
                .build();

        todoMapper.insert(todoVO);
    }

    @Test
    void testSelectAll() {
        todoMapper.selectAll();
    }

    @Test
    void testSelectOne() {

        TodoVO todoVO = todoMapper.selectOne(1L);
        log.info("todoVO: {}", todoVO);
    }

    @Test
    void testSelectList() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .size(10)
                .build();

        List<TodoVO> voList = todoMapper.selectList(pageRequestDTO);

        voList.forEach(vo -> log.info("vo: {}", vo));
    }

    @Test
    void testSelectSearch() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .size(10)
                .types(new String[]{"t", "w"})
                //.keyword("스프링")
                .from(LocalDate.of(2022,10,01))
                .to(LocalDate.of(2022,10,31))
                .finished(true)
                .build();

        List<TodoVO> voList = todoMapper.selectList(pageRequestDTO);

        voList.forEach(vo -> log.info("vo: {}", vo));
        log.info("count: {}", todoMapper.getCount(pageRequestDTO));
    }

}
