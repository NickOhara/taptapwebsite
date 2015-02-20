<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="taptapwebsite.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<%-- /***********************************************
    * Background Image Carousel- © Dynamic Drive (www.dynamicdrive.com)
    * This notice MUST stay intact for legal use
    * Visit http://www.dynamicdrive.com/ for this script and 100s more.
    ***********************************************/--%>
    
<style>

div.bgcarousel{ /* CSS for main carousel container */
background: url(Content/Images/ajaxload.gif) center center no-repeat; /* loading gif while caoursel is loading */
width:500px; /* default dimensions of carousel */
height:500px;
}

img.navbutton{ /* CSS for the nav buttons */
margin:5px;
opacity:0.7;
}

div.slide{ /* CSS for each image's DIV container within main container */
background-color: transparent;
background-position: center center; /* center image within carousel */
background-repeat: no-repeat;
background-size: contain; /* CSS3 property to scale image within container? "cover" or "contain" */
color: black;
}

div.selectedslide{ /* CSS for currently selected slide */
}

div.slide div.desc{ /* DIV that contains the textual description inside .slide */
position: absolute;
color: white;
left: 40px;
top: 100px;
width:200px;
padding: 10px;
font: bold 16px sans-serif, Arial;
text-shadow: 0 -1px 1px #8a8a8a; /* CSS3 text shadow */
z-index:5;
}

div.selectedslide div.desc{ /* CSS for currently selected slide's desc div */
}

div.slide div.desc h2{
font-size:150%;
margin:0;
}

div.slide div.desc a{
color:yellow;
text-decoration:none;
}

</style>

<script src="Scripts/bgcarousel.js" type="text/javascript"></script>


<script type="text/javascript">

    var firstbgcarousel = new bgCarousel({
        wrapperid: 'mybgcarousel', //ID of blank DIV on page to house carousel
        imagearray: [
		['Content/Images/ss_iphone_large.png', '<h3>New on iPhone!</h3>Best new app on the market!'], //["image_path", "optional description"]
        ['Content/Images/phones.png', '<h3>Stolen Pic</h3> lolololol!'],
		['Content/Images/blackberry_app_world.jpg', '<h3 style="color:white">Need Image</h3>Get me some fucking pics mike'] //<--no trailing comma after very last image element!
	],
        displaymode: { type: 'auto', pause: 3000, cycles: 0, stoponclick: false, pauseonmouseover: true },
        navbuttons: ['Content/Images/left.gif', 'Content/Images/right.gif', 'Content/Images/up.gif', 'Content/Images/down.gif'], // path to nav images
        activeslideclass: 'selectedslide', // CSS class that gets added to currently shown DIV slide
        orientation: 'h', //Valid values: "h" or "v"
        persist: true, //remember last viewed slide and recall within same session?
        slideduration: 500, //transition duration (milliseconds)
    })

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="mybgcarousel" class="bgcarousel"></div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="imagesPlaceHolder" runat="server">
 <div id="app-images">
                    <ul>
                        <li>
                            <img src="Content/Images/app_store.png" /></li>
                        <li>
                            <img src="Content/Images/android_market.png" /></li>
                    </ul>
                </div></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TwitterPlaceHolder" runat="server">
    <script src="Scripts/widget.js" type="text/javascript"></script>
<script type="text/javascript">
    new TWTR.Widget({
        version: 2,
        type: 'search',
        search: '\"taptap\" OR \"olympics\"',
        interval: 2000,
        title: '',
        subject: '',
        width: 'auto',
        height: 400,
        theme: {
            shell: {
                background: '#333333',
                color: '#ffffff'
            },
            tweets: {
                background: '#000000',
                color: '#ffffff',
                links: '#d3e59f'
            }
        },
        features: {
            scrollbar: false,
            loop: true,
            live: true,
            hashtags: true,
            timestamp: true,
            avatars: true,
            toptweets: true,
            behavior: 'default'
        }
    }).render().start();
</script>
</asp:Content>
