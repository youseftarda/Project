using System.Net.Http.Json;
using System.Net.Http;
using System.Text.RegularExpressions;
using Khadamati_App.Models;
using CommunityToolkit.Maui.Views;

namespace Khadamati_App
{
    public partial class SignUp : ContentPage
    {
        private readonly HttpClient _httpClient;

        public SignUp()
        {
            InitializeComponent();
            _httpClient = new HttpClient
            {
                BaseAddress = new Uri("http://10.0.2.2:31317/api/")
            };

            AddressPicker.SelectedIndexChanged += OnAddressSelected;
        }

        [Obsolete]
        private async void OnSubmitClicked(object sender, EventArgs e)
        {
            string fullName = FullName.Text;
            string nationalId = NationalIdNumber.Text;
            string primaryAddress = AddressPicker.SelectedItem?.ToString();
            string secondaryAddress = SecondaryAddressEntry.Text;

            string fullAddress = string.IsNullOrEmpty(secondaryAddress) ? primaryAddress : $"{primaryAddress}, {secondaryAddress}";
            string password = Password.Text;
            string confirmpassword = confirmPassword.Text;

            if (string.IsNullOrEmpty(fullName) || string.IsNullOrEmpty(nationalId) ||
                string.IsNullOrEmpty(primaryAddress) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(confirmpassword))
            {
                await DisplayAlert("Error", "Ã„Ì⁄ «·ÕﬁÊ· „ÿ·Ê»… »«” À‰«¡ «·⁄‰Ê«‰ «·À«‰ÊÌ.", "OK");
                return;
            }

            if (!IsPasswordValid(password))
            {
                await DisplayAlert("Error", "ÌÃ» √‰  Õ ÊÌ ﬂ·„… «·„—Ê— ⁄·Ï Õ—› ﬂ»Ì—° Õ—› ’€Ì— Ê—ﬁ„ Ê—„“ , Ê√‰ ·«  ﬁ· ⁄‰ 6 Õ—Ê›.", "OK");
                return;
            }

            if (password != confirmpassword)
            {
                await DisplayAlert("Error", "ﬂ·„… «·„—Ê— Ê √ﬂÌœ ﬂ·„… «·„—Ê— €Ì— „ ÿ«»ﬁÌ‰.", "OK");
                return;
            }

            var registerModel = new Register
            {
                FullName = fullName,
                NationalIdNumber = nationalId,
                Address = fullAddress,
                Password = password,
            };

            try
            {
                var response = await _httpClient.PostAsJsonAsync("Account/register", registerModel);

                if (response.IsSuccessStatusCode)
                {
                    //  ›—Ì€ «·ÕﬁÊ· »⁄œ «· ”ÃÌ· «·‰«ÃÕ
                    FullName.Text = string.Empty;
                    NationalIdNumber.Text = string.Empty;
                    AddressPicker.SelectedIndex = -1;
                    SecondaryAddressEntry.Text = string.Empty;
                    Password.Text = string.Empty;
                    confirmPassword.Text = string.Empty;

                    var popup = new SuccessPopup { Message = " „ «· ”ÃÌ· »‰Ã«Õ" };
                    this.ShowPopup(popup);

                   
                    //  ÊÃÌÂ «·„” Œœ„ ≈·Ï ’›Õ…  ”ÃÌ· «·œŒÊ· √Ê «·’›Õ… «·—∆Ì”Ì… »⁄œ «· ”ÃÌ·
                    await Navigation.PushAsync(new LogIn());
                }
                else
                {
                    var errorMessage = await response.Content.ReadAsStringAsync();
                    await DisplayAlert("Error", errorMessage, "OK");
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"ÕœÀ Œÿ√: {ex.Message}", "OK");
            }
        }

        private void OnAddressSelected(object sender, EventArgs e)
        {
            // ⁄—÷ Õﬁ· «·⁄‰Ê«‰ «·À«‰ÊÌ ⁄‰œ «Œ Ì«— «·⁄‰Ê«‰ «·—∆Ì”Ì
            if (AddressPicker.SelectedIndex != -1)
            {
                SecondaryAddressFrame.IsVisible = true;
            }
            else
            {
                SecondaryAddressFrame.IsVisible = false;
            }
        }

        private bool IsPasswordValid(string password)
        {
            var hasUpperCase = new Regex(@"[A-Z]+");
            var hasLowerCase = new Regex(@"[a-z]+");
            var hasDigits = new Regex(@"\d+");
            var hasMinimum6Chars = new Regex(@".{6,}");
            var hasSpecialChar = new Regex(@"[\W_]+");
            return hasUpperCase.IsMatch(password) && hasLowerCase.IsMatch(password) && hasDigits.IsMatch(password) && hasMinimum6Chars.IsMatch(password) && hasSpecialChar.IsMatch(password);
        }

        private async void TapGestureRecognizer_Tapped_For_SignIn(object sender, TappedEventArgs e)
        {
            await Navigation.PushAsync(new LogIn());
        }
    }
}
