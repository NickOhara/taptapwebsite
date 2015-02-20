<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="taptapwebsite.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h2 style="color:White">WASSSSSSSSSSSSSSUP</h2>
</asp:Content>
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
