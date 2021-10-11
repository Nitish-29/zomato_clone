class StringConstant {
  static String textHome = "Home";
  static String textCategories = "Categories";
  static String textDownload = "Downloads";
  static String textSettings = "Settings";
  static String textOrder = "Order";
  static String textGoOut = "Go out";
  static String textPro = "Pro";
  static String textNutrition = "Nutrition";
  static String textDonate = "Donate";
  static String textAddress = "Sector 7, Gurgaon";
  static String textSearchHint = "Restaurant name , cuisine or a dish";
  static String textProPartners = "PRO\nPartners";
  static String textGreatOffer = "Great\nOffers";
  static String textPureVeg = "Pure\nVeg";
  static String textRating = "Rating\n4+";
  static String textMaxSafety = "MAX\nSafety";
  static String textCategoryMsg = "Eat what makes you happy";
  static String textRestaurantMsg = "890 restaurants near you";
  static String textDiscount = "40% OFF\n Up to \u20B980";
  static String textSafety =
      "Zomato fund environmental measures to ensure your food safety";
  static String textLocationInfo =
      "Please enable device location to ensure accurate "
      "address and faster delivery";
  static String textLocationNotEnabled = "Device Location is not enabled";
  static String textEnableLocation = "Enable Device Location";
  static String textSafety2 =
      "Follow all Max Safety measures to ensure your food is safe";
  static String textProMemberShip = "Pro Membership";
  static String textProPlusMemberShip = "Pro Plus Membership";
  static String textMembershipEnd = "Your membership ended 1 month ago";
  static String textProMembershipBuy =
      "Sorry, you are not invite on the list for Pro Plus yet. "
      "Jon Pro to increase your chances of getting an invite to Pro Plus";
  static String textFreeDelivery = "Free Delivery on All Orders";
  static String textProBenefit = "All benefits of Pro membership";
  static String textHaveQuestion = "Still have a question?";
  static String textChatUs = "Chat with us";
  static String textProDeals =
      "Pro restaurants offering epic deals to the members";
  static String textLogin = "Log In";
  static String textSendOtp = "Send OTP";
  static String textVerifyOtp = "Verify OTP";
  static String textFacebook = "Facebook";
  static String textGoogle = "Google";
  static String textContinueEmail = "Continue with Email";
  static String textForgotPassword = "Forgot Password ?";
  static String textTerms = "By accepting you agree to our \n Terms of Service and Privacy Policy";
  static String textEmail = "Phone no";
  static String textPassword = "Password";
  static String textDelivery = "DELIVERY";
  static String textDining = "DINING";
  static String textDiningOffer = "Up to 40% OFF on dining";
  static String textDeliveryOffer = "Up to extra 30% OFF on delivery";
  static String textOfferRestauants = "At 25,000+ restaurants";
  static String textInviteOnly = "INVITE ONLY";
  static String textNoFreeDelivery =
      "This does not include Free delivery on orders";
  static String textRenewPro = "Renew Pro";
  static String textBookmarks = "Bookmarks";
  static String textNotificaitons = "Notifications";
  static String textPayment = "Payment";
  static String textSendFeedback = "Send Feedback";
  static String textReportSafety = "Report a Safety Emergency";
  static String textRateUs = "Rate us on Play Store";
  static String textLogout = "Log out";
  static String textZomatoPro = "ZOMATO PRO";
  static String textRenewMembership = "Renew membership";
  static String textProHistory = "Pro Transaction History";
  static String textProHelp = "Pro Help";

  static String textMembershipDuration(bool isTwelveMonth) {
    if (isTwelveMonth) {
      return textMemberShipDuration12;
    } else {
      return textMembershipDuration3;
    }
  }

  static String textMoreBtn(bool isExpanded) {
    if (isExpanded) {
      return textShowLess;
    } else {
      return textShowMore;
    }
  }

  static String textShowMore = "show more \u25BC";
  static String textShowLess = "show less \u25B2";

  static const String textEnterEmail = "Phone Number";
  static const String textEnterPassword = "Enter you password";

  static String textMemberShipDuration12 = "at 750 for 12 months";
  static String textMembershipDuration3 = "at 200 for 3 months";

  static List<String> cuisinesName = <String>[
    "Steak",
    "North Indian",
    "Modern Australian",
    "Desserts",
    "Italian",
    "Fusion",
    "Mexican",
    "Continental",
    "Asian",
    "Breakfast",
    "Seafood"
  ];

  static List<String> diningName = <String>[
    "Outdoor",
    "Premium",
    "Romantic",
    "Pro",
    "Cafe",
    "Events",
    "Pub & Bars",
    "Family Dining",
    "Buffet",
    "Dessert",
    "Healthy",
    "Pure Veg",
    "Kid Friendly",
    "Breakfast",
    "Pet Friendly",
    "Snacks"
  ];
}
