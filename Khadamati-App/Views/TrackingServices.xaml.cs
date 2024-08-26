using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Collections.Generic;
using Microsoft.Maui.Controls;

namespace Khadamati_App.Views
{
    public partial class TrackingServices : ContentPage
    {
        private readonly HttpClient _httpClient;

        public TrackingServices()
        {
            InitializeComponent();
            _httpClient = new HttpClient
            {
                BaseAddress = new Uri("http://10.0.2.2:31317/api/") //  √ﬂœ „‰ «” Œœ«„ «·⁄‰Ê«‰ «·’ÕÌÕ ·‹ API
            };
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();

            var token = await SecureStorage.GetAsync("auth_token");

            if (string.IsNullOrEmpty(token))
            {
                await DisplayAlert("Error", "ÌÃ»  ”ÃÌ· «·œŒÊ· ·  »⁄ «·Œœ„« ", "OK");
                await Navigation.PushAsync(new LogIn());
                return;
            }

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            var response = await _httpClient.GetAsync("Complaint/GetUserComplaint"); //  ⁄œÌ· «·«”„ Õ”» «·‹ Endpoint ›Ì API
            var response2 = await _httpClient.GetAsync("ServiceRequests/GetUserRequest");
            if (response.IsSuccessStatusCode)
            {
                var services = await response.Content.ReadFromJsonAsync<List<ComplaintData>>();

                // Clear existing data in the collection view
                ServicesCollectionView.ItemsSource = null;

                // Bind the data to the collection view
                ServicesCollectionView.ItemsSource = services;
            }
            if (response2.IsSuccessStatusCode)
            {
                var services2 = await response2.Content.ReadFromJsonAsync<List<ServiceRequestData>>();

                // Clear existing data in the collection view
                ServicesCollectionView2.ItemsSource = null;

                // Bind the data to the collection view
                ServicesCollectionView2.ItemsSource = services2;
            }

        }
    }

    public class ComplaintData
    {
        public string ComplaintDetails { get; set; } = string.Empty;
        public string ComplaintLocation { get; set; } = string.Empty;
        public string MobileNumber { get; set; } = string.Empty;
        public string TypeOfComplaint { get; set; } = string.Empty;
        public Status Status { get; set; }
        public string StatusText => GetStatusText(); // Œ«’Ì…  ⁄—÷ «·‰’ «·⁄—»Ì ··Õ«·…
        public string? Nots { get; set; }
        public DateTime DateOfProcess { get; set; }

        private string GetStatusText()
        {
            return Status switch
            {
                Status.WaitToApprovl => "ﬁÌœ «·«‰ Ÿ«— ..",
                Status.InPrograsse => "ﬁÌœ «·„—«Ã⁄…",
                Status.Done => " „  «ﬂÌœ «·‘ﬂÊÏ",
                Status.Reject => " „ —›÷ «·‘ﬂÊÏ",
                _ => "€Ì— „⁄—Ê›"
            };
        }
    }


    public enum Status
    {
        WaitToApprovl,
        InPrograsse,
        Done,
        Reject
    }
    public class ServiceRequestData
    {

        public string RequestType { get; set; } = string.Empty;
        public string PhoneNumber { get; set; } = string.Empty;
        public string BuildingPermit { get; set; } = string.Empty;
        public Status Status { get; set; }
        public string StatusText => GetStatusText(); // Œ«’Ì…  ⁄—÷ «·‰’ «·⁄—»Ì ··Õ«·…
        public string? Nots { get; set; }
        public DateTime DateOfProcess { get; set; }
        private string GetStatusText()
        {
           
            return Status switch
            {
                Status.WaitToApprovl => "ﬁÌœ «·«‰ Ÿ«— ..",
                Status.InPrograsse => "ﬁÌœ «·„—«Ã⁄…",
                Status.Done => " „  «ﬂÌœ «·ÿ·»",
                Status.Reject => " „ —›÷ «·ÿ·»",
                _ => "€Ì— „⁄—Ê›"
            };
        }
    }

}
