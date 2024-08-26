using System.ComponentModel;


namespace Khadamati_App
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class SuccessPopup : CommunityToolkit.Maui.Views.Popup, INotifyPropertyChanged
    {
        private string message;

        public string Message
        {
            get => message;
            set
            {
                if (message != value)
                {
                    message = value;
                    OnPropertyChanged(nameof(Message));
                }
            }
        }

        public SuccessPopup()
        {
            InitializeComponent();
            BindingContext = this;
            AutoClosePopup();
        }

        private async void AutoClosePopup()
        {
            await Task.Delay(1000); // «‰ Ÿ— ·„œ… 1 À«‰Ì…
            Close(); // √€·ﬁ «·‰«›–… «·„‰»Àﬁ…
        }
    }
}
