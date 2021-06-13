package com.entropy.backend.common.constants;

/**
 * @author bac-ta
 */
public class APIMessage {
    //Common
    public static final String PASSWORD_NOT_MATCH = "Password and confirm password not match";
    public static final String PASSWORD_NOT_BLANK = "Password must be not blank";
    public static final String EMAIL_NOT_BLANK = "Email must be not blank";
    public static final String NAME_NOT_BLANK = "Name must be not blank";
    public static final String REPEAT_PASSWORD_NOT_BLANK = "Repeat password must not blank";
    public static final String USER_TYPE_NOT_EMPTY = "User type must be not empty";
    public static final String USER_NAME_NOT_BLANK = "User name must be not blank";
    public static final String CREATE_FILEDIR_ERROR = "Could not create the directory where the uploaded files will be stored.";
    public static final String FILE_INVALID_PATH_SEQUENCE = "Sorry! Filename contains invalid path sequence ";
    public static final String FILE_NOT_STORE = "Could not store file %s . Please try again!";
    public static final String FILE_NOT_FOUND = "File not found %s";
    public static final String STATUS_TYPE_INVALID = "Status type invalid";
    public static final String NOT_DETERMINE_FILE_TYPE = "Could not determine file type";
    public static final String FILE_TYPE_INVALID = "File type is invalid";
    public static final String PARAMS_INVALID = "Params is invalid";

    //Authenticate
    public static String RESOURCE_NOT_FOUND = "%s not found with %s : '%s'";
    public static String LOGIN_SUCCESSFUL = "Login successful";
    public static String ENDTRY_POINT_UNAUTHORIZED = "Responding with unauthorized error. Message - {}";
    public static String ACCOUNT_INVALID = "Account invalid, please try again !";
    public static String OAUTH2_UNAUTHORIZED = "Sorry! We've got an Unauthorized Redirect URI and can't proceed with the authentication";

    //User
    public static final String REGIST_USER_SUCCESSFUL = "Register user is successful";
    public static final String REGIST_USER_FAIL = "Register user is failure";
    public static final String APPROVE_TYPE_INVALID = "Approve type invalid";
    public static final String USER_TYPE_INVALID = "User type invalid";
    public static final String OAUTH2_TYPE_INVALID = "OAuth2 type invalid";
    public static final String FIELD_ALREADY_EXIST = "This % used by another user, please try with other information";
    public static final String GENDER_INVALID = "The gender is invalid that must be in [MALE, FEMALE, OTHER]";

    //Post
    public static final String POST_ID_INVALID = "Post id not valid";
    public static final String CREATE_POST_FAILURE = "Create post failure";
    public static final String CREATE_POST_SUCCESSFUL = "Create post successful";
    public static final String UPDATE_POST_FAILURE = "Update post failure";
    public static final String UPDATE_POST_SUCCESSFUL = "Update post successful";
    public static final String PUBLISH_TYPE_INVALID = "Publish type invalid";
    public static final String POST_TITLE_EXIST = "Post title exist, please try again with other title";
    public static final String POST_NOT_FOUND = "Post not found";

    //Category
    public static final String CREATE_CATEGORY_SUCCESSFUL = "Create category successful";
    public static final String CREATE_CATEGORY_FAILURE = "Create category failure";
    public static final String CATEGORY_TYPE_INVALID = "Category type invalid";
    public static final String CATEGORY_ID_NOT_EXIST = "Category Id not exist";

    //Refresh token
    public static final String REFRESH_TOKEN_EXPIRE = "Refresh token was expired. Please make a new signing request";
}
