using CommunityToolkit.Maui.Views;
using Khadamati_App.Views;
using Microsoft.Maui.Controls;
using System.Diagnostics;

namespace Khadamati_App
{
    public partial class MainPage : ContentPage
    {
        private bool _isLoggedIn;

        public MainPage()
        {
            InitializeComponent();
            CheckLoginStatus();
        }

        // تحقق من حالة تسجيل الدخول
        private async void CheckLoginStatus()
        {
            var token = await SecureStorage.GetAsync("auth_token");
            _isLoggedIn = !string.IsNullOrEmpty(token);
            UpdateLoginLabel();
        }

        // تحديث النص بناءً على حالة تسجيل الدخول
        private void UpdateLoginLabel()
        {
            LoginLabel.Text = _isLoggedIn ? "تسجيل خروج" : "تسجيل دخول";
        }

        // التعامل مع تسجيل الدخول أو الخروج
        private async void OnTapped_LoginOrLogout(object sender, TappedEventArgs e)
        {
            if (_isLoggedIn)
            {
                bool confirm = await DisplayAlert("تأكيد", "هل تريد تسجيل الخروج؟", "نعم", "لا");
                if (confirm)
                {
                    SecureStorage.Remove("auth_token");
                    _isLoggedIn = false;
                    UpdateLoginLabel();
                    var popup = new SuccessPopup { Message = "تم تسجيل خروجك بنجاح" };
                    this.ShowPopup(popup);

                    await Navigation.PushAsync(new LogIn());
                }
            }
            else
            {
                // الانتقال إلى صفحة تسجيل الدخول مع تحديث حالة تسجيل الدخول بعد العودة
                await Navigation.PushAsync(new LogIn());
            }
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            // تحديث حالة تسجيل الدخول عند العودة إلى الصفحة
            CheckLoginStatus();
        }

        protected override void OnSizeAllocated(double pageWidth, double pageHeight)
        {
            base.OnSizeAllocated(pageWidth, pageHeight);
            const double aspectRatio = 1600 / 1441.0; // Aspect ratio of the original image
            backgroundImage.WidthRequest = Math.Max(pageHeight * aspectRatio, pageWidth);
        }

        private void Squared_Btn_Clicked(object sender, EventArgs e)
        {
            // Functionality for Squared_Btn_Clicked
        }

        private async void OnNavigate()
        {
            await Navigation.PushAsync(new Water_Table(), false);
        }

        private void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)
        {
            OnNavigate();
        }

        private async void OnNavigateC()
        {
            await Navigation.PushAsync(new Contact_Us(), false);
        }

        private void TapGestureRecognizer_Tapped_1(object sender, TappedEventArgs e)
        {
            OnNavigateC();
        }

        private async void OnTapped_login(object sender, TappedEventArgs e)
        {
            await Navigation.PushAsync(new LogIn());
        }

        private void ImageButton_Clicked(object sender, EventArgs e)
        {
            Debug.WriteLine("ImageButton clicked");
            Shell.Current.FlyoutIsPresented = true;
        }
    }
}