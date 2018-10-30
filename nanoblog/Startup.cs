using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(nanoblog.Startup))]
namespace nanoblog
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
