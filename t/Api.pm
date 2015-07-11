package t::Api;
use Mojo::Base 'Mojolicious::Controller';

our $RES  = {};
our $CODE = 200;

sub test_file {
  my ($c, $args, $cb) = @_;
  $c->$cb('dummy data');
}

sub boolean_in_url {
  my ($c, $args, $cb) = @_;
  $c->$cb({p1 => $args->{p1}, q1 => $args->{q1}});
}

sub ip_in_url {
  my ($c, $args, $cb) = @_;
  $c->$cb({ip => $args->{ip}});
}

sub list_pets {
  my ($c, $args, $cb) = @_;
  $c->$cb($RES, $CODE);
}

sub show_pet_by_id {
  my ($c, $args, $cb) = @_;
  $RES->{id} = $args->{petId};
  $c->$cb($RES, $CODE);
}

sub get_pet {
  my ($c, $args, $cb) = @_;
  return $c->$cb('', 201) if $CODE eq '201';
  return $c->$cb($RES, $CODE);
}

sub add_pet {
  my ($c, $args, $cb) = @_;
  $RES->{name} = $args->{data}{name} if ref $args->{data} eq 'HASH';
  $c->$cb($RES, $CODE);
}

sub update_pet {
  my ($c, $args, $cb) = @_;
  $c->$cb($RES, $CODE);
}

sub with_defaults {
  my ($c, $args, $cb) = @_;
  $c->$cb({ip => $args->{ip}, x => $args->{x}});
}

1;
