var express = require("express");
var router = express.Router();

var empresaController = require("../controllers/empresaController");

router.get("/myempresa/:id", empresaController.myEmpresa);
router.get("/myassinature/:id", empresaController.myAssinature);

module.exports = router;
