using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpCompartilhandoContextoRuby
{
    class Contexto
    {
        public string Nome { get; set; }
        public int Idade { get; set; }

        public override string ToString()
        {
            return string.Format("Nome: {0} Idade: {1}", this.Nome, this.Idade);
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            var contexto = new Contexto();
            var ruby = new RubyEngine(contexto);

            ruby.Execute("app.Nome = 'Vinicius'");
            ruby.Execute("app.Idade = 24");

            Console.WriteLine(contexto.ToString());

            contexto.Nome = "TDC 2010";
            var nome = ruby.Execute("return app.Nome.ToString");
            Console.WriteLine("Novo nome: {0}",nome);

            Console.ReadKey();
        }
    }
}
