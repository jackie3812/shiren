package Shiren::Dispatcher;

use strict;
use warnings;

use Shiren::Page::Main::Index;
use Shiren::View::Main::Index;

my $BASE_PAGE_MODULE_PATH = "Shiren::Page::";
my $BASE_VIEW_MODULE_PATH = "Shiren::View::";

sub dispatch {
	my $class = shift;
	my ($MODULE_NAME) = @_;

	my $PAGE_PATH = sprintf("%s%s", $BASE_PAGE_MODULE_PATH, $MODULE_NAME);

	return sub {
		my $env = shift;
		my $page = $PAGE_PATH->new($env);
		$page->dispatch;

		$class->view($MODULE_NAME, $page);
	}
}

# Page層とView層の橋渡し
sub view {
    my $class = shift;
	my ($MODULE_NAME, $page) = @_;

    my $request         = $page->get_request;
    my $pre_action_var  = $page->get_pre_action_var;
    my $action_var      = $page->get_action_var;
    my $post_action_var = $page->get_post_action_var;

    my $VIEW_CLASS_NAME = sprintf("%s%s", $BASE_VIEW_MODULE_PATH, $MODULE_NAME);

    $VIEW_CLASS_NAME->view($request, $pre_action_var, $action_var, $post_action_var);
}

1;

