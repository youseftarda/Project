namespace Khadamati_App.Views;

public partial class FlayoutMenu : ContentPage
{
	public FlayoutMenu()
	{
		InitializeComponent();
    }

    private async void OnButtonClicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new TrackingServices());
    }
}