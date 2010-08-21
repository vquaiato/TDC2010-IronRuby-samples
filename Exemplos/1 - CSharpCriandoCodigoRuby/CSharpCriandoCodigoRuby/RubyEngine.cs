using System;
using Microsoft.Scripting.Hosting;

namespace CSharpCriandoCodigoRuby
{
    public class RubyEngine
    {
        private ScriptScope scope;
        private ScriptRuntime runtime;
        private ScriptEngine engine;

        public RubyEngine(object appScope)
        {
            var runtimeSetup = new ScriptRuntimeSetup();
            runtimeSetup
                .LanguageSetups
                .Add(new LanguageSetup("IronRuby.Runtime.RubyContext, IronRuby",
                                       "IronRuby 1.0",
                                       new[] { "IronRuby", "Ruby", "rb" },
                                       new[] { ".rb" }));

            runtime = ScriptRuntime.CreateRemote(AppDomain.CurrentDomain, runtimeSetup);

            scope = runtime.CreateScope();
            scope.SetVariable("app", appScope);

            engine = runtime.GetEngine("IronRuby");
        }

        public dynamic Execute(string script)
        {
            return engine.Execute(script, scope);
        }
    }
}