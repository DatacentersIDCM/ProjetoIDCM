var database = require("../database/config");

function buscarUltimasMedidas(idAquario, limite_linhas) {
  instrucaoSql = `select 
                        temperatura, 
                        umidade, 
                        momento,
                        DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
                    from medida
                    where fk_aquario = ${idAquario}
                    order by id desc limit ${limite_linhas}`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idAquario) {
  instrucaoSql = `select 
                        temperatura, 
                        umidade, DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico, 
                        fk_aquario 
                        from medida where fk_aquario = ${idAquario} 
                    order by id desc limit 1`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarMetricas(idEmpresa, idRack) {
  const query = `SELECT M.temperatura, M.umidade, DATE_FORMAT(M.date_time,'%H:%i:%s') as momento_grafico FROM metrica AS M 
    JOIN sensor AS S ON S.id = M.fk_sensor 
    WHERE M.fk_empresa = ${idEmpresa} AND S.rack = ${idRack} ORDER BY M.date_time ASC LIMIT 7`;

  return database.executar(query);
}
function buscarMetricasTempoReal(idEmpresa, idRack) {
  const query = `SELECT M.temperatura, M.umidade, DATE_FORMAT(M.date_time,'%H:%i:%s') AS momento_grafico FROM metrica AS M 
  JOIN sensor AS S ON S.id = M.fk_sensor 
  WHERE M.fk_empresa = ${idEmpresa} AND S.rack = ${idRack} ORDER BY M.date_time DESC LIMIT 1`;

  return database.executar(query);
}

function buscarMaxMin(idEmpresa, idRack) {
  const query = `SELECT MAX(M.temperatura) AS 'maximo_temp', 
  MIN(M.temperatura) AS 'minimo_temp', MAX(M.umidade) AS 'maximo_umid', 
  MIN(M.umidade) AS 'minimo_umid' FROM metrica AS M 
  JOIN sensor AS S ON S.id = M.fk_sensor 
  WHERE M.fk_empresa = ${idEmpresa} AND S.rack = ${idRack} LIMIT 1`;

  return database.executar(query);
}

function buscarMedia(idEmpresa){
  const query = `select empresa.nome, round(avg(temperatura),2) as temperatura, round(avg(umidade),2) as umidade from empresa 
  join metrica on metrica.fk_empresa = empresa.id
  join sensor on sensor.id = metrica.fk_sensor where empresa.id = ${idEmpresa} group by fk_sensor`

  return database.executar(query);
}

function buscarMediaRealTime(idEmpresa){
  const query = `select empresa.nome, round(avg(temperatura),2) as temperatura, round(avg(umidade),2) as umidade from empresa 
  join metrica on metrica.fk_empresa = empresa.id
  join sensor on sensor.id = metrica.fk_sensor where empresa.id = ${idEmpresa} group by fk_sensor`

  return database.executar(query);
}



module.exports = {
  buscarUltimasMedidas,
  buscarMedidasEmTempoReal,
  buscarMetricas,
  buscarMetricasTempoReal,
  buscarMaxMin,
  buscarMedia,
  buscarMediaRealTime,
};
