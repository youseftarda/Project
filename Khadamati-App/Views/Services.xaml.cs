using System;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using Microsoft.Maui.Controls;
using Khadamati_App.Models;

namespace Khadamati_App.Views
{
    public partial class Services : ContentPage
    {
        

        public Services()
        {
            InitializeComponent();
            
        }

        private async void OnTapped_subscription(object sender, TappedEventArgs e)
        {
            await Navigation.PushAsync(new UnifiedSubscriptionPage());
        }

       

        private async void OnTapped_complaint(object sender, TappedEventArgs e)
        {
             await Navigation.PushAsync(new Complaint()); 
        }

      

        private async void OnTapped_suggestion(object sender, TappedEventArgs e)
        {
            await Navigation.PushAsync(new Suggestion());
        }
    }

   
}
