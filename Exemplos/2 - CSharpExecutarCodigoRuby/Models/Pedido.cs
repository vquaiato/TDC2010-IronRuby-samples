using System.Collections.Generic;
using System.Linq;

namespace Models
{
    public class Pedido
    {
        public IList<ItemPedido> Itens { get; set; }
        public void Add(ItemPedido novoItem)
        {
            if (Itens == null)
                Itens = new List<ItemPedido>();

            Itens.Add(novoItem);
        }

        public decimal TotalDoPedido()
        {
            return this.Itens.Sum(i => i.Quantidade * i.ValorUnitario);
        }
    }
}