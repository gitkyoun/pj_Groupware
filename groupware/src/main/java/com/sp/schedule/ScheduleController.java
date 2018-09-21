package com.sp.schedule;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("schedule.scheduleController")
public class ScheduleController {

	@RequestMapping(value="/schedule/month")
	public String month() {
		return ".schedule.main";
	}
}
