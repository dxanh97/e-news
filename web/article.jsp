<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>E-News</title>
	<link rel="stylesheet" type="text/css" href="css/article.css">
	<script src="js/config.js"></script>

</head>
<body>
	<div class="e-navbar"></div>
	<div class="e-login"></div>

	<section class="container">
		<div class="article-content">
			
			<h2 class="article-title">
                <s:property value="%{article.title}" />
			</h2>

			<div class="author-info">
				<a href="">
                    <s:if test="%{author.profilePicture != null && author.profilePicture != ''}">
					<img src="data:image/jpeg;base64,<s:property value="%{author.profilePicture}"/>" class="author-profile-pic img-thumbnail"
                        width="60px" height="60px" alt="profilePicture">
                    </s:if>
                    <s:if test="%{author.profilePicture == null || author.profilePicture == ''}">
					<img src="assets/img/default-user.png" class="author-profile-pic img-thumbnail"
                        width="60px" height="60px" alt="profilePicture">
                    </s:if>
				</a>
				<span class="badge badge-primary author-name">
					<a href="">
                        <s:property value="%{author.fullName}" />
                    </a>
				</span>
				<span class="article-publish-time"><s:date name="%{article.publishTime}" format="dd/MM/yyyy" /></span>
			</div>

			<div class="content">
				<script type="text/javascript">
					// load from database
					document.write('<s:property value="%{article.articleContent}" escapeHtml="false"/>');
				</script>
			</div>
            <span class="badge badge-success article-statistic">Comments: <s:property value="%{commentList.size}"/></span>
            <span class="badge badge-success article-statistic">Read: <s:property value="%{article.viewCount}"/></span>
		</div>

		<div class="comment-section">
			
            <s:iterator var="commentDTO" value="commentList" status="counter">
			<div class="comment">
				<div class="member-info">
					<a href="viewProfile">
                        <img src="data:image/jpeg;base64,<s:property value="%{commenterList[#counter.count - 1].profilePicture}"/>" class="member-profile-pic img-thumbnail" width="60px" height="60px">
					</a>
					<span class="badge badge-default member-name">
						<a href="viewProfile"><s:property value="%{commenterList[#counter.count - 1].fullName}"/></a>
					</span>
                        <span class="comment-time"><s:date name="%{#commentDTO.publishTime}"/></span>
				</div>
				<p class="comment-content">
                    <s:property value="%{#commentDTO.commentContent}"/>
				</p>
			</div>
            </s:iterator>
            
            
            <s:if test="%{#session.USERDETAILS.profilePicture != null && #session.USERDETAILS.profilePicture != ''}">
            <form class="comment new-comment" action="comment" method="POST">
				<div class="member-info">
					<a href="manageProfile">
                        <img src="data:image/jpeg;base64,<s:property value="%{#session.USERDETAILS.profilePicture}"/>" class="member-profile-pic img-thumbnail" width="60px" height="60px">
					</a>
					<span class="badge badge-info member-name">
                        <a href="manageProfile"><s:property value="%{#session.USERDETAILS.fullName}"/></a>
					</span>
				</div>
				<div class="input-group">
                    <input type="hidden" name="articleID" value="<s:property value="%{articleID}"/>"/>
                    <input type="hidden" name="commenterEmail" value="<s:property value="%{#session.USERDETAILS.email}"/>"/>
					<input type="text" class="form-control" placeholder="Comment" name="commentContent">
					<span class="input-group-btn">
						<button class="btn btn-outline-primary" type="submit">
							Submit
						</button>
					</span>
				</div>
			</form>
            </s:if>
			

		</div>
	</section>

	<div class="e-footer"></div>
</body>
</html>