using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpCriandoCodigoRuby
{
    public class ExecutandoScriptsTexto
    {
        private RubyEngine ruby;

        public ExecutandoScriptsTexto()
        {
            ruby = new RubyEngine(this);
        }

        public int Somar(int n1, int n2)
        {
            var script = string.Format("return {0} + {1}",n1,n2);
            return ruby.Execute(script);
        }
        public string CriarClasse()
        {
            var script = @"
            class Ola
                def mundo
                    'Olá mundo'
                end
                def voce(parameter)
                    'Olá: ' + parameter +  ' seja bem vindo ao IronRuby!'
                end
            end
            
            oi = Ola.new
            oi.mundo.ToString
            ";

            return ruby.Execute(script);
        }
        public string CriarClasseMandarParametro()
        {
            var nome = "TDC 2010";

            var script2 = @"
                oi = Ola.new
                oi.voce('" + nome + "').ToString";

            return ruby.Execute(script2);
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            ScriptsTexto();

            Console.ReadKey();
        }

        private static void ScriptsTexto()
        {
            var exec = new ExecutandoScriptsTexto();
            
            //Console.WriteLine("Soma: {0}",exec.Somar(2,2));

            Console.WriteLine("Saudações: {0}",exec.CriarClasse());

            Console.WriteLine("Parametro: {0}",exec.CriarClasseMandarParametro());
        }
    }
}
