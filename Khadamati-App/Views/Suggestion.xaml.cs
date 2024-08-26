
using System.Net.Http.Headers;
using System.Net.Http.Json;
using CommunityToolkit.Maui.Views;
using Khadamati_App.Models.Dto;


namespace Khadamati_App.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Suggestion : ContentPage
    {
        private readonly HttpClient _httpClient;
        private string? _token; // «·Õﬁ· ·Â ﬁÌ„… «› —«÷Ì…

        public Suggestion()
        {
            InitializeComponent();
            _httpClient = new HttpClient
            {
                BaseAddress = new Uri("http://10.0.2.2:31317/api/")
            };
        }
        protected override async void OnAppearing()
        {
            base.OnAppearing();
            _token = await SecureStorage.GetAsync("auth_token");

            if (string.IsNullOrEmpty(_token))
            {
                await DisplayAlert("Error", "ÌÃ»  ”ÃÌ· «·œŒÊ· · ﬁœÌ„ «·«ﬁ —«Õ", "OK");
                // ≈⁄«œ…  ÊÃÌÂ «·„” Œœ„ ≈·Ï ’›Õ…  ”ÃÌ· «·œŒÊ·
                 await Navigation.PushAsync(new LogIn());
            }
        }


        private async void OnSendClicked(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(SubjectEntry.Text) ||
                string.IsNullOrEmpty(PhoneNumberEntry.Text) ||
                string.IsNullOrEmpty(SuggestionTextEntry.Text))
            {
                await DisplayAlert("Error", "Ì—ÃÏ „·¡ Ã„Ì⁄ «·ÕﬁÊ·", "OK");
                return;
            }
            if (PhoneNumberEntry.Text.Length != 10 || !PhoneNumberEntry.Text.All(char.IsDigit))
            {
                await DisplayAlert("Error", "ÌÃ» √‰ ÌﬂÊ‰ —ﬁ„ «·Â« › „‰ 10 √—ﬁ«„ ’ÕÌÕ….", "OK");
                return;
            }

            if (string.IsNullOrEmpty(_token))
            {
                await DisplayAlert("Error", "ÌÃ»  ”ÃÌ· «·œŒÊ· · ﬁœÌ„ «·«ﬁ —«Õ", "OK");
                // ≈⁄«œ…  ÊÃÌÂ «·„” Œœ„ ≈·Ï ’›Õ…  ”ÃÌ· «·œŒÊ·
                 await Navigation.PushAsync(new LogIn());
            }

            bool confirm = await DisplayAlert(" √ﬂÌœ", "Â· √‰  „ √ﬂœ „‰ √‰ﬂ  —Ìœ  ﬁœÌ„ Â–« «·«ﬁ —«Õø", "‰⁄„", "·«");
            if (!confirm)
            {
                return;
            }
            var suggestion = new SuggestionDto
            {
                Subject = SubjectEntry.Text,
                MobilePhoneNumber = PhoneNumberEntry.Text,
                SuggestionText = SuggestionTextEntry.Text

            };

            try
            {
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", _token);
                var response = await _httpClient.PostAsJsonAsync("Suggestions/create", suggestion);

                if (response.IsSuccessStatusCode)
                {
                    //  ›—Ì€ «·ÕﬁÊ· »⁄œ «·≈—”«· «·‰«ÃÕ

                    SubjectEntry.Text = string.Empty;
                    SuggestionTextEntry.Text = string.Empty;
                    PhoneNumberEntry.Text = string.Empty;

                    var popup = new SuccessPopup { Message = " „ ≈—”«· «·«ﬁ —«Õ »‰Ã«Õ" };
                    this.ShowPopup(popup);

                    await Shell.Current.Navigation.PopToRootAsync();
                }
                else
                {
                    var errorMessage = await response.Content.ReadAsStringAsync();
                    await DisplayAlert("Error", $"Œÿ√ √À‰«¡ ≈—”«· «·«ﬁ —«Õ: {errorMessage}", "OK");
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄: {ex.Message}", "OK");
            }


        }
    }
}
