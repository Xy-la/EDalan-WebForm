        <%@ Page Title="Manage Requests" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeBehind="Requests.aspx.cs" Inherits="EDalan_WebForm.Admin.Requests" Async="true" %>

        <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <h3 class="mb-4 text-left text-primary">Manage Requests</h3>
    
            <div class="container-fluid">
                <asp:GridView ID="gvRequests" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover table-striped" OnRowCommand="gvRequests_RowCommand"  DataKeyNames="RequestId" EnablePersistedSelection="true">
            <Columns>
                <asp:BoundField DataField="RequestId" HeaderText="Request Id" SortExpression="RequestId" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:BoundField DataField="RequestDate" HeaderText="Request Date" SortExpression="RequestDate" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
                <span class='badge 
                    <%# Eval("Status").ToString() == "Approved" ? "bg-success" : 
                        Eval("Status").ToString() == "Rejected" ? "bg-danger" : 
                        "bg-warning" %>'>
                    <%# Eval("Status") %>
                </span>
            </ItemTemplate>
        </asp:TemplateField>
                <asp:BoundField DataField="User.FullName" HeaderText="Requested By" SortExpression="User.FullName" />
                <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:Button ID="btnApprove" runat="server" CommandName="Approve" CommandArgument='<%# Eval("RequestId") %>' 
                    Text="Approve" CssClass="btn btn-success btn-sm" Enabled='<%# Eval("Status").ToString() == "Pending" %>' 
                    OnClientClick='<%# "return confirmApprove(\"" + Eval("RequestId") + "\");" %>' UseSubmitBehavior="false" Visible='<%# Eval("Status").ToString() == "Pending" %>' />

                <asp:Button ID="btnReject" runat="server" CommandName="Reject" CommandArgument='<%# Eval("RequestId") %>' 
                    Text="Reject" CssClass="btn btn-danger btn-sm" Enabled='<%# Eval("Status").ToString() == "Pending" %>' 
                    OnClientClick='<%# "return confirmReject(\"" + Eval("RequestId") + "\");" %>' UseSubmitBehavior="false" Visible='<%# Eval("Status").ToString() == "Pending" %>' />
        <asp:Button ID="btnDelete" runat="server"
            CommandName="Delete"
            CommandArgument='<%# Eval("RequestId") %>'
            Text="Delete" CssClass="btn btn-danger btn-sm"
            OnClientClick='<%# "return confirmDelete(\"" + Eval("RequestId") + "\");" %>'
            UseSubmitBehavior="false"
            Visible='<%# Eval("Status").ToString() == "Approved" || Eval("Status").ToString() == "Rejected" %>' />


            </ItemTemplate>
        </asp:TemplateField>

            </Columns>
        </asp:GridView>

            </div>
            <script type="text/javascript">

                function confirmApprove(requestId) {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You want to approve this request?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Yes, approve it!',
                    cancelButtonText: 'Cancel'
                }).then((result) => {
                    if (result.isConfirmed) {
                        __doPostBack('<%= gvRequests.UniqueID %>', 'Approve$' + requestId);
                    }
                });
                return false;
            }

            function confirmReject(requestId) {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You want to reject this request?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Yes, reject it!',
                    cancelButtonText: 'Cancel'
                }).then((result) => {
                    if (result.isConfirmed) {
                        __doPostBack('<%= gvRequests.UniqueID %>', 'Reject$' + requestId);
                    }
                });
                return false; 
            }

                function confirmDelete(requestId) {
            Swal.fire({
                title: 'Are you sure?',
                text: "You want to delete this request?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    __doPostBack('<%= gvRequests.UniqueID %>', 'Delete$' + requestId);
                }
            });
            return false;
        }


        </script>

        </asp:Content>
