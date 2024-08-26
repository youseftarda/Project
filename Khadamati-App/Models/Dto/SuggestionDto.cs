using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Khadamati_App.Models.Dto
{
    class SuggestionDto
    {
        public string MobilePhoneNumber { get; set; } = string.Empty;
        public string Subject { get; set; } = string.Empty;
        public string SuggestionText { get; set; } = string.Empty;
    }
}
