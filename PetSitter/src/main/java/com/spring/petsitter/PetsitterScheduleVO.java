package com.spring.petsitter;

/*create table petsitter_schedule(
PETSITTER_ID varchar2(30),
START_DATE date,
END_DATE date);
*/
public class PetsitterScheduleVO {
	private String PETSITTER_ID;
	private String START_DATE;
	private String END_DATE;
	
	public String getPETSITTER_ID() {
		return PETSITTER_ID;
	}
	public void setPETSITTER_ID(String pETSITTER_ID) {
		PETSITTER_ID = pETSITTER_ID;
	}
	public String getSTART_DATE() {
		return START_DATE;
	}
	public void setSTART_DATE(String sTART_DATE) {
		START_DATE = sTART_DATE;
	}
	public String getEND_DATE() {
		return END_DATE;
	}
	public void setEND_DATE(String eND_DATE) {
		END_DATE = eND_DATE;
	}
	
	
}
