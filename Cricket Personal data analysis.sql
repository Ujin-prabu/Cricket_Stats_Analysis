/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Match number]
      ,[Year]
      ,[Played For]
      ,[Opponent]
      ,[Runs scored]
      ,[balls faced]
      ,[Strikerate]
      ,[out/notout]
      ,[4s]
      ,[6s]
      ,[overs bowled]
      ,[Maidens]
      ,[Runs conceded]
      ,[wickets taken]
      ,[Economy]
      ,[catches]
      ,[st]
      ,[Runout]
  FROM [cricket_analysis].[dbo].[Stats]

  --- Total Runs Scored in 117 matches

  select Sum(coalesce([Runs scored],0)) As Total_runs
  From [cricket_analysis].[dbo].[Stats]

  ---- Total Balls Faced
   select Sum(coalesce([Balls Faced],0)) As Total_balls
  From [cricket_analysis].[dbo].[Stats]

  --- AVG Strike Rate 
  select Sum(coalesce([Runs scored],0))/Sum(coalesce([Balls Faced],0))*100 As Strike_Rate
  From [cricket_analysis].[dbo].[Stats]

  ---- 4s
  select Sum(coalesce([4s],0)) As Fours
  From [cricket_analysis].[dbo].[Stats]
  

  ---- Sixes
   select Sum(coalesce([6s],0)) As sixs
  From [cricket_analysis].[dbo].[Stats]


  ---50's in various matches 

  select [Runs scored],[Match number]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50'

  ---- Total 50's
   select count([Runs scored])as Fifty
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50'


  ----- 30's in various match
  select [Runs scored],[Match number]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50'

  ----- Total 30's
  select count([Runs scored])as Thirties
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50'

  ---- Ducks 
  select [Runs scored],[Match number],[Balls Faced]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0'

   select count([Runs scored])as Ducks
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0'

  ---Golden Ducks 
  select [Runs scored],[Match number],[Balls Faced]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1'

  select count([Runs scored])as Golden_Ducks
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1'

  ---- High Scores 
   select Max([Runs scored])as High_score
  From [cricket_analysis].[dbo].[Stats]

  --- Runs Scored For Various Teams (Played For )
 -- 1)CC
  select Sum(coalesce([Runs scored],0)) As Total_runsForcc,Count ([Match Number]) As matches_CC, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikerateForCC,AVg(coalesce([Runs scored],0)) As AvgForCC, Max([Runs scored]) as HSForCC,Sum(coalesce([4s],0)) As FoursForCC, Sum(coalesce([6s],0)) As SixesForCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Played For]='CC' 
  ---[50s and 30's for cc]
  select count([Runs scored])as FiftyForCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Played For]='CC'

  select [Runs scored],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Played For]='CC'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_ForCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Played For]='CC'

  select [Runs scored],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Played For]='CC'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks For CC

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Played For] = 'CC'

   select count([Runs scored])as DucksForCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Played For] = 'CC'

  ---Golden Ducks 
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Played For] = 'CC'

  select count([Runs scored])as Golden_DucksForCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Played For] = 'CC'

  ---2) For Scc 

  select Sum(coalesce([Runs scored],0)) As Total_runsForScc,Count ([Match Number]) As matches_SCC, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikerateForSCC,AVg(coalesce([Runs scored],0)) As AvgForSCC, Max([Runs scored]) as HSForSCC,Sum(coalesce([4s],0)) As FoursForSCC, Sum(coalesce([6s],0)) As SixesForSCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Played For]='SCC' 
  ---[50s and 30's for Scc]
  select count([Runs scored])as FiftyForSCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Played For]='SCC'

  select [Runs scored],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Played For]='SCC'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_ForSCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Played For]='SCC'

  select [Runs scored],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Played For]='SCC'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks For SCC

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Played For] = 'SCC'

   select count([Runs scored])as DucksForSCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Played For] = 'SCC'

  ---Golden DucksFor Scc
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Played For] = 'SCC'

  select count([Runs scored])as Golden_DucksForSCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Played For] = 'SCC'



  --- Runs , Avg and Strikerate Against Various Opponents 

  ---1) Btcc

   select Sum(coalesce([Runs scored],0)) As Total_runsvsBtcc,Count ([Match Number]) As matches_Btcc, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsBtcc,AVg(coalesce([Runs scored],0)) As AvgvsBtcc, Max([Runs scored]) as HSvsBtcc,Sum(coalesce([4s],0)) As FoursVsBtcc, Sum(coalesce([6s],0)) As SixesVsBtcc
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='Btcc' 

  ---- [50's and 30's Against Btcc]

  select count([Runs scored])as FiftyVsBtcc
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='Btcc'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='Btcc'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSBtCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='Btcc'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='Btcc'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs BtCC

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'Btcc'

   select count([Runs scored])as DucksVSBtCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'Btcc'

  ---Golden Ducks vs Btcc
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'Btcc'

  select count([Runs scored])as Golden_DucksvsBtCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'Btcc'
---2) APj

  select Sum(coalesce([Runs scored],0)) As Total_runsvsApj,Count ([Match Number]) As matches_Apj, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsApj,AVg(coalesce([Runs scored],0)) As AvgvsApj, Max([Runs scored]) as HSvsApj,Sum(coalesce([4s],0)) As FoursVsApj, Sum(coalesce([6s],0)) As SixesVsApj
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='Apj' 

  ---- [50's and 30's Against Apj]

  select count([Runs scored])as FiftyVsApj
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='Apj'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='Apj'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSApj
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='Apj'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='Apj'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs Apj

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'Apj'

   select count([Runs scored])as DucksVSApj
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'Apj'

  ---Golden Ducks vs Apj
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'Apj'

  select count([Runs scored])as Golden_DucksvsApj
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'Apj'

---- 3) BCC 

  select Sum(coalesce([Runs scored],0)) As Total_runsvsBCC,Count ([Match Number]) As matches_BCC, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsBCC,AVg(coalesce([Runs scored],0)) As AvgvsBCC, Max([Runs scored]) as HSvsBCC,Sum(coalesce([4s],0)) As FoursVsBCC, Sum(coalesce([6s],0)) As SixesVsBCC
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='BCC' 

  ---- [50's and 30's Against BCC]

  select count([Runs scored])as FiftyVsBCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='BCC'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='BCC'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSBCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='BCC'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='BCC'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs BCC

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'BCC'

   select count([Runs scored])as DucksVSBCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'BCC'

  ---Golden Ducks vs BCC
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'BCC'

  select count([Runs scored])as Golden_DucksvsBCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'BCC'

----4) CC

  select Sum(coalesce([Runs scored],0)) As Total_runsvsCC,Count ([Match Number]) As matches_CC, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsCC,AVg(coalesce([Runs scored],0)) As AvgvsCC, Max([Runs scored]) as HSvsCC,Sum(coalesce([4s],0)) As FoursVsCC, Sum(coalesce([6s],0)) As SixesVsCC
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='CC' 

  ---- [50's and 30's Against CC]

  select count([Runs scored])as FiftyVsCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='CC'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='CC'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='CC'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='CC'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs CC

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'CC'

   select count([Runs scored])as DucksVSCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'CC'

  ---Golden Ducks vs CC
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'CC'

  select count([Runs scored])as Golden_DucksvsCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'CC'

---- 5) CCC

   select Sum(coalesce([Runs scored],0)) As Total_runsvsCCC,Count ([Match Number]) As matches_CCC, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsCCC,AVg(coalesce([Runs scored],0)) As AvgvsCCC, Max([Runs scored]) as HSvsCCC,Sum(coalesce([4s],0)) As FoursVsCCC, Sum(coalesce([6s],0)) As SixesVsCCC
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='CCC' 

  ---- [50's and 30's Against CCC]

  select count([Runs scored])as FiftyVsCCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='CCC'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='CCC'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSCCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='CCC'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='CCC'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs CCC

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'CCC'

   select count([Runs scored])as DucksVSCCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'CCC'

  ---Golden Ducks vs CCC
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'CCC'

  select count([Runs scored])as Golden_DucksvsCCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'CCC'

  ----6) HAPP

   select Sum(coalesce([Runs scored],0)) As Total_runsvsHAPP,Count ([Match Number]) As matches_HAPP, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsHAPP,AVg(coalesce([Runs scored],0)) As AvgvsHAPP, Max([Runs scored]) as HSvsHAPP,Sum(coalesce([4s],0)) As FoursVsHAPP, Sum(coalesce([6s],0)) As SixesVsHAPP
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='HAPP' 

  ---- [50's and 30's Against HAPP]

  select count([Runs scored])as FiftyVsHAPP
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='HAPP'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='HAPP'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSHAPP
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='HAPP'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='HAPP'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs HAPP

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'HAPP'

   select count([Runs scored])as DucksVSHAPP
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'HAPP'

  ---Golden Ducks vs HAPP
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'HAPP'

  select count([Runs scored])as Golden_DucksvsHAPP
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'HAPP'

---7) PCC

   select Sum(coalesce([Runs scored],0)) As Total_runsvsPCC
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='PCC'

  select Count ([Match Number]) As matches_PCC
  From [cricket_analysis].[dbo].[Stats]
  where [Opponent]= 'PCC'

  select Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsPCC
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='PCC'

  select AVg(coalesce([Runs scored],0)) As AvgvsPCC
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='PCC'


  -----8) PPC

  select Sum(coalesce([Runs scored],0)) As Total_runsvsPPC,Count ([Match Number]) As matches_PPC, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsPPC,AVg(coalesce([Runs scored],0)) As AvgvsPPC, Max([Runs scored]) as HSvsPPC,Sum(coalesce([4s],0)) As FoursVsPPC, Sum(coalesce([6s],0)) As SixesVsPPC
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='PPC' 

  ---- [50's and 30's Against PPC]

  select count([Runs scored])as FiftyVsPPC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='PPC'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='PPC'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSPPC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='PPC'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='PPC'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs PPC

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'PPC'

   select count([Runs scored])as DucksVSPPC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'PPC'

  ---Golden Ducks vs PPC
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'PPC'

  select count([Runs scored])as Golden_DucksvsPPC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'PPC'

--- 9) VOC 

  select Sum(coalesce([Runs scored],0)) As Total_runsvsVOC,Count ([Match Number]) As matches_VOC, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsVOC,AVg(coalesce([Runs scored],0)) As AvgvsVOC, Max([Runs scored]) as HSvsVOC,Sum(coalesce([4s],0)) As FoursVsVOC, Sum(coalesce([6s],0)) As SixesVsVOC
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='VOC' 

  ---- [50's and 30's Against VOC]

  select count([Runs scored])as FiftyVsVOC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='VOC'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='VOC'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSVOC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='VOC'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='VOC'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs VOC

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'VOC'

   select count([Runs scored])as DucksVSVOC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'VOC'

  ---Golden Ducks vs VOC
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'VOC'

  select count([Runs scored])as Golden_DucksvsVOC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'VOC'


 
  --- Runs in 2020 & match in 2020

  select Sum(coalesce([Runs scored],0)) As Total_runs2020
  From [cricket_analysis].[dbo].[Stats]
  where [Year]= '2020'
  --------- Matches 2020
  select Count ([Match Number]) As matches_2020
  From [cricket_analysis].[dbo].[Stats]
  where [Year]= '2020'

  ----- Avg Runs in 2020

  select Sum(coalesce([Runs scored],0))/ Count ([Match Number]) As Avg_runs_2020
  From [cricket_analysis].[dbo].[Stats]
  where [Year]= '2020'

  ---- Balls Faced in 2020
  select Sum(coalesce([Balls Faced],0)) As Total_balls2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Year]='2020'

  --- StrikeRate 2020
   select Sum(coalesce([Runs scored],0))/Sum(coalesce([Balls Faced],0))*100 As StrikeRate2020
  From [cricket_analysis].[dbo].[Stats]
  where [Year]= '2020'
  ---- Boundies in 2020
  select Sum(coalesce([4s],0)) As Fours_2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Year]='2020'

  ---- Sixes in 2020
   select Sum(coalesce([6s],0)) As sixs_2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Year]='2020'

  --- 50s in 2020 and 30's in 2020
  select count([Runs scored])as Fifty_2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Year] ='2020'

   select [Runs scored],[Match number]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Year]='2020'

  select count([Runs scored])as Thirties_2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Year]='2020'

  select [Runs scored],[Match number]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Year]='2020'

    ---- Ducks 2020
  select [Runs scored],[Match number],[Balls Faced]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Year]='2020'

   select count([Runs scored])as Ducks_2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Year]='2020'

  ---Golden Ducks 2020
  select [Runs scored],[Match number],[Balls Faced]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Year]='2020'

  select count([Runs scored])as Golden_Ducks2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Year]='2020'

  ---High Score 2020
  select Max([Runs scored])as High_score2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Year]='2020'

  ---- [Runs Scored for various teams in Year 2020]

  select Sum(coalesce([Runs scored],0)) As Total_runsForcc,Count ([Match Number]) As matches_CC2020, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikerateForCC2020,AVg(coalesce([Runs scored],0)) As AvgForCC2020, Max([Runs scored]) as HSForCC2020,Sum(coalesce([4s],0)) As FoursForCC2020, Sum(coalesce([6s],0)) As SixesForCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Played For]='CC' and [Year]='2020'
  ---[50s and 30's for cc]
  select count([Runs scored])as FiftyForCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Played For]='CC' and [Year]='2020'

  select [Runs scored],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Played For]='CC' and [Year]='2020'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_ForCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Played For]='CC' and [Year]='2020'

  select [Runs scored],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Played For]='CC' and [Year]='2020'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks For CC

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Played For] = 'CC' and [Year]='2020'

   select count([Runs scored])as DucksForCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Played For] = 'CC' and [Year]='2020'

  ---Golden Ducks 
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Played For] = 'CC' and [Year]='2020'

  select count([Runs scored])as Golden_DucksForCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Played For] = 'CC' and [Year]='2020'


  ----- Batting analysis Each opponent year 2020

  ---1) BTCC 2020
   select Sum(coalesce([Runs scored],0)) As Total_runsvsBtcc2020,Count ([Match Number]) As matches_Btcc2020, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsBtcc2020,AVg(coalesce([Runs scored],0)) As AvgvsBtcc2020, Max([Runs scored]) as HSvsBtcc2020,Sum(coalesce([4s],0)) As FoursVsBtcc2020, Sum(coalesce([6s],0)) As SixesVsBtcc2020
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='Btcc' and [Year]='2020'

  ---- [50's and 30's Against Btcc2020]

  select count([Runs scored])as FiftyVsBtcc2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='Btcc' and [Year]='2020'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='Btcc' and [Year]='2020'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSBtcc2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='Btcc' and [Year]='2020'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='Btcc' and [Year]='2020'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs Btcc2020

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'Btcc' and [Year]='2020'

   select count([Runs scored])as DucksVSBtcc2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'Btcc' and [Year]='2020'

  ---Golden Ducks vs Btcc2020
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'Btcc' and [Year]='2020'

  select count([Runs scored])as Golden_DucksvsBtcc2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'Btcc' and [Year]='2020'

