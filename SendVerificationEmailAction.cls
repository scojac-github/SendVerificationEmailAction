/***
*
* A wrapper around Apex API to send verification email to a user to verify their email address
* Exposed as an invocable action.
*
* Run the following SOQL Query to see who has/has not verified their email address
* SELECT Id, UserId, HasUserVerifiedEmailAddress FROM TwoFactorMethodsInfo
*
***/

global class SendVerificationEmailAction {
    @InvocableMethod(label='Send Verification Email' category='Email' description='Send email to users to verify their email address')

    public static void sendEmail(List<FlowInput> inputs) {
        for(FlowInput inp : inputs) {
            System.UserManagement.sendAsyncEmailConfirmation (
                inp.userId,
                inp.EmailTemplateId,
                inp.networkId,
                inp.landingPageUrl
            );
        }
    }

    @TestVisible
    global class FlowInput {
        @InvocableVariable(required=true) public Id userId;
        @InvocableVariable public Id EmailTemplateId;
        @InvocableVariable public Id networkId;
        @InvocableVariable public String landingPageUrl;
    }
}