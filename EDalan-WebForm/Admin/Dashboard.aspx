<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EDalan_WebForm.Admin.Dashboard" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Admin Dashboard</h1>

    <div class="container-fluid">
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h6>Pending Requests</h6>
                        <h3><asp:Literal ID="litPendingRequests" runat="server" /></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h6>Total Users</h6>
                        <h3><asp:Literal ID="litTotalUsers" runat="server" /></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h6>Active Users</h6>
                        <h3><asp:Literal ID="litActiveUsers" runat="server" /></h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mb-4">
            <div class="col-md-6">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5>Request Overview</h5>
                        <canvas id="requestChart" style="height: 300px; width: 100%;"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5>Approval Rates</h5>
                        <canvas id="approvalChart" style="height: 300px; width: 100%;"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <h5 class="mb-3">Pending Requests</h5>
        <asp:Repeater ID="rptRequests" runat="server">
            <HeaderTemplate>
                <table class="table table-bordered table-hover shadow-sm">
                    <thead class="table-light">
                        <tr>
                            <th>Request ID</th>
                            <th>Resident Name</th>
                            <th>Submission Date</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("RequestId") %></td>
                    <td><%# Eval("FullName") %></td>   
                    <td><%# Eval("RequestDate", "{0:yyyy-MM-dd HH:mm}") %></td>
                    <td>
                        <%# 
                            Eval("Status").ToString() == "Approved" 
                            ? "<span class='badge bg-success'>Approved</span>" :
                            Eval("Status").ToString() == "Pending" 
                            ? "<span class='badge bg-warning text-dark'>Pending</span>" :
                            "<span class='badge bg-danger'>Rejected</span>" 
                        %>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                    </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>

        <asp:Literal ID="litNoRequests" runat="server" Visible="false" Text="<div class='text-center'>No requests available</div>" />
    </div>

    <script type="text/javascript">
    const requestChart = document.getElementById('requestChart');
    const approvalChart = document.getElementById('approvalChart');

    const pending = <%= PendingRequests %>;
    const approved = <%= ApprovedRequests %>;
    const rejected = <%= RejectedRequests %>;   

    const monthlyApproved = <%= MonthlyApprovedJson %>;
    const monthlyRejected = <%= MonthlyRejectedJson %>;

    if (requestChart) {
        new Chart(requestChart, {
            type: 'doughnut',
            data: {
                labels: ['Approved', 'Pending', 'Rejected'],
                datasets: [{
                    data: [approved, pending, rejected],
                    backgroundColor: ['#8BC34A', '#FF9800', '#F7374F']
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true,
                aspectRatio:2,
            }
        });
    }

    if (approvalChart) {
        new Chart(approvalChart, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                datasets: [
                    {
                        label: 'Approved',
                        data: monthlyApproved,
                        borderColor: '#8BC34A',
                        fill: false
                    },
                    {
                        label: 'Rejected',
                        data: monthlyRejected,
                        borderColor: '#F7374F',
                        fill: false
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true,
                aspectRatio:2,
            }
        });
    }
</script>
</asp:Content>