--- 2) APJ 2020
select Sum(coalesce([Runs scored],0)) As Total_runsvsApj2020,Count ([Match Number]) As matches_Apj2020, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsApj2020,AVg(coalesce([Runs scored],0)) As AvgvsApj2020, Max([Runs scored]) as HSvsApj2020,Sum(coalesce([4s],0)) As FoursVsApj2020, Sum(coalesce([6s],0)) As SixesVsApj2020
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='Apj' and [Year]='2020'

  ---- [50's and 30's Against Apj2020]

  select count([Runs scored])as FiftyVsApj2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='Apj' and [Year]='2020'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='Apj' and [Year]='2020'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSApj2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='Apj' and [Year]='2020'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='Apj' and [Year]='2020'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs Apj2020

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'Apj' and [Year]='2020'

   select count([Runs scored])as DucksVSApj2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'Apj' and [Year]='2020'

  ---Golden Ducks vs Apj2020
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'Apj' and [Year]='2020'

  select count([Runs scored])as Golden_DucksvsApj2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'Apj' and [Year]='2020'

 --- 3) BCC 2020
 select Sum(coalesce([Runs scored],0)) As Total_runsvsBCC2020,Count ([Match Number]) As matches_BCC2020, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsBCC2020,AVg(coalesce([Runs scored],0)) As AvgvsBCC2020, Max([Runs scored]) as HSvsBCC2020,Sum(coalesce([4s],0)) As FoursVsBCC2020, Sum(coalesce([6s],0)) As SixesVsBCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='BCC' and [Year]='2020'

  ---- [50's and 30's Against BCC2020]

  select count([Runs scored])as FiftyVsBCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='BCC' and [Year]='2020'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='BCC' and [Year]='2020'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSBCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='BCC' and [Year]='2020'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='BCC' and [Year]='2020'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs BCC2020

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'BCC' and [Year]='2020'

   select count([Runs scored])as DucksVSBCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'BCC' and [Year]='2020'

  ---Golden Ducks vs BCC2020
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'BCC' and [Year]='2020'

  select count([Runs scored])as Golden_DucksvsBCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'BCC' and [Year]='2020'

---- 4) CC 2020

select Sum(coalesce([Runs scored],0)) As Total_runsvsCC2020,Count ([Match Number]) As matches_CC2020, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsCC2020,AVg(coalesce([Runs scored],0)) As AvgvsCC2020, Max([Runs scored]) as HSvsCC2020,Sum(coalesce([4s],0)) As FoursVsCC2020, Sum(coalesce([6s],0)) As SixesVsCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='CC' and [Year]='2020'

  ---- [50's and 30's Against CC2020]

  select count([Runs scored])as FiftyVsCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='CC' and [Year]='2020'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='CC' and [Year]='2020'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='CC' and [Year]='2020'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='CC' and [Year]='2020'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs CC2020

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'CC' and [Year]='2020'

   select count([Runs scored])as DucksVSCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'CC' and [Year]='2020'

  ---Golden Ducks vs CC2020
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'CC' and [Year]='2020'

  select count([Runs scored])as Golden_DucksvsCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'CC' and [Year]='2020'

---5) CCC 2020

  select Sum(coalesce([Runs scored],0)) As Total_runsvsCCC2020,Count ([Match Number]) As matches_CCC2020, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsCCC2020,AVg(coalesce([Runs scored],0)) As AvgvsCCC2020, Max([Runs scored]) as HSvsCCC2020,Sum(coalesce([4s],0)) As FoursVsCCC2020, Sum(coalesce([6s],0)) As SixesVsCCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='CCC' and [Year]='2020'

  ---- [50's and 30's Against CCC2020]

  select count([Runs scored])as FiftyVsCCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='CCC' and [Year]='2020'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='CCC' and [Year]='2020'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSCCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='CCC' and [Year]='2020'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='CCC' and [Year]='2020'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs CCC2020

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'CCC' and [Year]='2020'

   select count([Runs scored])as DucksVSCCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'CCC' and [Year]='2020'

  ---Golden Ducks vs CCC2020
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'CCC' and [Year]='2020'

  select count([Runs scored])as Golden_DucksvsCCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'CCC' and [Year]='2020'


---6) HAPP 2020

 select Sum(coalesce([Runs scored],0)) As Total_runsvsHAPP2020,Count ([Match Number]) As matches_HAPP2020, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsHAPP2020,AVg(coalesce([Runs scored],0)) As AvgvsHAPP2020, Max([Runs scored]) as HSvsHAPP2020,Sum(coalesce([4s],0)) As FoursVsHAPP2020, Sum(coalesce([6s],0)) As SixesVsHAPP2020
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='HAPP' and [Year]='2020'

  ---- [50's and 30's Against HAPP2020]

  select count([Runs scored])as FiftyVsHAPP2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='HAPP' and [Year]='2020'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='HAPP' and [Year]='2020'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSHAPP2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='HAPP' and [Year]='2020'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='HAPP' and [Year]='2020'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs HAPP2020

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'HAPP' and [Year]='2020'

   select count([Runs scored])as DucksVSHAPP2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'HAPP' and [Year]='2020'

  ---Golden Ducks vs HAPP2020
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'HAPP' and [Year]='2020'

  select count([Runs scored])as Golden_DucksvsHAPP2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'HAPP' and [Year]='2020'

--- 7) PCC 2020
     select Sum(coalesce([Runs scored],0)) As Total_runsvsPCC2020,Count ([Match Number]) As matches_PCC2020, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsPCC2020,AVg(coalesce([Runs scored],0)) As AvgvsPCC2020, Max([Runs scored]) as HSvsPCC2020,Sum(coalesce([4s],0)) As FoursVsPCC2020, Sum(coalesce([6s],0)) As SixesVsPCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='PCC' and [Year]='2020'

  ---- [50's and 30's Against PCC2020]

  select count([Runs scored])as FiftyVsPCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='PCC' and [Year]='2020'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='PCC' and [Year]='2020'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSPCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='PCC' and [Year]='2020'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='PCC' and [Year]='2020'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs PCC2020

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'PCC' and [Year]='2020'

   select count([Runs scored])as DucksVSPCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'PCC' and [Year]='2020'

  ---Golden Ducks vs PCC2020
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'PCC' and [Year]='2020'

  select count([Runs scored])as Golden_DucksvsPCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'PCC' and [Year]='2020'

----8) PPC 2020
select Sum(coalesce([Runs scored],0)) As Total_runsvsPPC2020,Count ([Match Number]) As matches_PPC2020, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsPPC2020,AVg(coalesce([Runs scored],0)) As AvgvsPPC2020, Max([Runs scored]) as HSvsPPC2020,Sum(coalesce([4s],0)) As FoursVsPPC2020, Sum(coalesce([6s],0)) As SixesVsPPC2020
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='PPC' and [Year]='2020'

  ---- [50's and 30's Against PPC2020]

  select count([Runs scored])as FiftyVsPPC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='PPC' and [Year]='2020'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='PPC' and [Year]='2020'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSPPC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='PPC' and [Year]='2020'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='PPC' and [Year]='2020'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs PPC2020

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'PPC' and [Year]='2020'

   select count([Runs scored])as DucksVSPPC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'PPC' and [Year]='2020'

  ---Golden Ducks vs PPC2020
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'PPC' and [Year]='2020'

  select count([Runs scored])as Golden_DucksvsPPC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'PPC' and [Year]='2020'



--- 9) VOC 2020

