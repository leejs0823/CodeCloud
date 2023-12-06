document.addEventListener('DOMContentLoaded', function () {
	// 선
	const emailInput = document.querySelector('[name="email"]');
    const passwordInput = document.querySelector('[name="pwd"]');
	const confirmPasswordInput = document.querySelector('[name="confirmPwd"]');
    const passwordValidationMessage = document.querySelector('#passwordValidationMessage');
    const confirmPasswordValidationMessage = document.querySelector('#confirmPasswordValidationMessage');
   const emailValidationMessage = document.querySelector('#emailValidationMessage');
   
    function emailValidation() {
    const email = emailInput.value;
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    console.log(emailRegex.test(email));
    if (!emailRegex.test(email)) {
		emailValidationMessage.textContent="유효한 이메일을 입력해주세요."
		emailValidationMessage.classList.remove('valid');
        emailValidationMessage.classList.add('invalid');
        
    } else {
		emailValidationMessage.classList.add('valid');
        emailValidationMessage.classList.remove('invalid');
        
    }
}

	function updatePasswordValidationMessage() {
	    const password = passwordInput.value;
	    const containsNumber = /[0-9]/.test(password); 
	    const containsLetter = /[a-zA-Z]/.test(password);
	    const containsSpecialChar = /[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]/.test(password); 

    if (password.length >= 8 && containsNumber && containsLetter && containsSpecialChar) {
        passwordValidationMessage.textContent = '✓ 8자 이상 입력  ✓ 숫자, 영문, 특수문자 포함하여, 2개 이상 조합';
        passwordValidationMessage.classList.add('valid');
        passwordValidationMessage.classList.remove('invalid');
    } else if (password.length === 0) {
        passwordValidationMessage.textContent = '';
        passwordValidationMessage.classList.remove('valid', 'invalid');
    } else {
        passwordValidationMessage.textContent = '✗ 8자 이상 입력 ✗ 숫자, 영문, 특수문자 포함하여, 2개 이상 조합';
        passwordValidationMessage.classList.add('invalid');
        passwordValidationMessage.classList.remove('valid');
    }
}

    
    // 
    function updateConfirmPasswordValidationMessage() {
		console.log("2차 비밀번호");
        if (confirmPasswordInput.value) {
            if (passwordInput.value === confirmPasswordInput.value) {
                confirmPasswordValidationMessage.textContent = '확인 완료';
                confirmPasswordValidationMessage.classList.add('valid');
                confirmPasswordValidationMessage.classList.remove('invalid');
            } else {
                confirmPasswordValidationMessage.textContent = '동일하지 않은 비밀번호입니다 :(';
                confirmPasswordValidationMessage.classList.add('invalid');
                confirmPasswordValidationMessage.classList.remove('valid');
            }
        } else {
            confirmPasswordValidationMessage.textContent = '';
        }
    }
    emailInput.addEventListener('input', emailValidation);
    passwordInput.addEventListener('input', updatePasswordValidationMessage);
    confirmPasswordInput.addEventListener('input', updateConfirmPasswordValidationMessage);
});
