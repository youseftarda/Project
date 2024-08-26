#if ANDROID


using Microsoft.Maui.Controls.Compatibility.Platform.Android;
using Microsoft.Maui.Platform;

#endif
using Khadamati_App.Views;

namespace Khadamati_App
{
    public partial class App : Application
    {

        public App()
        {

            InitializeComponent();
            MainPage = new AppShell();





            //            Microsoft.Maui.Handlers.EntryHandler.Mapper.AppendToMapping("MyCustomization", (handler, view) =>
            //            {
            //#if ANDROID
            //                handler.PlatformView.BackgroundTintList = Android.Content.Res.ColorStateList.ValueOf(Colors.Transparent.ToAndroid());


            //#endif
            //            });

            // CODE CREATED BY KAMEL SHILI 
            Microsoft.Maui.Handlers.EntryHandler.Mapper.AppendToMapping(nameof(BorderlessEntry), (handler, view) =>
            {
                if (view is BorderlessEntry)
                {
#if __ANDROID__
                    handler.PlatformView.SetBackgroundColor(Colors.Transparent.ToPlatform());
#elif __IOS__
                    handler.PlatformView.BorderStyle = UIKit.UITextBorderStyle.None;

#endif
                }
            });

        }
    }
}