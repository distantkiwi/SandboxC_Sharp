using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Connected_Slot_Racers.Startup))]
namespace Connected_Slot_Racers
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
