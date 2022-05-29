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

function buscarMetricas(idEmpresa,idRack){
    const query = `select metrica.temperatura, metrica.umidade, metrica.date_time from empresa join metrica on metrica.fk_empresa = empresa.id join sensor on sensor.id = metrica.fk_sensor where empresa.id = ${idEmpresa} and sensor.rack = ${idRack}`;

    return database.executar(query);

}
function buscarMetricasTempoReal(idEmpresa, idRack) {
    const query = `SELECT * FROM empresa AS E JOIN usuario AS U on U.fk_empresa = E.id
    JOIN metrica AS M ON M.fk_empresa = E.id
    JOIN sensor AS S ON M.fk_sensor = S.id WHERE E.id = 1 AND S.rack = 1
    order by S.id desc limit 1`;

    return database.executar(query);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarMetricas,
    buscarMetricasTempoReal
}