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


function buscarMetricas(idEmpresa, idRack) {
  const query = `SELECT M.temperatura, M.umidade, DATE_FORMAT(M.date_time,'%H:%i:%s') as momento_grafico FROM metrica AS M 
    JOIN sensor AS S ON S.id = M.fk_sensor 
    WHERE S.fk_empresa = ${idEmpresa} AND S.rack = ${idRack} ORDER BY M.id DESC LIMIT 7`;

  return database.executar(query);
}
function buscarMetricasTempoReal(idEmpresa, idRack) {
  const query = `SELECT M.temperatura, M.umidade, DATE_FORMAT(M.date_time,'%H:%i:%s') AS momento_grafico FROM metrica AS M 
  JOIN sensor AS S ON S.id = M.fk_sensor 
  WHERE S.fk_empresa = ${idEmpresa} AND S.rack = ${idRack} ORDER BY M.id DESC LIMIT 1`;

  return database.executar(query);
}

function buscarMaxMin(idEmpresa, idRack) {
  const query = `SELECT MAX(M.temperatura) AS 'maximo_temp', 
  MIN(M.temperatura) AS 'minimo_temp', MAX(M.umidade) AS 'maximo_umid', 
  MIN(M.umidade) AS 'minimo_umid' FROM metrica AS M 
  JOIN sensor AS S ON S.id = M.fk_sensor 
  WHERE S.fk_empresa = ${idEmpresa} AND S.rack = ${idRack} LIMIT 1`;

  return database.executar(query);
}

function buscarMedia(idEmpresa) {
  const query = `SELECT E.nome, ROUND(AVG(temperatura),2) AS 'temperatura', ROUND(AVG(umidade),2) AS 'umidade'
  FROM empresa AS E 
  JOIN metrica AS M
  JOIN sensor AS S ON S.id = M.fk_sensor WHERE E.id = ${idEmpresa} GROUP BY M.fk_sensor`;

  return database.executar(query);
}

function buscarMediaRealTime(idEmpresa) {
  const query = `SELECT E.nome, ROUND(AVG(temperatura),2) AS 'temperatura', ROUND(AVG(umidade),2) AS 'umidade'
  FROM empresa AS E 
  JOIN metrica AS M
  JOIN sensor AS S ON S.id = M.fk_sensor WHERE E.id = ${idEmpresa} GROUP BY M.fk_sensor`;

  return database.executar(query);
}

module.exports = {
  buscarUltimasMedidas,
  buscarMetricas,
  buscarMetricasTempoReal,
  buscarMaxMin,
  buscarMedia,
  buscarMediaRealTime,
};
