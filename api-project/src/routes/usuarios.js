var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

router.get("/", usuarioController.testar);

router.get("/listar", usuarioController.listar);

router.get("/myinformation/:id", usuarioController.myInformations);

router.get("/myassinature/:id", usuarioController.myAssinature);

router.get("/myempresa/:id", usuarioController.myEmpresa);

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", usuarioController.cadastrar);

router.post("/autenticar", usuarioController.entrar);

module.exports = router;
