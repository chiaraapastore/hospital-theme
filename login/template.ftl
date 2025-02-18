<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
    <!DOCTYPE html>
    <html class="kc-html">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="robots" content="noindex, nofollow">
        <title>HospitalCare - ${msg("loginTitle",(realm.displayName!''))}</title>
        <link href="${url.resourcesPath}/css/login.css" rel="stylesheet" />
    </head>

    <body class="kc-body">
    <div class="kc-container">
        <div id="kc-header" class="kc-header">
            <div id="kc-header-wrapper">
                <img src="${url.resourcesPath}/img/logo.png" alt="HospitalCare Logo" class="kc-logo"/>
                <h1 class="kc-title">HospitalCare</h1>
            </div>
        </div>
        <div class="kc-form-card">
            <header class="kc-form-header">
                <h2 id="kc-page-title"><#nested "header"></h2>
            </header>
            <div id="kc-content">
                <div id="kc-content-wrapper">
                    <#if displayMessage && message?has_content>
                        <div class="kc-alert kc-alert-${message.type}">
                            <span class="kc-alert-text">${kcSanitize(message.summary)?no_esc}</span>
                        </div>
                    </#if>
                    <#nested "form">
                    <#nested "socialProviders">
                    <#if displayInfo>
                        <div id="kc-info" class="kc-info">
                            <div id="kc-info-wrapper">
                                <#nested "info">
                            </div>
                        </div>
                    </#if>
                </div>
            </div>
        </div>
    </div>
    </body>
    </html>
</#macro>
