<%@ Page Title="Barangay Officials" Language="C#" AutoEventWireup="True" CodeBehind="Officials.aspx.cs" Inherits="EDalan_WebForm.Officials" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-4">
        <h2 class="mb-4">Barangay Officials</h2>

        <div class="mb-5 vh-100">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
                <asp:Repeater ID="rptOfficials" runat="server">
                    <ItemTemplate>
                        <div class="col">
                            <div class="card h-100 text-center">
                                <div class="overflow-hidden" style="height: 250px;">
                                    <img src='<%# !string.IsNullOrEmpty(Eval("ProfileImage").ToString()) ? Eval("ProfileImage") : "~/Content/images/default.png" %>'
                                         class="card-img-top w-100 h-100 object-fit-cover avatar"
                                         alt='<%# Eval("Position") %>' />
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("Name") %></h5>
                                    <p class="card-text text-muted"><%# Eval("Position") %></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
