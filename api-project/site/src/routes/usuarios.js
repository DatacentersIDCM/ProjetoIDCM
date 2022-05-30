var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

router.get("/myinformation/:id", usuarioController.myInformations);

router.post("/recuperarSenha", usuarioController.recuperarSenha);

router.post("/atualizarInformation", usuarioController.atualizarInformation);

router.post("/cadastrar", usuarioController.cadastrar);

router.post("/atualizar/imagem", usuarioController.atualizarImg);

router.post("/autenticar", usuarioController.entrar);

module.exports = router;