select Sum(coalesce([Runs scored],0)) As Total_runsvsVOC2020,Count ([Match Number]) As matches_VOC2020, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsVOC2020,AVg(coalesce([Runs scored],0)) As AvgvsVOC2020, Max([Runs scored]) as HSvsVOC2020,Sum(coalesce([4s],0)) As FoursVsVOC2020, Sum(coalesce([6s],0)) As SixesVsVOC2020
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='VOC' and [Year]='2020'

  ---- [50's and 30's Against VOC2020]

  select count([Runs scored])as FiftyVsVOC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='VOC' and [Year]='2020'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='VOC' and [Year]='2020'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSVOC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='VOC' and [Year]='2020'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='VOC' and [Year]='2020'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs VOC2020

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'VOC' and [Year]='2020'

   select count([Runs scored])as DucksVSVOC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'VOC' and [Year]='2020'

  ---Golden Ducks vs VOC2020
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'VOC' and [Year]='2020'

  select count([Runs scored])as Golden_DucksvsVOC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'VOC' and [Year]='2020'



 


  ---Runs in 2021 & matches in 2021
  select Sum(coalesce([Runs scored],0)) As Total_runs2021
  From [cricket_analysis].[dbo].[Stats]
  where [Year]= '2021'

  --------- Matches 2021

   select Count ([Match Number]) as matches_2021
  From [cricket_analysis].[dbo].[Stats]
  where [Year]= '2021'

  ----Average Runs in 2021

  select Sum(coalesce([Runs scored],0))/ Count ([Match Number]) As Avg_runs_2021
  From [cricket_analysis].[dbo].[Stats]
  where [Year]= '2021'

  ---- balls faced in 2021

  select Sum(coalesce([Balls Faced],0)) As Total_balls2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Year]='2021'

  ---- Strike Rate in 2021

   select Sum(coalesce([Runs scored],0))/Sum(coalesce([Balls Faced],0))*100 As StrikeRate2021
  From [cricket_analysis].[dbo].[Stats]
  where [Year]= '2021'

   ---- Boundies in 2021
  select Sum(coalesce([4s],0)) As Fours_2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Year]='2021'

  ---- Sixes in 2021
   select Sum(coalesce([6s],0)) As sixs_2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Year]='2021'

  ---- Fifties and 30's in 2021
   select count([Runs scored])as Fifty_2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Year] ='2021'


  select [Runs scored],[Match number]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Year]='2021'

  select count([Runs scored])as Thirties_2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Year]='2021'

  select [Runs scored],[Match number]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Year]='2021'

     ---- Ducks 2021
  select [Runs scored],[Match number],[Balls Faced]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Year]='2021'

   select count([Runs scored])as Ducks_2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Year]='2021'

  ---Golden Ducks 2021
  select [Runs scored],[Match number],[Balls Faced]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Year]='2021'

  select count([Runs scored])as Golden_Ducks2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Year]='2021'

    ---High Score 2021
  select Max([Runs scored])as High_score2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Year]='2021'

  --- [Batting Analysis 2021 For teams played]
  --- CC
  select Sum(coalesce([Runs scored],0)) As Total_runsForcc,Count ([Match Number]) As matches_CC2021, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikerateForCC2021,AVg(coalesce([Runs scored],0)) As AvgForCC2021, Max([Runs scored]) as HSForCC2021,Sum(coalesce([4s],0)) As FoursForCC2021, Sum(coalesce([6s],0)) As SixesForCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Played For]='CC' and [Year]='2021'
  ---[50s and 30's for cc]
  select count([Runs scored])as FiftyForCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Played For]='CC' and [Year]='2021'

  select [Runs scored],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Played For]='CC' and [Year]='2021'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_ForCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Played For]='CC' and [Year]='2021'

  select [Runs scored],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Played For]='CC' and [Year]='2021'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks For CC

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Played For] = 'CC' and [Year]='2021'

   select count([Runs scored])as DucksForCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Played For] = 'CC' and [Year]='2021'

  ---Golden Ducks 
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Played For] = 'CC' and [Year]='2021'

  select count([Runs scored])as Golden_DucksForCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Played For] = 'CC' and [Year]='2021'

  ---2] Scc 2021

  select Sum(coalesce([Runs scored],0)) As Total_runsForScc,Count ([Match Number]) As matches_Scc2021, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikerateForScc2021,AVg(coalesce([Runs scored],0)) As AvgForScc2021, Max([Runs scored]) as HSForScc2021,Sum(coalesce([4s],0)) As FoursForScc2021, Sum(coalesce([6s],0)) As SixesForScc2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Played For]='Scc' and [Year]='2021'
  ---[50s and 30's for Scc]
  select count([Runs scored])as FiftyForScc
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Played For]='Scc' and [Year]='2021'

  select [Runs scored],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Played For]='Scc' and [Year]='2021'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_ForScc
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Played For]='Scc' and [Year]='2021'

  select [Runs scored],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Played For]='Scc' and [Year]='2021'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks For Scc

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Played For] = 'Scc' and [Year]='2021'

   select count([Runs scored])as DucksForScc
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Played For] = 'Scc' and [Year]='2021'

  ---Golden Ducks 
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Played For] = 'Scc' and [Year]='2021'

  select count([Runs scored])as Golden_DucksForScc
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Played For] = 'Scc' and [Year]='2021'

  --- batting analysis each opponent 2021

   ---1) BTCC 2021
   select Sum(coalesce([Runs scored],0)) As Total_runsvsBtcc2021,Count ([Match Number]) As matches_Btcc2021, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsBtcc2021,AVg(coalesce([Runs scored],0)) As AvgvsBtcc2021, Max([Runs scored]) as HSvsBtcc2021,Sum(coalesce([4s],0)) As FoursVsBtcc2021, Sum(coalesce([6s],0)) As SixesVsBtcc2021
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='Btcc' and [Year]='2021'

  ---- [50's and 30's Against Btcc2021]

  select count([Runs scored])as FiftyVsBtcc2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='Btcc' and [Year]='2021'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='Btcc' and [Year]='2021'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSBtcc2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='Btcc' and [Year]='2021'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='Btcc' and [Year]='2021'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs Btcc2021

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'Btcc' and [Year]='2021'

   select count([Runs scored])as DucksVSBtcc2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'Btcc' and [Year]='2021'

  ---Golden Ducks vs Btcc2021
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'Btcc' and [Year]='2021'

  select count([Runs scored])as Golden_DucksvsBtcc2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'Btcc' and [Year]='2021'

--- 2) APJ 2021
select Sum(coalesce([Runs scored],0)) As Total_runsvsApj2021,Count ([Match Number]) As matches_Apj2021, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsApj2021,AVg(coalesce([Runs scored],0)) As AvgvsApj2021, Max([Runs scored]) as HSvsApj2021,Sum(coalesce([4s],0)) As FoursVsApj2021, Sum(coalesce([6s],0)) As SixesVsApj2021
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='Apj' and [Year]='2021'

  ---- [50's and 30's Against Apj2021]

  select count([Runs scored])as FiftyVsApj2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='Apj' and [Year]='2021'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='Apj' and [Year]='2021'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSApj2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='Apj' and [Year]='2021'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='Apj' and [Year]='2021'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs Apj2021

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'Apj' and [Year]='2021'

   select count([Runs scored])as DucksVSApj2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'Apj' and [Year]='2021'

  ---Golden Ducks vs Apj2021
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'Apj' and [Year]='2021'

  select count([Runs scored])as Golden_DucksvsApj2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'Apj' and [Year]='2021'

 --- 3) BCC 2021
 select Sum(coalesce([Runs scored],0)) As Total_runsvsBCC2021,Count ([Match Number]) As matches_BCC2021, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsBCC2021,AVg(coalesce([Runs scored],0)) As AvgvsBCC2021, Max([Runs scored]) as HSvsBCC2021,Sum(coalesce([4s],0)) As FoursVsBCC2021, Sum(coalesce([6s],0)) As SixesVsBCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='BCC' and [Year]='2021'

  ---- [50's and 30's Against BCC2021]

  select count([Runs scored])as FiftyVsBCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='BCC' and [Year]='2021'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='BCC' and [Year]='2021'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSBCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='BCC' and [Year]='2021'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='BCC' and [Year]='2021'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs BCC2021

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'BCC' and [Year]='2021'

   select count([Runs scored])as DucksVSBCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'BCC' and [Year]='2021'

  ---Golden Ducks vs BCC2021
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'BCC' and [Year]='2021'

  select count([Runs scored])as Golden_DucksvsBCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'BCC' and [Year]='2021'

---- 4) CC 2021

select Sum(coalesce([Runs scored],0)) As Total_runsvsCC2021,Count ([Match Number]) As matches_CC2021, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsCC2021,AVg(coalesce([Runs scored],0)) As AvgvsCC2021, Max([Runs scored]) as HSvsCC2021,Sum(coalesce([4s],0)) As FoursVsCC2021, Sum(coalesce([6s],0)) As SixesVsCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='CC' and [Year]='2021'

  ---- [50's and 30's Against CC2021]

  select count([Runs scored])as FiftyVsCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='CC' and [Year]='2021'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='CC' and [Year]='2021'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='CC' and [Year]='2021'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='CC' and [Year]='2021'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs CC2021

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'CC' and [Year]='2021'

   select count([Runs scored])as DucksVSCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'CC' and [Year]='2021'

  ---Golden Ducks vs CC2021
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'CC' and [Year]='2021'

  select count([Runs scored])as Golden_DucksvsCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'CC' and [Year]='2021'

---5) CCC 2021

  select Sum(coalesce([Runs scored],0)) As Total_runsvsCCC2021,Count ([Match Number]) As matches_CCC2021, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsCCC2021,AVg(coalesce([Runs scored],0)) As AvgvsCCC2021, Max([Runs scored]) as HSvsCCC2021,Sum(coalesce([4s],0)) As FoursVsCCC2021, Sum(coalesce([6s],0)) As SixesVsCCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='CCC' and [Year]='2021'

  ---- [50's and 30's Against CCC2021]

  select count([Runs scored])as FiftyVsCCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='CCC' and [Year]='2021'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='CCC' and [Year]='2021'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSCCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='CCC' and [Year]='2021'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='CCC' and [Year]='2021'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs CCC2021

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'CCC' and [Year]='2021'

   select count([Runs scored])as DucksVSCCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'CCC' and [Year]='2021'

  ---Golden Ducks vs CCC2021
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'CCC' and [Year]='2021'

  select count([Runs scored])as Golden_DucksvsCCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'CCC' and [Year]='2021'


---6) HAPP 2021

  select Sum(coalesce([Runs scored],0)) As Total_runsvsHAPP2021,Count ([Match Number]) As matches_HAPP2021, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsHAPP2021,AVg(coalesce([Runs scored],0)) As AvgvsHAPP2021, Max([Runs scored]) as HSvsHAPP2021,Sum(coalesce([4s],0)) As FoursVsHAPP2021, Sum(coalesce([6s],0)) As SixesVsHAPP2021
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='HAPP' and [Year]='2021'

  ---- [50's and 30's Against HAPP2021]

  select count([Runs scored])as FiftyVsHAPP2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='HAPP' and [Year]='2021'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='HAPP' and [Year]='2021'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSHAPP2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='HAPP' and [Year]='2021'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='HAPP' and [Year]='2021'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs HAPP2021

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'HAPP' and [Year]='2021'

   select count([Runs scored])as DucksVSHAPP2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'HAPP' and [Year]='2021'

  ---Golden Ducks vs HAPP2021
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'HAPP' and [Year]='2021'

  select count([Runs scored])as Golden_DucksvsHAPP2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'HAPP' and [Year]='2021'


--- 7) PCC 2021
     select Sum(coalesce([Runs scored],0)) As Total_runsvsPCC2021,Count ([Match Number]) As matches_PCC2021, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsPCC2021,AVg(coalesce([Runs scored],0)) As AvgvsPCC2021, Max([Runs scored]) as HSvsPCC2021,Sum(coalesce([4s],0)) As FoursVsPCC2021, Sum(coalesce([6s],0)) As SixesVsPCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='PCC' and [Year]='2021'

  ---- [50's and 30's Against PCC2021]

  select count([Runs scored])as FiftyVsPCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='PCC' and [Year]='2021'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='PCC' and [Year]='2021'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSPCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='PCC' and [Year]='2021'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='PCC' and [Year]='2021'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs PCC2021

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'PCC' and [Year]='2021'

   select count([Runs scored])as DucksVSPCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'PCC' and [Year]='2021'

  ---Golden Ducks vs PCC2021
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'PCC' and [Year]='2021'

  select count([Runs scored])as Golden_DucksvsPCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'PCC' and [Year]='2021'

----8) PPC 2021

select Sum(coalesce([Runs scored],0)) As Total_runsvsPPC2021,Count ([Match Number]) As matches_PPC2021, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsPPC2021,AVg(coalesce([Runs scored],0)) As AvgvsPPC2021, Max([Runs scored]) as HSvsPPC2021,Sum(coalesce([4s],0)) As FoursVsPPC2021, Sum(coalesce([6s],0)) As SixesVsPPC2021
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='PPC' and [Year]='2021'

  ---- [50's and 30's Against PPC2021]

  select count([Runs scored])as FiftyVsPPC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='PPC' and [Year]='2021'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='PPC' and [Year]='2021'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSPPC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='PPC' and [Year]='2021'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='PPC' and [Year]='2021'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs PPC2021

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'PPC' and [Year]='2021'

   select count([Runs scored])as DucksVSPPC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'PPC' and [Year]='2021'

  ---Golden Ducks vs PPC2021
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'PPC' and [Year]='2021'

  select count([Runs scored])as Golden_DucksvsPPC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'PPC' and [Year]='2021'

--- 9) VOC 2021

select Sum(coalesce([Runs scored],0)) As Total_runsvsVOC2021,Count ([Match Number]) As matches_VOC2021, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsVOC2021,AVg(coalesce([Runs scored],0)) As AvgvsVOC2021, Max([Runs scored]) as HSvsVOC2021,Sum(coalesce([4s],0)) As FoursVsVOC2021, Sum(coalesce([6s],0)) As SixesVsVOC2021
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='VOC' and [Year]='2021'

  ---- [50's and 30's Against VOC2021]

  select count([Runs scored])as FiftyVsVOC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='VOC' and [Year]='2021'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Opponent]='VOC' and [Year]='2021'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_VSVOC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='VOC' and [Year]='2021'

  select [Runs scored],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Opponent]='VOC' and [Year]='2021'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks Vs VOC2021

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Opponent] = 'VOC' and [Year]='2021'

   select count([Runs scored])as DucksVSVOC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Opponent] = 'VOC' and [Year]='2021'

  ---Golden Ducks vs VOC2021
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Opponent]= 'VOC' and [Year]='2021'

  select count([Runs scored])as Golden_DucksvsVOC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Opponent] = 'VOC' and [Year]='2021'

  ---Runs & matches in 2022
  select Sum(coalesce([Runs scored],0)) As Total_runs2022
  From [cricket_analysis].[dbo].[Stats]
  where [Year]= '2022'

    

---------- Matches 2022
 select Count ([Match Number]) as matches_2022
  From [cricket_analysis].[dbo].[Stats]
  where [Year]= '2022'

  ------ Average Runs in 2022
  select Sum(coalesce([Runs scored],0))/ Count ([Match Number]) As Avg_runs_2022
  From [cricket_analysis].[dbo].[Stats]
  where [Year]= '2022'

 --- Balls faced 2022
 select Sum(coalesce([Balls Faced],0)) As Total_balls2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Year]='2022'

 --- Strike rate year 2022
 select Sum(coalesce([Runs scored],0))/Sum(coalesce([Balls Faced],0))*100 As StrikeRate2022
  From [cricket_analysis].[dbo].[Stats]
  where [Year]= '2022'
  --- 4's in 2022
   select Sum(coalesce([4s],0)) As Fours_2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Year]='2022'

  ---- Sixes in 2021
   select Sum(coalesce([6s],0)) As sixs_2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Year]='2022'

