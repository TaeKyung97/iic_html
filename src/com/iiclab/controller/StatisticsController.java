package com.iiclab.controller;

import com.iiclab.dao.StatisticsDao;
import com.iiclab.dto.StatisticsDto;

public class StatisticsController {
    private StatisticsDao dao = new StatisticsDao();

    public StatisticsDto fetchStatistics() {
        return dao.getStatistics();
    }
}

