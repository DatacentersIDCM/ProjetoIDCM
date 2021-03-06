process.env.AMBIENTE_PROCESSO = "producao";
// process.env.AMBIENTE_PROCESSO = "producao";

var express = require("express");
var cors = require("cors");
var path = require("path");
var PORTA = 8080;

var app = express();

var indexRouter = require("./src/routes/index");
var usuarioRouter = require("./src/routes/usuarios");
var empresaRouter = require("./src/routes/empresa");
var avisosRouter = require("./src/routes/avisos");
var medidasRouter = require("./src/routes/medidas");

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, "public")));

app.use(cors());

app.use("/", indexRouter);
app.use("/usuarios", usuarioRouter);
app.use("/avisos", avisosRouter);
app.use("/empresa", empresaRouter);
app.use("/medidas", medidasRouter);

app.listen(PORTA, function () {
  console.log(
    `Servidor do seu sistema já está rodando... Acesse o caminho a seguir para visualizar: http://localhost:${PORTA}'`
  );
});
