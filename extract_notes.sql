
USE NM_BI 
DECLARE @cohort_id AS INT = 4119 ; 
drop table #main_co
--------------------------------------------------------------------------------
-- MAIN COHORT
--------------------------------------------------------------------------------
--Select * from [FSM_Analytics].cohort.cohort_patients where cohort_id=4119


SELECT pc.ir_id
	, pc.nmff_mrn
	,patient_key
	--, pc.full_name
	, pc.birth_date
	, pc.gender
	--, nm_bi.dbo.calc_age(pc.birth_date, GETDATE()) AS age
	, pc.race_1
	--, pc.race_2
	--, pc.race_3
	--, pc.race_4

INTO #main_co
FROM NM_BI.dim.vw_patient_current pc
	JOIN [FSM_Analytics].cohort.cohort_patients cp 
	 ON cp.source_ir_id = pc.ir_id
	 AND cp.is_dltd_flg = 0
	 AND cp.cohort_id = @cohort_id
	JOIN [FSM_Analytics].cohort.cohorts c ON c.cohort_id = cp.cohort_id
	 AND c.is_dltd_flg = 0
--WHERE pc.is_current = 1
	AND pc.ir_id <> 0
	--AND pc.is_alive=1
		--AND (
				--(pc.race_1 IS NULL 
							--	OR pc.race_1 IN ('Black or African American', 'African', 'Unknown', '2 or more races', 'Unable to Answer'
							--	, 'Declined', 'Declined to Answer', 'Patient Declined', 'not_applicable', 'no_value', 'Other', 'Other Race', 'not_happened_yet'))		
		--	)
--
;

Select distinct mc.ir_id, 'AlonaendAlona' as AlonaendAlona
,n.note_key
, 'AlonaendAlona' as AlonaendAlona
, n.patient_key
, 'AlonaendAlona' as AlonaendAlona
, n.department_key
, 'AlonaendAlona' as AlonaendAlona
, d.department_name
, 'AlonaendAlona' as AlonaendAlona
, n.note_type
, 'AlonaendAlona' as AlonaendAlona
, n.note_text
, 'AlonaendAlona' as AlonaendAlona
, n.signed_date_key
, '77endofline777' as 'endofline' 
from #main_co mc
join NM_BI.fact.vw_note n
on mc.patient_key=n.patient_key
join NM_BI.dim.vw_department d
on n.department_key=d.department_key
where (
		note_type in ('NMH Anatomical Pathology'
					,'Progress Notes'
					,'Nephrology - Progress Note'
					,'Nephrology - Progress Notes'
					,'OP Transplant ID Progress NOte'
					,'IR - Progress Note'
					,'MLP Student - Progress Note'
					,'Hospitalist Discharge Instructions'
					,'Discharge Summaries'
					,'Discharge Summary')
		or
		(department_name in ('rheumatology'
							,'nephrology'
							,'transplant')
		and note_type = 'Consult')
		)
