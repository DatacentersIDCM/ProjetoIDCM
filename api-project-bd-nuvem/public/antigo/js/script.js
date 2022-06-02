
var opcao = false;

  function Calcular() {
    var frete = 0;


    var textOrcamento = document.getElementById('textOrcamento');
    var ValorOrcamento = document.getElementById('ValorOrcamento');

    var metragem_sala = Number(input_metragem_sala.value)
    var qnt_servidor = Number(input_qnt_servidor.value)

    // Localidade
    var localidade = document.getElementsByName("localidade");
    var dentro_sp = localidade[0].checked;


    // Tempo de assinatura
    var tempoAssis = document.getElementsByName('ano');

    var temp1 = tempoAssis[0].checked;
    var temp2 = tempoAssis[1].checked;
    var temp3 = tempoAssis[2].checked;

    var TodosTemps = [temp1, temp2, temp3];

    var custo_hardware = 200
    var valor_hardware = (qnt_servidor * custo_hardware) + (metragem_sala / 20 * custo_hardware)
    var mao_de_obra = Number(valor_hardware * 0.65)
    var valorFinal = Number(mao_de_obra + valor_hardware)

    if (dentro_sp == true) {
         frete = 50
    }else {
        frete = 100
    }

    if(TodosTemps[0] == true){
        var desconto1 = Number((valorFinal + frete) * 12) * 0.05
        var orcamento = Number((valorFinal + frete) * 12) - desconto1
    }else if(TodosTemps[1] == true){
        var desconto2 = Number((valorFinal + frete) * 24) * 0.10
        var orcamento = Number((valorFinal + frete) * 24)-desconto2
    }else if(TodosTemps[2] == true) {
        var desconto5 = Number((valorFinal + frete) * 60) * 0.15
        var orcamento = Number((valorFinal + frete) * 60)-desconto5    
    }

 

  if(orcamento == undefined){
       orcamento = 0;
  }

    
    textOrcamento.innerHTML = `O valor do orçamento ficou: `;
    ValorOrcamento.innerHTML = `${orcamento.toLocaleString('pt-BR', {
        style: "currency",
        currency: "BRL"
    })} `;

    Abertura();
}


function Abertura(){

    if(opcao == false){
        $('.container')
        .transition('fade up')
        ;
        opcao = true;
    }
}

function Alert(){
    alert('click')
}
