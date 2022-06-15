package com.example.lit.domain.vo.project;

import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Data
public class ProjectFileVO {
    private String uuid;
    private String uploadPath;
    private String name;
    private String image;
    private Long projectNumber;


}
