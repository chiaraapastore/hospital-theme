<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>

    <#if section = "form">
        <div class="kc-container">
        <div id="kc-form" >

            <div id="kc-header">
                <div id="kc-header-logo-title">
                    <img src="${url.resourcesPath}/img/logo.png" alt="HospitalCare Logo" class="kc-logo"/>
                    <h1 class="kc-title">HospitalCare</h1>
                </div>
            </div>

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
        </div>
    </#if>

</@layout.registrationLayout>