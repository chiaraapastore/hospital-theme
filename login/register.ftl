<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        <div id="kc-header" class="kc-header-container">
            <div id="kc-header-logo">
                <img src="${url.resourcesPath}/img/logo.png" alt="HospitalCare Logo" class="kc-logo"/>
            </div>
            <h1 class="kc-title">HospitalCare</h1>
        </div>
    <#elseif section = "form">
        <div id="kc-form" class="kc-container">
            <h3 class="kc-form-title">Registrazione</h3>
            <form id="kc-register-form" action="${url.registrationAction}" method="post">
                <div class="kc-form-group">
                    <label for="firstName" class="kc-label">Nome</label>
                    <input type="text" id="firstName" class="kc-input" name="firstName" value="${(register.formData.firstName!'')}"/>
                </div>
                <div class="kc-form-group">
                    <label for="lastName" class="kc-label">Cognome</label>
                    <input type="text" id="lastName" class="kc-input" name="lastName" value="${(register.formData.lastName!'')}"/>
                </div>
                <div class="kc-form-group">
                    <label for="email" class="kc-label">Email</label>
                    <input type="text" id="email" class="kc-input" name="email" value="${(register.formData.email!'')}"/>
                </div>
                <div class="kc-form-group">
                    <label for="username" class="kc-label">Nome Utente</label>
                    <input type="text" id="username" class="kc-input" name="username" value="${(register.formData.username!'')}"/>
                </div>
                <div class="kc-form-group">
                    <label for="password" class="kc-label">Password</label>
                    <input type="password" id="password" class="kc-input" name="password"/>
                </div>
                <div class="kc-form-group">
                    <label for="password-confirm" class="kc-label">Conferma Password</label>
                    <input type="password" id="password-confirm" class="kc-input" name="password-confirm"/>
                </div>
                <div class="kc-form-group">
                    <a href="${url.loginUrl}" class="kc-reset-password">Torna al login</a>
                </div>
                <div id="kc-form-buttons" class="kc-form-group">
                    <button class="kc-button kc-button-primary" type="submit">Iscriviti</button>
                </div>
            </form>
        </div>
    </#if>
</@layout.registrationLayout>
