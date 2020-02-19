{* Template for terms and conditions field to insert into Event and Contribution forms *}
<fieldset class="crm-gdpr-terms-conditions" id="gdpr-terms-conditions">
  <div class="crm-section">
    <div class="label">
      <label>{ts}Terms &amp; Conditions{/ts}
        <span class="crm-marker" title="This field is required">*</span>
      </label>
    </div>
    <div class="content">
      <div class="terms-conditions-acceptance-intro">
       {$terms_conditions.intro}
      </div>
   </div>
  </div>{* end crm-section *}
  <div class="clear"></div>
  {if $terms_conditions.links.global}
   <div class="crm-section">
    {assign var="link" value=$terms_conditions.links.global}
      <div class="label"><label></label></div>
      <div class="content terms-conditions-item">
        <a href="{$link.url}" class="terms-conditions-link" target="blank">{$link.label}</a>
        <div class="terms-conditions-checkbox">
          {$form.accept_tc.html}
        </div>
      </div>
    </div> {* end .crm-section *}
    <div class="clear"></div>
  {/if}
  {if $terms_conditions.links.entity}
    {assign var="link" value=$terms_conditions.links.entity}
    <div class="crm-section">
      <div class="label"><label></label></div>
      <div class="content terms-conditions-item">
        <a href="{$link.url}" class="terms-conditions-link" target="blank">{$link.label}</a>
        <div class="terms-conditions-checkbox">
          {$form.accept_entity_tc.html}
        </div>
      </div>
    </div>{* end .crm-section *}
    <div class="clear"></div>
  {/if}
</fieldset>
{literal}
<script type="text/javascript">
  (function($) {
    var field = $('#gdpr-terms-conditions');
    var tncPosition = {/literal}'{$terms_conditions.position}'{literal};
    if (tncPosition == 'formTop' && $('form .crm-section:first').length) {
      $('form .crm-section:first').prepend(field);
    } else if (tncPosition == 'customPre' && $('form .custom_pre-section:first, form .custom_pre_profile-group:first').length) {
      $('form .custom_pre-section:first, form .custom_pre_profile-group:first').after(field);
    } else if (tncPosition == 'customPost' && $('form .custom_post-section:first,form .custom_post_profile-group:first').length) {
      $('form .custom_post-section:first,form .custom_post_profile-group:first').after(field);
    } else if ($('form #crm-submit-buttons:last').length) {
      $('form #crm-submit-buttons:last').before(field);
    } else {
      console.log("Error: Couldn't find a place to position terms and conditions");
    }
  })(CRM.$ || cj || jQuery);
</script>
{/literal}
