const express = require("express");
const router = express.Router();

const medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idAquario", medidaController.buscarUltimasMedidas);

router.post("/realtime", medidaController.buscarMetricas);

router.post("/atualizartime", medidaController.buscarMetricasTempoReal);


module.exports = router;