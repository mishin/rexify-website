package WebApp;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  $self->helper(keywords => sub { return ""; });

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->route('/')->to('content#index');

  $r->route('/*')->to('content#serve');
}

1;