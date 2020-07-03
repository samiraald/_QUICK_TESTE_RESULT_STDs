SELECT B.cd_multi_empresa, a.nm_paciente, A.CD_PACIENTE, b.cd_atendimento, F.nm_usuario, f.dt_registro,
Case
          
    when (DS_RESPOSTA = 'checked' and Ds_Pergunta = 'L_HIV') then 'HIV'
    when (DS_RESPOSTA = 'checked' and Ds_Pergunta = 'L_SIFILIS') then 'SIFILIS'
    when (DS_RESPOSTA = 'checked' and Ds_Pergunta = 'REAGENTELR') then 'REAGENTE'
    when (DS_RESPOSTA = 'checked' and Ds_Pergunta = 'N_REAGENTELR') then 'NAO REAGENTE'
    when (DS_RESPOSTA = 'checked' and Ds_Pergunta = 'POSITIVOLR') then 'POSITIVO'
    when (DS_RESPOSTA = 'checked' and Ds_Pergunta = 'NEGATIVOLR') then 'NEGATIVO'

     else '' end STATUS,
          CASE   
          WHEN (DS_RESPOSTA = 'checked' and Ds_Pergunta = 'L_HIV' /*encontrar no descrição*/) THEN 1 END HIV,
          CASE
          WHEN (DS_RESPOSTA = 'checked' and Ds_Pergunta = 'L_SIFILIS' /*encontrar no descrição*/) THEN 1 END SIFILIS,
          CASE
          WHEN (DS_RESPOSTA = 'checked' and Ds_Pergunta = 'REAGENTELR' /*encontrar no descrição*/) THEN 1 END REAGENTE,
          CASE
          WHEN (DS_RESPOSTA = 'checked' and Ds_Pergunta = 'N_REAGENTELR' /*encontrar no descrição*/) THEN 1 END NAO_REAGENTE,
          CASE
          WHEN (DS_RESPOSTA = 'checked' and Ds_Pergunta = 'POSITIVOLR' /*encontrar no descrição*/) THEN 1 END POSITIVO,
          CASE
          WHEN (DS_RESPOSTA = 'checked' and Ds_Pergunta = 'NEGATIVOLR' /*encontrar no descrição*/) THEN 1 END NEGATIVO
     
          
from paciente a,
     atendime b,
     documento e,
     registro_documento f,
     registro_resposta g,
     pergunta_doc h
where a.cd_paciente=b.cd_paciente(+)
and e.cd_documento=f.cd_documento
and b.cd_atendimento=f.cd_atendimento(+)
and f.cd_registro_documento=g.cd_registro_documento(+)
and g.cd_pergunta_doc=h.cd_pergunta_doc(+)
and g.cd_pergunta_doc IN ('45854','45855','45836','45837','45838','45839')
--and f.dt_registro between to_date ('01/07/2018','dd/mm/yyyy') and to_date ('28/07/2018','dd/mm/yyyy')
and g.ds_resposta = 'checked'
AND E.CD_DOCUMENTO = '814';
--AND DT_REGISTRO LIKE '17/12/19%';
--order by F.dt_registro asc,a.nm_paciente asc;