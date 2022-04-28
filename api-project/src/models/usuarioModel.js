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

function casdastrarUsuario(nomeUser, email, senha, cargo, idEmpresa) {
  const query = `INSERT INTO usuario (Nome, Cargo, Email, Senha, FK_Empresa)
  VALUES ('${nomeUser}', '${cargo}', '${email}', '${senha}', ${idEmpresa})`;

  return database.executar(query);
}

function myInformations(idUser) {
  const query = `SELECT * FROM usuario WHERE ID_Usuario = ${idUser}`;

  return database.executar(query);
}

function atualizarImg(idUser, img) {
  const query = `UPDATE usuario SET Imagem = '${img}' WHERE ID_Usuario = ${idUser}`;

  return database.executar(query);
}

module.exports = {
  entrar,
  casdastrarUsuario,
  myInformations,
  listar,
  atualizarImg,
};
