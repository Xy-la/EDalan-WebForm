<%@ Page Title="Community Services" Language="C#" AutoEventWireup="True" CodeBehind="CommunityServices.aspx.cs" Inherits="EDalan_WebForm.CommunityServices" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-4">
        <h2 class="mb-4">Community Services</h2>

        <div class="mb-5 vh-100">
            <asp:Repeater ID="rptServices" runat="server">
                <ItemTemplate>
                    <div class="col mb-4">
                        <div class="card h-100 text-center p-3">
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Title") %></h5>
                                <p class="card-text"><%# Eval("Description") %></p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <HeaderTemplate>
                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
                </HeaderTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

