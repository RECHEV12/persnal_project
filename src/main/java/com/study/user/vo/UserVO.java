package com.study.user.vo;

import com.study.attach.vo.AttachVO;

public class UserVO {
    private String userId           ;            /*아이디        */
    private String userName         ;            /*이름          */
    private String userPass         ;            /*비밀번호      */
    private String userBirth        ;            /*생년월일      */
    private String userGender       ;            /*성별          */
    private String userHp           ;            /*전화번호      */
    private String userEmail        ;            /*이메일        */
    private int userZip             ;            /*우편번호      */
    private String userAdd1         ;            /*주소1         */
    private String userAdd2         ;            /*주소2         */
    private String userClass        ;            /*판매자여부     */
    private String userRegDate      ;            /*등록일자       */
    private String userLogin        ;            /*로그인여부     */
    private String userOut          ;            /*탈퇴여부       */
    private String userIntroduce    ;            /*프로필내용     */
    private AttachVO userAttach    ;             /*유저프로필아이콘*/

    public UserVO() {
    }

    public UserVO(String userId, String userName, String userPass, String userBirth, String userGender, String userHp, String userEmail, int userZip, String userAdd1, String userAdd2, String userClass, String userRegDate, String userLogin, String userOut,  String userIntroduce) {
        this.userId = userId;
        this.userName = userName;
        this.userPass = userPass;
        this.userBirth = userBirth;
        this.userGender = userGender;
        this.userHp = userHp;
        this.userEmail = userEmail;
        this.userZip = userZip;
        this.userAdd1 = userAdd1;
        this.userAdd2 = userAdd2;
        this.userClass = userClass;
        this.userRegDate = userRegDate;
        this.userLogin = userLogin;
        this.userOut = userOut;
        this.userIntroduce = userIntroduce;
    }

    @Override
    public String toString() {
        return "UserVO{" +
                "userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", userPass='" + userPass + '\'' +
                ", userBirth='" + userBirth + '\'' +
                ", userGender='" + userGender + '\'' +
                ", userHp='" + userHp + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userZip=" + userZip +
                ", userAdd1='" + userAdd1 + '\'' +
                ", userAdd2='" + userAdd2 + '\'' +
                ", userClass='" + userClass + '\'' +
                ", userRegDate='" + userRegDate + '\'' +
                ", userLogin='" + userLogin + '\'' +
                ", userOut='" + userOut + '\'' +
                ", userIntroduce='" + userIntroduce + '\'' +
                '}';
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getUserBirth() {
        return userBirth;
    }

    public void setUserBirth(String userBirth) {
        this.userBirth = userBirth;
    }

    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    public String getUserHp() {
        return userHp;
    }

    public void setUserHp(String userHp) {
        this.userHp = userHp;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public int getUserZip() {
        return userZip;
    }

    public void setUserZip(int userZip) {
        this.userZip = userZip;
    }

    public String getUserAdd1() {
        return userAdd1;
    }

    public void setUserAdd1(String userAdd1) {
        this.userAdd1 = userAdd1;
    }

    public String getUserAdd2() {
        return userAdd2;
    }

    public void setUserAdd2(String userAdd2) {
        this.userAdd2 = userAdd2;
    }

    public String getUserClass() {
        return userClass;
    }

    public void setUserClass(String userClass) {
        this.userClass = userClass;
    }

    public String getUserRegDate() {
        return userRegDate;
    }

    public void setUserRegDate(String userRegDate) {
        this.userRegDate = userRegDate;
    }

    public String getUserLogin() {
        return userLogin;
    }

    public void setUserLogin(String userLogin) {
        this.userLogin = userLogin;
    }

    public String getUserOut() {
        return userOut;
    }

    public void setUserOut(String userOut) {
        this.userOut = userOut;
    }


    public String getUserIntroduce() {
        return userIntroduce;
    }

    public void setUserIntroduce(String userIntroduce) {
        this.userIntroduce = userIntroduce;
    }

    public AttachVO getUserAttach() {
        return userAttach;
    }

    public void setUserAttach(AttachVO userAttach) {
        this.userAttach = userAttach;
    }
}