---- Fifties and 30's 2022
 select count([Runs scored])as Fifty_2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Year] ='2022'

  select [Runs scored],[Match number]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Year]='2022'

  select count([Runs scored])as Thirties_2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Year]='2022'

  select [Runs scored],[Match number]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Year]='2022'

     ---- Ducks 2022
  select [Runs scored],[Match number],[Balls Faced]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Year]='2022'

   select count([Runs scored])as Ducks_2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Year]='2022'

  ---Golden Ducks 2022
  select [Runs scored],[Match number],[Balls Faced]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Year]='2022'

  select count([Runs scored])as Golden_Ducks2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Year]='2022'

    ---High Score 2022
  select Max([Runs scored])as High_score2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Year]='2022'
  ---- Analysis of Batting For Each team 2022

  select Sum(coalesce([Runs scored],0)) As Total_runsForcc,Count ([Match Number]) As matches_CC2022, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikerateForCC2022,AVg(coalesce([Runs scored],0)) As AvgForCC2022, Max([Runs scored]) as HSForCC2022,Sum(coalesce([4s],0)) As FoursForCC2022, Sum(coalesce([6s],0)) As SixesForCC2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Played For]='CC' and [Year]='2022'
  ---[50s and 30's for cc]
  select count([Runs scored])as FiftyForCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Played For]='CC' and [Year]='2022'

  select [Runs scored],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Played For]='CC' and [Year]='2022'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_ForCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Played For]='CC' and [Year]='2022'

  select [Runs scored],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Played For]='CC' and [Year]='2022'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks For CC

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Played For] = 'CC' and [Year]='2022'

   select count([Runs scored])as DucksForCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Played For] = 'CC' and [Year]='2022'

  ---Golden Ducks 
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Played For] = 'CC' and [Year]='2022'

  select count([Runs scored])as Golden_DucksForCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Played For] = 'CC' and [Year]='2022'

  ---2] Scc 2022

  select Sum(coalesce([Runs scored],0)) As Total_runsForScc,Count ([Match Number]) As matches_Scc2022, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikerateForScc2022,AVg(coalesce([Runs scored],0)) As AvgForScc2022, Max([Runs scored]) as HSForScc2022,Sum(coalesce([4s],0)) As FoursForScc2022, Sum(coalesce([6s],0)) As SixesForScc2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Played For]='Scc' and [Year]='2022'
  ---[50s and 30's for Scc]
  select count([Runs scored])as FiftyForScc
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Played For]='Scc' and [Year]='2022'

  select [Runs scored],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Played For]='Scc' and [Year]='2022'
  order by [Runs scored] Desc

  select count([Runs scored])as Thirties_ForScc
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Played For]='Scc' and [Year]='2022'

  select [Runs scored],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Played For]='Scc' and [Year]='2022'
  order by [Runs scored] Desc

  ---- Ducks and Golden Ducks For Scc

  select [Runs scored],[Match number],[Balls Faced] ,[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [Played For] = 'Scc' and [Year]='2022'

   select count([Runs scored])as DucksForScc
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [Played For] = 'Scc' and [Year]='2022'

  ---Golden Ducks 
  select [Runs scored],[Match number],[Balls Faced],[Played For],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]='0' and [balls faced]='1' and [Played For] = 'Scc' and [Year]='2022'

  select count([Runs scored])as Golden_DucksForScc
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]= '0' and [balls faced]='1' and [Played For] = 'Scc' and [Year]='2022'


  ---- Analysis against each opponent 2022

 ---1) BTCC 2022
   select Sum(coalesce([Runs scored],0)) As Total_runsvsBtcc2022,Count ([Match Number]) As matches_Btcc2022, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsBtcc2022,AVg(coalesce([Runs scored],0)) As AvgvsBtcc2022, Max([Runs scored]) as HSvsBtcc2022
  From [cricket_analysis].[dbo].[Stats]
  Where Opponent='Btcc' and year ='2022'

  ----[30's and 50's against Btcc Year 2022]

  select count([Runs scored])as Fifty_Btcc2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Year] ='2022' and Opponent='Btcc'

  select [Runs scored],[Match number]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Year]='2022' and Opponent='Btcc'

  select count([Runs scored])as Thirties_Btcc2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Year]='2022' and Opponent='Btcc'

  select [Runs scored],[Match number]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Year]='2022' and Opponent='Btcc'

--- 2) APJ 2022
select Sum(coalesce([Runs scored],0)) As Total_runsvsApj2022,Count ([Match Number]) As matches_Apj2022, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsAPJ2022,AVg(coalesce([Runs scored],0)) As AvgvsAPJ2022,Max([Runs scored]) as HSvsAPj2022
 From [cricket_analysis].[dbo].[Stats]
 Where Opponent='APJ' and year ='2022'

 ---- [30's and 50's against Apj Year 2022]

 select count([Runs scored])as Fifty_Apj2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Year] ='2022' and Opponent='Apj'

  select [Runs scored],[Match number]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Year]='2022' and Opponent='Apj'

  select count([Runs scored])as Thirties_Apj2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Year]='2022' and Opponent='Apj'

  select [Runs scored],[Match number]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Year]='2022' and Opponent='Apj'

 --- 3) BCC 2022
 select Sum(coalesce([Runs scored],0)) As Total_runsvsBCC2022,Count ([Match Number]) As matches_BCC2022, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsBCC2022,AVg(coalesce([Runs scored],0)) As AvgvsBCC2022,Max([Runs scored]) as HSvsBCC2022
From [cricket_analysis].[dbo].[Stats]
Where Opponent='BCC' and year ='2022'

---- 4) CC 2022

select Sum(coalesce([Runs scored],0)) As Total_runsvsCC2022,Count ([Match Number]) As matches_CC2022, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsCC2022,AVg(coalesce([Runs scored],0)) As AvgvsCC2022,Max([Runs scored]) as HSvsCC2022
From [cricket_analysis].[dbo].[Stats]
Where Opponent='CC' and year ='2022'

---5) CCC 2022

  select Sum(coalesce([Runs scored],0)) As Total_runsvsCCC2022,Count ([Match Number]) As matches_CCC2022, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsCCC2022,AVg(coalesce([Runs scored],0)) As AvgvsCCC2022,Max([Runs scored]) as HSvsCCC2022
From [cricket_analysis].[dbo].[Stats]
Where Opponent='CCC' and year ='2022'


---6) HAPP 2022

  select Sum(coalesce([Runs scored],0)) As Total_runsvsHAPP2022,Count ([Match Number]) As matches_HAPP2022, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsHAPP2022,AVg(coalesce([Runs scored],0)) As AvgvsHAPP2022,Max([Runs scored]) as HSvsHAPP2022
From [cricket_analysis].[dbo].[Stats]
Where Opponent='HAPP' and year ='2022'

----[30's and 50's against HAPP Year 2022]

select count([Runs scored])as Fifty_HAPP2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Year] ='2022' and Opponent='HAPP'

  select [Runs scored],[Match number]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Year]='2022' and Opponent='HAPP'

  select count([Runs scored])as Thirties_HAPP2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Year]='2022' and Opponent='HAPP'

  select [Runs scored],[Match number]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Year]='2022' and Opponent='HAPP'
--- 7) PCC 2022
     select Sum(coalesce([Runs scored],0)) As Total_runsvsPCC2022,Count ([Match Number]) As matches_PCC2022, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsPCC2022,AVg(coalesce([Runs scored],0)) As AvgvsPCC2022,Max([Runs scored]) as HSvsPCC2022
From [cricket_analysis].[dbo].[Stats]
Where Opponent='PCC' and year ='2022'

----8) PPC 2022

select Sum(coalesce([Runs scored],0)) As Total_runsvsPPC2022,Count ([Match Number]) As matches_PPC2022, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsPPC2022,AVg(coalesce([Runs scored],0)) As AvgvsPPC2022,Max([Runs scored]) as HSvsPPC2022
From [cricket_analysis].[dbo].[Stats]
Where Opponent='PPC' and year ='2022'

--- 9) VOC 2022

select Sum(coalesce([Runs scored],0)) As Total_runsvsVOC2022,Count ([Match Number]) As matches_VOC2022, Sum(coalesce([Runs scored],0))/sum(coalesce([Balls Faced],0))*100 As StrikeratevsVOC2022,AVg(coalesce([Runs scored],0)) As AvgvsVOC2022,Max([Runs scored]) as HSvsVOC2022
From [cricket_analysis].[dbo].[Stats]
Where Opponent='VOC' and year ='2022'

---- [30's and 50's against VOC Year 2022]

select count([Runs scored])as Fifty_VOC2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Year] ='2022' and Opponent='VOC'

  select [Runs scored],[Match number]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='50' and [Year]='2022' and Opponent='VOC'

  select count([Runs scored])as Thirties_VOC2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Year]='2022' and Opponent='VOC'

  select [Runs scored],[Match number]
  From [cricket_analysis].[dbo].[Stats]
  Where [Runs scored]>='30' and [Runs scored]<='50' and [Year]='2022' and Opponent='VOC'


  ------------------------------------  [Bowling Analysis] ----------------------------------------------------------------------------------
  
----Overall Bowling Analysis 

select count([Match number]) as NumberofMatches,Sum(coalesce([wickets taken],0)) As Wickets_taken,Sum(coalesce([Runs conceded],0)) As Runs_conceded,Sum(coalesce([overs bowled],0)) As over_bowled,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rate,Sum(coalesce([Maidens],0)) As maiden,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_average,Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_Strikerate,(max([wickets taken])) as Max_wicket
From [cricket_analysis].[dbo].[Stats]

------Fifers and Three Fors

select count([Wickets taken])as Fifer
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5'
  
  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' 
  order by [Wickets taken] Desc

  select count([Wickets taken])as Threefor
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' 

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5'
  order by [Wickets taken] Desc


 ----- Bowling Analysis For Teams Played

 ----1]CC

 select count([Match number]) as NumberofMatchesForCC,Sum(coalesce([wickets taken],0)) As Wickets_takenforcc ,Sum(coalesce([Runs conceded],0)) As Runs_concededforCC,Sum(coalesce([overs bowled],0)) As over_bowledforCC,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateforCC,Sum(coalesce([Maidens],0)) As maidenforCC,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageForCC,Sum(coalesce([overs bowled],0))*6 As Balls_BowledForCC, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateForCC,(max([wickets taken])) as Max_wicketForCC
From [cricket_analysis].[dbo].[Stats]
Where [Played For] = 'CC'

------Fifers and Three Fors

select count([Wickets taken])as Fifer
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Played For] = 'CC'
  
  select [Match number],[Opponent],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Played For] = 'CC'
  order by [Wickets taken] Desc

  select count([Wickets taken])as Threefor
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Played For] = 'CC'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Played For] = 'CC'
  order by [Wickets taken] Desc

  ------2)For SCC
   select count([Match number]) as NumberofMatchesForSCC, Sum(coalesce([wickets taken],0)) As Wickets_takenforSCC ,Sum(coalesce([Runs conceded],0)) As Runs_concededforSCC,Sum(coalesce([overs bowled],0)) As over_bowledforSCC,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateforSCC,Sum(coalesce([Maidens],0)) As maidenforSCC,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageForSCC,Sum(coalesce([overs bowled],0))*6 As Balls_BowledForSCC, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateForSCC,(max([wickets taken])) as Max_wicketForSCC
From [cricket_analysis].[dbo].[Stats]
Where [Played For] = 'SCC'

------Fifers and Three Fors

select count([Wickets taken])as Fifer
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Played For] = 'SCC'
  
  select [Match number],[Opponent],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Played For] = 'SCC'
  order by [Wickets taken] Desc

  select count([Wickets taken])as Threefor
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Played For] = 'SCC'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Played For] = 'SCC'
  order by [Wickets taken] Desc

  ------[Bowling Analyis against opponents]
  
  ---1) Btcc

   select count([Match number]) as NumberofMatchesvsBtcc, Sum(coalesce([wickets taken],0)) As Wickets_takenVsBtcc ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsBtcc,Sum(coalesce([overs bowled],0)) As over_bowledVsBtcc,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsBtcc,Sum(coalesce([Maidens],0)) As maidenVsBtcc,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsBtcc,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsBtcc, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsBtcc,(max([wickets taken])) as Max_wicketVsBtcc
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'Btcc'

------Fifers and Three VsBtcc

