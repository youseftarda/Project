using System.Net.Http.Headers;
using System.Net.Http.Json;
using CommunityToolkit.Maui.Views;
using Khadamati_App.Models.Dto;


namespace Khadamati_App.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Complaint : ContentPage
    {
        private readonly HttpClient _httpClient;
        private string? _token; // «·Õﬁ· ·Â ﬁÌ„… «› —«÷Ì…

        public Complaint()
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
                await DisplayAlert("Error", "ÌÃ»  ”ÃÌ· «·œŒÊ· · ﬁœÌ„ ‘ﬂÊÏ", "OK");
                // ≈⁄«œ…  ÊÃÌÂ «·„” Œœ„ ≈·Ï ’›Õ…  ”ÃÌ· «·œŒÊ·
                await Navigation.PushAsync(new LogIn());
            }
        }

        private async void OnSendClicked(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ComplaintTypePicker.SelectedItem?.ToString()) ||
                string.IsNullOrEmpty(ComplaintDescriptionEntry.Text) ||
                string.IsNullOrEmpty(ComplaintLocationEntry.Text) ||
                string.IsNullOrEmpty(PhoneNumberEntry.Text))
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
                await DisplayAlert("Error", "ÌÃ»  ”ÃÌ· «·œŒÊ· · ﬁœÌ„ «·‘ﬂÊÏ", "OK");
                // ≈⁄«œ…  ÊÃÌÂ «·„” Œœ„ ≈·Ï ’›Õ…  ”ÃÌ· «·œŒÊ·
                await Navigation.PushAsync(new LogIn());
            }

            bool confirm = await DisplayAlert(" √ﬂÌœ", "Â· √‰  „ √ﬂœ „‰ √‰ﬂ  —Ìœ  ﬁœÌ„ Â–Â «·‘ﬂÊÏø", "‰⁄„", "·«");
            if (!confirm)
            {
                return; // ≈–« «Œ «— «·„” Œœ„ "·«"° Ì „ ≈·€«¡ «·≈—”«·
            }

            var complaint = new ComplaintDto
            {
                MobileNumber = PhoneNumberEntry.Text,
                ComplaintDetails = ComplaintDescriptionEntry.Text,
                ComplaintLocation = ComplaintLocationEntry.Text,
                TypeOfComplaint = ComplaintTypePicker.SelectedItem?.ToString() ?? "No Type Selected"
            };

            try
            {
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", _token);
                var response = await _httpClient.PostAsJsonAsync("Complaint/create", complaint);

                if (response.IsSuccessStatusCode)
                {
                    //  ›—Ì€ «·ÕﬁÊ· »⁄œ «·≈—”«· «·‰«ÃÕ
                    ComplaintTypePicker.SelectedItem = null;
                    ComplaintDescriptionEntry.Text = string.Empty;
                    ComplaintLocationEntry.Text = string.Empty;
                    PhoneNumberEntry.Text = string.Empty;

                    var popup = new SuccessPopup { Message = " „ ≈—”«· «·‘ﬂÊÏ »‰Ã«Õ" };
                    this.ShowPopup(popup);

                   
                    await Shell.Current.Navigation.PopToRootAsync();
                }
                else
                {
                    var errorMessage = await response.Content.ReadAsStringAsync();
                    await DisplayAlert("Error", $"Œÿ√ √À‰«¡ ≈—”«· «·‘ﬂÊÏ: {errorMessage}", "OK");
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄: {ex.Message}", "OK");
            }
        }
    }
}
