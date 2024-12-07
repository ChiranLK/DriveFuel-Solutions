package com.DFSolutions.report;

public class Report {
	private int reportid;
	private String text;
	private String description;
	private String date;
	private String type;
	private String frequency;
	
	public Report(int ReportID, String text, String description, String date, String type, String frequency) {
		this.reportid = ReportID;
		this.text = text;
		this.description = description;
		this.date = date;
		this.type = type;
		this.frequency = frequency;
	}

	public int getReportID() {
		return reportid;
	}

	public void setReportID(int reportID) {
		reportid = reportID;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFrequency() {
		return frequency;
	}

	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}
}
