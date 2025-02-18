<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        <div id="kc-header-logo">
            <img src="${url.resourcesPath}/img/logo.png" alt="HospitalCare Logo" class="kc-logo"/>
        </div>
        <h2 class="kc-title">HospitalCare</h2>
        ${msg("registerTitle")}
    <#elseif section = "form">
        <form id="kc-register-form" class="kc-form" action="${url.registrationAction}" method="post">
            <div class="kc-form-group">
                <label for="firstName" class="kc-label">${msg("firstName")}</label>
                <input type="text" id="firstName" class="kc-input" name="firstName" value="${(register.formData.firstName!'')}" aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"/>
            </div>

            <div class="kc-form-group">
                <label for="lastName" class="kc-label">${msg("lastName")}</label>
                <input type="text" id="lastName" class="kc-input" name="lastName" value="${(register.formData.lastName!'')}" aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"/>
            </div>

            <div class="kc-form-group">
                <label for="email" class="kc-label">${msg("email")}</label>
                <input type="text" id="email" class="kc-input" name="email" value="${(register.formData.email!'')}" autocomplete="email" aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"/>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="kc-form-group">
                    <label for="username" class="kc-label">${msg("username")}</label>
                    <input type="text" id="username" class="kc-input" name="username" value="${(register.formData.username!'')}" autocomplete="username" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                </div>
            </#if>

            <#if passwordRequired??>
                <div class="kc-form-group">
                    <label for="password" class="kc-label">${msg("password")}</label>
                    <input type="password" id="password" class="kc-input" name="password" autocomplete="new-password" aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"/>
                </div>

                <div class="kc-form-group">
                    <label for="password-confirm" class="kc-label">${msg("passwordConfirm")}</label>
                    <input type="password" id="password-confirm" class="kc-input" name="password-confirm" aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"/>
                </div>
            </#if>

            <div class="kc-form-group">
                <div id="kc-form-options" class="kc-form-options">
                    <span><a href="${url.loginUrl}" class="kc-back-link">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                </div>
                <div id="kc-form-buttons" class="kc-form-buttons">
                    <button class="kc-button kc-button-primary" type="submit">${msg("doRegister")}</button>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
