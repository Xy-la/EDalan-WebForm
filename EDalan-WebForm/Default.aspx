<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EDalan_WebForm._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="d-flex flex-column justify-content-center align-items-center py-5">
    <img src='<%= ResolveUrl("~/Content/images/hero-img.png") %>' alt="Landing Image" class="img-fluid mb-4" />
    <h1 class="display-6 fw-bold primary-text">
        E-DALAN :
        <span class="secondary-text">
            Barangay Management System
        </span>
    </h1>
</section>

<section class="text-center container py-5">
    <h2 class="fst-italic fs-3 fw-bold primary-text">Service Center</h2>
    <div class="row mt-2 g-4">
        <div class="col-md-6">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h5 class="card-title">Services</h5>
                    <p class="card-text">Access various services offered by the Barangay, from certificates to assistance requests.</p>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h5 class="card-title">Reports</h5>
                    <p class="card-text">Generate and access reports for better transparency and community engagement.</p>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h5 class="card-title">Communication</h5>
                    <p class="card-text">Stay connected with the Barangay through announcements and updateds.</p>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h5 class="card-title">Notifications</h5>
                    <p class="card-text">Receive timely updates and notifications from the barangay.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="text-center container py-5">
    <h2 class="fst-italic fs-3 fw-bold primary-text">Customer Feedback</h2>
    <div class="row mt-4 g-4">
        <div class="col-md-4">
            <div class="card shadow-sm border-0 p-3 rounded-4 h-100">
                <div class="d-flex align-items-center mb-3">
                    <img src='<%= ResolveUrl("~/Content/images/avatar1.jpg") %>' alt="User" class="rounded-circle me-3 avatar" width="50" height="50" />
                    <div class="text-start">
                        <h6 class="mb-0 fw-semibold">Emma Johnson</h6>
                        <small class="text-muted">3 days ago</small>
                    </div>
                    <div class="ms-auto text-warning">
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                    </div>
                </div>
                <p class="mb-0 text-start">Excellent service! Highly recommended.</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card shadow-sm border-0 p-3 rounded-4 h-100">
                <div class="d-flex align-items-center mb-3">
                    <img src='<%= ResolveUrl("~/Content/images/avatar2.jpg") %>' alt="User" class="rounded-circle me-3 avatar" width="50" height="50" />
                    <div class="text-start">
                        <h6 class="mb-0 fw-semibold">Liam Smith</h6>
                        <small class="text-muted">5 days ago</small>
                    </div>
                    <div class="ms-auto text-warning">
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                    </div>
                </div>
                <p class="mb-0 text-start">Quick response and very friendly staff!</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card shadow-sm border-0 p-3 rounded-4 h-100">
                <div class="d-flex align-items-center mb-3">
                    <img src='<%= ResolveUrl("~/Content/images/avatar3.jpg") %>' alt="User" class="rounded-circle me-3 avatar" width="50" height="50" />
                    <div class="text-start">
                        <h6 class="mb-0 fw-semibold">Sophia Davis</h6>
                        <small class="text-muted">1 week ago</small>
                    </div>
                    <div class="ms-auto text-warning">
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                    </div>
                </div>
                <p class="mb-0 text-start">Very professional and easy to deal with.</p>
            </div>
        </div>
    </div>
</section>
</asp:Content>
