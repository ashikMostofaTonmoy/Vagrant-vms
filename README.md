# Some Common vagrant commands

Useful links :

1. [Vagrant Cheat Sheet + Get Started with Vagrant](https://www.pluralsight.com/resources/blog/cloud/vagrant-cheat-sheet-get-started-with-vagrant)
2. [vagrant-cheat-sheet.md](https://gist.github.com/ashikMostofaTonmoy/2990e9036f58d81fe04a4578b965fb72)

> NB: Default password of the vagrant machine is `vagrant`

* Check status of the vm described in `vagrant` file.

```sh
vagrant status
```

* Starting vm for the first time. If any error occers, then you can use this too. for second times it won't change your other configuration.

```sh
vagrant up
```

* Restarts vagrant machine, loads new Vagrantfile configuration

```sh
vagrant reload
```

* Stoping vm

    ```sh
    vagrant halt
    ```

* Resume a suspended machine (vagrant up works just fine for this as well)

    ```sh
    vagrant resume
    ```

* Forces reprovision of the `provision` script of the vagrant file in the vagrant machine

    ```sh
    vagrant provision 
    ```

* Restart the virtual machine and force provisioning script

    ```sh
    vagrant reload --provision
    ```

* Removing vm:

    ```sh
    vagrant destroy

    # forcefully
    vagrant destroy -f 

    # specific vm 

    vagrant destroy <vm-name>
    vagrant destroy master1 # like this one

    ```

* Export ting vagrant ssh key

    ```sh
    vagrant ssh-config > vagrant-ssh
    ```
