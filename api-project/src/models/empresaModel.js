var database = require("../database/config");

function cadastrarEmpresa(empresa, cnpj, cep) {
  const query = `
          INSERT INTO empresa (Nome_empresa, CNPJ, CEP) VALUES ('${empresa}', '${cnpj}', '${cep}');
      `;
  return database.executar(query);
}

function CreateAssinatura(
  nome_assinature,
  dateTime_atual,
  dateTime_renovacao,
  idEmpresa
) {
  const query = `INSERT INTO assinatura (Plano, Status_assinatura, Inicio, Vencimento, FK_empresa)
    VALUES ('${nome_assinature}', 1, '${dateTime_atual}', '${dateTime_renovacao}',  ${idEmpresa})
  `;

  return database.executar(query);
}

function listarUnicEmpresa(empresa) {
  const query = `SELECT * FROM empresa WHERE Nome_empresa = '${empresa}'`;

  return database.executar(query);
}

function listarMyEmpresa(idEmpresa) {
  const query = `SELECT * FROM empresa WHERE ID_Empresa = '${idEmpresa}'`;

  return database.executar(query);
}

function listarMyAssinature(idEmpresa) {
  const query = `SELECT * FROM assinatura WHERE FK_Empresa = '${idEmpresa}'`;

  return database.executar(query);
}

module.exports = {
  listarUnicEmpresa,
  cadastrarEmpresa,
  listarMyEmpresa,
  CreateAssinatura,
  listarMyAssinature,
};
