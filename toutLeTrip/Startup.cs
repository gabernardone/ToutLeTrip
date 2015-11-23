using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(toutLeTrip.Startup))]
namespace toutLeTrip
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
