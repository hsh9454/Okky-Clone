package com.okkyclone.domain;

import java.util.Date;

public class ActivityVO {

	private String activityType;
	private Date activityDate;
	private int activityCount;

	public ActivityVO() {
	}

	public String getActivityType() {
		return activityType;
	}

	public void setActivityType(String activityType) {
		this.activityType = activityType;
	}

	public Date getActivityDate() {
		return activityDate;
	}

	public void setActivityDate(Date activityDate) {
		this.activityDate = activityDate;
	}

	public int getActivityCount() {
		return activityCount;
	}

	public void setActivityCount(int activityCount) {
		this.activityCount = activityCount;
	}

	@Override
	public String toString() {
		return "ActivityVO [activityType=" + activityType + ", activityDate=" + activityDate + ", activityCount="
				+ activityCount + "]";
	}
}