
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
        private string? _token; // ����� �� ���� ��������

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
                await DisplayAlert("Error", "��� ����� ������ ������ �����", "OK");
                // ����� ����� �������� ��� ���� ����� ������
                await Navigation.PushAsync(new LogIn());
            }
        }

        private async void OnSendClicked(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(RequestTypePicker.SelectedItem?.ToString())||
                string.IsNullOrEmpty(PhoneNumberEntry.Text) ||
                string.IsNullOrEmpty(BuildingPermitEntry.Text))
            {
                await DisplayAlert("Error", "���� ��� ���� ������", "OK");
                return;
            }
            if (PhoneNumberEntry.Text.Length != 10 || !PhoneNumberEntry.Text.All(char.IsDigit))
            {
                await DisplayAlert("Error", "��� �� ���� ��� �������� �� 10 ����� �����.", "OK");
                return;
            }

            if (string.IsNullOrEmpty(_token)) // ������ �� ������ ��� �������
            {
                await DisplayAlert("Error", "��� ����� ������ ������ �����", "OK");
                await Navigation.PushAsync(new LogIn());
                return;
            }

            bool confirm = await DisplayAlert("�����", "�� ��� ����� �� ��� ���� ����� ��� ����� �", "���", "��");
            if (!confirm)
            {
                return; // ��� ����� �������� "��"� ��� ����� �������
            }
            var requestDto = new ServiceRequestDto
            {

                RequestType = RequestTypePicker.SelectedItem?.ToString() ?? "No Type Selected",

                PhoneNumber = PhoneNumberEntry.Text,

                BuildingPermit = BuildingPermitEntry.Text
            };

            try
            {
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", _token); // ����� ������ ��� ������

                var response = await _httpClient.PostAsJsonAsync("ServiceRequests/create", requestDto);

                if (response.IsSuccessStatusCode)
                {

                    // ����� ������ ��� ������� ������
                    RequestTypePicker.SelectedItem = null;
                    PhoneNumberEntry.Text = string.Empty;
                    BuildingPermitEntry.Text = string.Empty;

                    var popup = new SuccessPopup { Message = "�� ����� ����� �����" };
                    this.ShowPopup(popup);

                    await Shell.Current.Navigation.PopToRootAsync();
                }
                else
                {
                    var errorMessage = await response.Content.ReadAsStringAsync();
                    await DisplayAlert("Error", $"��� ����� ����� �����: {errorMessage}", "OK");
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"��� ��� ��� �����: {ex.Message}", "OK");
            }

        }
    }

}
