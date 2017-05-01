<#ftl encoding='UTF-8'>
<#assign security=JspTaglibs["http://www.springframework.org/security/tags"] />
<#include "header.ftl">
<div>
    <h2 class="text-center">Спортклубы</h2>
</div>
<div class="jumbotron" style="margin-top: 20px;">
    <div class="text-center">
    <@security.authorize access="hasRole('ROLE_ADMIN')">
        <label>Новый спортивный клуб для выбранного города</label>
        <form name="newsportsclub" action="/admin/catalog/sportsclubs/new" method="POST">
            <input type="hidden" name="cityid" value="${cityid}">
            <input type="text" placeholder="Название клуба" name="newsportsclubname">
            <input class="btn btn-success" type="submit" value="Добавить">
        </form>
    </@security.authorize>

        <div>
        <#if sportsClubs?has_content>
            <#list sportsClubs as s >
                <h5><a href="/catalog/sections?sportsclubid=${s.id}"> ${s.name}</a></h5>
                <@security.authorize  access="hasRole('ROLE_ADMIN')">
                    <form action="/admin/catalog/sportsclubs/delete" method="GET">
                        <input type="hidden" name="cid" value="${cityid}">
                        <input type="hidden" name="deletingsportsclubid" value="${s.id}">
                        <input class="btn btn-danger" type="submit" value="Удалить">
                    </form>
                </@security.authorize>
            </#list>
        <#else>
            <h5>К сожалению в данном разделе отсутствуют какие-либо пункты.</h5>
        </#if>
        </div>
    </div>
</div>
<#include "footer.ftl">