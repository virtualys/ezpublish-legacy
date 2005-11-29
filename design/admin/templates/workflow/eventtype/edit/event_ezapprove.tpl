<div class="block">

{* Sections *}
<div class="element">
    <label>{'Affected sections'|i18n( 'design/admin/workflow/eventtype/edit' )}:</label>
    <select name="WorkflowEvent_event_ezapprove_section_{$event.id}[]" size="5" multiple="multiple">
    <option value="-1"
         {section show=and( $event.selected_sections|count()|eq( 1 ), $event.selected_sections[0]|eq( '' ) )}
             selected="selected"
         {section-else}
             {section show=$event.selected_sections|contains( -1 )} selected="selected"{/section}
         {/section}>
    {'All sections'|i18n( 'design/admin/workflow/eventtype/edit' )}</option>
    {section var=Sections loop=$event.workflow_type.sections}
    <option value="{$Sections.item.value}"{section show=$event.selected_sections|contains( $Sections.item.value )} selected="selected"{/section}>{$Sections.item.name|wash}</option>
    {/section}
    </select>
</div>

{* User who functions as approver *}
<div class="block">
<fieldset>
<legend>{'User who approves content'|i18n( 'design/admin/workflow/eventtype/edit' )}</legend>
{section show=$event.selected_users}
<table class="list" cellspacing="0">
<tr>
<th class="tight">&nbsp;</th>
<th>{'User'|i18n( 'design/admin/workflow/eventtype/edit' )}</th>
</tr>
{section var=User loop=$event.selected_users sequence=array( bglight, bgdark )}
<tr class="{$User.sequence}">
<td><input type="checkbox" name="DeleteUserIDArray_{$event.id}[]" value="{$User.item}" />
    <input type="hidden" name="WorkflowEvent_event_user_id_{$event.id}[]" value="{$User.item}" /></td>
<td>{fetch(content, object, hash( object_id, $User.item)).name|wash}</td>
</tr>
{/section}
</table>
{section-else}
<p>{'No user selected.'|i18n( 'design/admin/workflow/eventtype/edit' )}</p>
{/section}

<input class="button" type="submit" name="CustomActionButton[{$event.id}_RemoveUser]" value="{'Remove selected'|i18n( 'design/admin/workflow/eventtype/edit' )}"
       {section show=$event.selected_users|not}disabled="disabled"{/section} />
<input class="button" type="submit" name="CustomActionButton[{$event.id}_AddUser]" value="{'Add user'|i18n( 'design/admin/workflow/eventtype/edit' )}"
       {section show=$event.selected_users}disabled="disabled"{/section} />

</fieldset>
</div>

{* Excluded users & groups *}
<div class="block">
<fieldset>
<legend>{'Excluded user groups ( users in these groups do not need to have their content approved )'|i18n( 'design/admin/workflow/eventtype/edit' )}</legend>
{section show=$event.selected_usergroups}
<table class="list" cellspacing="0">
<tr>
<th class="tight">&nbsp;</th>
<th>{'User and user groups'|i18n( 'design/admin/workflow/eventtype/edit' )}</th>
</tr>
{section var=User loop=$event.selected_usergroups sequence=array( bglight, bgdark )}
<tr class="{$User.sequence}">
<td><input type="checkbox" name="DeleteExcludeUserIDArray_{$event.id}[]" value="{$User.item}" />
    <input type="hidden" name="WorkflowEvent_event_user_id_{$event.id}[]" value="{$User.item}" /></td>
<td>{fetch(content, object, hash( object_id, $User.item)).name|wash}</td>
</tr>
{/section}
</table>
{section-else}
<p>{'No groups selected.'|i18n( 'design/admin/workflow/eventtype/edit' )}</p>
{/section}

<input class="button" type="submit" name="CustomActionButton[{$event.id}_RemoveExcludeUser]" value="{'Remove selected'|i18n( 'design/admin/workflow/eventtype/edit' )}"
       {section show=$event.selected_usergroups|not}disabled="disabled"{/section} />
<input class="button" type="submit" name="CustomActionButton[{$event.id}_AddExcludeUser]" value="{'Add groups'|i18n( 'design/admin/workflow/eventtype/edit' )}" />

</fieldset>
</div>

</div>
