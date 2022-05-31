const database = require("../database/config");

function cadastrarEmpresa(empresa, cnpj, cep) {
  const query = `
          INSERT INTO empresa (nome, cnpj, cep) VALUES ('${empresa}', '${cnpj}', '${cep}');
      `;
  return database.executar(query);
}

function CreateAssinatura(idEmpresa, fk_assinatura, incio, renovacao) {
  const query = `INSERT INTO plano (fk_empresa, fk_assinatura, status_ass, inicio, renovacao)
    VALUES (${idEmpresa}, '${fk_assinatura}', 1, '${incio}', '${renovacao}')
  `;
  return database.executar(query);
}

function listarUnicEmpresa(empresa) {
  const query = `SELECT * FROM empresa WHERE nome = '${empresa}'`;
  return database.executar(query);
}

function listarMyEmpresa(idEmpresa) {
  const query = `SELECT * FROM empresa WHERE id = '${idEmpresa}'`;
  return database.executar(query);
}

function listarMyAssinature(idEmpresa) {
  const query = `SELECT * FROM plano WHERE fk_empresa = '${idEmpresa}'`;
  return database.executar(query);
}

function newSensor(idEmpresa) {
  const query = `INSERT INTO sensor VALUES 
  (NULL, 1, 1, ${idEmpresa}),
  (NULL, 2, 1, ${idEmpresa}),
  (NULL, 3, 1, ${idEmpresa}),
  (NULL, 4, 1, ${idEmpresa});`;

  return database.executar(query);
}

module.exports = {
  listarUnicEmpresa,
  cadastrarEmpresa,
  listarMyEmpresa,
  CreateAssinatura,
  listarMyAssinature,
  newSensor,
};
