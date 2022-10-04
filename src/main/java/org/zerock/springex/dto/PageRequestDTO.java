package org.zerock.springex.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Positive;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.Arrays;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageRequestDTO {

    @Builder.Default
    @Min(value = 1)
    @Positive
    private int page = 1;

    @Builder.Default
    @Min(value = 10)
    @Max(value = 100)
    @Positive
    private int size = 10;

    private String link;

    // 검색 종류
    private String[] types;

    // 제목, 작성자 검색에 사용하는 문자열
    private String keyword;

    private boolean finished;

    private LocalDate from;

    private LocalDate to;

    public int getSkip() {
        return (page-1) * 10;
    }

    public String getLink() {
        StringBuilder sb = new StringBuilder();
        sb.append("page=").append(this.page);
        sb.append("&size=").append(this.size);

        if (finished) {
            sb.append("&finished=on");
        }

        if (types != null && types.length > 0) {
            for (String type : types) {
                sb.append("&types=").append(type);
            }
        }

        if (keyword != null) {
            try {
                // keyword는 한글이 가능하기 때문에 URLEncoder로 인코딩 해준다.
                sb.append("&keyword=").append(URLEncoder.encode(keyword, "UTF-8"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

        if(from != null) {
            sb.append("&from=").append(from.toString());
        }

        if(to != null) {
            sb.append("&to=").append(to.toString());
        }

        return sb.toString();
    }

    public boolean checkType(String type) {
        if (types == null || types.length == 0) {
            return false;
        }
        return Arrays.stream(types).anyMatch(type::equals);
    }
}
