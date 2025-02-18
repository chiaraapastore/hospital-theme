<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <div id="kc-header-logo">
            <img src="${url.resourcesPath}/img/logo.png" alt="HospitalCare Logo" class="kc-logo"/>

        </div>
        <h2 class="kc-title">HospitalCare</h2>
    <#elseif section = "form">
        <div id="kc-form" class="kc-background">
            <div id="kc-form-wrapper">
                <#if realm.password>
                    <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                        <#if !usernameHidden??>
                            <div class="kc-form-group">
                                <label for="username" class="kc-label">${msg("usernameOrEmail")}</label>
                                <input tabindex="1" id="username" class="kc-input" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" />
                                <#if messagesPerField.existsError('username','password')>
                                    <span class="kc-error">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</span>
                                </#if>
                            </div>
                        </#if>

                        <div class="kc-form-group">
                            <label for="password" class="kc-label">${msg("password")}</label>
                            <input tabindex="2" id="password" class="kc-input" name="password" type="password" autocomplete="off" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" />
                        </div>

                        <div class="kc-form-group kc-form-setting">
                            <#if realm.rememberMe && !usernameHidden??>
                                <div class="kc-checkbox">
                                    <label>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" <#if login.rememberMe??>checked</#if>> ${msg("rememberMe")}
                                    </label>
                                </div>
                            </#if>
                            <#if realm.resetPasswordAllowed>
                                <a tabindex="5" href="${url.loginResetCredentialsUrl}" class="kc-reset-password">${msg("doForgotPassword")}</a>
                            </#if>
                        </div>

                        <div id="kc-form-buttons" class="kc-form-group">
                            <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                            <button tabindex="4" class="kc-button kc-button-primary" name="login" id="kc-login" type="submit">${msg("doLogIn")}</button>
                        </div>
                    </form>
                </#if>
            </div>
        </div>

    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