select count([Wickets taken])as FifervsBtcc
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Btcc'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Btcc'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsBtcc
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Btcc'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Btcc'
  order by [Wickets taken] Desc

 ---- 2) APJ 

  select count([Match number]) as NumberofMatchesvsApj, Sum(coalesce([wickets taken],0)) As Wickets_takenVsApj ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsApj,Sum(coalesce([overs bowled],0)) As over_bowledVsApj,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsApj,Sum(coalesce([Maidens],0)) As maidenVsApj,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsApj,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsApj, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsApj,(max([wickets taken])) as Max_wicketVsApj
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'Apj'

------Fifers and Three VsApj

select count([Wickets taken])as FifervsApj
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Apj'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Apj'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsApj
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Apj'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Apj'
  order by [Wickets taken] Desc

---- 3)BCC

  select count([Match number]) as NumberofMatchesvsBCC, Sum(coalesce([wickets taken],0)) As Wickets_takenVsBCC ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsBCC,Sum(coalesce([overs bowled],0)) As over_bowledVsBCC,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsBCC,Sum(coalesce([Maidens],0)) As maidenVsBCC,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsBCC,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsBCC, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsBCC,(max([wickets taken])) as Max_wicketVsBCC
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'BCC'

------Fifers and Three VsBCC

select count([Wickets taken])as FifervsBCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'BCC'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'BCC'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsBCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'BCC'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'BCC'
  order by [Wickets taken] Desc

----- 4) CC

 select count([Match number]) as NumberofMatchesvsCC, Sum(coalesce([wickets taken],0)) As Wickets_takenVsCC ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsCC,Sum(coalesce([overs bowled],0)) As over_bowledVsCC,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsCC,Sum(coalesce([Maidens],0)) As maidenVsCC,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsCC,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsCC, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsCC,(max([wickets taken])) as Max_wicketVsCC
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'CC'

------Fifers and Three VsCC

select count([Wickets taken])as FifervsCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'CC'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'CC'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'CC'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'CC'
  order by [Wickets taken] Desc

-----5] CCC

  select count([Match number]) as NumberofMatchesvsCCC, Sum(coalesce([wickets taken],0)) As Wickets_takenVsCCC ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsCCC,Sum(coalesce([overs bowled],0)) As over_bowledVsCCC,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsCCC,Sum(coalesce([Maidens],0)) As maidenVsCCC,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsCCC,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsCCC, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsCCC,(max([wickets taken])) as Max_wicketVsCCC
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'CCC'

------Fifers and Three VsCCC

select count([Wickets taken])as FifervsCCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'CCC'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'CCC'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsCCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'CCC'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'CCC'
  order by [Wickets taken] Desc

  ----6) HAPP

    select count([Match number]) as NumberofMatchesvsHAPP, Sum(coalesce([wickets taken],0)) As Wickets_takenVsHAPP ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsHAPP,Sum(coalesce([overs bowled],0)) As over_bowledVsHAPP,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsHAPP,Sum(coalesce([Maidens],0)) As maidenVsHAPP,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsHAPP,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsHAPP, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsHAPP,(max([wickets taken])) as Max_wicketVsHAPP
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'HAPP'

------Fifers and Three VsHAPP

select count([Wickets taken])as FifervsHAPP
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'HAPP'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'HAPP'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsHAPP
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'HAPP'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'HAPP'
  order by [Wickets taken] Desc

---- 7) PCC

  select count([Match number]) as NumberofMatchesvsPCC, Sum(coalesce([wickets taken],0)) As Wickets_takenVsPCC ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsPCC,Sum(coalesce([overs bowled],0)) As over_bowledVsPCC,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsPCC,Sum(coalesce([Maidens],0)) As maidenVsPCC,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsPCC,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsPCC, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsPCC,(max([wickets taken])) as Max_wicketVsPCC
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'PCC'

------Fifers and Three VsPCC

select count([Wickets taken])as FifervsPCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'PCC'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'PCC'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsPCC
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'PCC'

----8) PPC 

  select count([Match number]) as NumberofMatchesvsPPC, Sum(coalesce([wickets taken],0)) As Wickets_takenVsPPC ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsPPC,Sum(coalesce([overs bowled],0)) As over_bowledVsPPC,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsPPC,Sum(coalesce([Maidens],0)) As maidenVsPPC,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsPPC,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsPPC, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsPPC,(max([wickets taken])) as Max_wicketVsPPC
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'PPC'

------Fifers and Three VsPPC

select count([Wickets taken])as FifervsPPC
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'PPC'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'PPC'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsPPC
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'PPC'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'PPC'
  order by [Wickets taken] Desc

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'PCC'
  order by [Wickets taken] Desc

  ----9) Voc

    select count([Match number]) as NumberofMatchesvsVoc, Sum(coalesce([wickets taken],0)) As Wickets_takenVsVoc ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsVoc,Sum(coalesce([overs bowled],0)) As over_bowledVsVoc,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsVoc,Sum(coalesce([Maidens],0)) As maidenVsVoc,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsVoc,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsVoc, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsVoc,(max([wickets taken])) as Max_wicketVsVoc
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'Voc'

------Fifers and Three VsVoc

select count([Wickets taken])as FifervsVoc
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Voc'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Voc'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsVoc
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Voc'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Voc'
  order by [Wickets taken] Desc

  --- Analysis For 2020

  select count([Match number]) as NumberofMatches2020,Sum(coalesce([wickets taken],0)) As Wickets_taken2020,Sum(coalesce([Runs conceded],0)) As Runs_conceded2020,Sum(coalesce([overs bowled],0)) As over_bowled2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rate2020,Sum(coalesce([Maidens],0)) As maiden2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_average2020,Sum(coalesce([overs bowled],0))*6 As Balls_Bowled2020, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_Strikerate2020,(max([wickets taken])) as Max_wicket2020
From [cricket_analysis].[dbo].[Stats]
Where [Year]='2020'

------Fifers and Three Fors 2020

select count([Wickets taken])as Fifer2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Year]='2020'
  
  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Year]='2020'
  order by [Wickets taken] Desc 

  select count([Wickets taken])as Threefor2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Year]='2020'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Year]='2020'
  order by [Wickets taken] Desc


 ----- Bowling Analysis For Teams Played 2020

 ----1]CC 2020

 select count([Match number]) as NumberofMatchesForCC2020,Sum(coalesce([wickets taken],0)) As Wickets_takenforcc2020 ,Sum(coalesce([Runs conceded],0)) As Runs_concededforCC2020,Sum(coalesce([overs bowled],0)) As over_bowledforCC2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateforCC2020,Sum(coalesce([Maidens],0)) As maidenforCC2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageForCC2020,Sum(coalesce([overs bowled],0))*6 As Balls_BowledForCC2020, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateForCC2020,(max([wickets taken])) as Max_wicketForCC2020
From [cricket_analysis].[dbo].[Stats]
Where [Played For] = 'CC' and [Year]='2020'

------Fifers and Three Fors CC 2020

select count([Wickets taken])as FiferCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Played For] = 'CC' and [Year]='2020'
  
  select [Match number],[Opponent],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Played For] = 'CC' and [Year]='2020'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeforCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Played For] = 'CC' and [Year]='2020'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Played For] = 'CC' and [Year]='2020'
  order by [Wickets taken] Desc

  ------2)For SCC 2020
   select count([Match number]) as NumberofMatchesForSCC2020, Sum(coalesce([wickets taken],0)) As Wickets_takenforSCC2020 ,Sum(coalesce([Runs conceded],0)) As Runs_concededforSCC2020,Sum(coalesce([overs bowled],0)) As over_bowledforSCC,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateforSCC2020,Sum(coalesce([Maidens],0)) As maidenforSCC2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageForSCC2020,Sum(coalesce([overs bowled],0))*6 As Balls_BowledForSCC2020, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateForSCC2020,(max([wickets taken])) as Max_wicketForSCC2020
From [cricket_analysis].[dbo].[Stats]
Where [Played For] = 'SCC' and [Year]='2020'

------Fifers and Three Fors Scc 2020

select count([Wickets taken])as FiferScc2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Played For] = 'SCC' and [Year]='2020'
  
  select [Match number],[Opponent],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Played For] = 'SCC' and [Year]='2020'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeforScc2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Played For] = 'SCC' and [Year]='2020'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Played For] = 'SCC' and [Year]='2020'
  order by [Wickets taken] Desc

  ------[Bowling Analyis against opponents 2020]
  
  ---1) Btcc 2020

   select count([Match number]) as NumberofMatchesvsBtcc2020, Sum(coalesce([wickets taken],0)) As Wickets_takenVsBtcc2020 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsBtcc2020,Sum(coalesce([overs bowled],0)) As over_bowledVsBtcc2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsBtcc2020,Sum(coalesce([Maidens],0)) As maidenVsBtcc2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsBtcc2020,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsBtcc2020, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsBtcc2020,(max([wickets taken])) as Max_wicketVsBtcc2020
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'Btcc' and [Year]='2020'

------Fifers and Three VsBtcc 2020

select count([Wickets taken])as FifervsBtcc2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Btcc' and [Year]='2020'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Btcc' and [Year]='2020'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsBtcc2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Btcc' and [Year]='2020'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Btcc' and [Year]='2020'
  order by [Wickets taken] Desc

 ---- 2) APJ 

  select count([Match number]) as NumberofMatchesvsApj2020, Sum(coalesce([wickets taken],0)) As Wickets_takenVsApj2020 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsApj2020,Sum(coalesce([overs bowled],0)) As over_bowledVsApj2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsApj2020,Sum(coalesce([Maidens],0)) As maidenVsApj2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsApj2020,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsApj2020, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsApj2020,(max([wickets taken])) as Max_wicketVsApj2020
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'Apj' and [Year]='2020'

------Fifers and Three VsApj2020

select count([Wickets taken])as FifervsApj2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Apj' and [Year]='2020'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Apj' and [Year]='2020'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsApj2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Apj' and [Year]='2020'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Apj' and [Year]='2020'
  order by [Wickets taken] Desc

---- 3)BCC 2020

  select count([Match number]) as NumberofMatchesvsBCC2020, Sum(coalesce([wickets taken],0)) As Wickets_takenVsBCC2020 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsBCC2020,Sum(coalesce([overs bowled],0)) As over_bowledVsBCC2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsBCC,Sum(coalesce([Maidens],0)) As maidenVsBCC2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsBCC2020,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsBCC2020, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsBCC2020,(max([wickets taken])) as Max_wicketVsBCC2020
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'BCC' and [Year]='2020'

------Fifers and Three VsBCC2020

select count([Wickets taken])as FifervsBCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'BCC' and [Year]='2020'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'BCC' and [Year]='2020'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsBCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'BCC' and [Year]='2020'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'BCC' and [Year]='2020'
  order by [Wickets taken] Desc

----- 4) CC 2020

 select count([Match number]) as NumberofMatchesvsCC2020, Sum(coalesce([wickets taken],0)) As Wickets_takenVsCC2020 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsCC,Sum(coalesce([overs bowled],0)) As over_bowledVsCC2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsCC2020,Sum(coalesce([Maidens],0)) As maidenVsCC2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsCC2020,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsCC2020, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsCC2020,(max([wickets taken])) as Max_wicketVsCC2020
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'CC' and [Year]='2020'

------Fifers and Three VsCC2020

select count([Wickets taken])as FifervsCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'CC' and [Year]='2020'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'CC' and [Year]='2020'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'CC' and [Year]='2020'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'CC' and [Year]='2020'
  order by [Wickets taken] Desc

-----5] CCC 2020

  select count([Match number]) as NumberofMatchesvsCCC2020, Sum(coalesce([wickets taken],0)) As Wickets_takenVsCCC ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsCCC2020,Sum(coalesce([overs bowled],0)) As over_bowledVsCCC2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsCCC2020,Sum(coalesce([Maidens],0)) As maidenVsCCC2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsCCC2020,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsCCC2020, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsCCC2020,(max([wickets taken])) as Max_wicketVsCCC2020
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'CCC' and [Year]='2020'

------Fifers and Three VsCCC2020

select count([Wickets taken])as FifervsCCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'CCC' and [Year]='2020'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'CCC' and [Year]='2020'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsCCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'CCC' and [Year]='2020'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'CCC' and [Year]='2020'
  order by [Wickets taken] Desc

  ----6) HAPP 2020

    select count([Match number]) as NumberofMatchesvsHAPP2020, Sum(coalesce([wickets taken],0)) As Wickets_takenVsHAPP2020 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsHAPP2020,Sum(coalesce([overs bowled],0)) As over_bowledVsHAPP2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsHAPP2020,Sum(coalesce([Maidens],0)) As maidenVsHAPP,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsHAPP2020,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsHAPP2020, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsHAPP2020,(max([wickets taken])) as Max_wicketVsHAPP2020
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'HAPP' and [Year]='2020'

