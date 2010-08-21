using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Models;

namespace Calculos
{
    public class CalculadorDeDescontos
    {
        public decimal CalcularDescontoPara(Pedido pedido)
        {
            var desconto = 0m;
            foreach (var item in pedido.Itens)
            {
                var fatorDesconto = 0m;
                var totalItem = item.Quantidade * item.ValorUnitario;

                if (item.ValorUnitario < 100)
                    fatorDesconto = 0.03m;
                else if (item.ValorUnitario < 1000)
                {
                    fatorDesconto = 0.1m;
                    if (item.Quantidade > 2)
                        fatorDesconto = 0.15m;
                }
                else
                {
                    fatorDesconto = 0.1m;
                }

                desconto += totalItem * fatorDesconto;
            }

            return desconto;
        }
    }
}
