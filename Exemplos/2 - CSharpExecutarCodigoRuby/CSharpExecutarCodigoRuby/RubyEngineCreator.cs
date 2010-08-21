using System.IO;
using IronRuby;
using Microsoft.Scripting.Hosting;

namespace CSharpExecutarCodigoRuby
{
    public static class RubyEngineCreator
    {
        private static ScriptEngine ironRubyEngine = null;
        private static ScriptEngine CreateEngine()
        {
            if (ironRubyEngine == null)
                ironRubyEngine = Ruby.CreateEngine();

            return ironRubyEngine;
        }


        public static dynamic GetRubyObject(string rubyFileName, string rubyClassName)
        {
            var binDebug = Path.GetDirectoryName(typeof(RubyEngineCreator).Assembly.Location);
            var path = Path.Combine(binDebug, string.Format("{0}.rb", rubyFileName));

            
            CreateEngine().ExecuteFile(path);

            var variable = CreateEngine().Runtime.Globals.GetVariable(rubyClassName);
            return CreateEngine().Operations.CreateInstance(variable);
        }
    }
}