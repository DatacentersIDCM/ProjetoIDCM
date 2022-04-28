var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

router.get("/", usuarioController.testar);

router.get("/listar", usuarioController.listar);

router.get("/myinformation/:id", usuarioController.myInformations);

router.post("/cadastrar", usuarioController.cadastrar);

router.post("/atualizar/imagem", usuarioController.atualizarImg);

router.post("/autenticar", usuarioController.entrar);

module.exports = router;
