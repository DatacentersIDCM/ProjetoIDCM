var database = require("../database/config");

function listar() {
  var instrucao = `
        SELECT * FROM usuario;
    `;
  return database.executar(instrucao);
}

function entrar(email, senha) {
  var instrucao = `
        SELECT * FROM usuario WHERE Email = '${email}' AND Senha = '${senha}';
    `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
function cadastrarEmpresa(empresa, cnpj, cep) {
  const query = `
        INSERT INTO empresa (Nome_empresa, CNPJ, CEP) VALUES ('${empresa}', '${cnpj}', '${cep}');
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

function casdastrarUsuario(nomeUser, email, senha, cargo, idEmpresa) {
  const query = `INSERT INTO usuario (Nome, Cargo, Email, Senha, FK_Empresa)
  VALUES ('${nomeUser}', '${cargo}', '${email}', '${senha}', ${idEmpresa})`;

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

function myInformations(idUser) {
  const query = `SELECT * FROM usuario WHERE ID_Usuario = ${idUser}`;

  return database.executar(query);
}

module.exports = {
  entrar,
  listarUnicEmpresa,
  cadastrarEmpresa,
  casdastrarUsuario,
  listarMyEmpresa,
  myInformations,
  listarMyAssinature,
  CreateAssinatura,
  listar,
};