------Fifers and Three VsHAPP2020

select count([Wickets taken])as FifervsHAPP2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'HAPP' and [Year]='2020'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'HAPP' and [Year]='2020'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsHAPP2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'HAPP' and [Year]='2020'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'HAPP' and [Year]='2020'
  order by [Wickets taken] Desc

---- 7) PCC 2020

  select count([Match number]) as NumberofMatchesvsPCC2020, Sum(coalesce([wickets taken],0)) As Wickets_takenVsPCC2020 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsPCC2020,Sum(coalesce([overs bowled],0)) As over_bowledVsPCC2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsPCC2020,Sum(coalesce([Maidens],0)) As maidenVsPCC2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsPCC2020,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsPCC2020, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsPCC2020,(max([wickets taken])) as Max_wicketVsPCC2020
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'PCC' and [Year]='2020'

------Fifers and Three VsPCC 2020

select count([Wickets taken])as FifervsPCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'PCC' and [Year]='2020'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'PCC' and [Year]='2020'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsPCC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'PCC' and [Year]='2020'

----8) PPC 2020

  select count([Match number]) as NumberofMatchesvsPPC2020, Sum(coalesce([wickets taken],0)) As Wickets_takenVsPPC2020 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsPPC2020,Sum(coalesce([overs bowled],0)) As over_bowledVsPPC2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsPPC2020,Sum(coalesce([Maidens],0)) As maidenVsPPC2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsPPC2020,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsPPC2020, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsPPC2020,(max([wickets taken])) as Max_wicketVsPPC2020
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'PPC' and [Year]='2020'

------Fifers and Three VsPPC2020

select count([Wickets taken])as FifervsPPC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'PPC' and [Year]='2020'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'PPC' and [Year]='2020'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsPPC2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'PPC' and [Year]='2020'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'PPC' and [Year]='2020'
  order by [Wickets taken] Desc

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'PCC' and [Year]='2020'
  order by [Wickets taken] Desc

  ----9) Voc 2020

    select count([Match number]) as NumberofMatchesvsVoc2020, Sum(coalesce([wickets taken],0)) As Wickets_takenVsVoc2020 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsVoc2020,Sum(coalesce([overs bowled],0)) As over_bowledVsVoc2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsVoc2020,Sum(coalesce([Maidens],0)) As maidenVsVoc2020,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsVoc2020,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsVoc2020, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsVoc2020,(max([wickets taken])) as Max_wicketVsVoc2020
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'Voc' and [Year]='2020'

------Fifers and Three VsVoc2020

select count([Wickets taken])as FifervsVoc2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Voc' and [Year]='2020'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Voc' and [Year]='2020'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsVoc2020
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Voc' and [Year]='2020'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Voc' and [Year]='2020'
  order by [Wickets taken] Desc


  ------[Bowling Analysis For Year 2021]

  select count([Match number]) as NumberofMatches2021,Sum(coalesce([wickets taken],0)) As Wickets_taken2021,Sum(coalesce([Runs conceded],0)) As Runs_conceded2021,Sum(coalesce([overs bowled],0)) As over_bowled2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rate2021,Sum(coalesce([Maidens],0)) As maiden2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_average2021,Sum(coalesce([overs bowled],0))*6 As Balls_Bowled2021, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_Strikerate2021,(max([wickets taken])) as Max_wicket2021
From [cricket_analysis].[dbo].[Stats]
Where [Year]='2021'

------Fifers and Three Fors 2021

select count([Wickets taken])as Fifer2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Year]='2021'
  
  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Year]='2021'
  order by [Wickets taken] Desc 

  select count([Wickets taken])as Threefor2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Year]='2021'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Year]='2021'
  order by [Wickets taken] Desc


 ----- Bowling Analysis For Teams Played 2021

 ----1]CC 2021

 select count([Match number]) as NumberofMatchesForCC2021,Sum(coalesce([wickets taken],0)) As Wickets_takenforcc2021 ,Sum(coalesce([Runs conceded],0)) As Runs_concededforCC2021,Sum(coalesce([overs bowled],0)) As over_bowledforCC2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateforCC2021,Sum(coalesce([Maidens],0)) As maidenforCC2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageForCC2021,Sum(coalesce([overs bowled],0))*6 As Balls_BowledForCC2021, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateForCC2021,(max([wickets taken])) as Max_wicketForCC2021
From [cricket_analysis].[dbo].[Stats]
Where [Played For] = 'CC' and [Year]='2021'

------Fifers and Three Fors CC 2021

select count([Wickets taken])as FiferCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Played For] = 'CC' and [Year]='2021'
  
  select [Match number],[Opponent],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Played For] = 'CC' and [Year]='2021'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeforCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Played For] = 'CC' and [Year]='2021'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Played For] = 'CC' and [Year]='2021'
  order by [Wickets taken] Desc

  ------2)For SCC 2021
   select count([Match number]) as NumberofMatchesForSCC2021, Sum(coalesce([wickets taken],0)) As Wickets_takenforSCC2021 ,Sum(coalesce([Runs conceded],0)) As Runs_concededforSCC2021,Sum(coalesce([overs bowled],0)) As over_bowledforSCC,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateforSCC2021,Sum(coalesce([Maidens],0)) As maidenforSCC2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageForSCC2021,Sum(coalesce([overs bowled],0))*6 As Balls_BowledForSCC2021, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateForSCC2021,(max([wickets taken])) as Max_wicketForSCC2021
From [cricket_analysis].[dbo].[Stats]
Where [Played For] = 'SCC' and [Year]='2021'

------Fifers and Three Fors Scc 2021

select count([Wickets taken])as FiferScc2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Played For] = 'SCC' and [Year]='2021'
  
  select [Match number],[Opponent],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Played For] = 'SCC' and [Year]='2021'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeforScc2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Played For] = 'SCC' and [Year]='2021'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Played For] = 'SCC' and [Year]='2021'
  order by [Wickets taken] Desc

  ------[Bowling Analyis against opponents 2021]
  
  ---1) Btcc 2021

   select count([Match number]) as NumberofMatchesvsBtcc2021, Sum(coalesce([wickets taken],0)) As Wickets_takenVsBtcc2021 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsBtcc2021,Sum(coalesce([overs bowled],0)) As over_bowledVsBtcc2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsBtcc2021,Sum(coalesce([Maidens],0)) As maidenVsBtcc2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsBtcc2021,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsBtcc2021, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsBtcc2021,(max([wickets taken])) as Max_wicketVsBtcc2021
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'Btcc' and [Year]='2021'

------Fifers and Three VsBtcc 2021

select count([Wickets taken])as FifervsBtcc2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Btcc' and [Year]='2021'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Btcc' and [Year]='2021'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsBtcc2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Btcc' and [Year]='2021'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Btcc' and [Year]='2021'
  order by [Wickets taken] Desc

 ---- 2) APJ 

  select count([Match number]) as NumberofMatchesvsApj2021, Sum(coalesce([wickets taken],0)) As Wickets_takenVsApj2021 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsApj2021,Sum(coalesce([overs bowled],0)) As over_bowledVsApj2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsApj2021,Sum(coalesce([Maidens],0)) As maidenVsApj2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsApj2021,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsApj2021, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsApj2021,(max([wickets taken])) as Max_wicketVsApj2021
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'Apj' and [Year]='2021'

------Fifers and Three VsApj2021

select count([Wickets taken])as FifervsApj2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Apj' and [Year]='2021'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Apj' and [Year]='2021'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsApj2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Apj' and [Year]='2021'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Apj' and [Year]='2021'
  order by [Wickets taken] Desc

---- 3)BCC 2021

  select count([Match number]) as NumberofMatchesvsBCC2021, Sum(coalesce([wickets taken],0)) As Wickets_takenVsBCC2021 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsBCC2021,Sum(coalesce([overs bowled],0)) As over_bowledVsBCC2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsBCC,Sum(coalesce([Maidens],0)) As maidenVsBCC2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsBCC2021,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsBCC2021, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsBCC2021,(max([wickets taken])) as Max_wicketVsBCC2021
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'BCC' and [Year]='2021'

------Fifers and Three VsBCC2021

select count([Wickets taken])as FifervsBCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'BCC' and [Year]='2021'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'BCC' and [Year]='2021'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsBCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'BCC' and [Year]='2021'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'BCC' and [Year]='2021'
  order by [Wickets taken] Desc

----- 4) CC 2021

 select count([Match number]) as NumberofMatchesvsCC2021, Sum(coalesce([wickets taken],0)) As Wickets_takenVsCC2021 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsCC,Sum(coalesce([overs bowled],0)) As over_bowledVsCC2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsCC2021,Sum(coalesce([Maidens],0)) As maidenVsCC2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsCC2021,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsCC2021, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsCC2021,(max([wickets taken])) as Max_wicketVsCC2021
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'CC' and [Year]='2021'

------Fifers and Three VsCC2021

select count([Wickets taken])as FifervsCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'CC' and [Year]='2021'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'CC' and [Year]='2021'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'CC' and [Year]='2021'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'CC' and [Year]='2021'
  order by [Wickets taken] Desc

-----5] CCC 2021

  select count([Match number]) as NumberofMatchesvsCCC2021, Sum(coalesce([wickets taken],0)) As Wickets_takenVsCCC ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsCCC2021,Sum(coalesce([overs bowled],0)) As over_bowledVsCCC2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsCCC2021,Sum(coalesce([Maidens],0)) As maidenVsCCC2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsCCC2021,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsCCC2021, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsCCC2021,(max([wickets taken])) as Max_wicketVsCCC2021
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'CCC' and [Year]='2021'

------Fifers and Three VsCCC2021

select count([Wickets taken])as FifervsCCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'CCC' and [Year]='2021'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'CCC' and [Year]='2021'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsCCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'CCC' and [Year]='2021'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'CCC' and [Year]='2021'
  order by [Wickets taken] Desc

  ----6) HAPP 2021

    select count([Match number]) as NumberofMatchesvsHAPP2021, Sum(coalesce([wickets taken],0)) As Wickets_takenVsHAPP2021 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsHAPP2021,Sum(coalesce([overs bowled],0)) As over_bowledVsHAPP2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsHAPP2021,Sum(coalesce([Maidens],0)) As maidenVsHAPP,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsHAPP2021,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsHAPP2021, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsHAPP2021,(max([wickets taken])) as Max_wicketVsHAPP2021
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'HAPP' and [Year]='2021'

------Fifers and Three VsHAPP2021

select count([Wickets taken])as FifervsHAPP2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'HAPP' and [Year]='2021'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'HAPP' and [Year]='2021'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsHAPP2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'HAPP' and [Year]='2021'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'HAPP' and [Year]='2021'
  order by [Wickets taken] Desc

---- 7) PCC 2021

  select count([Match number]) as NumberofMatchesvsPCC2021, Sum(coalesce([wickets taken],0)) As Wickets_takenVsPCC2021 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsPCC2021,Sum(coalesce([overs bowled],0)) As over_bowledVsPCC2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsPCC2021,Sum(coalesce([Maidens],0)) As maidenVsPCC2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsPCC2021,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsPCC2021, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsPCC2021,(max([wickets taken])) as Max_wicketVsPCC2021
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'PCC' and [Year]='2021'

------Fifers and Three VsPCC 2021

select count([Wickets taken])as FifervsPCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'PCC' and [Year]='2021'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'PCC' and [Year]='2021'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsPCC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'PCC' and [Year]='2021'

----8) PPC 2021

  select count([Match number]) as NumberofMatchesvsPPC2021, Sum(coalesce([wickets taken],0)) As Wickets_takenVsPPC2021 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsPPC2021,Sum(coalesce([overs bowled],0)) As over_bowledVsPPC2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsPPC2021,Sum(coalesce([Maidens],0)) As maidenVsPPC2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsPPC2021,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsPPC2021, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsPPC2021,(max([wickets taken])) as Max_wicketVsPPC2021
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'PPC' and [Year]='2021'

------Fifers and Three VsPPC2021

select count([Wickets taken])as FifervsPPC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'PPC' and [Year]='2021'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'PPC' and [Year]='2021'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsPPC2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'PPC' and [Year]='2021'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'PPC' and [Year]='2021'
  order by [Wickets taken] Desc

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'PCC' and [Year]='2021'
  order by [Wickets taken] Desc

  ----9) Voc 2021

    select count([Match number]) as NumberofMatchesvsVoc2021, Sum(coalesce([wickets taken],0)) As Wickets_takenVsVoc2021 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsVoc2021,Sum(coalesce([overs bowled],0)) As over_bowledVsVoc2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsVoc2021,Sum(coalesce([Maidens],0)) As maidenVsVoc2021,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsVoc2021,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsVoc2021, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsVoc2021,(max([wickets taken])) as Max_wicketVsVoc2021
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'Voc' and [Year]='2021'

