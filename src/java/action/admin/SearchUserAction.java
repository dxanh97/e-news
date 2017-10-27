/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action.admin;

import java.util.ArrayList;

import article.ArticleDTO;
import user.UserDAO;
import userdetails.UserDetailsDAO;
import userdetails.UserDetailsDTO;
import role.RoleDAO;

/**
 *
 * @author dangxuananh1997
 */
public class SearchUserAction {
    
    //Inputs
    private String searchValue;
    private int pageNumber = 1;  //Display 10 article in this page | Default: 1
    
    //Outputs
    private ArrayList<UserDetailsDTO> userList;
    private ArrayList<String> roleList;
    private int numberOfPages;      //Number of pagination page
    private final int tab = 5;      //Tab number
    
    //Return
    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    
    
    public SearchUserAction() {
    }
    
    public String execute() throws Exception {

        UserDetailsDAO dao = new UserDetailsDAO();
        RoleDAO roleDao = new RoleDAO();
        ArrayList<UserDetailsDTO> tempUserList = dao.searchUser(searchValue);

        //get pageOfNumber
        numberOfPages = tempUserList.size() / 10 + 1;

        //get userList
        for (int i = pageNumber * 10 - 10; i < pageNumber * 10 && i < tempUserList.size(); i++) {
            this.userList.add(userList.get(i));
        }

        //get roleList
        roleList = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            roleList.add(roleDao.getRoleName(userList.get(i).getEmail()));
        }

        return SUCCESS;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public ArrayList<UserDetailsDTO> getUserList() {
        return userList;
    }

    public void setUserList(ArrayList<UserDetailsDTO> userList) {
        this.userList = userList;
    }

    public ArrayList<String> getRoleList() {
        return roleList;
    }

    public void setRoleList(ArrayList<String> roleList) {
        this.roleList = roleList;
    }

    public int getNumberOfPages() {
        return numberOfPages;
    }

    public void setNumberOfPages(int numberOfPages) {
        this.numberOfPages = numberOfPages;
    }
    
}
