var database = require("../database/config");

function buscarUltimasMedidas(idAquario, limite_linhas) {
  instrucaoSql = `select 
                        temperatura, 
                        umidade, 
                        momento,
                        FORMAT(momento,'dd/MM/yyyy') as momento_grafico
                    from medida
                    where fk_aquario = ${idAquario}
                    order by id desc limit ${limite_linhas}`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarMetricas(idEmpresa, idRack) {
  const query = `SELECT TOP 7 M.id, M.temperatura, M.umidade, FORMAT(M.date_time,'dd/MM/yyyy') as momento_grafico FROM metrica AS M 
    JOIN sensor AS S ON S.id = M.fk_sensor 
    WHERE S.fk_empresa = ${idEmpresa} AND S.rack = ${idRack} ORDER BY M.id DESC `;

  return database.executar(query);
}
function buscarMetricasTempoReal(idEmpresa, idRack) {
  const query = `SELECT TOP 1 M.id, M.temperatura, M.umidade, FORMAT(M.date_time,'dd/MM/yyyy') AS momento_grafico FROM metrica AS M 
  JOIN sensor AS S ON S.id = M.fk_sensor 
  WHERE S.fk_empresa = ${idEmpresa} AND S.rack = ${idRack} ORDER BY M.id DESC`;

  return database.executar(query);
}

function buscarMaxMin(idEmpresa, idRack) {
  const query = `SELECT TOP 1 M.id, MAX(M.temperatura) AS 'maximo_temp', 
  MIN(M.temperatura) AS 'minimo_temp', MAX(M.umidade) AS 'maximo_umid', 
  MIN(M.umidade) AS 'minimo_umid' FROM metrica AS M 
  JOIN sensor AS S ON S.id = M.fk_sensor 
  WHERE S.fk_empresa = ${idEmpresa} AND S.rack = ${idRack}`;

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
