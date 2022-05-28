const usuarioModel = require("../models/usuarioModel");
const empresaModel = require("../models/empresaModel");

function entrar(req, res) {
  var email = req.body.MyEmail;
  var senha = req.body.MySenha;

  if (email == undefined || email == "") {
    res.json({
      mensagem: "email_undefined",
    });
  } else if (senha == undefined || senha == "") {
    res.json({
      mensagem: "senha_undefined",
    });
  } else {
    usuarioModel
      .entrar(email, senha)
      .then((resultado) => {
        console.log(`\nResultados encontrados: ${resultado.length}`);
        console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

        if (resultado.length == 1) {
          res.json({
            mensagem: "success",
            resultado,
          });
        } else if (resultado.length == 0) {
          res.json({
            mensagem: "email_senha_invalidos",
          });
        } else {
          res.json({
            mensagem: "login_ativo",
          });
        }
      })
      .catch((erro) => {
        console.log(erro);
        console.log(
          "\nHouve um erro ao realizar o login! Erro: ",
          erro.sqlMessage
        );
        res.status(500).json(erro.sqlMessage);
      });
  }
}

function cadastrar(req, res) {
  const empresa = req.body.NewEmpresa;
  const cnpj = req.body.NewCnpj;
  const cep = req.body.NewCep;

  // Usuario
  const nomeUser = req.body.NewNomeUser;
  const email = req.body.NewEmail;
  const senha = req.body.NewSenha;
  const cargo = "Admin";

  // Assinature
  const assinatura = req.body.NewAssinatura;
  let nome_assinature = "";

  // Date
  const data_atual = new Date();
  const dia_atual = data_atual.getDate();
  const mes_atual = data_atual.getMonth() + 1;
  let ano_atual = data_atual.getFullYear();
  var renovacao = "";

  if (assinatura <= 1.2) {
    nome_assinature = "Anual";
    renovacao = ano_atual + 1;
  } else if (assinatura <= 1.8) {
    nome_assinature = "Bianual";
    renovacao = ano_atual + 2;
  } else {
    nome_assinature = "Quinquenal";
    renovacao = ano_atual + 5;
  }

  if (mes_atual < 10) {
    var mesFormat = "0" + mes_atual;
  }

  var dateTime_atual = `${ano_atual}/${mesFormat}/${dia_atual}`;
  var dateTime_renovacao = `${renovacao}/${mesFormat}/${dia_atual}`;

  empresaModel
    .cadastrarEmpresa(empresa, cnpj, cep)
    .then((response) => {
      const tamanho = response.affectedRows;
      if (tamanho > 0) {
        empresaModel
          .listarUnicEmpresa(empresa)
          .then((dadosEmpresa) => {
            const idEmpresa = dadosEmpresa[0].id;
            usuarioModel
              .casdastrarUsuario(nomeUser, email, senha, cargo, idEmpresa)
              .then((insertUser) => {
                const tamanhoUser = insertUser.affectedRows;
                if (tamanhoUser > 0) {
                  empresaModel
                    .CreateAssinatura(
                      nome_assinature,
                      dateTime_atual,
                      dateTime_renovacao,
                      idEmpresa
                    )
                    .then((resAssinature) => {
                      const tamanhoAssinature = resAssinature.affectedRows;
                      if (tamanhoAssinature > 0) {
                        res.json({
                          mensagem: "success",
                        });
                      }
                    })
                    .catch(() => {
                      res.json({
                        mensagem: "error_cadastrar_assinatura",
                      });
                    });
                }
              })
              .catch(() => {
                res.json({
                  mensagem: "error_cadastrar_user",
                });
              });
          })
          .catch(() => {
            res.json({
              mensagem: "error_listagem_empresa",
            });
          });
      }
    })
    .catch(() => {
      res.json({
        mensagem: "error_empresa",
      });
    });
}

function myInformations(req, res) {
  const idUser = req.params.id;
  usuarioModel.myInformations(idUser).then((response) => {
    res.json({
      response,
    });
  });
}

function recuperarSenha(req, res) {
  const email = req.body.email;
  const novaSenha = req.body.novaSenha;

  usuarioModel.verifyEmail(email).then((response) => {
    const tamanho = response.length;
    if (tamanho > 0) {
      usuarioModel.recuperarSenha(email, novaSenha).then((res2) => {
        const stt = res2.affectedRows;
        if (stt > 0) {
          res.json({
            mensagem: "success",
          });
        } else {
          res.json({
            mensagem: "error",
          });
        }
      });
    } else {
      res.json({
        mensagem: "email_inot",
      });
    }
  });
}

function atualizarImg(req, res) {
  const idUser = req.body.id;
  const img = req.body.img;

  usuarioModel.atualizarImg(idUser, img).then((response) => {
    const tamanho = response.affectedRows;

    if (tamanho > 0) {
      res.json({
        mensagem: "success",
      });
    } else {
      res.json({
        mensagem: "error",
      });
    }
  });
}

module.exports = {
  entrar,
  cadastrar,
  atualizarImg,
  myInformations,
  recuperarSenha,
};
