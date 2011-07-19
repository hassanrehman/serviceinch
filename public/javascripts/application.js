function validateRequired(selector) {
    if( $(selector).val().length < 1 ) {
        $(selector).css('border-color', 'red');
        return false;
    }
    $(selector).css('border-color', '#BDB597');
    return true;
}

function validateCustomerForm() {
    if( !validateRequired('#customer_company_name') ) return false;
    return true;
}

function validateTicketForm() {
    if( !validateRequired('#ticket_subject') ) return false;
    return true;
}

function validateTicketCategoryForm() {
    if( !validateRequired('#ticket_category_name') ) return false;
    return true;
}

function validateAgentForm() {
    if( !validateRequired('#user_login') ) return false;
    if( !validateRequired('#user_email') ) return false;
    if( !validateRequired('#user_password') ) return false;

    //custome validators
    if( $('#user_password').val() != $('#user_password_confirmation').val() ) {
        $('#user_password').css('border-color', 'red');
        $('#user_password_confirmation').css('border-color', 'red');
        return false;
    }
    $('#user_password').css('border-color', '#BDB597');
    $('#user_password_confirmation').css('border-color', '#BDB597');
    return true;
}

