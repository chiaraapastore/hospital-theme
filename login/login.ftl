<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>

    <#if section = "form">
        <div class="kc-container">
        <div id="kc-form" >
            <div id="kc-header">
                <div id="kc-header-logo-title">
                    <img src="${url.resourcesPath}/img/logo.png" alt="HospitalCare Logo" class="kc-logo"/>
                    <h1 class="kc-title">HospitalCare</h1>
                </div>
            </div>

            <h3 class="kc-form-title">Login</h3>
            <#if realm.password>
                <form id="kc-form-login" action="${url.loginAction}" method="post">
                    <#if !usernameHidden??>
                        <div class="kc-form-group">
                            <label for="username" class="kc-label">Email o Username</label>
                            <input id="username" class="kc-input" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off"/>
                        </div>
                    </#if>

                    <div class="kc-form-group">
                        <label for="password" class="kc-label">Password</label>
                        <input id="password" class="kc-input" name="password" type="password" autocomplete="off"/>
                    </div>

                    <#if realm.resetPasswordAllowed>
                        <a href="${url.loginResetCredentialsUrl}" class="kc-reset-password">Hai dimenticato la password?</a>
                    </#if>

                    <div id="kc-form-buttons" class="kc-form-group">
                        <button class="kc-button kc-button-primary" name="login" id="kc-login" type="submit">Accedi</button>
                    </div>

                    <div class="kc-registration-link">
                        <span>Devi ancora registrarti?
                            <a href="${url.registrationUrl}" class="kc-registration-text">Crea un account</a>
                        </span>
                    </div>
                </form>
            </#if>
         </div>
        </div>
    </#if>
</@layout.registrationLayout>
