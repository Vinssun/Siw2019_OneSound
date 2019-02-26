$(function() {
    var owner = $('#owner');
    var cardNumber = $('#cardNumber');
    var cardNumberField = $('#card-number-field');
    var CVV = $("#cvv");
    var mastercard = $("#mastercard");
    var confirmButton = $('#confirm-purchase');
    var visa = $("#visa");
    var amex = $("#amex");

    // Use the payform library to format and validate
    // the payment fields.

    cardNumber.payform('formatCardNumber');
    CVV.payform('formatCardCVC');


    cardNumber.keyup(function() {

        amex.removeClass('transparent');
        visa.removeClass('transparent');
        mastercard.removeClass('transparent');

        if ($.payform.validateCardNumber(cardNumber.val()) == false) {
            cardNumberField.addClass('has-error');
        } else {
            cardNumberField.removeClass('has-error');
            cardNumberField.addClass('has-success');
        }

        if ($.payform.parseCardType(cardNumber.val()) == 'visa') {
            mastercard.addClass('transparent');
            amex.addClass('transparent');
        } else if ($.payform.parseCardType(cardNumber.val()) == 'amex') {
            mastercard.addClass('transparent');
            visa.addClass('transparent');
        } else if ($.payform.parseCardType(cardNumber.val()) == 'mastercard') {
            amex.addClass('transparent');
            visa.addClass('transparent');
        }
    });

    confirmButton.click(function(e) {

        e.preventDefault();

        var isCardValid = $.payform.validateCardNumber(cardNumber.val());
        var isCvvValid = $.payform.validateCardCVC(CVV.val());
        var valid = 1
        if(owner.val().length < 5){
        	owner.removeClass('white');
            owner.addClass('error');
            valid = 0
        }else{
        	owner.removeClass('error');
        	owner.addClass('success');
        }
        if (!isCardValid) {
        	cardNumber.removeClass('white');
        	cardNumber.addClass('error');
        	valid = 0
        }else{
        	cardNumber.removeClass('error');
        	cardNumber.addClass('success');
        }
        if (!isCvvValid) {
        	CVV.removeClass('error');
        	CVV.addClass('error');
        	valid = 0
        }else{
        	CVV.removeClass('error');
        	CVV.addClass('success');
        }
       	if(valid ==1){
            //alert("Everything is correct");
       		$("#confirm-purchase").on("click",function(){
       			$.ajax({
       				type : 'Post',
       				url : "diventaPremium",
       				
       				success : function(data) {
       					alert("ook")
       					
       					$(".spinner").fadeOut();
       					//$('.spinner').css('display', 'none');
       					//$('#contenitore').css('display', 'block');
       					$('#contenitore').fadeIn()
       					$('#contenitore').html(data);
       				},
       				beforeSend : function() {
       					$('.fade').each(function(){
       						$(this).remove()
       					})
       					$('#payModal').modal("hide")
       					$(".spinner").fadeIn();
       					//$('.spinner').css('display', 'block');
       					//$('#contenitore').css('display', 'none');
       					$('#contenitore').fadeOut()
       				},
       				
       				error : function() {
       					window.location.href = "pageNotFound.jsp";
       				}
       				
       			});
       		});
        }
    });
});


