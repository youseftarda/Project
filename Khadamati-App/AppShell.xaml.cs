using Khadamati_App.Views;

namespace Khadamati_App
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
            
          // Shell.SetTabBarIsVisible(this, false); 

            Routing.RegisterRoute(nameof(Water_Table), typeof(Water_Table));
            Routing.RegisterRoute(nameof(Contact_Us), typeof(Contact_Us));
            Routing.RegisterRoute(nameof(LogIn), typeof(LogIn));
            Routing.RegisterRoute(nameof(MainPage), typeof(MainPage));

        }
    }
}
