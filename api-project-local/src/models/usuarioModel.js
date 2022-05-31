const database = require("../database/config");

function entrar(email, senha) {
  var instrucao = `
        SELECT * FROM usuario WHERE Email = '${email}' AND Senha = '${senha}';
    `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucao

function casdastrarUsuario(nomeUser, email, senha, cargo, idEmpresa) {
  const query = `INSERT INTO usuario (nome, cargo, email, senha, fk_empresa)
  VALUES ('${nomeUser}', '${cargo}', '${email}', '${senha}', ${idEmpresa})`;
  return database.executar(query);
}

function myInformations(idUser) {
  const query = `SELECT U.nome AS 'nome', 
  E.nome AS 'empresa', U.sobrenome AS 'sobrenome',
  U.email AS 'email', U.imagem AS 'imagem',
  U.telefone AS 'telefone'
  FROM usuario AS U 
  JOIN empresa AS E 
  ON U.fk_empresa = E.id WHERE U.id = ${idUser}`;
  return database.executar(query);
}

function atualizarImg(idUser, img) {
  const query = `UPDATE usuario SET imagem = '${img}' WHERE id = ${idUser}`;

  return database.executar(query);
}

function verifyEmail(email) {
  const query = `SELECT email FROM usuario WHERE email = '${email}'`;
  return database.executar(query);
}

function recuperarSenha(email, senha) {
  const query = `UPDATE usuario SET senha = '${senha}' WHERE email = '${email}'`;
  return database.executar(query);
}

function atualizarInformation(iduser, nome, sobrenome, email, telefone) {
  const query = `UPDATE usuario SET nome = '${nome}', sobrenome = '${sobrenome}', 
  email = '${email}', telefone = '${telefone}' WHERE id = ${iduser}`;
  return database.executar(query);
}

module.exports = {
  entrar,
  casdastrarUsuario,
  myInformations,
  atualizarImg,
  recuperarSenha,
  atualizarInformation,
  verifyEmail,
};
