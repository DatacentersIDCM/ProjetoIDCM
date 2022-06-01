var empresaModel = require("../models/empresaModel");

function myAssinature(req, res) {
  const idEmpresa = req.params.id;

  empresaModel.listarMyAssinature(idEmpresa).then((response) => {
    res.json({
      response,
    });
  });
}

function myEmpresa(req, res) {
  const idEmpresa = req.params.id;

  empresaModel.listarMyEmpresa(idEmpresa).then((response) => {
    res.json({
      response,
    });
  });
}

module.exports = {
  myEmpresa,
  myAssinature,
};
