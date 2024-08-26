using System.Net.Http.Json;
using Khadamati_App.Models;
using CommunityToolkit.Maui.Views;

namespace Khadamati_App
{
    public partial class LogIn : ContentPage
    {
        private readonly HttpClient _httpClient;

        public LogIn()
        {
            InitializeComponent();
            _httpClient = new HttpClient
            {
                BaseAddress = new Uri("http://10.0.2.2:31317/api/")
            };
        }

        private async void OnLoginClicked(object sender, EventArgs e)
        {
            string nationalId = NationalIdNumber.Text;
            string password = Password.Text;

            if (string.IsNullOrEmpty(nationalId) || string.IsNullOrEmpty(password))
            {
                await DisplayAlert("Error", "Ã„Ì⁄ «·ÕﬁÊ· „ÿ·Ê»…", "OK");
                return;
            }

            var loginModel = new Login
            {
                NationalIdNumber = nationalId,
                Password = password,
            };

            try
            {
                var response = await _httpClient.PostAsJsonAsync("Account/authenticate", loginModel);

                if (response.IsSuccessStatusCode)
                {
                    var tokenData = await response.Content.ReadFromJsonAsync<TokenApiDto>();

                    //  Œ“Ì‰ «· Êﬂ‰ ›Ì SecureStorage
                    await SecureStorage.SetAsync("auth_token", tokenData.AccessToken);

                    var popup = new SuccessPopup { Message = " „  ”ÃÌ· «·œŒÊ· »‰Ã«Õ" };
                    this.ShowPopup(popup);

                    NationalIdNumber.Text = string.Empty;
                    Password.Text = string.Empty;

                    // Navigate to the main page after successful login
                    await Shell.Current.Navigation.PopToRootAsync();
                }
                else
                {
                    var errorResponse = await response.Content.ReadFromJsonAsync<ErrorResponse>();
                    await DisplayAlert("Error", errorResponse?.Message ?? "›‘·  ”ÃÌ· «·œŒÊ·", "OK");
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"ÕœÀ Œÿ√ √À‰«¡ „Õ«Ê·…  ”ÃÌ· «·œŒÊ·: {ex.Message}", "OK");
                if (ex.InnerException != null)
                {
                    await DisplayAlert("Inner Exception", ex.InnerException.Message, "OK");
                }
            }
        }

        private async void OnTapped_register(object sender, TappedEventArgs e)
        {
            await Navigation.PushAsync(new SignUp());
        }

        private async void OnTapped_ignor(object sender, TappedEventArgs e)
        {
            await Shell.Current.Navigation.PopToRootAsync();
        }

        public class ErrorResponse
        {
            public string Message { get; set; } = string.Empty;
        }

        public class TokenApiDto
        {
            public string AccessToken { get; set; } = string.Empty;
            public string RefreshToken { get; set; } = string.Empty;
        }

  
    }
}
