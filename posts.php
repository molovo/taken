<?php theme_include('header'); ?>
	<?php if (current_url() == 'blog'): ?>
		<script type="text/javascript">
			window.location.href = '<?php echo base_url(); ?>category/blogs';
		</script>
	<?php endif; ?>
	<section class="grid 3of6 posts">
		<?php if(has_posts()): ?>
			<ul class="items force-grid">
				<?php while(posts()): ?>
				<?php if (current_url() == 'category/blogs'): ?>
					<li class="grid 1of1 remove-padding">
						<article>
							<h3><?php echo article_title(); ?></h3>
							<p><?php echo article_description(); ?></p>
							<a href="<?php echo article_url(); ?>" class="button">Read Now</a>
						</article>
						<hr />
					</li>
				<?php else: ?>
					<li class="grid 1of2 image-wrapper">
						<a href="<?php echo article_url(); ?>" title="<?php echo article_title(); ?>">
							<div class="grid 1of1 remove-padding img-container">
								<div class="grid 1of1 remove-padding img" style="background: url('<?php echo article_custom_field("image"); ?>') center no-repeat; background-size: cover"></div>
								<span href="<?php echo article_url(); ?>" class="button">View</span>
							</div>
							<h3><?php echo article_title(); ?></h3>
						</a>
					</li>
				<?php endif; ?>
				<?php endwhile; ?>
			</ul>
		<?php endif; ?>
	</section>
	<?php /*if (current_url() == 'category/blogs'): ?>
		<div class="grid 1of6 title ralign">
			<h2><?php echo page_name(); ?></h2>
		</div>
	<?php else: */?>
		<div class="grid 1of6 title ralign">
			<h2><?php echo ucwords(str_replace('category/', '', current_url())) ?></h2>
		</div>
	<?php //endif; ?>
