<div class="box block boss_block-recent-comments b_raidus">
    <div class="box-heading block-title">
        <span><?php echo $heading_title; ?></span>
    </div>
    <div class="box-content block-content">
        <?php if($articles){?>
        <ol>
            <?php foreach ($articles as $article) { ?>
            <li class="item recent-comment-item">
                <a class="comment-title" href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a>
             
                <div class="recent-comment-content">
                    <?php echo $article['comment']; ?>
                </div>  
			   <small class="time-stamp">
				<?php $date = new DateTime($article['date_added']);?>
				<?php echo $date->format('l, M j, Y');?></small>
                <span class="comment-by">Comment by <span><?php echo $article['author']; ?></span></span>         
            </li>
            <?php } ?>
        </ol>
        <?php } else {?>
        <?php echo 'There are no comments.'; ?>
        <?php } ?>
    </div>

</div>
