resource openstack_compute_instance_v2 file_server {
  name            = "file_server"
  image_id        = data.openstack_images_image_v2.nfs_base_image.id
  flavor_name       = var.NFS_FLAVOR_NAME
  key_pair        = var.NFS_KEYPAIR_NAME
  security_groups = ["jupytercloud_default", "jupytercloud_nfs"]

  network {
    name = data.openstack_networking_network_v2.private.name
  }
}