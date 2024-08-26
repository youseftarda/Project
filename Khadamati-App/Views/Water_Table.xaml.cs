namespace Khadamati_App.Views;

public partial class Water_Table : ContentPage
{
	public Water_Table()
	{
		InitializeComponent();
    }
    //protected override void OnAppearing()
    //{
    //    base.OnAppearing();

      
    //    //var backArrowButton = new ImageButton
    //    //{
    //    //    Source = "fleche.jpg", // Make sure you have this image in your resources
    //    //    HorizontalOptions = LayoutOptions.Start,
    //    //    VerticalOptions = LayoutOptions.Start,
    //    //    WidthRequest=30,
    //    //    HeightRequest=30
    //    //};

    //    //// Set up the event handler for the button click
    //    //backArrowButton.Clicked += Fleche_Btn_Clicked;

    //    //// Add the button to the page's layout
    //    //// Assuming you have a Layout like StackLayout or Grid in your XAML with x:Name="layoutRoot"
    //    //layoutRoot.Children.Insert(0, backArrowButton); // Add the button at the beginning
    //}


    //private async void Back_Btn_Clicked(object sender, EventArgs e)
    //{
    //     await Navigation.PushAsync(new MainPage());
    //}

    private void ImageButton_Clicked(object sender, EventArgs e)
    {

    }

    //private async void Fleche_Btn_Clicked(object sender, EventArgs e)
    //{
    //    await Navigation.PopAsync();
    //}
}