------Fifers and Three VsVoc2021

select count([Wickets taken])as FifervsVoc2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Voc' and [Year]='2021'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Voc' and [Year]='2021'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsVoc2021
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Voc' and [Year]='2021'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Voc' and [Year]='2021'
  order by [Wickets taken] Desc

  ----[Bowling Analysis For 2022]

  select count([Match number]) as NumberofMatches2022,Sum(coalesce([wickets taken],0)) As Wickets_taken2022,Sum(coalesce([Runs conceded],0)) As Runs_conceded2022,Sum(coalesce([overs bowled],0)) As over_bowled2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rate2022,Sum(coalesce([Maidens],0)) As maiden2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_average2022,Sum(coalesce([overs bowled],0))*6 As Balls_Bowled2022, Sum(coalesce([overs bowled],0))*6.5/Sum(coalesce([wickets taken],0)) As Bowling_Strikerate2022,(max([wickets taken])) as Max_wicket2022
From [cricket_analysis].[dbo].[Stats]
Where [Year]='2022'

------Fifers and Three Fors 2022

select count([Wickets taken])as Fifer2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Year]='2022'
  
  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Year]='2022'
  order by [Wickets taken] Desc 

  select count([Wickets taken])as Threefor2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Year]='2022'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Year]='2022'
  order by [Wickets taken] Desc


 ----- Bowling Analysis For Teams Played 2022

 ----1]CC 2022

 select count([Match number]) as NumberofMatchesForCC2022,Sum(coalesce([wickets taken],0)) As Wickets_takenforcc2022 ,Sum(coalesce([Runs conceded],0)) As Runs_concededforCC2022,Sum(coalesce([overs bowled],0)) As over_bowledforCC2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateforCC2022,Sum(coalesce([Maidens],0)) As maidenforCC2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageForCC2022,Sum(coalesce([overs bowled],0))*6 As Balls_BowledForCC2022, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateForCC2022,(max([wickets taken])) as Max_wicketForCC2022
From [cricket_analysis].[dbo].[Stats]
Where [Played For] = 'CC' and [Year]='2022'

------Fifers and Three Fors CC 2022

select count([Wickets taken])as FiferCC2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Played For] = 'CC' and [Year]='2022'
  
  select [Match number],[Opponent],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Played For] = 'CC' and [Year]='2022'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeforCC2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Played For] = 'CC' and [Year]='2022'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Played For] = 'CC' and [Year]='2022'
  order by [Wickets taken] Desc

  ------2)For SCC 2022
   select count([Match number]) as NumberofMatchesForSCC2022, Sum(coalesce([wickets taken],0)) As Wickets_takenforSCC2022 ,Sum(coalesce([Runs conceded],0)) As Runs_concededforSCC2022,Sum(coalesce([overs bowled],0)) As over_bowledforSCC,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateforSCC2022,Sum(coalesce([Maidens],0)) As maidenforSCC2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageForSCC2022,Sum(coalesce([overs bowled],0))*6 As Balls_BowledForSCC2022, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateForSCC2022,(max([wickets taken])) as Max_wicketForSCC2022
From [cricket_analysis].[dbo].[Stats]
Where [Played For] = 'SCC' and [Year]='2022'

------Fifers and Three Fors Scc 2022

select count([Wickets taken])as FiferScc2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Played For] = 'SCC' and [Year]='2022'
  
  select [Match number],[Opponent],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Played For] = 'SCC' and [Year]='2022'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeforScc2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Played For] = 'SCC' and [Year]='2022'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Opponent]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Played For] = 'SCC' and [Year]='2022'
  order by [Wickets taken] Desc

  ------[Bowling Analyis against opponents 2022]
  
  ---1) Btcc 2022

   select count([Match number]) as NumberofMatchesvsBtcc2022, Sum(coalesce([wickets taken],0)) As Wickets_takenVsBtcc2022 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsBtcc2022,Sum(coalesce([overs bowled],0)) As over_bowledVsBtcc2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsBtcc2022,Sum(coalesce([Maidens],0)) As maidenVsBtcc2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsBtcc2022,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsBtcc2022, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsBtcc2022,(max([wickets taken])) as Max_wicketVsBtcc2022
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'Btcc' and [Year]='2022'

------Fifers and Three VsBtcc 2022

select count([Wickets taken])as FifervsBtcc2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Btcc' and [Year]='2022'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Btcc' and [Year]='2022'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsBtcc2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Btcc' and [Year]='2022'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Btcc' and [Year]='2022'
  order by [Wickets taken] Desc

 ---- 2) APJ 

  select count([Match number]) as NumberofMatchesvsApj2022, Sum(coalesce([wickets taken],0)) As Wickets_takenVsApj2022 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsApj2022,Sum(coalesce([overs bowled],0)) As over_bowledVsApj2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsApj2022,Sum(coalesce([Maidens],0)) As maidenVsApj2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsApj2022,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsApj2022, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsApj2022,(max([wickets taken])) as Max_wicketVsApj2022
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'Apj' and [Year]='2022'

------Fifers and Three VsApj2022

select count([Wickets taken])as FifervsApj2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Apj' and [Year]='2022'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Apj' and [Year]='2022'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsApj2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Apj' and [Year]='2022'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Apj' and [Year]='2022'
  order by [Wickets taken] Desc

---- 3)BCC 2022

  select count([Match number]) as NumberofMatchesvsBCC2022, Sum(coalesce([wickets taken],0)) As Wickets_takenVsBCC2022 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsBCC2022,Sum(coalesce([overs bowled],0)) As over_bowledVsBCC2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsBCC,Sum(coalesce([Maidens],0)) As maidenVsBCC2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsBCC2022,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsBCC2022, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsBCC2022,(max([wickets taken])) as Max_wicketVsBCC2022
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'BCC' and [Year]='2022'

------Fifers and Three VsBCC2022

select count([Wickets taken])as FifervsBCC2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'BCC' and [Year]='2022'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'BCC' and [Year]='2022'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsBCC2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'BCC' and [Year]='2022'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'BCC' and [Year]='2022'
  order by [Wickets taken] Desc

----- 4) CC 2022

 select count([Match number]) as NumberofMatchesvsCC2022, Sum(coalesce([wickets taken],0)) As Wickets_takenVsCC2022 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsCC,Sum(coalesce([overs bowled],0)) As over_bowledVsCC2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsCC2022,Sum(coalesce([Maidens],0)) As maidenVsCC2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsCC2022,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsCC2022, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsCC2022,(max([wickets taken])) as Max_wicketVsCC2022
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'CC' and [Year]='2022'

------Fifers and Three VsCC2022

select count([Wickets taken])as FifervsCC2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'CC' and [Year]='2022'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'CC' and [Year]='2022'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsCC2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'CC' and [Year]='2022'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'CC' and [Year]='2022'
  order by [Wickets taken] Desc

-----5] CCC 2022

  select count([Match number]) as NumberofMatchesvsCCC2022, Sum(coalesce([wickets taken],0)) As Wickets_takenVsCCC ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsCCC2022,Sum(coalesce([overs bowled],0)) As over_bowledVsCCC2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsCCC2022,Sum(coalesce([Maidens],0)) As maidenVsCCC2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsCCC2022,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsCCC2022, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsCCC2022,(max([wickets taken])) as Max_wicketVsCCC2022
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'CCC' and [Year]='2022'

------Fifers and Three VsCCC2022

select count([Wickets taken])as FifervsCCC2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'CCC' and [Year]='2022'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'CCC' and [Year]='2022'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsCCC2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'CCC' and [Year]='2022'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'CCC' and [Year]='2022'
  order by [Wickets taken] Desc

  ----6) HAPP 2022

    select count([Match number]) as NumberofMatchesvsHAPP2022, Sum(coalesce([wickets taken],0)) As Wickets_takenVsHAPP2022 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsHAPP2022,Sum(coalesce([overs bowled],0)) As over_bowledVsHAPP2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsHAPP2022,Sum(coalesce([Maidens],0)) As maidenVsHAPP,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsHAPP2022,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsHAPP2022, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsHAPP2022,(max([wickets taken])) as Max_wicketVsHAPP2022
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'HAPP' and [Year]='2022'

------Fifers and Three VsHAPP2022

select count([Wickets taken])as FifervsHAPP2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'HAPP' and [Year]='2022'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'HAPP' and [Year]='2022'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsHAPP2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'HAPP' and [Year]='2022'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'HAPP' and [Year]='2022'
  order by [Wickets taken] Desc

---- 7) PCC 2022

  select count([Match number]) as NumberofMatchesvsPCC2022, Sum(coalesce([wickets taken],0)) As Wickets_takenVsPCC2022 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsPCC2022,Sum(coalesce([overs bowled],0)) As over_bowledVsPCC2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsPCC2022,Sum(coalesce([Maidens],0)) As maidenVsPCC2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsPCC2022,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsPCC2022, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsPCC2022,(max([wickets taken])) as Max_wicketVsPCC2022
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'PCC' and [Year]='2022'

------Fifers and Three VsPCC 2022

select count([Wickets taken])as FifervsPCC2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'PCC' and [Year]='2022'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'PCC' and [Year]='2022'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsPCC2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'PCC' and [Year]='2022'

----8) PPC 2022

  select count([Match number]) as NumberofMatchesvsPPC2022, Sum(coalesce([wickets taken],0)) As Wickets_takenVsPPC2022 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsPPC2022,Sum(coalesce([overs bowled],0)) As over_bowledVsPPC2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsPPC2022,Sum(coalesce([Maidens],0)) As maidenVsPPC2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsPPC2022,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsPPC2022, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsPPC2022,(max([wickets taken])) as Max_wicketVsPPC2022
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'PPC' and [Year]='2022'

------Fifers and Three VsPPC2022

select count([Wickets taken])as FifervsPPC2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'PPC' and [Year]='2022'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'PPC' and [Year]='2022'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsPPC2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'PPC' and [Year]='2022'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'PPC' and [Year]='2022'
  order by [Wickets taken] Desc

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'PCC' and [Year]='2022'
  order by [Wickets taken] Desc

  ----9) Voc 2022

    select count([Match number]) as NumberofMatchesvsVoc2022, Sum(coalesce([wickets taken],0)) As Wickets_takenVsVoc2022 ,Sum(coalesce([Runs conceded],0)) As Runs_concededVsVoc2022,Sum(coalesce([overs bowled],0)) As over_bowledVsVoc2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([overs bowled],0)) As Economy_rateVsVoc2022,Sum(coalesce([Maidens],0)) As maidenVsVoc2022,Sum(coalesce([Runs conceded],0))/Sum(coalesce([wickets taken],0)) as Bowling_averageVsVoc2022,Sum(coalesce([overs bowled],0))*6 As Balls_BowledVsVoc2022, Sum(coalesce([overs bowled],0))*6/Sum(coalesce([wickets taken],0)) As Bowling_StrikerateVsVoc2022,(max([wickets taken])) as Max_wicketVsVoc2022
From [cricket_analysis].[dbo].[Stats]
Where [Opponent] = 'Voc' and [Year]='2022'

------Fifers and Three VsVoc2022

