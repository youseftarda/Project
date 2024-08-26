
using System.Net.Http.Headers;
using System.Net.Http.Json;
using CommunityToolkit.Maui.Views;
using Khadamati_App.Models.Dto;

namespace Khadamati_App.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class UnifiedSubscriptionPage : ContentPage
    {
        private readonly HttpClient _httpClient;
        private string? _token; // «·Õﬁ· ·Â ﬁÌ„… «› —«÷Ì…

        public UnifiedSubscriptionPage()
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
                await DisplayAlert("Error", "ÌÃ»  ”ÃÌ· «·œŒÊ· ·≈—”«· «·ÿ·»", "OK");
                // ≈⁄«œ…  ÊÃÌÂ «·„” Œœ„ ≈·Ï ’›Õ…  ”ÃÌ· «·œŒÊ·
                await Navigation.PushAsync(new LogIn());
            }
        }

        private async void OnSendClicked(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(RequestTypePicker.SelectedItem?.ToString())||
                string.IsNullOrEmpty(PhoneNumberEntry.Text) ||
                string.IsNullOrEmpty(BuildingPermitEntry.Text))
            {
                await DisplayAlert("Error", "Ì—ÃÏ „·¡ Ã„Ì⁄ «·ÕﬁÊ·", "OK");
                return;
            }
            if (PhoneNumberEntry.Text.Length != 10 || !PhoneNumberEntry.Text.All(char.IsDigit))
            {
                await DisplayAlert("Error", "ÌÃ» √‰ ÌﬂÊ‰ —ﬁ„ «·„Ê»«Ì· „‰ 10 √—ﬁ«„ ’ÕÌÕ….", "OK");
                return;
            }

            if (string.IsNullOrEmpty(_token)) // «· Õﬁﬁ „‰ «· Êﬂ‰ ﬁ»· «·≈—”«·
            {
                await DisplayAlert("Error", "ÌÃ»  ”ÃÌ· «·œŒÊ· ·≈—”«· «·ÿ·»", "OK");
                await Navigation.PushAsync(new LogIn());
                return;
            }

            bool confirm = await DisplayAlert(" √ﬂÌœ", "Â· √‰  „ √ﬂœ „‰ √‰ﬂ  —Ìœ ≈—”«· Â–« «·ÿ·» ø", "‰⁄„", "·«");
            if (!confirm)
            {
                return; // ≈–« «Œ «— «·„” Œœ„ "·«"° Ì „ ≈·€«¡ «·≈—”«·
            }
            var requestDto = new ServiceRequestDto
            {

                RequestType = RequestTypePicker.SelectedItem?.ToString() ?? "No Type Selected",

                PhoneNumber = PhoneNumberEntry.Text,

                BuildingPermit = BuildingPermitEntry.Text
            };

            try
            {
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", _token); // ≈÷«›… «· Êﬂ‰ ≈·Ï «·ÂÌœ—

                var response = await _httpClient.PostAsJsonAsync("ServiceRequests/create", requestDto);

                if (response.IsSuccessStatusCode)
                {

                    //  ›—Ì€ «·ÕﬁÊ· »⁄œ «·≈—”«· «·‰«ÃÕ
                    RequestTypePicker.SelectedItem = null;
                    PhoneNumberEntry.Text = string.Empty;
                    BuildingPermitEntry.Text = string.Empty;

                    var popup = new SuccessPopup { Message = " „ ≈—”«· «·ÿ·» »‰Ã«Õ" };
                    this.ShowPopup(popup);

                    await Shell.Current.Navigation.PopToRootAsync();
                }
                else
                {
                    var errorMessage = await response.Content.ReadAsStringAsync();
                    await DisplayAlert("Error", $"Œÿ√ √À‰«¡ ≈—”«· «·ÿ·»: {errorMessage}", "OK");
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄: {ex.Message}", "OK");
            }

        }
    }

}
