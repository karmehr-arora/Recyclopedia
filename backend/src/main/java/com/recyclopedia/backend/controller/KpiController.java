package com.recyclopedia.backend.controller;

import com.recyclopedia.backend.dto.KpiResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class KpiController {

    @GetMapping("/kpis")
    public KpiResponse kpis() {
        return KpiResponse.mock();
    }
}