select count([Wickets taken])as FifervsVoc2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Voc' and [Year]='2022'
  
  select [Match number],[Played For],[overs bowled],Economy,[Runs conceded],[wickets taken]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='5' and [Opponent] = 'Voc' and [Year]='2022'
  order by [Wickets taken] Desc

  select count([Wickets taken])as ThreeVsVoc2022
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Voc' and [Year]='2022'

  select [Wickets taken],[Runs conceded],[overs bowled],[Match number],[Played For]
  From [cricket_analysis].[dbo].[Stats]
  Where [Wickets taken]>='3' and [Wickets taken]<='5' and [Opponent] = 'Voc' and [Year]='2022'
  order by [Wickets taken] Desc


  -------Fielding Analysis ---------------

  select Sum(coalesce([catches],0)) As Total_catches,Sum(coalesce([Runout],0)) As total_Runouts,Sum(coalesce([st],0)) As total_st
  From [cricket_analysis].[dbo].[Stats] 

  ----- For CC 
  select Sum(coalesce([catches],0)) As Total_catchesCC,Sum(coalesce([Runout],0)) As total_RunoutsCC,Sum(coalesce([st],0)) As total_stCC
  From [cricket_analysis].[dbo].[Stats] 
  Where [Played For]='CC'

  ----- For CC 2020
  select Sum(coalesce([catches],0)) As Total_catchesCC2020,Sum(coalesce([Runout],0)) As total_RunoutsCC2020,Sum(coalesce([st],0)) As total_stCC2020
  From [cricket_analysis].[dbo].[Stats] 
  Where [Played For]='CC' and [Year]='2020'

  ----- For CC 2021
  select Sum(coalesce([catches],0)) As Total_catchesCC2021,Sum(coalesce([Runout],0)) As total_RunoutsCC2021,Sum(coalesce([st],0)) As total_stCC2021
  From [cricket_analysis].[dbo].[Stats] 
  Where [Played For]='CC' and [Year]='2021'

  ----- For CC 2022

  select Sum(coalesce([catches],0)) As Total_catchesCC2022,Sum(coalesce([Runout],0)) As total_RunoutsCC2022,Sum(coalesce([st],0)) As total_stCC2022
  From [cricket_analysis].[dbo].[Stats] 
  Where [Played For]='CC' and [Year]='2022'


  ------ For SCC
    select Sum(coalesce([catches],0)) As Total_catchesSCC,Sum(coalesce([Runout],0)) As total_RunoutsSCC,Sum(coalesce([st],0)) As total_stSCC
  From [cricket_analysis].[dbo].[Stats] 
  Where [Played For]='SCC'
  
  --- For SCC 2020
  
  select Sum(coalesce([catches],0)) As Total_catchesSCC2020,Sum(coalesce([Runout],0)) As total_RunoutsSCC2020,Sum(coalesce([st],0)) As total_stSCC2020
  From [cricket_analysis].[dbo].[Stats] 
  Where [Played For]='SCC' and [Year]='2020'
  
  
  --- For SCC 2021
  
   select Sum(coalesce([catches],0)) As Total_catchesSCC2021,Sum(coalesce([Runout],0)) As total_RunoutsSCC2021,Sum(coalesce([st],0)) As total_stSCC2021
  From [cricket_analysis].[dbo].[Stats] 
  Where [Played For]='SCC' and [Year]='2021'
  
   --- For SCC 2022
  
  select Sum(coalesce([catches],0)) As Total_catchesSCC2022,Sum(coalesce([Runout],0)) As total_RunoutsSCC2022,Sum(coalesce([st],0)) As total_stSCC2022
  From [cricket_analysis].[dbo].[Stats] 
  Where [Played For]='SCC'  and [Year]='2022'

  ---- Against various teams 
---1] Btcc

select Sum(coalesce([catches],0)) As Total_catchesBtcc,Sum(coalesce([Runout],0)) As total_RunoutsBtcc,Sum(coalesce([st],0)) As total_stBtcc
From [cricket_analysis].[dbo].[Stats] 
Where [Opponent]='Btcc'
  
  --- For Btcc 2020
  
 select Sum(coalesce([catches],0)) As Total_catchesBtcc2020,Sum(coalesce([Runout],0)) As total_RunoutsBtcc2020,Sum(coalesce([st],0)) As total_stBtcc2020
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='Btcc' and [Year]='2020'
  
  
  --- For Btcc 2021
  
 select Sum(coalesce([catches],0)) As Total_catchesBtcc2021,Sum(coalesce([Runout],0)) As total_RunoutsBtcc2021,Sum(coalesce([st],0)) As total_stBtcc2021
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='Btcc' and [Year]='2021'
  
   --- For Btcc 2022
  
 select Sum(coalesce([catches],0)) As Total_catchesBtcc2022,Sum(coalesce([Runout],0)) As total_RunoutsBtcc2022,Sum(coalesce([st],0)) As total_stBtcc2022
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='Btcc'  and [Year]='2022'

 ---2] Apj

select Sum(coalesce([catches],0)) As Total_catchesApj,Sum(coalesce([Runout],0)) As total_RunoutsApj,Sum(coalesce([st],0)) As total_stApj
From [cricket_analysis].[dbo].[Stats] 
Where [Opponent]='Apj'
  
  --- For Apj 2020
  
 select Sum(coalesce([catches],0)) As Total_catchesApj2020,Sum(coalesce([Runout],0)) As total_RunoutsApj2020,Sum(coalesce([st],0)) As total_stApj2020
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='Apj' and [Year]='2020'
  
  
  --- For Apj 2021
  
 select Sum(coalesce([catches],0)) As Total_catchesApj2021,Sum(coalesce([Runout],0)) As total_RunoutsApj2021,Sum(coalesce([st],0)) As total_stApj2021
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='Apj' and [Year]='2021'
  
   --- For Apj 2022
  
 select Sum(coalesce([catches],0)) As Total_catchesApj2022,Sum(coalesce([Runout],0)) As total_RunoutsApj2022,Sum(coalesce([st],0)) As total_stApj2022
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='Apj'  and [Year]='2022'

 ---3] BCC

select Sum(coalesce([catches],0)) As Total_catchesBCC,Sum(coalesce([Runout],0)) As total_RunoutsBCC,Sum(coalesce([st],0)) As total_stBCC
From [cricket_analysis].[dbo].[Stats] 
Where [Opponent]='BCC'
  
  --- For BCC 2020
  
 select Sum(coalesce([catches],0)) As Total_catchesBCC2020,Sum(coalesce([Runout],0)) As total_RunoutsBCC2020,Sum(coalesce([st],0)) As total_stBCC2020
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='BCC' and [Year]='2020'
  
  
  --- For BCC 2021
  
 select Sum(coalesce([catches],0)) As Total_catchesBCC2021,Sum(coalesce([Runout],0)) As total_RunoutsBCC2021,Sum(coalesce([st],0)) As total_stBCC2021
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='BCC' and [Year]='2021'
  
   --- For BCC 2022
  
 select Sum(coalesce([catches],0)) As Total_catchesBCC2022,Sum(coalesce([Runout],0)) As total_RunoutsBCC2022,Sum(coalesce([st],0)) As total_stBCC2022
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='BCC'  and [Year]='2022'

 ---4] CC

select Sum(coalesce([catches],0)) As Total_catchesCC,Sum(coalesce([Runout],0)) As total_RunoutsCC,Sum(coalesce([st],0)) As total_stCC
From [cricket_analysis].[dbo].[Stats] 
Where [Opponent]='CC'
  
  --- For CC 2020
  
 select Sum(coalesce([catches],0)) As Total_catchesCC2020,Sum(coalesce([Runout],0)) As total_RunoutsCC2020,Sum(coalesce([st],0)) As total_stCC2020
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='CC' and [Year]='2020'
  
  
  --- For CC 2021
  
 select Sum(coalesce([catches],0)) As Total_catchesCC2021,Sum(coalesce([Runout],0)) As total_RunoutsCC2021,Sum(coalesce([st],0)) As total_stCC2021
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='CC' and [Year]='2021'
  
   --- For CC 2022
  
 select Sum(coalesce([catches],0)) As Total_catchesCC2022,Sum(coalesce([Runout],0)) As total_RunoutsCC2022,Sum(coalesce([st],0)) As total_stCC2022
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='CC'  and [Year]='2022'

 ---5] CCC

select Sum(coalesce([catches],0)) As Total_catchesCCC,Sum(coalesce([Runout],0)) As total_RunoutsCCC,Sum(coalesce([st],0)) As total_stCCC
From [cricket_analysis].[dbo].[Stats] 
Where [Opponent]='CCC'
  
  --- For CCC 2020
  
 select Sum(coalesce([catches],0)) As Total_catchesCCC2020,Sum(coalesce([Runout],0)) As total_RunoutsCCC2020,Sum(coalesce([st],0)) As total_stCCC2020
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='CCC' and [Year]='2020'
  
  
  --- For CCC 2021
  
 select Sum(coalesce([catches],0)) As Total_catchesCCC2021,Sum(coalesce([Runout],0)) As total_RunoutsCCC2021,Sum(coalesce([st],0)) As total_stCCC2021
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='CCC' and [Year]='2021'
  
   --- For CCC 2022
  
 select Sum(coalesce([catches],0)) As Total_catchesCCC2022,Sum(coalesce([Runout],0)) As total_RunoutsCCC2022,Sum(coalesce([st],0)) As total_stCCC2022
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='CCC'  and [Year]='2022'

 ---6] PCC

select Sum(coalesce([catches],0)) As Total_catchesPCC,Sum(coalesce([Runout],0)) As total_RunoutsPCC,Sum(coalesce([st],0)) As total_stPCC
From [cricket_analysis].[dbo].[Stats] 
Where [Opponent]='PCC'
  
  --- For PCC 2020
  
 select Sum(coalesce([catches],0)) As Total_catchesPCC2020,Sum(coalesce([Runout],0)) As total_RunoutsPCC2020,Sum(coalesce([st],0)) As total_stPCC2020
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='PCC' and [Year]='2020'
  
  
  --- For PCC 2021
  
 select Sum(coalesce([catches],0)) As Total_catchesPCC2021,Sum(coalesce([Runout],0)) As total_RunoutsPCC2021,Sum(coalesce([st],0)) As total_stPCC2021
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='PCC' and [Year]='2021'
  
   --- For PCC 2022
  
 select Sum(coalesce([catches],0)) As Total_catchesPCC2022,Sum(coalesce([Runout],0)) As total_RunoutsPCC2022,Sum(coalesce([st],0)) As total_stPCC2022
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='PCC'  and [Year]='2022'

 ---7] HAPP

select Sum(coalesce([catches],0)) As Total_catchesHAPP,Sum(coalesce([Runout],0)) As total_RunoutsHAPP,Sum(coalesce([st],0)) As total_stHAPP
From [cricket_analysis].[dbo].[Stats] 
Where [Opponent]='HAPP'
  
  --- For HAPP 2020
  
 select Sum(coalesce([catches],0)) As Total_catchesHAPP2020,Sum(coalesce([Runout],0)) As total_RunoutsHAPP2020,Sum(coalesce([st],0)) As total_stHAPP2020
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='HAPP' and [Year]='2020'
  
  
  --- For HAPP 2021
  
 select Sum(coalesce([catches],0)) As Total_catchesHAPP2021,Sum(coalesce([Runout],0)) As total_RunoutsHAPP2021,Sum(coalesce([st],0)) As total_stHAPP2021
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='HAPP' and [Year]='2021'
  
   --- For HAPP 2022
  
 select Sum(coalesce([catches],0)) As Total_catchesHAPP2022,Sum(coalesce([Runout],0)) As total_RunoutsHAPP2022,Sum(coalesce([st],0)) As total_stHAPP2022
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='HAPP'  and [Year]='2022'

 ---8] PPC

select Sum(coalesce([catches],0)) As Total_catchesPPC,Sum(coalesce([Runout],0)) As total_RunoutsPPC,Sum(coalesce([st],0)) As total_stPPC
From [cricket_analysis].[dbo].[Stats] 
Where [Opponent]='PPC'
  
  --- For PPC 2020
  
 select Sum(coalesce([catches],0)) As Total_catchesPPC2020,Sum(coalesce([Runout],0)) As total_RunoutsPPC2020,Sum(coalesce([st],0)) As total_stPPC2020
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='PPC' and [Year]='2020'
  
  
  --- For PPC 2021
  
 select Sum(coalesce([catches],0)) As Total_catchesPPC2021,Sum(coalesce([Runout],0)) As total_RunoutsPPC2021,Sum(coalesce([st],0)) As total_stPPC2021
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='PPC' and [Year]='2021'
  
   --- For PPC 2022
  
 select Sum(coalesce([catches],0)) As Total_catchesPPC2022,Sum(coalesce([Runout],0)) As total_RunoutsPPC2022,Sum(coalesce([st],0)) As total_stPPC2022
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='PPC'  and [Year]='2022'

 ---9] VOC

select Sum(coalesce([catches],0)) As Total_catchesVOC,Sum(coalesce([Runout],0)) As total_RunoutsVOC,Sum(coalesce([st],0)) As total_stVOC
From [cricket_analysis].[dbo].[Stats] 
Where [Opponent]='VOC'
  
  --- For VOC 2020
  
 select Sum(coalesce([catches],0)) As Total_catchesVOC2020,Sum(coalesce([Runout],0)) As total_RunoutsVOC2020,Sum(coalesce([st],0)) As total_stVOC2020
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='VOC' and [Year]='2020'
  
  
  --- For VOC 2021
  
 select Sum(coalesce([catches],0)) As Total_catchesVOC2021,Sum(coalesce([Runout],0)) As total_RunoutsVOC2021,Sum(coalesce([st],0)) As total_stVOC2021
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='VOC' and [Year]='2021'
  
   --- For VOC 2022
  
 select Sum(coalesce([catches],0)) As Total_catchesVOC2022,Sum(coalesce([Runout],0)) As total_RunoutsVOC2022,Sum(coalesce([st],0)) As total_stVOC2022
 From [cricket_analysis].[dbo].[Stats] 
 Where [Opponent]='VOC'  and [Year]='2022'


