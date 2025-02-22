<#--
<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        <div id="kc-header-logo">
            <img src="${url.resourcesPath}/img/logo.png" alt="HospitalCare Logo" class="kc-logo"/>
        </div>
        <h2 class="kc-title">HospitalCare</h2>
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="kc-form" action="${url.loginAction}" method="post">
            <div class="kc-form-group">
                <label for="username" class="kc-label">${msg("usernameOrEmail")}</label>
                <input type="text" id="username" name="username" class="kc-input" autofocus value="${(auth.attemptedUsername!'')}" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                <#if messagesPerField.existsError('username')>
                    <span id="input-error-username" class="kc-error" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('username'))?no_esc}
                    </span>
                </#if>
            </div>
            <div class="kc-form-group kc-form-setting">
                <div id="kc-form-options" class="kc-form-options">
                    <span><a href="${url.loginUrl}" class="kc-back-link">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                </div>
                <div id="kc-form-buttons" class="kc-form-buttons">
                    <button class="kc-button kc-button-primary" type="submit">${msg("doSubmit")}</button>
                </div>
            </div>
        </form>
    <#elseif section = "info" >
        <p class="kc-info-text">
            <#if realm.duplicateEmailsAllowed>
                ${msg("emailInstructionUsername")}
            <#else>
                ${msg("emailInstruction")}
            </#if>
        </p>
    </#if>
</@layout.registrationLayout>
-->
<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <div id="kc-header" class="kc-header-container">
            <div id="kc-header-logo">
                <img src="${url.resourcesPath}/img/logo.png" alt="HospitalCare Logo" class="kc-logo"/>
            </div>
            <h1 class="kc-title">HospitalCare</h1>
        </div>
    <#elseif section = "form">
        <div id="kc-form" class="kc-container">
            <h3 class="kc-form-title">Recupero Password</h3>
            <p>Inserisci la mail associata al tuo account e riceverai un link per resettare la tua password</p>
            <#if realm.password>
                <form id="kc-form-recovery" action="${url.loginAction}" method="post">
                    <div class="kc-form-group">
                        <label for="username" class="kc-label">Email</label>
                        <input id="username" class="kc-input" name="username" type="text" autofocus autocomplete="off"/>
                    </div>

                    <div id="kc-form-buttons" class="kc-form-group">
                        <button class="kc-button kc-button-primary" name="login" id="kc-recover" type="submit">Invia</button>
                    </div>

                    <div class="kc-registration-link">
                        <a href="${url.loginUrl}" class="kc-reset-password">Torna al login</a>
                    </div>
                </form>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>