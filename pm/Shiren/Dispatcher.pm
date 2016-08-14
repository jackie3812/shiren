package Shiren::Dispatcher;

use strict;
use warnings;

use Shiren::Page::Sample;
use Shiren::View::Sample;

use Shiren::Page::Index;
use Shiren::View::Index;
use Shiren::Page::Signup::Index;
use Shiren::View::Signup::Index;
use Shiren::Page::Signup::Exec;
use Shiren::Page::Signin::Index;
use Shiren::View::Signin::Index;
use Shiren::Page::Signin::Exec;
use Shiren::Page::Main::Signout;
use Shiren::Page::Main::Profile;
use Shiren::View::Main::Profile;

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

		# redirectが発生したらここで返す
		return $class->redirect($page) if $page->has_redirect;

		$class->view($MODULE_NAME, $page);
	}
}

sub redirect {
	my $class = shift;
	my ($page) = @_;
	return $page->redirect_value;
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

