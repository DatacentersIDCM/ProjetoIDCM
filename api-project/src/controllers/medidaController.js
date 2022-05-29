const medidaModel = require("../models/medidaModel");

function buscarUltimasMedidas(req, res) {

    const limite_linhas = 7;

    var idAquario = req.params.idAquario;

    console.log(`Recuperando as ultimas ${limite_linhas} medidas`);

    medidaModel.buscarUltimasMedidas(idAquario, limite_linhas).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function buscarMedidasEmTempoReal(req, res) {

    var idAquario = req.params.idAquario;

    console.log(`Recuperando medidas em tempo real`);

    medidaModel.buscarMedidasEmTempoReal(idAquario).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarMetricas(req, res) {
    const idEmpresa = req.body.MyEmpresa;
    const idRack = req.body.MyRack;

    medidaModel.buscarMetricas(idEmpresa, idRack).then((response) => {
        const resultado = response.length;

        if (resultado > 0) {
            res.status(200).json({
                response
            })
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch((erro) => {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarMetricasTempoReal(req, res) {
    const idEmpresa = req.body.idEmpresa;
    const idRack = req.body.idRack;

    console.log(`Recuperando medidas em tempo real`);

    medidaModel.buscarMetricasTempoReal(idEmpresa, idRack).then((response) => {
        const resultado = response.length;

        if (resultado > 0) {
            res.status(200).json({
                response
            })
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as medidas atualizadas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}
  

module.exports = {
    buscarUltimasMedidas,
    buscarMetricas,
    buscarMedidasEmTempoReal,
    buscarMetricasTempoReal,
}