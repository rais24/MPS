<div class="box block boss_blog-cat b_raidus b_first">
  <div class="box-heading block-title">
    <span><?php echo $heading_title; ?></span>
  </div>
  <div class="box-content">
    <div class="box-category">
        <?php if($categories){?>
      <ul>
        <?php foreach ($categories as $category) { ?>
        <li >
          <?php if ($category['blog_category_id'] == $blog_category_id) { ?>
          <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
          <?php } ?>
          <?php if ($category['children']) { ?>
          <ul>
            <?php foreach ($category['children'] as $child) { ?>
            <li >
              <?php if ($child['blog_category_id'] == $child_id) { ?>
              <a href="<?php echo $child['href']; ?>" class="active"><i class="fa fa-angle-double-right"></i><?php echo $child['name']; ?></a>
              <?php } else { ?>
              <a href="<?php echo $child['href']; ?>"><i class="fa fa-angle-double-right"></i><?php echo $child['name']; ?></a>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
      <?php } else {?>
        <?php echo 'There are no Category.'; ?>
        <?php } ?>
    </div>
  </div>
</div>
