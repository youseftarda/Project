using Microsoft.Extensions.Logging;
using CommunityToolkit.Maui;
using Microsoft.Maui.Controls.Handlers.Compatibility;
using Microsoft.Maui.Controls.PlatformConfiguration;
using Microsoft.Maui.LifecycleEvents;


namespace Khadamati_App
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>().UseMauiCommunityToolkit()
              
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                    fonts.AddFont("Cairo-Black.ttf", "Cairo-Black");
                    fonts.AddFont("Cairo-Bold.ttf", "Cairo-Bold");
                    fonts.AddFont("Cairo-ExtraBold.ttf", "Cairo-ExtraBold");
                    fonts.AddFont("Cairo-ExtraLight.ttf", "Cairo-ExtraLight");
                    fonts.AddFont("Cairo-Light.ttf", "Cairo-Light");
                    fonts.AddFont("Cairo-Medium.ttf", "Cairo-Medium");
                    fonts.AddFont("Cairo-Regular.ttf", "Cairo-Regular");
                    fonts.AddFont("Cairo-SemiBold.ttf", "Cairo-SemiBold");
                });
          
            // ADD BY KAMEL 
            builder.ConfigureLifecycleEvents(events => {
#if ANDROID
                events.AddAndroid(android => android.OnCreate((activity, bundle) => MakeNavigationBarTranslucent(activity)));
                static void MakeNavigationBarTranslucent(Android.App.Activity activity)
                {
                    activity.Window.SetNavigationBarColor(Android.Graphics.Color.ParseColor("#3F51B5"));
                }
#endif

            });
            // ADD BY KAMEL 
#if DEBUG
            builder.Logging.AddDebug();
#endif
            

            return builder.Build();

        }

    }
}
