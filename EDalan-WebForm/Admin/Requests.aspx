<%@ Page Title="Manage Requests" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="Requests.aspx.cs" Inherits="EDalan_WebForm.Admin.Requests" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="mb-4 text-left text-primary">Manage Requests</h3>
    
    <div class="container-fluid">
        <asp:GridView ID="gvRequests" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover table-striped" OnRowCommand="gvRequests_RowCommand" OnRowDeleting="gvRequests_RowDeleting">
    <Columns>
        <asp:BoundField DataField="RequestId" HeaderText="Request Id" SortExpression="RequestId" />
        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
        <asp:BoundField DataField="RequestDate" HeaderText="Request Date" SortExpression="RequestDate" DataFormatString="{0:MM/dd/yyyy}" />
        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
        <asp:BoundField DataField="User.FullName" HeaderText="Requested By" SortExpression="User.FullName" />
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:LinkButton 
                    ID="btnApprove" 
                    runat="server" 
                    CommandName="Approve" 
                    CommandArgument='<%# Eval("RequestId") %>' 
                    OnClientClick="return confirmApprove(this);" 
                    CssClass="btn btn-success btn-sm me-1" 
                    Visible='<%# Eval("Status").ToString() != "Approved" && Eval("Status").ToString() != "Rejected" %>'>
                    <i class="bi bi-check-circle me-1"></i>Approve
                </asp:LinkButton>

                <asp:LinkButton 
                    ID="btnReject" 
                    runat="server" 
                    CommandName="Reject" 
                    CommandArgument='<%# Eval("RequestId") %>' 
                    OnClientClick="return confirmReject(this);" 
                    CssClass="btn btn-danger btn-sm" 
                    Visible='<%# Eval("Status").ToString() != "Approved" && Eval("Status").ToString() != "Rejected" %>'>
                    <i class="bi bi-x-circle me-1"></i>Reject
                </asp:LinkButton>

                <i class="bi bi-check-circle me-1 text-success" 
                    style="display: <%# Eval("Status").ToString() == "Approved" ? "inline" : "none" %>">
                    Approved
                </i>

                <i class="bi bi-x-circle me-1 text-danger" 
                    style="display: <%# Eval("Status").ToString() == "Rejected" ? "inline" : "none" %>">
                    Rejected
                </i>

                <asp:LinkButton 
                    ID="btnDelete" 
                    runat="server" 
                    CommandName="Delete" 
                    CommandArgument='<%# Eval("RequestId") %>' 
                    OnClientClick="return confirmDelete(this);" 
                    CssClass="btn btn-danger btn-sm">
                    <i class="bi bi-trash me-1"></i>Delete
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

    </div>
    <script type="text/javascript">
    function confirmApprove(button) {
        event.preventDefault();
        Swal.fire({
            title: 'Are you sure?',
            text: "You are about to approve this request.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#28a745',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, approve it!'
        }).then((result) => {
            if (result.isConfirmed) {
                __doPostBack(button.name, '');
            }
        });
        return false;
    }

    function confirmReject(button) {
        event.preventDefault();
        Swal.fire({
            title: 'Are you sure?',
            text: "You are about to reject this request.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#dc3545',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Yes, reject it!'
        }).then((result) => {
            if (result.isConfirmed) {
                __doPostBack(button.name, '');
            }
        });
        return false;
    }

    function confirmDelete(button) {
        event.preventDefault();
        Swal.fire({
            title: 'Are you sure?',
            text: "You are about to delete this request. This action cannot be undone.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#dc3545',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                __doPostBack(button.name, '');
            }
        });
        return false;
    }

</script>

</asp:Content>
