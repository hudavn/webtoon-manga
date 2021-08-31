# sources
## Login:
  + LoginPage.dart : trang login
  + components:
    - Rounded_InputFiled.dart: sử dụng form của TextfieldContainer với thuộc tính child là textfield.
    - RoundedButton.dart : tạo nút login
    - TextfieldContainer : tạo ra một form Container sử dụng cho điền email và password
## Signup
+ SignupPage.dart: trang đăng kí
+ components:
   - SignupNowbutton.dart : tạo nút 'sign up now'
   - TermsAndPolicy : tạo dòng text của terms of use and privacy policy .... và điều hướng đến trang 2 trang đó.
   - TextContainer: tạo ra một form container cho các dòng trong trang đăng kí, phải custom lại child cho phù hợp (text hoặc textfield)
## Forgot:
  + ForgetPage.dart: trang quên mật khẩu ( ở trang này sử dụng lại các components được khai báo ở Signup)
