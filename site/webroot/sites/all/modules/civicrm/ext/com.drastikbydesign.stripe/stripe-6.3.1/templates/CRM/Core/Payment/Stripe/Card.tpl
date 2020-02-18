{* https://civicrm.org/licensing *}

{* Manually create the CRM.vars.stripe here for drupal webform because \Civi::resources()->addVars() does not work in this context *}
{literal}
<script type="text/javascript">
  CRM.$(function($) {
    $(document).ready(function() {
      if (typeof CRM.vars.stripe === 'undefined') {
        var stripe = {{/literal}{foreach from=$stripeJSVars key=arrayKey item=arrayValue}{$arrayKey}:'{$arrayValue}',{/foreach}{literal}};
        CRM.vars.stripe = stripe;
      }
    });
  });
</script>
{/literal}

{* Add the components required for a Stripe card element *}
{crmScope extensionKey='com.drastikbydesign.stripe'}
<label for="card-element"><legend>{ts}Credit or debit card{/ts}</legend></label>
<div id="card-element"></div>
{* Area for Stripe to report errors *}
<div id="card-errors" role="alert" class="crm-error alert alert-danger"></div>
{/crmScope}
