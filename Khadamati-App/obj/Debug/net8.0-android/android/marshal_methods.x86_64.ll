; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [390 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [780 x i64] [
	i64 15690660930947125, ; 0: Microsoft.DotNet.PlatformAbstractions.dll => 0x37be92af148835 => 223
	i64 24362543149721218, ; 1: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 302
	i64 98382396393917666, ; 2: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 242
	i64 120698629574877762, ; 3: Mono.Android => 0x1accec39cafe242 => 171
	i64 131669012237370309, ; 4: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 252
	i64 160518225272466977, ; 5: Microsoft.Extensions.Hosting.Abstractions => 0x23a4679b5576e21 => 234
	i64 196720943101637631, ; 6: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 58
	i64 210515253464952879, ; 7: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 288
	i64 229794953483747371, ; 8: System.ValueTuple.dll => 0x330654aed93802b => 151
	i64 232391251801502327, ; 9: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 330
	i64 233177144301842968, ; 10: Xamarin.AndroidX.Collection.Jvm.dll => 0x33c696097d9f218 => 289
	i64 238698480785378387, ; 11: DotNetty.Transport => 0x3500700eba34c53 => 179
	i64 295915112840604065, ; 12: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 333
	i64 316157742385208084, ; 13: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 296
	i64 350667413455104241, ; 14: System.ServiceProcess.dll => 0x4ddd227954be8f1 => 132
	i64 374214195677100225, ; 15: Microsoft.CodeAnalysis.Razor => 0x53179d40b3df8c1 => 222
	i64 422779754995088667, ; 16: System.IO.UnmanagedMemoryStream => 0x5de03f27ab57d1b => 56
	i64 435118502366263740, ; 17: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 332
	i64 482535784737928357, ; 18: Microsoft.AspNetCore.Diagnostics.Abstractions.dll => 0x6b24fbd58b7f4a5 => 190
	i64 535107122908063503, ; 19: Microsoft.Extensions.ObjectPool.dll => 0x76d1517d9b7670f => 240
	i64 545109961164950392, ; 20: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 362
	i64 560278790331054453, ; 21: System.Reflection.Primitives => 0x7c6829760de3975 => 95
	i64 634256334200181332, ; 22: Microsoft.CodeAnalysis.CSharp.dll => 0x8cd54c6888b1254 => 221
	i64 634308326490598313, ; 23: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 315
	i64 649145001856603771, ; 24: System.Security.SecureString => 0x90239f09b62167b => 129
	i64 750875890346172408, ; 25: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 145
	i64 798450721097591769, ; 26: Xamarin.AndroidX.Collection.Ktx.dll => 0xb14aab351ad2bd9 => 290
	i64 799765834175365804, ; 27: System.ComponentModel.dll => 0xb1956c9f18442ac => 18
	i64 849051935479314978, ; 28: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 365
	i64 864641107619353643, ; 29: Microsoft.AspNetCore.Mvc.DataAnnotations => 0xbffd2819dda142b => 205
	i64 870603111519317375, ; 30: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 262
	i64 872800313462103108, ; 31: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 301
	i64 895210737996778430, ; 32: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0xc6c6d6c5569cbbe => 316
	i64 940822596282819491, ; 33: System.Transactions => 0xd0e792aa81923a3 => 150
	i64 960778385402502048, ; 34: System.Runtime.Handles.dll => 0xd555ed9e1ca1ba0 => 104
	i64 982068613551266738, ; 35: Microsoft.AspNetCore.ResponseCaching.Abstractions.dll => 0xda1023367c89bb2 => 216
	i64 1001381392624924420, ; 36: Microsoft.AspNetCore.Authentication.Core.dll => 0xde59f1230183704 => 183
	i64 1010599046655515943, ; 37: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 95
	i64 1120440138749646132, ; 38: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 345
	i64 1121665720830085036, ; 39: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 373
	i64 1268860745194512059, ; 40: System.Drawing.dll => 0x119be62002c19ebb => 36
	i64 1301485588176585670, ; 41: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 261
	i64 1301626418029409250, ; 42: System.Diagnostics.FileVersionInfo => 0x12104e54b4e833e2 => 28
	i64 1315114680217950157, ; 43: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 284
	i64 1369545283391376210, ; 44: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 323
	i64 1404195534211153682, ; 45: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 50
	i64 1425944114962822056, ; 46: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 115
	i64 1476839205573959279, ; 47: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 70
	i64 1486715745332614827, ; 48: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 249
	i64 1492954217099365037, ; 49: System.Net.HttpListener => 0x14b809f350210aad => 65
	i64 1507091876539346714, ; 50: Plugin.SimpleAudioPlayer.Abstractions => 0x14ea4413a9012f1a => 271
	i64 1513467482682125403, ; 51: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 170
	i64 1518315023656898250, ; 52: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 263
	i64 1537168428375924959, ; 53: System.Threading.Thread.dll => 0x15551e8a954ae0df => 145
	i64 1556147632182429976, ; 54: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 371
	i64 1576750169145655260, ; 55: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 344
	i64 1606660040657435043, ; 56: DotNetty.Handlers.dll => 0x164c00cb663379a3 => 178
	i64 1624659445732251991, ; 57: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 283
	i64 1628611045998245443, ; 58: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 319
	i64 1636321030536304333, ; 59: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 309
	i64 1639340239664632727, ; 60: Microsoft.AspNetCore.Cryptography.Internal.dll => 0x16c01b432b36d397 => 187
	i64 1651782184287836205, ; 61: System.Globalization.Calendars => 0x16ec4f2524cb982d => 40
	i64 1659332977923810219, ; 62: System.Reflection.DispatchProxy => 0x1707228d493d63ab => 89
	i64 1682513316613008342, ; 63: System.Net.dll => 0x17597cf276952bd6 => 81
	i64 1731380447121279447, ; 64: Newtonsoft.Json => 0x18071957e9b889d7 => 257
	i64 1735388228521408345, ; 65: System.Net.Mail.dll => 0x181556663c69b759 => 66
	i64 1743969030606105336, ; 66: System.Memory.dll => 0x1833d297e88f2af8 => 62
	i64 1767386781656293639, ; 67: System.Private.Uri.dll => 0x188704e9f5582107 => 86
	i64 1795316252682057001, ; 68: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 282
	i64 1825687700144851180, ; 69: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 106
	i64 1835311033149317475, ; 70: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 361
	i64 1836611346387731153, ; 71: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 330
	i64 1854145951182283680, ; 72: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 102
	i64 1875417405349196092, ; 73: System.Drawing.Primitives => 0x1a06d2319b6c713c => 35
	i64 1875917498431009007, ; 74: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 279
	i64 1881198190668717030, ; 75: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 383
	i64 1897575647115118287, ; 76: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 332
	i64 1920760634179481754, ; 77: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 250
	i64 1959996714666907089, ; 78: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 383
	i64 1972384582241139858, ; 79: Microsoft.CodeAnalysis.CSharp => 0x1b5f5153d0f0bc92 => 221
	i64 1972385128188460614, ; 80: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 119
	i64 1981742497975770890, ; 81: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 317
	i64 1983698669889758782, ; 82: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 357
	i64 2019660174692588140, ; 83: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 375
	i64 2040001226662520565, ; 84: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 142
	i64 2062890601515140263, ; 85: System.Threading.Tasks.Dataflow => 0x1ca0dc1289cd44a7 => 141
	i64 2080945842184875448, ; 86: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 53
	i64 2102659300918482391, ; 87: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 35
	i64 2106033277907880740, ; 88: System.Threading.Tasks.Dataflow.dll => 0x1d3a221ba6d9cb24 => 141
	i64 2133195048986300728, ; 89: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 257
	i64 2165310824878145998, ; 90: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 276
	i64 2165725771938924357, ; 91: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 286
	i64 2200176636225660136, ; 92: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 239
	i64 2203565783020068373, ; 93: Xamarin.KotlinX.Coroutines.Core => 0x1e94a367981dde15 => 353
	i64 2262844636196693701, ; 94: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 301
	i64 2269733267185212154, ; 95: Microsoft.AspNetCore.Html.Abstractions.dll => 0x1f7fb66185761afa => 193
	i64 2287834202362508563, ; 96: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 8
	i64 2287887973817120656, ; 97: System.ComponentModel.DataAnnotations.dll => 0x1fc035fd8d41f790 => 14
	i64 2302323944321350744, ; 98: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 379
	i64 2304837677853103545, ; 99: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 329
	i64 2315304989185124968, ; 100: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 51
	i64 2329709569556905518, ; 101: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 312
	i64 2335503487726329082, ; 102: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 136
	i64 2337758774805907496, ; 103: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 101
	i64 2364395629313652312, ; 104: Syncfusion.Maui.Expander.dll => 0x20d0054c39b9f658 => 266
	i64 2414730492268170344, ; 105: Microsoft.AspNetCore.Mvc.Localization.dll => 0x2182d896c3f2cc68 => 207
	i64 2470498323731680442, ; 106: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 294
	i64 2479423007379663237, ; 107: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 339
	i64 2497223385847772520, ; 108: System.Runtime => 0x22a7eb7046413568 => 116
	i64 2547086958574651984, ; 109: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 277
	i64 2592350477072141967, ; 110: System.Xml.dll => 0x23f9e10627330e8f => 163
	i64 2602673633151553063, ; 111: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 382
	i64 2612152650457191105, ; 112: Microsoft.IdentityModel.Tokens.dll => 0x24403afeed9892c1 => 247
	i64 2624866290265602282, ; 113: mscorlib.dll => 0x246d65fbde2db8ea => 166
	i64 2625416601812051405, ; 114: GalaSoft.MvvmLight.dll => 0x246f5a7d426ba5cd => 256
	i64 2632269733008246987, ; 115: System.Net.NameResolution => 0x2487b36034f808cb => 67
	i64 2656907746661064104, ; 116: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 228
	i64 2662981627730767622, ; 117: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 357
	i64 2706075432581334785, ; 118: System.Net.WebSockets => 0x258de944be6c0701 => 80
	i64 2783046991838674048, ; 119: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 101
	i64 2787234703088983483, ; 120: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 334
	i64 2789714023057451704, ; 121: Microsoft.IdentityModel.JsonWebTokens.dll => 0x26b70e1f9943eab8 => 245
	i64 2815524396660695947, ; 122: System.Security.AccessControl => 0x2712c0857f68238b => 117
	i64 2895129759130297543, ; 123: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 362
	i64 2923871038697555247, ; 124: Jsr305Binding => 0x2893ad37e69ec52f => 346
	i64 2974029546067041986, ; 125: Microsoft.AspNetCore.Mvc.Formatters.Json.dll => 0x2945e01d74d79ec2 => 206
	i64 3017136373564924869, ; 126: System.Net.WebProxy => 0x29df058bd93f63c5 => 78
	i64 3017704767998173186, ; 127: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 345
	i64 3021884968805928991, ; 128: Microsoft.AspNetCore.Authorization.Policy => 0x29efe45e55c5101f => 185
	i64 3106852385031680087, ; 129: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 114
	i64 3110390492489056344, ; 130: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 121
	i64 3135773902340015556, ; 131: System.IO.FileSystem.DriveInfo.dll => 0x2b8481c008eac5c4 => 48
	i64 3168817962471953758, ; 132: Microsoft.Extensions.Hosting.Abstractions.dll => 0x2bf9e725d304955e => 234
	i64 3168887168596639127, ; 133: Microsoft.AspNetCore.Mvc.Razor.Extensions.dll => 0x2bfa2617217efd97 => 209
	i64 3266690593535380875, ; 134: Microsoft.AspNetCore.Authorization => 0x2d559dc982c94d8b => 184
	i64 3281594302220646930, ; 135: System.Security.Principal => 0x2d8a90a198ceba12 => 128
	i64 3289520064315143713, ; 136: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 310
	i64 3303437397778967116, ; 137: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 280
	i64 3311221304742556517, ; 138: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 82
	i64 3325875462027654285, ; 139: System.Runtime.Numerics => 0x2e27e21c8958b48d => 110
	i64 3328853167529574890, ; 140: System.Net.Sockets.dll => 0x2e327651a008c1ea => 75
	i64 3344514922410554693, ; 141: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 354
	i64 3396143930648122816, ; 142: Microsoft.Extensions.FileProviders.Abstractions => 0x2f2186e9506155c0 => 231
	i64 3402534845034375023, ; 143: System.IdentityModel.Tokens.Jwt.dll => 0x2f383b6a0629a76f => 267
	i64 3429672777697402584, ; 144: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 252
	i64 3437845325506641314, ; 145: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 53
	i64 3493805808809882663, ; 146: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 336
	i64 3494946837667399002, ; 147: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 226
	i64 3508450208084372758, ; 148: System.Net.Ping => 0x30b084e02d03ad16 => 69
	i64 3522470458906976663, ; 149: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 335
	i64 3523004241079211829, ; 150: Microsoft.Extensions.Caching.Memory.dll => 0x30e439b10bb89735 => 225
	i64 3531994851595924923, ; 151: System.Numerics => 0x31042a9aade235bb => 83
	i64 3551103847008531295, ; 152: System.Private.CoreLib.dll => 0x31480e226177735f => 172
	i64 3567343442040498961, ; 153: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 377
	i64 3571415421602489686, ; 154: System.Runtime.dll => 0x319037675df7e556 => 116
	i64 3638003163729360188, ; 155: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 227
	i64 3647754201059316852, ; 156: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 156
	i64 3655542548057982301, ; 157: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 226
	i64 3659371656528649588, ; 158: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 274
	i64 3716579019761409177, ; 159: netstandard.dll => 0x3393f0ed5c8c5c99 => 167
	i64 3727469159507183293, ; 160: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 328
	i64 3772598417116884899, ; 161: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 302
	i64 3869221888984012293, ; 162: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 237
	i64 3869649043256705283, ; 163: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 32
	i64 3890352374528606784, ; 164: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 250
	i64 3919223565570527920, ; 165: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 122
	i64 3933965368022646939, ; 166: System.Net.Requests => 0x369840a8bfadc09b => 72
	i64 3966267475168208030, ; 167: System.Memory => 0x370b03412596249e => 62
	i64 4005135229510678782, ; 168: Microsoft.AspNetCore.DataProtection.Abstractions => 0x379519456862f8fe => 189
	i64 4006972109285359177, ; 169: System.Xml.XmlDocument => 0x379b9fe74ed9fe49 => 161
	i64 4009997192427317104, ; 170: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 113
	i64 4073500526318903918, ; 171: System.Private.Xml.dll => 0x3887fb25779ae26e => 88
	i64 4073631083018132676, ; 172: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 248
	i64 4120493066591692148, ; 173: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 388
	i64 4148881117810174540, ; 174: System.Runtime.InteropServices.JavaScript.dll => 0x3993c9651a66aa4c => 105
	i64 4154383907710350974, ; 175: System.ComponentModel => 0x39a7562737acb67e => 18
	i64 4167269041631776580, ; 176: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 146
	i64 4168469861834746866, ; 177: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 118
	i64 4187479170553454871, ; 178: System.Linq.Expressions => 0x3a1cea1e912fa117 => 58
	i64 4201423742386704971, ; 179: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 296
	i64 4202567570116092282, ; 180: Newtonsoft.Json.Bson => 0x3a5284f05958a17a => 258
	i64 4205801962323029395, ; 181: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 17
	i64 4225924121207573736, ; 182: Microsoft.AspNetCore.Authentication.Abstractions => 0x3aa57f992c550ce8 => 182
	i64 4235503420553921860, ; 183: System.IO.IsolatedStorage.dll => 0x3ac787eb9b118544 => 52
	i64 4243591448627561453, ; 184: Microsoft.AspNetCore.Http.Extensions.dll => 0x3ae443f06354c3ed => 196
	i64 4250192876909962317, ; 185: Microsoft.AspNetCore.Hosting.Abstractions => 0x3afbb7e72f1d244d => 191
	i64 4282138915307457788, ; 186: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 92
	i64 4297576817271644894, ; 187: DotNetty.Common.dll => 0x3ba40f58846e22de => 177
	i64 4337444564132831293, ; 188: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 260
	i64 4356591372459378815, ; 189: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 385
	i64 4373617458794931033, ; 190: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 55
	i64 4397634830160618470, ; 191: System.Security.SecureString.dll => 0x3d0789940f9be3e6 => 129
	i64 4431618353714093320, ; 192: Microsoft.AspNetCore.Antiforgery => 0x3d804569b93add08 => 181
	i64 4477672992252076438, ; 193: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 152
	i64 4484706122338676047, ; 194: System.Globalization.Extensions.dll => 0x3e3ce07510042d4f => 41
	i64 4533124835995628778, ; 195: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 92
	i64 4636684751163556186, ; 196: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 340
	i64 4672453897036726049, ; 197: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 50
	i64 4679594760078841447, ; 198: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 355
	i64 4716677666592453464, ; 199: System.Xml.XmlSerializer => 0x417501590542f358 => 162
	i64 4743821336939966868, ; 200: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 13
	i64 4759461199762736555, ; 201: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 314
	i64 4794310189461587505, ; 202: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 277
	i64 4795410492532947900, ; 203: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 335
	i64 4809057822547766521, ; 204: System.Drawing => 0x42bd349c3145ecf9 => 36
	i64 4814660307502931973, ; 205: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 67
	i64 4853321196694829351, ; 206: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 109
	i64 5055365687667823624, ; 207: Xamarin.AndroidX.Activity.Ktx.dll => 0x4628444ef7239408 => 278
	i64 5081566143765835342, ; 208: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 99
	i64 5095776370830346062, ; 209: Syncfusion.Maui.Expander => 0x46b7d59c562c074e => 266
	i64 5099468265966638712, ; 210: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 99
	i64 5103417709280584325, ; 211: System.Collections.Specialized => 0x46d2fb5e161b6285 => 11
	i64 5112836352847824253, ; 212: Microsoft.AspNetCore.WebUtilities.dll => 0x46f47192ee32c57d => 219
	i64 5177565741364132164, ; 213: Microsoft.AspNetCore.Http => 0x47da689c1f3db944 => 194
	i64 5182934613077526976, ; 214: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 11
	i64 5205316157927637098, ; 215: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 321
	i64 5223612245689175824, ; 216: Microsoft.AspNetCore.Mvc.Localization => 0x487dffa95caf0f10 => 207
	i64 5244375036463807528, ; 217: System.Diagnostics.Contracts.dll => 0x48c7c34f4d59fc28 => 25
	i64 5262971552273843408, ; 218: System.Security.Principal.dll => 0x4909d4be0c44c4d0 => 128
	i64 5278787618751394462, ; 219: System.Net.WebClient.dll => 0x4942055efc68329e => 76
	i64 5280980186044710147, ; 220: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x4949cf7fd7123d03 => 313
	i64 5290786973231294105, ; 221: System.Runtime.Loader => 0x496ca6b869b72699 => 109
	i64 5332349484191854038, ; 222: Syncfusion.Maui.Core.dll => 0x4a004f9a977e2dd6 => 265
	i64 5376510917114486089, ; 223: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 339
	i64 5408338804355907810, ; 224: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 337
	i64 5423376490970181369, ; 225: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 106
	i64 5440320908473006344, ; 226: Microsoft.VisualBasic.Core => 0x4b7fe70acda9f908 => 2
	i64 5446034149219586269, ; 227: System.Diagnostics.Debug => 0x4b94333452e150dd => 26
	i64 5451019430259338467, ; 228: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 292
	i64 5457765010617926378, ; 229: System.Xml.Serialization => 0x4bbde05c557002ea => 157
	i64 5471532531798518949, ; 230: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 381
	i64 5507995362134886206, ; 231: System.Core.dll => 0x4c705499688c873e => 21
	i64 5522859530602327440, ; 232: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 384
	i64 5527431512186326818, ; 233: System.IO.FileSystem.Primitives.dll => 0x4cb561acbc2a8f22 => 49
	i64 5570799893513421663, ; 234: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 43
	i64 5573260873512690141, ; 235: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 126
	i64 5574231584441077149, ; 236: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 281
	i64 5591791169662171124, ; 237: System.Linq.Parallel => 0x4d9a087135e137f4 => 59
	i64 5593115988096097561, ; 238: Microsoft.AspNetCore.Routing.dll => 0x4d9ebd5b8a069d19 => 217
	i64 5610815111739789596, ; 239: Microsoft.AspNetCore.Authentication.Core => 0x4ddd9e9de3a4d11c => 183
	i64 5650097808083101034, ; 240: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 119
	i64 5692067934154308417, ; 241: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 342
	i64 5724799082821825042, ; 242: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 305
	i64 5741990095351817038, ; 243: Microsoft.Extensions.Localization.Abstractions.dll => 0x4fafa591c141a34e => 236
	i64 5757522595884336624, ; 244: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 291
	i64 5783556987928984683, ; 245: Microsoft.VisualBasic => 0x504352701bbc3c6b => 3
	i64 5838482455892408505, ; 246: GalaSoft.MvvmLight.Platform => 0x510674dc2ad138b9 => 255
	i64 5896680224035167651, ; 247: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 311
	i64 5959344983920014087, ; 248: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x52b3d8b05c8ef307 => 331
	i64 5979151488806146654, ; 249: System.Formats.Asn1 => 0x52fa3699a489d25e => 38
	i64 5984759512290286505, ; 250: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 124
	i64 6068057819846744445, ; 251: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 378
	i64 6102788177522843259, ; 252: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0x54b1758374b3de7b => 331
	i64 6183170893902868313, ; 253: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 260
	i64 6200764641006662125, ; 254: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 378
	i64 6222399776351216807, ; 255: System.Text.Json.dll => 0x565a67a0ffe264a7 => 137
	i64 6251069312384999852, ; 256: System.Transactions.Local => 0x56c0426b870da1ac => 149
	i64 6278736998281604212, ; 257: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 85
	i64 6284145129771520194, ; 258: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 90
	i64 6319713645133255417, ; 259: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 315
	i64 6357457916754632952, ; 260: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 389
	i64 6401687960814735282, ; 261: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 312
	i64 6459596646370694080, ; 262: Microsoft.AspNetCore.JsonPatch.dll => 0x59a518eceb3ad3c0 => 198
	i64 6478287442656530074, ; 263: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 366
	i64 6504860066809920875, ; 264: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 286
	i64 6548213210057960872, ; 265: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 298
	i64 6557084851308642443, ; 266: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 343
	i64 6560151584539558821, ; 267: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 241
	i64 6589202984700901502, ; 268: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 348
	i64 6591971792923354531, ; 269: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x5b7b636b7e9765a3 => 313
	i64 6617685658146568858, ; 270: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 133
	i64 6702137467294796250, ; 271: Microsoft.AspNetCore.Mvc.Razor => 0x5d02c6845df149da => 208
	i64 6713440830605852118, ; 272: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 96
	i64 6739853162153639747, ; 273: Microsoft.VisualBasic.dll => 0x5d88c4bde075ff43 => 3
	i64 6743165466166707109, ; 274: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 374
	i64 6772837112740759457, ; 275: System.Runtime.InteropServices.JavaScript => 0x5dfdf378527ec7a1 => 105
	i64 6777482997383978746, ; 276: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 377
	i64 6786606130239981554, ; 277: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 33
	i64 6798329586179154312, ; 278: System.Windows => 0x5e5884bd523ca188 => 154
	i64 6814185388980153342, ; 279: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 158
	i64 6876862101832370452, ; 280: System.Xml.Linq => 0x5f6f85a57d108914 => 155
	i64 6894844156784520562, ; 281: System.Numerics.Vectors => 0x5faf683aead1ad72 => 82
	i64 6911788284027924527, ; 282: Microsoft.AspNetCore.Hosting.Server.Abstractions => 0x5feb9ad2f830f02f => 192
	i64 7011053663211085209, ; 283: Xamarin.AndroidX.Fragment.Ktx => 0x614c442918e5dd99 => 307
	i64 7060448593242414269, ; 284: System.Security.Cryptography.Xml => 0x61fbc096731edcbd => 269
	i64 7060896174307865760, ; 285: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 143
	i64 7083547580668757502, ; 286: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 87
	i64 7101497697220435230, ; 287: System.Configuration => 0x628d9687c0141d1e => 19
	i64 7103753931438454322, ; 288: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 308
	i64 7105430439328552570, ; 289: System.Security.Cryptography.Pkcs => 0x629b8f56a06d167a => 268
	i64 7112547816752919026, ; 290: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 51
	i64 7123594442286643413, ; 291: Microsoft.AspNetCore.Razor.Runtime => 0x62dc1767207138d5 => 215
	i64 7192745174564810625, ; 292: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 276
	i64 7220009545223068405, ; 293: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 381
	i64 7270811800166795866, ; 294: System.Linq => 0x64e71ccf51a90a5a => 61
	i64 7299370801165188114, ; 295: System.IO.Pipes.AccessControl.dll => 0x654c9311e74f3c12 => 54
	i64 7316205155833392065, ; 296: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 4
	i64 7331765743953618630, ; 297: Microsoft.AspNetCore.Http.dll => 0x65bfaa1948bba6c6 => 194
	i64 7338192458477945005, ; 298: System.Reflection => 0x65d67f295d0740ad => 97
	i64 7349431895026339542, ; 299: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 275
	i64 7377312882064240630, ; 300: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 17
	i64 7473077275758116397, ; 301: Microsoft.DotNet.PlatformAbstractions => 0x67b5b430309b3e2d => 223
	i64 7488575175965059935, ; 302: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 155
	i64 7489048572193775167, ; 303: System.ObjectModel => 0x67ee71ff6b419e3f => 84
	i64 7496222613193209122, ; 304: System.IdentityModel.Tokens.Jwt => 0x6807eec000a1b522 => 267
	i64 7592577537120840276, ; 305: System.Diagnostics.Process => 0x695e410af5b2aa54 => 29
	i64 7637303409920963731, ; 306: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 45
	i64 7654504624184590948, ; 307: System.Net.Http => 0x6a3a4366801b8264 => 64
	i64 7694700312542370399, ; 308: System.Net.Mail => 0x6ac9112a7e2cda5f => 66
	i64 7708790323521193081, ; 309: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 372
	i64 7714652370974252055, ; 310: System.Private.CoreLib => 0x6b0ff375198b9c17 => 172
	i64 7725404731275645577, ; 311: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x6b3626ac11ce9289 => 316
	i64 7735176074855944702, ; 312: Microsoft.CSharp => 0x6b58dda848e391fe => 1
	i64 7735352534559001595, ; 313: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 351
	i64 7791074099216502080, ; 314: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 47
	i64 7820441508502274321, ; 315: System.Data => 0x6c87ca1e14ff8111 => 24
	i64 7824823231109474690, ; 316: Microsoft.AspNetCore.Authorization.Policy.dll => 0x6c975b4560812982 => 185
	i64 7836164640616011524, ; 317: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 283
	i64 7972383140441761405, ; 318: Microsoft.Extensions.Caching.Abstractions.dll => 0x6ea3983a0b58267d => 224
	i64 8025517457475554965, ; 319: WindowsBase => 0x6f605d9b4786ce95 => 165
	i64 8031450141206250471, ; 320: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 108
	i64 8064050204834738623, ; 321: System.Collections.dll => 0x6fe942efa61731bf => 12
	i64 8083354569033831015, ; 322: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 310
	i64 8085230611270010360, ; 323: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 63
	i64 8087206902342787202, ; 324: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 27
	i64 8103644804370223335, ; 325: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 23
	i64 8113615946733131500, ; 326: System.Reflection.Extensions => 0x70995ab73cf916ec => 93
	i64 8138277578025671259, ; 327: Microsoft.AspNetCore.Cors => 0x70f0f856b9bf1a5b => 186
	i64 8167236081217502503, ; 328: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 168
	i64 8185542183669246576, ; 329: System.Collections => 0x7198e33f4794aa70 => 12
	i64 8187640529827139739, ; 330: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 352
	i64 8246048515196606205, ; 331: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 253
	i64 8264926008854159966, ; 332: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 29
	i64 8290740647658429042, ; 333: System.Runtime.Extensions => 0x730ea0b15c929a72 => 103
	i64 8318905602908530212, ; 334: System.ComponentModel.DataAnnotations => 0x7372b092055ea624 => 14
	i64 8342572048615572890, ; 335: Microsoft.AspNetCore.Cors.dll => 0x73c6c513ced5859a => 186
	i64 8368701292315763008, ; 336: System.Security.Cryptography => 0x7423997c6fd56140 => 126
	i64 8398329775253868912, ; 337: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 293
	i64 8399132193771933415, ; 338: Microsoft.Extensions.WebEncoders => 0x748fb63acf52cee7 => 243
	i64 8400357532724379117, ; 339: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 325
	i64 8410671156615598628, ; 340: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 91
	i64 8426919725312979251, ; 341: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 314
	i64 8473466935318901352, ; 342: DotNetty.Handlers => 0x7597cd4887b37268 => 178
	i64 8476857680833348370, ; 343: System.Security.Permissions.dll => 0x75a3d925fd9d0312 => 270
	i64 8518412311883997971, ; 344: System.Collections.Immutable => 0x76377add7c28e313 => 9
	i64 8519205576476231015, ; 345: Microsoft.AspNetCore.Mvc.Core.dll => 0x763a4c55ca648567 => 203
	i64 8537064613166331693, ; 346: Plugin.SimpleAudioPlayer.dll => 0x7679bf08cc56372d => 272
	i64 8563666267364444763, ; 347: System.Private.Uri => 0x76d841191140ca5b => 86
	i64 8598790081731763592, ; 348: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 304
	i64 8599632406834268464, ; 349: CommunityToolkit.Maui => 0x7758081c784b4930 => 173
	i64 8601935802264776013, ; 350: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 337
	i64 8611142787134128904, ; 351: Microsoft.AspNetCore.Hosting.Server.Abstractions.dll => 0x7780ecbdb94c0308 => 192
	i64 8614108721271900878, ; 352: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 376
	i64 8623059219396073920, ; 353: System.Net.Quic.dll => 0x77ab42ac514299c0 => 71
	i64 8626175481042262068, ; 354: Java.Interop => 0x77b654e585b55834 => 168
	i64 8638972117149407195, ; 355: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 1
	i64 8639588376636138208, ; 356: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 324
	i64 8648495978913578441, ; 357: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 5
	i64 8677882282824630478, ; 358: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 376
	i64 8684531736582871431, ; 359: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 44
	i64 8725526185868997716, ; 360: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 27
	i64 8879201933170698050, ; 361: Khadamati-App.dll => 0x7b39431d3b99e742 => 0
	i64 8886598895004054153, ; 362: Microsoft.AspNetCore.Mvc.Cors.dll => 0x7b538a9c9e187289 => 204
	i64 8893249077141143629, ; 363: Microsoft.AspNetCore.Mvc.ApiExplorer.dll => 0x7b6b2aeace11804d => 202
	i64 8902623738196561789, ; 364: DotNetty.Transport.dll => 0x7b8c791f2c2a8f7d => 179
	i64 8941376889969657626, ; 365: System.Xml.XDocument => 0x7c1626e87187471a => 158
	i64 8951477988056063522, ; 366: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 327
	i64 8954753533646919997, ; 367: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 112
	i64 9031035476476434958, ; 368: Xamarin.KotlinX.Coroutines.Core.dll => 0x7d54aeead9541a0e => 353
	i64 9045785047181495996, ; 369: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 386
	i64 9111603110219107042, ; 370: Microsoft.Extensions.Caching.Memory => 0x7e72eac0def44ae2 => 225
	i64 9138683372487561558, ; 371: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 121
	i64 9312692141327339315, ; 372: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 342
	i64 9324707631942237306, ; 373: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 282
	i64 9385861857747300476, ; 374: DotNetty.Buffers => 0x824147a195ea707c => 175
	i64 9413000421947348542, ; 375: Microsoft.AspNetCore.Hosting.Abstractions.dll => 0x82a1b202f4c6163e => 191
	i64 9427266486299436557, ; 376: Microsoft.IdentityModel.Logging.dll => 0x82d460ebe6d2a60d => 246
	i64 9468215723722196442, ; 377: System.Xml.XPath.XDocument.dll => 0x8365dc09353ac5da => 159
	i64 9554839972845591462, ; 378: System.ServiceModel.Web => 0x84999c54e32a1ba6 => 131
	i64 9575902398040817096, ; 379: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 347
	i64 9584643793929893533, ; 380: System.IO.dll => 0x85037ebfbbd7f69d => 57
	i64 9659729154652888475, ; 381: System.Text.RegularExpressions => 0x860e407c9991dd9b => 138
	i64 9662334977499516867, ; 382: System.Numerics.dll => 0x8617827802b0cfc3 => 83
	i64 9667360217193089419, ; 383: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 30
	i64 9678050649315576968, ; 384: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 294
	i64 9702891218465930390, ; 385: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 10
	i64 9780093022148426479, ; 386: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 344
	i64 9808709177481450983, ; 387: Mono.Android.dll => 0x881f890734e555e7 => 171
	i64 9825649861376906464, ; 388: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 291
	i64 9834056768316610435, ; 389: System.Transactions.dll => 0x8879968718899783 => 150
	i64 9836529246295212050, ; 390: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 94
	i64 9864374015518639636, ; 391: Microsoft.AspNetCore.Cryptography.Internal => 0x88e54be746950614 => 187
	i64 9907349773706910547, ; 392: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 304
	i64 9933555792566666578, ; 393: System.Linq.Queryable.dll => 0x89db145cf475c552 => 60
	i64 9938556199016768930, ; 394: Microsoft.AspNetCore.Routing => 0x89ecd834cea6a5a2 => 217
	i64 9956195530459977388, ; 395: Microsoft.Maui => 0x8a2b8315b36616ac => 251
	i64 9974604633896246661, ; 396: System.Xml.Serialization.dll => 0x8a6cea111a59dd85 => 157
	i64 9991543690424095600, ; 397: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 361
	i64 9994308163963284983, ; 398: Newtonsoft.Json.Bson.dll => 0x8ab2ea52b0d16df7 => 258
	i64 10017511394021241210, ; 399: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 239
	i64 10038780035334861115, ; 400: System.Net.Http.dll => 0x8b50e941206af13b => 64
	i64 10051358222726253779, ; 401: System.Private.Xml => 0x8b7d990c97ccccd3 => 88
	i64 10078727084704864206, ; 402: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 79
	i64 10089571585547156312, ; 403: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 47
	i64 10092835686693276772, ; 404: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 249
	i64 10105485790837105934, ; 405: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 143
	i64 10143853363526200146, ; 406: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 358
	i64 10229024438826829339, ; 407: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 298
	i64 10236703004850800690, ; 408: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 74
	i64 10243523786148452761, ; 409: Microsoft.AspNetCore.Http.Abstractions => 0x8e284e9c69a49999 => 195
	i64 10245369515835430794, ; 410: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 91
	i64 10303118382221642606, ; 411: Plugin.SimpleAudioPlayer.Abstractions.dll => 0x8efc0794931e4b6e => 271
	i64 10321854143672141184, ; 412: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 350
	i64 10357309525532190134, ; 413: Microsoft.AspNetCore.Mvc.RazorPages.dll => 0x8fbc8e235a1da5b6 => 210
	i64 10360651442923773544, ; 414: System.Text.Encoding => 0x8fc86d98211c1e68 => 135
	i64 10364469296367737616, ; 415: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 90
	i64 10376576884623852283, ; 416: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 336
	i64 10406448008575299332, ; 417: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 354
	i64 10430153318873392755, ; 418: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 295
	i64 10458986597687352396, ; 419: Microsoft.AspNetCore.Routing.Abstractions => 0x9125c8e581b9dc4c => 218
	i64 10506226065143327199, ; 420: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 356
	i64 10521980565667308266, ; 421: Microsoft.AspNetCore.Razor.dll => 0x920595939e29e2ea => 213
	i64 10546663366131771576, ; 422: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 112
	i64 10566960649245365243, ; 423: System.Globalization.dll => 0x92a562b96dcd13fb => 42
	i64 10595762989148858956, ; 424: System.Xml.XPath.XDocument => 0x930bb64cc472ea4c => 159
	i64 10670374202010151210, ; 425: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 4
	i64 10714184849103829812, ; 426: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 103
	i64 10785150219063592792, ; 427: System.Net.Primitives => 0x95ac8cfb68830758 => 70
	i64 10822644899632537592, ; 428: System.Linq.Queryable => 0x9631c23204ca5ff8 => 60
	i64 10830817578243619689, ; 429: System.Formats.Tar => 0x964ecb340a447b69 => 39
	i64 10847732767863316357, ; 430: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 284
	i64 10880838204485145808, ; 431: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 173
	i64 10899834349646441345, ; 432: System.Web => 0x9743fd975946eb81 => 153
	i64 10929237632997888614, ; 433: Microsoft.AspNetCore.Html.Abstractions => 0x97ac73b8bcab9266 => 193
	i64 10943875058216066601, ; 434: System.IO.UnmanagedMemoryStream.dll => 0x97e07461df39de29 => 56
	i64 10964653383833615866, ; 435: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 34
	i64 10972388274974066310, ; 436: Microsoft.AspNetCore.Razor.Language => 0x9845c1007b7d8686 => 214
	i64 11002576679268595294, ; 437: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 238
	i64 11009005086950030778, ; 438: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 251
	i64 11019817191295005410, ; 439: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 281
	i64 11023048688141570732, ; 440: System.Core => 0x98f9bc61168392ac => 21
	i64 11037814507248023548, ; 441: System.Xml => 0x992e31d0412bf7fc => 163
	i64 11050168729868392624, ; 442: Microsoft.AspNetCore.Http.Features => 0x995a15e9dbef58b0 => 197
	i64 11051904132540108364, ; 443: Microsoft.Extensions.FileProviders.Composite.dll => 0x99604040c7b98e4c => 232
	i64 11071824625609515081, ; 444: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 348
	i64 11103970607964515343, ; 445: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 367
	i64 11136029745144976707, ; 446: Jsr305Binding.dll => 0x9a8b200d4f8cd543 => 346
	i64 11162124722117608902, ; 447: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 341
	i64 11188319605227840848, ; 448: System.Threading.Overlapped => 0x9b44e5671724e550 => 140
	i64 11220793807500858938, ; 449: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 370
	i64 11226290749488709958, ; 450: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 241
	i64 11235648312900863002, ; 451: System.Reflection.DispatchProxy.dll => 0x9bed0a9c8fac441a => 89
	i64 11279616943328429297, ; 452: DotNetty.Buffers.dll => 0x9c893fd9159184f1 => 175
	i64 11292872538489367807, ; 453: DotNetty.Common => 0x9cb857bdd66c2cff => 177
	i64 11299661109949763898, ; 454: Xamarin.AndroidX.Collection.Jvm => 0x9cd075e94cda113a => 289
	i64 11329751333533450475, ; 455: System.Threading.Timer.dll => 0x9d3b5ccf6cc500eb => 147
	i64 11340910727871153756, ; 456: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 297
	i64 11347436699239206956, ; 457: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 162
	i64 11392833485892708388, ; 458: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 326
	i64 11432101114902388181, ; 459: System.AppContext => 0x9ea6fb64e61a9dd5 => 6
	i64 11446671985764974897, ; 460: Mono.Android.Export => 0x9edabf8623efc131 => 169
	i64 11448276831755070604, ; 461: System.Diagnostics.TextWriterTraceListener => 0x9ee0731f77186c8c => 31
	i64 11485890710487134646, ; 462: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 107
	i64 11508496261504176197, ; 463: Xamarin.AndroidX.Fragment.Ktx.dll => 0x9fb664600dde1045 => 307
	i64 11517440453979132662, ; 464: Microsoft.IdentityModel.Abstractions.dll => 0x9fd62b122523d2f6 => 244
	i64 11518296021396496455, ; 465: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 368
	i64 11529969570048099689, ; 466: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 341
	i64 11530571088791430846, ; 467: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 237
	i64 11564861549255168062, ; 468: Microsoft.CodeAnalysis.dll => 0xa07ea44e47ed903e => 220
	i64 11580057168383206117, ; 469: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 279
	i64 11591352189662810718, ; 470: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 334
	i64 11597940890313164233, ; 471: netstandard => 0xa0f429ca8d1805c9 => 167
	i64 11672361001936329215, ; 472: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 308
	i64 11692977985522001935, ; 473: System.Threading.Overlapped.dll => 0xa245cd869980680f => 140
	i64 11705530742807338875, ; 474: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 364
	i64 11707554492040141440, ; 475: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 59
	i64 11739066727115742305, ; 476: SQLite-net.dll => 0xa2e98afdf8575c61 => 259
	i64 11743665907891708234, ; 477: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 144
	i64 11806260347154423189, ; 478: SQLite-net => 0xa3d8433bc5eb5d95 => 259
	i64 11868746509924019608, ; 479: Microsoft.AspNetCore.Mvc.ApiExplorer => 0xa4b64211452dad98 => 202
	i64 11991047634523762324, ; 480: System.Net => 0xa668c24ad493ae94 => 81
	i64 12040886584167504988, ; 481: System.Net.ServicePoint => 0xa719d28d8e121c5c => 74
	i64 12058074296353848905, ; 482: Microsoft.Extensions.FileSystemGlobbing.dll => 0xa756e2afa5707e49 => 233
	i64 12063623837170009990, ; 483: System.Security => 0xa76a99f6ce740786 => 130
	i64 12096697103934194533, ; 484: System.Diagnostics.Contracts => 0xa7e019eccb7e8365 => 25
	i64 12102847907131387746, ; 485: System.Buffers => 0xa7f5f40c43256f62 => 7
	i64 12123043025855404482, ; 486: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 93
	i64 12137774235383566651, ; 487: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 338
	i64 12145679461940342714, ; 488: System.Text.Json => 0xa88e1f1ebcb62fba => 137
	i64 12182153051801469180, ; 489: Khadamati-App => 0xa90fb3a8241140fc => 0
	i64 12191646537372739477, ; 490: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 273
	i64 12201331334810686224, ; 491: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 113
	i64 12269460666702402136, ; 492: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 9
	i64 12279246230491828964, ; 493: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 263
	i64 12310909314810916455, ; 494: Microsoft.Extensions.Localization.dll => 0xaad922cbbb5a2e67 => 235
	i64 12332222936682028543, ; 495: System.Runtime.Handles => 0xab24db6c07db5dff => 104
	i64 12341818387765915815, ; 496: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 174
	i64 12375446203996702057, ; 497: System.Configuration.dll => 0xabbe6ac12e2e0569 => 19
	i64 12439275739440478309, ; 498: Microsoft.IdentityModel.JsonWebTokens => 0xaca12f61007bf865 => 245
	i64 12441092376399691269, ; 499: Microsoft.AspNetCore.Authentication.Abstractions.dll => 0xaca7a399c11fbe05 => 182
	i64 12449521524599790614, ; 500: Microsoft.AspNetCore.Mvc.dll => 0xacc595ddc1599c16 => 200
	i64 12451044538927396471, ; 501: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 306
	i64 12466513435562512481, ; 502: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 320
	i64 12475113361194491050, ; 503: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 389
	i64 12487638416075308985, ; 504: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 300
	i64 12517810545449516888, ; 505: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 33
	i64 12538491095302438457, ; 506: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 287
	i64 12550732019250633519, ; 507: System.IO.Compression => 0xae2d28465e8e1b2f => 46
	i64 12681088699309157496, ; 508: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 369
	i64 12699999919562409296, ; 509: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 30
	i64 12700543734426720211, ; 510: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 288
	i64 12708238894395270091, ; 511: System.IO => 0xb05cbbf17d3ba3cb => 57
	i64 12708922737231849740, ; 512: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 134
	i64 12717050818822477433, ; 513: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 114
	i64 12742166704152928552, ; 514: Microsoft.CodeAnalysis.Razor.dll => 0xb0d5451b45d86128 => 222
	i64 12753841065332862057, ; 515: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 343
	i64 12823819093633476069, ; 516: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 382
	i64 12835242264250840079, ; 517: System.IO.Pipes => 0xb21ff0d5d6c0740f => 55
	i64 12843321153144804894, ; 518: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 242
	i64 12843770487262409629, ; 519: System.AppContext.dll => 0xb23e3d357debf39d => 6
	i64 12859557719246324186, ; 520: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 77
	i64 12982280885948128408, ; 521: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 299
	i64 12991459499837607210, ; 522: Microsoft.CodeAnalysis => 0xb44aef9559b1cd2a => 220
	i64 13068258254871114833, ; 523: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 111
	i64 13070736518021853291, ; 524: Microsoft.AspNetCore.JsonPatch => 0xb564959c856b306b => 198
	i64 13086625805112021739, ; 525: Microsoft.AspNetCore.DataProtection.Abstractions.dll => 0xb59d08d5762992eb => 189
	i64 13122923747915422861, ; 526: Microsoft.AspNetCore.Localization => 0xb61dfd9ed9095c8d => 199
	i64 13129914918964716986, ; 527: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 303
	i64 13162471042547327635, ; 528: System.Security.Permissions => 0xb6aa7dace9662293 => 270
	i64 13173818576982874404, ; 529: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 102
	i64 13185305731832515997, ; 530: GalaSoft.MvvmLight.Platform.dll => 0xb6fb9db450cc8d9d => 255
	i64 13221551921002590604, ; 531: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 356
	i64 13222659110913276082, ; 532: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 370
	i64 13308002692117796025, ; 533: Microsoft.AspNetCore.Routing.Abstractions.dll => 0xb8af85f08d9f94b9 => 218
	i64 13343850469010654401, ; 534: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 170
	i64 13370592475155966277, ; 535: System.Runtime.Serialization => 0xb98de304062ea945 => 115
	i64 13381594904270902445, ; 536: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 364
	i64 13401370062847626945, ; 537: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 338
	i64 13404347523447273790, ; 538: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 293
	i64 13404984788036896679, ; 539: Microsoft.AspNetCore.Http.Abstractions.dll => 0xba0812a45e7447a7 => 195
	i64 13431476299110033919, ; 540: System.Net.WebClient => 0xba663087f18829ff => 76
	i64 13454009404024712428, ; 541: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 349
	i64 13463706743370286408, ; 542: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 85
	i64 13465488254036897740, ; 543: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 351
	i64 13467053111158216594, ; 544: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 384
	i64 13491513212026656886, ; 545: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 285
	i64 13540124433173649601, ; 546: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 385
	i64 13545416393490209236, ; 547: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 368
	i64 13550417756503177631, ; 548: Microsoft.Extensions.FileProviders.Abstractions.dll => 0xbc0cc1280684799f => 231
	i64 13572454107664307259, ; 549: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 328
	i64 13578472628727169633, ; 550: System.Xml.XPath => 0xbc706ce9fba5c261 => 160
	i64 13580399111273692417, ; 551: Microsoft.VisualBasic.Core.dll => 0xbc77450a277fbd01 => 2
	i64 13618112415141049676, ; 552: Microsoft.AspNetCore.Mvc.Core => 0xbcfd4116f7d1b54c => 203
	i64 13621154251410165619, ; 553: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 299
	i64 13637569584472253285, ; 554: Microsoft.AspNetCore.Mvc => 0xbd4261483a23e365 => 200
	i64 13647894001087880694, ; 555: System.Data.dll => 0xbd670f48cb071df6 => 24
	i64 13675589307506966157, ; 556: Xamarin.AndroidX.Activity.Ktx => 0xbdc97404d0153e8d => 278
	i64 13702626353344114072, ; 557: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 32
	i64 13710614125866346983, ; 558: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 117
	i64 13713329104121190199, ; 559: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 37
	i64 13717397318615465333, ; 560: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 16
	i64 13755568601956062840, ; 561: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 363
	i64 13768883594457632599, ; 562: System.IO.IsolatedStorage => 0xbf14e6adb159cf57 => 52
	i64 13814445057219246765, ; 563: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 366
	i64 13881769479078963060, ; 564: System.Console.dll => 0xc0a5f3cade5c6774 => 20
	i64 13911222732217019342, ; 565: System.Security.Cryptography.OpenSsl.dll => 0xc10e975ec1226bce => 123
	i64 13921917134693230900, ; 566: Microsoft.AspNetCore.WebUtilities => 0xc13495df5dd06934 => 219
	i64 13928444506500929300, ; 567: System.Windows.dll => 0xc14bc67b8bba9714 => 154
	i64 13939962644205322370, ; 568: Microsoft.AspNetCore.Razor.Language.dll => 0xc174b22af612c082 => 214
	i64 13955418299340266673, ; 569: Microsoft.Extensions.DependencyModel.dll => 0xc1ab9b0118299cb1 => 230
	i64 13959074834287824816, ; 570: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 306
	i64 13964766427641771713, ; 571: DotNetty.Codecs.dll => 0xc1ccd113d2e376c1 => 176
	i64 13970307180132182141, ; 572: Syncfusion.Licensing => 0xc1e0805ccade287d => 264
	i64 14075334701871371868, ; 573: System.ServiceModel.Web.dll => 0xc355a25647c5965c => 131
	i64 14100563506285742564, ; 574: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 358
	i64 14124974489674258913, ; 575: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 287
	i64 14125464355221830302, ; 576: System.Threading.dll => 0xc407bafdbc707a9e => 148
	i64 14178052285788134900, ; 577: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 274
	i64 14199657271608119382, ; 578: Microsoft.AspNetCore.Localization.dll => 0xc50f510e367e9056 => 199
	i64 14212104595480609394, ; 579: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 120
	i64 14220608275227875801, ; 580: System.Diagnostics.FileVersionInfo.dll => 0xc559bfe1def019d9 => 28
	i64 14226382999226559092, ; 581: System.ServiceProcess => 0xc56e43f6938e2a74 => 132
	i64 14232023429000439693, ; 582: System.Resources.Writer.dll => 0xc5824de7789ba78d => 100
	i64 14254574811015963973, ; 583: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 134
	i64 14261073672896646636, ; 584: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 326
	i64 14261232074598307362, ; 585: Microsoft.AspNetCore.Mvc.Abstractions => 0xc5ea130339d6d622 => 201
	i64 14298246716367104064, ; 586: System.Web.dll => 0xc66d93a217f4e840 => 153
	i64 14327695147300244862, ; 587: System.Reflection.dll => 0xc6d632d338eb4d7e => 97
	i64 14327709162229390963, ; 588: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 125
	i64 14331727281556788554, ; 589: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 275
	i64 14346402571976470310, ; 590: System.Net.Ping.dll => 0xc718a920f3686f26 => 69
	i64 14461014870687870182, ; 591: System.Net.Requests.dll => 0xc8afd8683afdece6 => 72
	i64 14464374589798375073, ; 592: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 379
	i64 14486659737292545672, ; 593: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 311
	i64 14495724990987328804, ; 594: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 329
	i64 14522721392235705434, ; 595: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 360
	i64 14528548208938697926, ; 596: Microsoft.AspNetCore.Mvc.Abstractions.dll => 0xc99fc59ed7edc4c6 => 201
	i64 14538127318538747197, ; 597: Syncfusion.Licensing.dll => 0xc9c1cdc518e77d3d => 264
	i64 14551742072151931844, ; 598: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 136
	i64 14556034074661724008, ; 599: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 174
	i64 14561513370130550166, ; 600: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 124
	i64 14569958227297576184, ; 601: Microsoft.AspNetCore.Mvc.Razor.Extensions => 0xca32e3d0125a24f8 => 209
	i64 14574160591280636898, ; 602: System.Net.Quic => 0xca41d1d72ec783e2 => 71
	i64 14622043554576106986, ; 603: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 111
	i64 14644440854989303794, ; 604: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 321
	i64 14669215534098758659, ; 605: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 228
	i64 14690985099581930927, ; 606: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 152
	i64 14693486184709846151, ; 607: Plugin.SimpleAudioPlayer => 0xcbe9bfd5e7bd7487 => 272
	i64 14705122255218365489, ; 608: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 371
	i64 14711489710198462279, ; 609: Microsoft.AspNetCore.Mvc.ViewFeatures.dll => 0xcc29b5f255319747 => 212
	i64 14744092281598614090, ; 610: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 387
	i64 14792063746108907174, ; 611: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 349
	i64 14832630590065248058, ; 612: System.Security.Claims => 0xcdd816ef5d6e873a => 118
	i64 14835122486566269605, ; 613: Microsoft.AspNetCore.Mvc.TagHelpers.dll => 0xcde0f14d3b3132a5 => 211
	i64 14852515768018889994, ; 614: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 297
	i64 14889905118082851278, ; 615: GoogleGson.dll => 0xcea391d0969961ce => 180
	i64 14892012299694389861, ; 616: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 388
	i64 14904040806490515477, ; 617: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 355
	i64 14912225920358050525, ; 618: System.Security.Principal.Windows => 0xcef2de7759506add => 127
	i64 14935719434541007538, ; 619: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 133
	i64 14954917835170835695, ; 620: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 229
	i64 14984936317414011727, ; 621: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 77
	i64 14987728460634540364, ; 622: System.IO.Compression.dll => 0xcfff1ba06622494c => 46
	i64 14988210264188246988, ; 623: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 300
	i64 14997925763760621062, ; 624: Microsoft.AspNetCore.Razor.Runtime.dll => 0xd02356050ca18606 => 215
	i64 15015154896917945444, ; 625: System.Net.Security.dll => 0xd0608bd33642dc64 => 73
	i64 15024878362326791334, ; 626: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 63
	i64 15071021337266399595, ; 627: System.Resources.Reader.dll => 0xd127060e7a18a96b => 98
	i64 15076659072870671916, ; 628: System.ObjectModel.dll => 0xd13b0d8c1620662c => 84
	i64 15111608613780139878, ; 629: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 372
	i64 15115185479366240210, ; 630: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 43
	i64 15133485256822086103, ; 631: System.Linq.dll => 0xd204f0a9127dd9d7 => 61
	i64 15138356091203993725, ; 632: Microsoft.IdentityModel.Abstractions => 0xd2163ea89395c07d => 244
	i64 15150743910298169673, ; 633: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 327
	i64 15188318564056798176, ; 634: Microsoft.AspNetCore.Mvc.TagHelpers => 0xd2c7bf434a1393e0 => 211
	i64 15227001540531775957, ; 635: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 227
	i64 15234786388537674379, ; 636: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 37
	i64 15250465174479574862, ; 637: System.Globalization.Calendars.dll => 0xd3a489469852174e => 40
	i64 15272359115529052076, ; 638: Xamarin.AndroidX.Collection.Ktx => 0xd3f251b2fb4edfac => 290
	i64 15279429628684179188, ; 639: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 352
	i64 15299439993936780255, ; 640: System.Xml.XPath.dll => 0xd452879d55019bdf => 160
	i64 15332518387094693223, ; 641: Microsoft.AspNetCore.Mvc.DataAnnotations.dll => 0xd4c80c3ce6eca567 => 205
	i64 15338463749992804988, ; 642: System.Resources.Reader => 0xd4dd2b839286f27c => 98
	i64 15370028218478381000, ; 643: Microsoft.Extensions.Localization.Abstractions => 0xd54d4f3b162247c8 => 236
	i64 15370334346939861994, ; 644: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 295
	i64 15391712275433856905, ; 645: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 229
	i64 15481710163200268842, ; 646: Microsoft.Extensions.FileProviders.Composite => 0xd6da155e291b5a2a => 232
	i64 15526743539506359484, ; 647: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 135
	i64 15527772828719725935, ; 648: System.Console => 0xd77dbb1e38cd3d6f => 20
	i64 15530465045505749832, ; 649: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 65
	i64 15536481058354060254, ; 650: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 359
	i64 15541854775306130054, ; 651: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 125
	i64 15557562860424774966, ; 652: System.Net.Sockets => 0xd7e790fe7a6dc536 => 75
	i64 15565247197164990907, ; 653: Microsoft.AspNetCore.Http.Extensions => 0xd802dddb8c29f1bb => 196
	i64 15582737692548360875, ; 654: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 319
	i64 15592226634512578529, ; 655: Microsoft.AspNetCore.Authorization.dll => 0xd862b7834f81b7e1 => 184
	i64 15609085926864131306, ; 656: System.dll => 0xd89e9cf3334914ea => 164
	i64 15620595871140898079, ; 657: Microsoft.Extensions.DependencyModel => 0xd8c7812eef49651f => 230
	i64 15637608551555227372, ; 658: Microsoft.AspNetCore.Mvc.Razor.dll => 0xd903f220440f5eec => 208
	i64 15661133872274321916, ; 659: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 156
	i64 15664356999916475676, ; 660: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 359
	i64 15710114879900314733, ; 661: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 5
	i64 15735700225633954557, ; 662: Microsoft.Extensions.Localization => 0xda606ffbe0f22afd => 235
	i64 15743187114543869802, ; 663: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 367
	i64 15745825835632158716, ; 664: Syncfusion.Maui.Core => 0xda84692c2c05e7fc => 265
	i64 15755368083429170162, ; 665: System.IO.FileSystem.Primitives => 0xdaa64fcbde529bf2 => 49
	i64 15777549416145007739, ; 666: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 333
	i64 15783653065526199428, ; 667: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 360
	i64 15817206913877585035, ; 668: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 144
	i64 15847085070278954535, ; 669: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 139
	i64 15852824340364052161, ; 670: Microsoft.AspNetCore.Http.Features.dll => 0xdc008bbee610c6c1 => 197
	i64 15865669146576290041, ; 671: DotNetty.Codecs => 0xdc2e2e07658e00f9 => 176
	i64 15885744048853936810, ; 672: System.Resources.Writer => 0xdc75800bd0b6eaaa => 100
	i64 15928521404965645318, ; 673: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 248
	i64 15934062614519587357, ; 674: System.Security.Cryptography.OpenSsl => 0xdd2129868f45a21d => 123
	i64 15937190497610202713, ; 675: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 120
	i64 15963349826457351533, ; 676: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 142
	i64 15971679995444160383, ; 677: System.Formats.Tar.dll => 0xdda6ce5592a9677f => 39
	i64 16018552496348375205, ; 678: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 68
	i64 16027684189145026053, ; 679: Microsoft.AspNetCore.DataProtection => 0xde6dc5da0a224e05 => 188
	i64 16046481083542319511, ; 680: Microsoft.Extensions.ObjectPool => 0xdeb08d870f90b197 => 240
	i64 16054465462676478687, ; 681: System.Globalization.Extensions => 0xdecceb47319bdadf => 41
	i64 16153500642854367575, ; 682: Microsoft.Extensions.WebEncoders.dll => 0xe02cc33ff060f157 => 243
	i64 16154507427712707110, ; 683: System => 0xe03056ea4e39aa26 => 164
	i64 16219561732052121626, ; 684: System.Net.Security => 0xe1177575db7c781a => 73
	i64 16288847719894691167, ; 685: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 373
	i64 16315482530584035869, ; 686: WindowsBase.dll => 0xe26c3ceb1e8d821d => 165
	i64 16321164108206115771, ; 687: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 238
	i64 16337011941688632206, ; 688: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 127
	i64 16344871930018146979, ; 689: Microsoft.AspNetCore.ResponseCaching.Abstractions => 0xe2d4a66be7fc2aa3 => 216
	i64 16361933716545543812, ; 690: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 305
	i64 16454459195343277943, ; 691: System.Net.NetworkInformation => 0xe459fb756d988f77 => 68
	i64 16496768397145114574, ; 692: Mono.Android.Export.dll => 0xe4f04b741db987ce => 169
	i64 16523284800709429098, ; 693: Microsoft.AspNetCore.DataProtection.dll => 0xe54e7ffb6ce5876a => 188
	i64 16586971685355653868, ; 694: Microsoft.AspNetCore.Mvc.RazorPages => 0xe630c2ddc5160aec => 210
	i64 16589693266713801121, ; 695: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xe63a6e214f2a71a1 => 318
	i64 16621146507174665210, ; 696: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 292
	i64 16649148416072044166, ; 697: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 253
	i64 16677317093839702854, ; 698: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 325
	i64 16702652415771857902, ; 699: System.ValueTuple => 0xe7cbbde0b0e6d3ee => 151
	i64 16709499819875633724, ; 700: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 45
	i64 16737807731308835127, ; 701: System.Runtime.Intrinsics => 0xe848a3736f733137 => 108
	i64 16755018182064898362, ; 702: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 261
	i64 16758309481308491337, ; 703: System.IO.FileSystem.DriveInfo => 0xe89179af15740e49 => 48
	i64 16762783179241323229, ; 704: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 96
	i64 16765015072123548030, ; 705: System.Diagnostics.TextWriterTraceListener.dll => 0xe8a94c621bfe717e => 31
	i64 16793451114543296636, ; 706: Microsoft.AspNetCore.Mvc.ViewFeatures => 0xe90e52d02b3db07c => 212
	i64 16822611501064131242, ; 707: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 23
	i64 16833383113903931215, ; 708: mscorlib => 0xe99c30c1484d7f4f => 166
	i64 16856067890322379635, ; 709: System.Data.Common.dll => 0xe9ecc87060889373 => 22
	i64 16890310621557459193, ; 710: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 138
	i64 16933958494752847024, ; 711: System.Net.WebProxy.dll => 0xeb018187f0f3b4b0 => 78
	i64 16942731696432749159, ; 712: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 380
	i64 16977952268158210142, ; 713: System.IO.Pipes.AccessControl => 0xeb9dcda2851b905e => 54
	i64 16989020923549080504, ; 714: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xebc52084add25bb8 => 318
	i64 16998075588627545693, ; 715: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 323
	i64 17008137082415910100, ; 716: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 10
	i64 17024911836938395553, ; 717: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 280
	i64 17031351772568316411, ; 718: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 322
	i64 17037200463775726619, ; 719: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 309
	i64 17047637518392099970, ; 720: Microsoft.AspNetCore.Antiforgery.dll => 0xec9560002f620482 => 181
	i64 17062143951396181894, ; 721: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 16
	i64 17089008752050867324, ; 722: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 387
	i64 17118171214553292978, ; 723: System.Threading.Channels => 0xed8ff6060fc420b2 => 139
	i64 17126545051278881272, ; 724: Microsoft.Net.Http.Headers.dll => 0xedadb5fbdb33b1f8 => 254
	i64 17137864900836977098, ; 725: Microsoft.IdentityModel.Tokens => 0xedd5ed53b705e9ca => 247
	i64 17187273293601214786, ; 726: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 13
	i64 17201328579425343169, ; 727: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 15
	i64 17202182880784296190, ; 728: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 122
	i64 17205988430934219272, ; 729: Microsoft.Extensions.FileSystemGlobbing => 0xeec7f35113509a08 => 233
	i64 17230721278011714856, ; 730: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 87
	i64 17234219099804750107, ; 731: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 149
	i64 17260702271250283638, ; 732: System.Data.Common => 0xef8a5543bba6bc76 => 22
	i64 17311256152179951039, ; 733: Microsoft.AspNetCore.Mvc.Formatters.Json => 0xf03defc05e7b45bf => 206
	i64 17333249706306540043, ; 734: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 34
	i64 17338386382517543202, ; 735: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 79
	i64 17342750010158924305, ; 736: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 365
	i64 17360349973592121190, ; 737: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 347
	i64 17438153253682247751, ; 738: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 380
	i64 17470386307322966175, ; 739: System.Threading.Timer => 0xf27347c8d0d5709f => 147
	i64 17509662556995089465, ; 740: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 80
	i64 17514990004910432069, ; 741: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 363
	i64 17522591619082469157, ; 742: GoogleGson => 0xf32cc03d27a5bf25 => 180
	i64 17570464675455066222, ; 743: GalaSoft.MvvmLight => 0xf3d6d487af0c606e => 256
	i64 17590473451926037903, ; 744: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 273
	i64 17623389608345532001, ; 745: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 375
	i64 17627500474728259406, ; 746: System.Globalization => 0xf4a176498a351f4e => 42
	i64 17685921127322830888, ; 747: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 26
	i64 17702523067201099846, ; 748: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 386
	i64 17704177640604968747, ; 749: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 320
	i64 17710060891934109755, ; 750: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 317
	i64 17712670374920797664, ; 751: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 107
	i64 17727630781806093631, ; 752: Microsoft.AspNetCore.Diagnostics.Abstractions => 0xf605324562d5253f => 190
	i64 17777860260071588075, ; 753: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 110
	i64 17790600151040787804, ; 754: Microsoft.IdentityModel.Logging => 0xf6e4e89427cc055c => 246
	i64 17830780619298983968, ; 755: Microsoft.AspNetCore.Razor => 0xf773a880713c5020 => 213
	i64 17838668724098252521, ; 756: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 7
	i64 17891337867145587222, ; 757: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 350
	i64 17911643751311784505, ; 758: Microsoft.Net.Http.Headers => 0xf892f1178448ba39 => 254
	i64 17928294245072900555, ; 759: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 44
	i64 17992315986609351877, ; 760: System.Xml.XmlDocument.dll => 0xf9b18c0ffc6eacc5 => 161
	i64 18017743553296241350, ; 761: Microsoft.Extensions.Caching.Abstractions => 0xfa0be24cb44e92c6 => 224
	i64 18025913125965088385, ; 762: System.Threading => 0xfa28e87b91334681 => 148
	i64 18099568558057551825, ; 763: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 374
	i64 18116111925905154859, ; 764: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 285
	i64 18121036031235206392, ; 765: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 322
	i64 18146411883821974900, ; 766: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 38
	i64 18146811631844267958, ; 767: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 15
	i64 18203743254473369877, ; 768: System.Security.Cryptography.Pkcs.dll => 0xfca0b00ad94c6915 => 268
	i64 18225059387460068507, ; 769: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 146
	i64 18245806341561545090, ; 770: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 8
	i64 18260797123374478311, ; 771: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 303
	i64 18305135509493619199, ; 772: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 324
	i64 18318849532986632368, ; 773: System.Security.dll => 0xfe39a097c37fa8b0 => 130
	i64 18324163916253801303, ; 774: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 369
	i64 18370042311372477656, ; 775: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 262
	i64 18380184030268848184, ; 776: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 340
	i64 18427086088365902170, ; 777: Microsoft.AspNetCore.Mvc.Cors => 0xffba292a9e97895a => 204
	i64 18428404840311395189, ; 778: System.Security.Cryptography.Xml.dll => 0xffbed8907bd99375 => 269
	i64 18439108438687598470 ; 779: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 94
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [780 x i32] [
	i32 223, ; 0
	i32 302, ; 1
	i32 242, ; 2
	i32 171, ; 3
	i32 252, ; 4
	i32 234, ; 5
	i32 58, ; 6
	i32 288, ; 7
	i32 151, ; 8
	i32 330, ; 9
	i32 289, ; 10
	i32 179, ; 11
	i32 333, ; 12
	i32 296, ; 13
	i32 132, ; 14
	i32 222, ; 15
	i32 56, ; 16
	i32 332, ; 17
	i32 190, ; 18
	i32 240, ; 19
	i32 362, ; 20
	i32 95, ; 21
	i32 221, ; 22
	i32 315, ; 23
	i32 129, ; 24
	i32 145, ; 25
	i32 290, ; 26
	i32 18, ; 27
	i32 365, ; 28
	i32 205, ; 29
	i32 262, ; 30
	i32 301, ; 31
	i32 316, ; 32
	i32 150, ; 33
	i32 104, ; 34
	i32 216, ; 35
	i32 183, ; 36
	i32 95, ; 37
	i32 345, ; 38
	i32 373, ; 39
	i32 36, ; 40
	i32 261, ; 41
	i32 28, ; 42
	i32 284, ; 43
	i32 323, ; 44
	i32 50, ; 45
	i32 115, ; 46
	i32 70, ; 47
	i32 249, ; 48
	i32 65, ; 49
	i32 271, ; 50
	i32 170, ; 51
	i32 263, ; 52
	i32 145, ; 53
	i32 371, ; 54
	i32 344, ; 55
	i32 178, ; 56
	i32 283, ; 57
	i32 319, ; 58
	i32 309, ; 59
	i32 187, ; 60
	i32 40, ; 61
	i32 89, ; 62
	i32 81, ; 63
	i32 257, ; 64
	i32 66, ; 65
	i32 62, ; 66
	i32 86, ; 67
	i32 282, ; 68
	i32 106, ; 69
	i32 361, ; 70
	i32 330, ; 71
	i32 102, ; 72
	i32 35, ; 73
	i32 279, ; 74
	i32 383, ; 75
	i32 332, ; 76
	i32 250, ; 77
	i32 383, ; 78
	i32 221, ; 79
	i32 119, ; 80
	i32 317, ; 81
	i32 357, ; 82
	i32 375, ; 83
	i32 142, ; 84
	i32 141, ; 85
	i32 53, ; 86
	i32 35, ; 87
	i32 141, ; 88
	i32 257, ; 89
	i32 276, ; 90
	i32 286, ; 91
	i32 239, ; 92
	i32 353, ; 93
	i32 301, ; 94
	i32 193, ; 95
	i32 8, ; 96
	i32 14, ; 97
	i32 379, ; 98
	i32 329, ; 99
	i32 51, ; 100
	i32 312, ; 101
	i32 136, ; 102
	i32 101, ; 103
	i32 266, ; 104
	i32 207, ; 105
	i32 294, ; 106
	i32 339, ; 107
	i32 116, ; 108
	i32 277, ; 109
	i32 163, ; 110
	i32 382, ; 111
	i32 247, ; 112
	i32 166, ; 113
	i32 256, ; 114
	i32 67, ; 115
	i32 228, ; 116
	i32 357, ; 117
	i32 80, ; 118
	i32 101, ; 119
	i32 334, ; 120
	i32 245, ; 121
	i32 117, ; 122
	i32 362, ; 123
	i32 346, ; 124
	i32 206, ; 125
	i32 78, ; 126
	i32 345, ; 127
	i32 185, ; 128
	i32 114, ; 129
	i32 121, ; 130
	i32 48, ; 131
	i32 234, ; 132
	i32 209, ; 133
	i32 184, ; 134
	i32 128, ; 135
	i32 310, ; 136
	i32 280, ; 137
	i32 82, ; 138
	i32 110, ; 139
	i32 75, ; 140
	i32 354, ; 141
	i32 231, ; 142
	i32 267, ; 143
	i32 252, ; 144
	i32 53, ; 145
	i32 336, ; 146
	i32 226, ; 147
	i32 69, ; 148
	i32 335, ; 149
	i32 225, ; 150
	i32 83, ; 151
	i32 172, ; 152
	i32 377, ; 153
	i32 116, ; 154
	i32 227, ; 155
	i32 156, ; 156
	i32 226, ; 157
	i32 274, ; 158
	i32 167, ; 159
	i32 328, ; 160
	i32 302, ; 161
	i32 237, ; 162
	i32 32, ; 163
	i32 250, ; 164
	i32 122, ; 165
	i32 72, ; 166
	i32 62, ; 167
	i32 189, ; 168
	i32 161, ; 169
	i32 113, ; 170
	i32 88, ; 171
	i32 248, ; 172
	i32 388, ; 173
	i32 105, ; 174
	i32 18, ; 175
	i32 146, ; 176
	i32 118, ; 177
	i32 58, ; 178
	i32 296, ; 179
	i32 258, ; 180
	i32 17, ; 181
	i32 182, ; 182
	i32 52, ; 183
	i32 196, ; 184
	i32 191, ; 185
	i32 92, ; 186
	i32 177, ; 187
	i32 260, ; 188
	i32 385, ; 189
	i32 55, ; 190
	i32 129, ; 191
	i32 181, ; 192
	i32 152, ; 193
	i32 41, ; 194
	i32 92, ; 195
	i32 340, ; 196
	i32 50, ; 197
	i32 355, ; 198
	i32 162, ; 199
	i32 13, ; 200
	i32 314, ; 201
	i32 277, ; 202
	i32 335, ; 203
	i32 36, ; 204
	i32 67, ; 205
	i32 109, ; 206
	i32 278, ; 207
	i32 99, ; 208
	i32 266, ; 209
	i32 99, ; 210
	i32 11, ; 211
	i32 219, ; 212
	i32 194, ; 213
	i32 11, ; 214
	i32 321, ; 215
	i32 207, ; 216
	i32 25, ; 217
	i32 128, ; 218
	i32 76, ; 219
	i32 313, ; 220
	i32 109, ; 221
	i32 265, ; 222
	i32 339, ; 223
	i32 337, ; 224
	i32 106, ; 225
	i32 2, ; 226
	i32 26, ; 227
	i32 292, ; 228
	i32 157, ; 229
	i32 381, ; 230
	i32 21, ; 231
	i32 384, ; 232
	i32 49, ; 233
	i32 43, ; 234
	i32 126, ; 235
	i32 281, ; 236
	i32 59, ; 237
	i32 217, ; 238
	i32 183, ; 239
	i32 119, ; 240
	i32 342, ; 241
	i32 305, ; 242
	i32 236, ; 243
	i32 291, ; 244
	i32 3, ; 245
	i32 255, ; 246
	i32 311, ; 247
	i32 331, ; 248
	i32 38, ; 249
	i32 124, ; 250
	i32 378, ; 251
	i32 331, ; 252
	i32 260, ; 253
	i32 378, ; 254
	i32 137, ; 255
	i32 149, ; 256
	i32 85, ; 257
	i32 90, ; 258
	i32 315, ; 259
	i32 389, ; 260
	i32 312, ; 261
	i32 198, ; 262
	i32 366, ; 263
	i32 286, ; 264
	i32 298, ; 265
	i32 343, ; 266
	i32 241, ; 267
	i32 348, ; 268
	i32 313, ; 269
	i32 133, ; 270
	i32 208, ; 271
	i32 96, ; 272
	i32 3, ; 273
	i32 374, ; 274
	i32 105, ; 275
	i32 377, ; 276
	i32 33, ; 277
	i32 154, ; 278
	i32 158, ; 279
	i32 155, ; 280
	i32 82, ; 281
	i32 192, ; 282
	i32 307, ; 283
	i32 269, ; 284
	i32 143, ; 285
	i32 87, ; 286
	i32 19, ; 287
	i32 308, ; 288
	i32 268, ; 289
	i32 51, ; 290
	i32 215, ; 291
	i32 276, ; 292
	i32 381, ; 293
	i32 61, ; 294
	i32 54, ; 295
	i32 4, ; 296
	i32 194, ; 297
	i32 97, ; 298
	i32 275, ; 299
	i32 17, ; 300
	i32 223, ; 301
	i32 155, ; 302
	i32 84, ; 303
	i32 267, ; 304
	i32 29, ; 305
	i32 45, ; 306
	i32 64, ; 307
	i32 66, ; 308
	i32 372, ; 309
	i32 172, ; 310
	i32 316, ; 311
	i32 1, ; 312
	i32 351, ; 313
	i32 47, ; 314
	i32 24, ; 315
	i32 185, ; 316
	i32 283, ; 317
	i32 224, ; 318
	i32 165, ; 319
	i32 108, ; 320
	i32 12, ; 321
	i32 310, ; 322
	i32 63, ; 323
	i32 27, ; 324
	i32 23, ; 325
	i32 93, ; 326
	i32 186, ; 327
	i32 168, ; 328
	i32 12, ; 329
	i32 352, ; 330
	i32 253, ; 331
	i32 29, ; 332
	i32 103, ; 333
	i32 14, ; 334
	i32 186, ; 335
	i32 126, ; 336
	i32 293, ; 337
	i32 243, ; 338
	i32 325, ; 339
	i32 91, ; 340
	i32 314, ; 341
	i32 178, ; 342
	i32 270, ; 343
	i32 9, ; 344
	i32 203, ; 345
	i32 272, ; 346
	i32 86, ; 347
	i32 304, ; 348
	i32 173, ; 349
	i32 337, ; 350
	i32 192, ; 351
	i32 376, ; 352
	i32 71, ; 353
	i32 168, ; 354
	i32 1, ; 355
	i32 324, ; 356
	i32 5, ; 357
	i32 376, ; 358
	i32 44, ; 359
	i32 27, ; 360
	i32 0, ; 361
	i32 204, ; 362
	i32 202, ; 363
	i32 179, ; 364
	i32 158, ; 365
	i32 327, ; 366
	i32 112, ; 367
	i32 353, ; 368
	i32 386, ; 369
	i32 225, ; 370
	i32 121, ; 371
	i32 342, ; 372
	i32 282, ; 373
	i32 175, ; 374
	i32 191, ; 375
	i32 246, ; 376
	i32 159, ; 377
	i32 131, ; 378
	i32 347, ; 379
	i32 57, ; 380
	i32 138, ; 381
	i32 83, ; 382
	i32 30, ; 383
	i32 294, ; 384
	i32 10, ; 385
	i32 344, ; 386
	i32 171, ; 387
	i32 291, ; 388
	i32 150, ; 389
	i32 94, ; 390
	i32 187, ; 391
	i32 304, ; 392
	i32 60, ; 393
	i32 217, ; 394
	i32 251, ; 395
	i32 157, ; 396
	i32 361, ; 397
	i32 258, ; 398
	i32 239, ; 399
	i32 64, ; 400
	i32 88, ; 401
	i32 79, ; 402
	i32 47, ; 403
	i32 249, ; 404
	i32 143, ; 405
	i32 358, ; 406
	i32 298, ; 407
	i32 74, ; 408
	i32 195, ; 409
	i32 91, ; 410
	i32 271, ; 411
	i32 350, ; 412
	i32 210, ; 413
	i32 135, ; 414
	i32 90, ; 415
	i32 336, ; 416
	i32 354, ; 417
	i32 295, ; 418
	i32 218, ; 419
	i32 356, ; 420
	i32 213, ; 421
	i32 112, ; 422
	i32 42, ; 423
	i32 159, ; 424
	i32 4, ; 425
	i32 103, ; 426
	i32 70, ; 427
	i32 60, ; 428
	i32 39, ; 429
	i32 284, ; 430
	i32 173, ; 431
	i32 153, ; 432
	i32 193, ; 433
	i32 56, ; 434
	i32 34, ; 435
	i32 214, ; 436
	i32 238, ; 437
	i32 251, ; 438
	i32 281, ; 439
	i32 21, ; 440
	i32 163, ; 441
	i32 197, ; 442
	i32 232, ; 443
	i32 348, ; 444
	i32 367, ; 445
	i32 346, ; 446
	i32 341, ; 447
	i32 140, ; 448
	i32 370, ; 449
	i32 241, ; 450
	i32 89, ; 451
	i32 175, ; 452
	i32 177, ; 453
	i32 289, ; 454
	i32 147, ; 455
	i32 297, ; 456
	i32 162, ; 457
	i32 326, ; 458
	i32 6, ; 459
	i32 169, ; 460
	i32 31, ; 461
	i32 107, ; 462
	i32 307, ; 463
	i32 244, ; 464
	i32 368, ; 465
	i32 341, ; 466
	i32 237, ; 467
	i32 220, ; 468
	i32 279, ; 469
	i32 334, ; 470
	i32 167, ; 471
	i32 308, ; 472
	i32 140, ; 473
	i32 364, ; 474
	i32 59, ; 475
	i32 259, ; 476
	i32 144, ; 477
	i32 259, ; 478
	i32 202, ; 479
	i32 81, ; 480
	i32 74, ; 481
	i32 233, ; 482
	i32 130, ; 483
	i32 25, ; 484
	i32 7, ; 485
	i32 93, ; 486
	i32 338, ; 487
	i32 137, ; 488
	i32 0, ; 489
	i32 273, ; 490
	i32 113, ; 491
	i32 9, ; 492
	i32 263, ; 493
	i32 235, ; 494
	i32 104, ; 495
	i32 174, ; 496
	i32 19, ; 497
	i32 245, ; 498
	i32 182, ; 499
	i32 200, ; 500
	i32 306, ; 501
	i32 320, ; 502
	i32 389, ; 503
	i32 300, ; 504
	i32 33, ; 505
	i32 287, ; 506
	i32 46, ; 507
	i32 369, ; 508
	i32 30, ; 509
	i32 288, ; 510
	i32 57, ; 511
	i32 134, ; 512
	i32 114, ; 513
	i32 222, ; 514
	i32 343, ; 515
	i32 382, ; 516
	i32 55, ; 517
	i32 242, ; 518
	i32 6, ; 519
	i32 77, ; 520
	i32 299, ; 521
	i32 220, ; 522
	i32 111, ; 523
	i32 198, ; 524
	i32 189, ; 525
	i32 199, ; 526
	i32 303, ; 527
	i32 270, ; 528
	i32 102, ; 529
	i32 255, ; 530
	i32 356, ; 531
	i32 370, ; 532
	i32 218, ; 533
	i32 170, ; 534
	i32 115, ; 535
	i32 364, ; 536
	i32 338, ; 537
	i32 293, ; 538
	i32 195, ; 539
	i32 76, ; 540
	i32 349, ; 541
	i32 85, ; 542
	i32 351, ; 543
	i32 384, ; 544
	i32 285, ; 545
	i32 385, ; 546
	i32 368, ; 547
	i32 231, ; 548
	i32 328, ; 549
	i32 160, ; 550
	i32 2, ; 551
	i32 203, ; 552
	i32 299, ; 553
	i32 200, ; 554
	i32 24, ; 555
	i32 278, ; 556
	i32 32, ; 557
	i32 117, ; 558
	i32 37, ; 559
	i32 16, ; 560
	i32 363, ; 561
	i32 52, ; 562
	i32 366, ; 563
	i32 20, ; 564
	i32 123, ; 565
	i32 219, ; 566
	i32 154, ; 567
	i32 214, ; 568
	i32 230, ; 569
	i32 306, ; 570
	i32 176, ; 571
	i32 264, ; 572
	i32 131, ; 573
	i32 358, ; 574
	i32 287, ; 575
	i32 148, ; 576
	i32 274, ; 577
	i32 199, ; 578
	i32 120, ; 579
	i32 28, ; 580
	i32 132, ; 581
	i32 100, ; 582
	i32 134, ; 583
	i32 326, ; 584
	i32 201, ; 585
	i32 153, ; 586
	i32 97, ; 587
	i32 125, ; 588
	i32 275, ; 589
	i32 69, ; 590
	i32 72, ; 591
	i32 379, ; 592
	i32 311, ; 593
	i32 329, ; 594
	i32 360, ; 595
	i32 201, ; 596
	i32 264, ; 597
	i32 136, ; 598
	i32 174, ; 599
	i32 124, ; 600
	i32 209, ; 601
	i32 71, ; 602
	i32 111, ; 603
	i32 321, ; 604
	i32 228, ; 605
	i32 152, ; 606
	i32 272, ; 607
	i32 371, ; 608
	i32 212, ; 609
	i32 387, ; 610
	i32 349, ; 611
	i32 118, ; 612
	i32 211, ; 613
	i32 297, ; 614
	i32 180, ; 615
	i32 388, ; 616
	i32 355, ; 617
	i32 127, ; 618
	i32 133, ; 619
	i32 229, ; 620
	i32 77, ; 621
	i32 46, ; 622
	i32 300, ; 623
	i32 215, ; 624
	i32 73, ; 625
	i32 63, ; 626
	i32 98, ; 627
	i32 84, ; 628
	i32 372, ; 629
	i32 43, ; 630
	i32 61, ; 631
	i32 244, ; 632
	i32 327, ; 633
	i32 211, ; 634
	i32 227, ; 635
	i32 37, ; 636
	i32 40, ; 637
	i32 290, ; 638
	i32 352, ; 639
	i32 160, ; 640
	i32 205, ; 641
	i32 98, ; 642
	i32 236, ; 643
	i32 295, ; 644
	i32 229, ; 645
	i32 232, ; 646
	i32 135, ; 647
	i32 20, ; 648
	i32 65, ; 649
	i32 359, ; 650
	i32 125, ; 651
	i32 75, ; 652
	i32 196, ; 653
	i32 319, ; 654
	i32 184, ; 655
	i32 164, ; 656
	i32 230, ; 657
	i32 208, ; 658
	i32 156, ; 659
	i32 359, ; 660
	i32 5, ; 661
	i32 235, ; 662
	i32 367, ; 663
	i32 265, ; 664
	i32 49, ; 665
	i32 333, ; 666
	i32 360, ; 667
	i32 144, ; 668
	i32 139, ; 669
	i32 197, ; 670
	i32 176, ; 671
	i32 100, ; 672
	i32 248, ; 673
	i32 123, ; 674
	i32 120, ; 675
	i32 142, ; 676
	i32 39, ; 677
	i32 68, ; 678
	i32 188, ; 679
	i32 240, ; 680
	i32 41, ; 681
	i32 243, ; 682
	i32 164, ; 683
	i32 73, ; 684
	i32 373, ; 685
	i32 165, ; 686
	i32 238, ; 687
	i32 127, ; 688
	i32 216, ; 689
	i32 305, ; 690
	i32 68, ; 691
	i32 169, ; 692
	i32 188, ; 693
	i32 210, ; 694
	i32 318, ; 695
	i32 292, ; 696
	i32 253, ; 697
	i32 325, ; 698
	i32 151, ; 699
	i32 45, ; 700
	i32 108, ; 701
	i32 261, ; 702
	i32 48, ; 703
	i32 96, ; 704
	i32 31, ; 705
	i32 212, ; 706
	i32 23, ; 707
	i32 166, ; 708
	i32 22, ; 709
	i32 138, ; 710
	i32 78, ; 711
	i32 380, ; 712
	i32 54, ; 713
	i32 318, ; 714
	i32 323, ; 715
	i32 10, ; 716
	i32 280, ; 717
	i32 322, ; 718
	i32 309, ; 719
	i32 181, ; 720
	i32 16, ; 721
	i32 387, ; 722
	i32 139, ; 723
	i32 254, ; 724
	i32 247, ; 725
	i32 13, ; 726
	i32 15, ; 727
	i32 122, ; 728
	i32 233, ; 729
	i32 87, ; 730
	i32 149, ; 731
	i32 22, ; 732
	i32 206, ; 733
	i32 34, ; 734
	i32 79, ; 735
	i32 365, ; 736
	i32 347, ; 737
	i32 380, ; 738
	i32 147, ; 739
	i32 80, ; 740
	i32 363, ; 741
	i32 180, ; 742
	i32 256, ; 743
	i32 273, ; 744
	i32 375, ; 745
	i32 42, ; 746
	i32 26, ; 747
	i32 386, ; 748
	i32 320, ; 749
	i32 317, ; 750
	i32 107, ; 751
	i32 190, ; 752
	i32 110, ; 753
	i32 246, ; 754
	i32 213, ; 755
	i32 7, ; 756
	i32 350, ; 757
	i32 254, ; 758
	i32 44, ; 759
	i32 161, ; 760
	i32 224, ; 761
	i32 148, ; 762
	i32 374, ; 763
	i32 285, ; 764
	i32 322, ; 765
	i32 38, ; 766
	i32 15, ; 767
	i32 268, ; 768
	i32 146, ; 769
	i32 8, ; 770
	i32 303, ; 771
	i32 324, ; 772
	i32 130, ; 773
	i32 369, ; 774
	i32 262, ; 775
	i32 340, ; 776
	i32 204, ; 777
	i32 269, ; 778
	i32 94 ; 779
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 0d97e20b84d8e87c3502469ee395805907905fe3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
