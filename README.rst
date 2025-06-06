# PROJECT NOT UNDER ACTIVE MANAGEMENT #  
This project will no longer be maintained by Intel.  
Intel has ceased development and contributions including, but not limited to, maintenance, bug fixes, new releases, or updates, to this project.  
Intel no longer accepts patches to this project.  
 If you have an ongoing need to use this project, are interested in independently developing it, or would like to maintain patches for the open source software community, please create your own fork of this project.  
  
Media Delivery Software Stack
=============================

.. contents::

.. |virt-guide| replace:: GPU virtualization setup guide
.. _virt-guide: doc/virtualization.rst

Background
----------

Intel GPUs have dedicated hardware that enables fast, energy-efficient encoding 
and decoding of video compliant with the industry standards such as H.264, HEVC and AV1.
Drivers and software enable application developers to utilize this hardware either
directly from their own applications or from within popular frameworks such as FFmpeg 
and GStreamer.

Overview
--------

This repository curates a coherent set of software, drivers and utilities to assist
users who are getting started with transcoding video on Intel GPUs so that they can
begin evaluating performance and incorporating Intel GPU transcode acceleration into
their applications.

Included here are scripts, Docker configurations and documents that provide:

* **Kernel mode drivers.**

  * The latest Intel GPUs are not fully supported by currently available Linux
    distributions so backported drivers can be installed by following the instructions
    below.

* **User mode drivers and libraries:**

  * `Intel® Media Driver <https://github.com/intel/media-driver>`_
  * `Intel® oneAPI Video Processing Library (oneVPL) <https://github.com/oneapi-src/oneVPL>`_
  * `Intel® Media SDK <https://github.com/Intel-Media-SDK/MediaSDK>`_

* **Transcoding software:**

  * `FFmpeg <http://ffmpeg.org/>`_ with `ffmpeg-qsv <https://trac.ffmpeg.org/wiki/Hardware/QuickSync>`_
    plugins (qsv means "QuickSync", a name for Intel's GPU video transcoding technology)

* **Quality and performance measuring software:**

  * Set of `quality <doc/quality.rst>`_ and `performance <doc/performance.rst>`_
    benchmarking scripts
  * `VMAF <https://github.com/Netflix/vmaf>`_
  * `Intel GPU Tools <https://gitlab.freedesktop.org/drm/igt-gpu-tools>`_

* **Demonstrations:**

  * Samples which demonstrate operations typical for Content Delivery Network (CDN)
    applications such as Video On Demand (VOD) streaming under Nginx server.

* **Setup guides and user documentation:**

  * |virt-guide|_
  * `Capabilities of ffmpeg-qsv plugins <doc/features/ffmpeg-qsv>`_

* `Benchmarking data <doc/benchmarks/readme.rst>`_ **for specific GPUs:**

  * `Benchmarks for Intel® Data Center GPU Flex Series <doc/benchmarks/intel-data-center-gpu-flex-series/intel-data-center-gpu-flex-series.rst>`_
  * `Benchmarks for Intel® Iris® Xe MAX graphics <doc/benchmarks/intel-iris-xe-max-graphics/intel-iris-xe-max-graphics.md>`_

Prerequisites
-------------

To run Intel® Data Center GPU Flex Series
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We recommend to attach GPU of `Intel® Data Center GPU Flex Series <https://ark.intel.com/content/www/us/en/ark/products/series/230021/intel-data-center-gpu-flex-series.html>`_
to the system with the following characteristics:

+---------------------+---------------------------------------------------------------------------------------------------------------------------+
|                     | Recommendation                                                                                                            |
+=====================+===========================================================================================================================+
| CPU                 | `3rd Generation Intel® Xeon® Scalable Processors                                                                          |
|                     | <https://ark.intel.com/content/www/us/en/ark/products/series/204098/3rd-generation-intel-xeon-scalable-processors.html>`_ |
+---------------------+---------------------------------------------------------------------------------------------------------------------------+
| Storage             | At least of 20GB of free disk space available for docker                                                                  |
+---------------------+---------------------------------------------------------------------------------------------------------------------------+
| Operating System(s) | Ubuntu 20.04 or Ubuntu 22.04 with kernel mode support as described `here <doc/intel-gpu-dkms.rst>`__                      |
+---------------------+---------------------------------------------------------------------------------------------------------------------------+

To run Intel® Arc™ A-Series Graphics
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

GPU of `Intel® Arc™ A-Series Graphics <https://ark.intel.com/content/www/us/en/ark/products/series/227957/intel-arc-a-series-graphics.html>`_
should be attached to the system with the following requirements:

+---------------------+---------------------------------------------------------------------------------------------------------------------------+
|                     | Recommendation                                                                                                            |
+=====================+===========================================================================================================================+
| CPU                 | One of the following CPUs:                                                                                                |
|                     |                                                                                                                           |
|                     | * `12th Generation Intel® Core™ i9 Processors                                                                             |
|                     |   <https://ark.intel.com/content/www/us/en/ark/products/series/217839/12th-generation-intel-core-i9-processors.html>`_    |
|                     | * `12th Generation Intel® Core™ i7 Processors                                                                             |
|                     |   <https://ark.intel.com/content/www/us/en/ark/products/series/217837/12th-generation-intel-core-i7-processors.html>`_    |
|                     | * `12th Generation Intel® Core™ i5 Processors                                                                             |
|                     |   <https://ark.intel.com/content/www/us/en/ark/products/series/217838/12th-generation-intel-core-i5-processors.html>`_    |
|                     | * `12th Generation Intel® Core™ i3 Processors                                                                             |
|                     |   <https://ark.intel.com/content/www/us/en/ark/products/series/217840/12th-generation-intel-core-i3-processors.html>`_    |
|                     | * `11th Generation Intel® Core™ i9 Processors                                                                             |
|                     |   <https://ark.intel.com/content/www/us/en/ark/products/series/202984/11th-generation-intel-core-i9-processors.html>`_    |
|                     | * `11th Generation Intel® Core™ i7 Processors                                                                             |
|                     |   <https://ark.intel.com/content/www/us/en/ark/products/series/202986/11th-generation-intel-core-i7-processors.html>`_    |
|                     | * `11th Generation Intel® Core™ i5 Processors                                                                             |
|                     |   <https://ark.intel.com/content/www/us/en/ark/products/series/202985/11th-generation-intel-core-i5-processors.html>`_    |
|                     | * `11th Generation Intel® Core™ i3 Processors                                                                             |
|                     |   <https://ark.intel.com/content/www/us/en/ark/products/series/202987/11th-generation-intel-core-i3-processors.html>`_    |
+---------------------+---------------------------------------------------------------------------------------------------------------------------+
| Storage             | At least of 20GB of free disk space available for docker                                                                  |
+---------------------+---------------------------------------------------------------------------------------------------------------------------+
| Operating System(s) | Ubuntu 20.04 or Ubuntu 22.04 with kernel mode support as described `here <doc/intel-gpu-dkms.rst>`__                      |
+---------------------+---------------------------------------------------------------------------------------------------------------------------+

To run upstreamed GPU products
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To run upstream GPU products, i.e. those GPUs support for which is available in Linux
distributions, you need:

+---------------------+---------------------------------------------------------------------------------------------------------------------------+
|                     | Recommendation                                                                                                            |
+=====================+===========================================================================================================================+
| Operating System(s) | Linux distribution capable to support your GPU. We recommend Ubuntu 20.04 or later.                                       |
+---------------------+---------------------------------------------------------------------------------------------------------------------------+
| Storage             | At least of 20GB of free disk space available for docker                                                                  |
+---------------------+---------------------------------------------------------------------------------------------------------------------------+

Installation
------------

We provide dockerfiles to setup transcoding environment. These dockerfiles need to be
built into docker containers. Dockerfiles can also be used as a reference instruction
to install ingredients on bare metal.

If you want to run in virtual environment, first follow instruction given in
|virt-guide|_ and then proceed with the setup described below.

Setup Docker
~~~~~~~~~~~~

Docker is required to build and to run media delivery containers. If you run Ubuntu 20.04
or later you can install it as follows::

  sudo apt-get install docker.io

You might need to further configure docker on your system:

* Allow docker to run under your user account (remember to relogin for group modification
  to take effect)::

    sudo usermod -aG docker $(whoami) && exit

* Consider to register and login to `Docker Hub <https://hub.docker.com/>`_. Docker Hub
  limits the number of docker image downloads ("pulls"). For anonymous users this limit
  is tied to IP address. For authenticated users it depends on subscription type. For
  details see https://docs.docker.com/docker-hub/download-rate-limit/. To authenticate
  running docker engine, execute::

    # you will be prompted to enter username and password:
    docker login

* If you run behind a proxy, configure proxies for for docker daemon. Refer to
  https://docs.docker.com/config/daemon/systemd/. Below example assumes that you
  have ``http_proxy`` environment variable set in advance::

    sudo mkdir -p /etc/systemd/system/docker.service.d
    echo "[Service]" | sudo tee /etc/systemd/system/docker.service.d/https-proxy.conf
    echo "Environment=\"HTTPS_PROXY=$http_proxy/\"" | \
      sudo tee -a /etc/systemd/system/docker.service.d/https-proxy.conf

    sudo systemctl daemon-reload
    sudo systemctl restart docker

    sudo systemctl show --property=Environment --no-pager docker

* Make sure that docker has at least 20GB of hard disk space to use. To check available
  space run (in the example below 39GB are available)::

    $ df -h $(docker info -f '{{ .DockerRootDir}}')
    Filesystem      Size  Used Avail Use% Mounted on
    /dev/sda1        74G   32G   39G  46% /

  If disk space is not enough (for example, default ``/var/lib/docker`` is mounted to
  a small size partition which might be a case for ``/var``), consider reconfiguring
  docker storage location as follows::

    # Below assumes unaltered default docker installation when
    # /etc/docker/daemon.json does not exist
    echo "{\"data-root\": \"/mnt/newlocation\"}" | sudo tee /etc/docker/daemon.json
    sudo systemctl daemon-reload
    sudo systemctl restart docker

Setup Media Delivery
~~~~~~~~~~~~~~~~~~~~

We provide few different setup configurations which differ by versions and origins
of the included Intel media stack components. Some versions of media stack require
special setup for the host.

+----------------------------------------------------+-----------------------------+------------------------------------------------+--------------------------------------------+
| Dockerfile                                         | Intel media stack origin    | Supported Intel GPUs                           | Host setup instructions                    |
+====================================================+=============================+================================================+============================================+
| `docker/ubuntu20.04/selfbuild-prodkmd/Dockerfile`_ | Self-built from open source | Alchemist, ATS-M                               | `Intel GPU DKMS <doc/intel-gpu-dkms.rst>`_ |
+----------------------------------------------------+-----------------------------+------------------------------------------------+--------------------------------------------+
| `docker/ubuntu20.04/selfbuild/Dockerfile`_         | Self-built from open source | Gen8+ (legacy upstreamed platforms), such as   | Use any Linux distribution which           |
|                                                    |                             | SKL, KBL, CFL, TGL, DG1, etc.                  | supports required platform                 |
+----------------------------------------------------+-----------------------------+------------------------------------------------+--------------------------------------------+
| `docker/ubuntu20.04/native/Dockerfile`_            | Ubuntu 20.04                | Gen8+, check Ubuntu 20.04 documentation        | Use any Linux distribution which           |
|                                                    |                             |                                                | supports required platform                 |
+----------------------------------------------------+-----------------------------+------------------------------------------------+--------------------------------------------+

.. _docker/ubuntu20.04/selfbuild/Dockerfile: docker/ubuntu20.04/selfbuild/Dockerfile
.. _docker/ubuntu20.04/selfbuild-prodkmd/Dockerfile: docker/ubuntu20.04/selfbuild-prodkmd/Dockerfile
.. _docker/ubuntu20.04/native/Dockerfile: docker/ubuntu20.04/native/Dockerfile

To build any of the configurations, first clone Media Delivery repository::

  git clone https://github.com/intel/media-delivery.git && cd media-delivery

To build configuration which targets DG2/ATS-M stack self-built from open source projects, run::

  docker build \
    $(env | grep -E '(_proxy=|_PROXY)' | sed 's/^/--build-arg /') \
    --file docker/ubuntu20.04/selfbuild-prodkmd/Dockerfile \
    --tag intel-media-delivery .

To build configuration which targets Gen8+ legacy upstreamed platforms via stack
self-built from open source projects, run::

  docker build \
    $(env | grep -E '(_proxy=|_PROXY)' | sed 's/^/--build-arg /') \
    --file docker/ubuntu20.04/selfbuild/Dockerfile \
    --tag intel-media-delivery .

Running
-------

Docker containers provide isolated environments with configured software.
To access resources on a host system you need to add specific options when starting
docker containers. Overall, software included into media-delivery constainers
requires the following:

* To access desired GPU you need to map it to the container, see ``--device`` option
  below
* To be able to access performance metrics, you need ``--cap-add SYS_ADMIN``
* To access ngingx server (if you are running a demo), you need to forward ``8080``
  port, see ``-p 8080:8080``

Summarizing, start container as follows (``-v`` option maps a host folder
to the container so you can copy transcoded streams back to the host)::

  DEVICE=${DEVICE:-/dev/dri/renderD128}
  DEVICE_GRP=$(stat --format %g $DEVICE)
  mkdir -p /tmp/media-delivery && chmod -R 777 /tmp/media-delivery
  docker run --rm -it -v /tmp/media-delivery:/opt/media-delivery \
    -e DEVICE=$DEVICE --device $DEVICE --group-add $DEVICE_GRP \
    --cap-add SYS_ADMIN \
    -p 8080:8080 \
    intel-media-delivery

Once inside a container you can run the included software and scripts. To start,
we recommend running simple `scripts <./scripts/>`_ which will showcase basic
transcoding capabilities. These scripts will download sample video clips, though
you can supply your own as a script argument if needed. If you work under proxy
do not forget to add it to your environment (via ``export https_proxy=<...>``).

* Below commands will run single transcoding session (1080p or 4K) and produce
  output files which you can copy to the host and review::

    # AV1 to AV1:
    ffmpeg-qsv-AV1-1080p.sh 1
    ffmpeg-qsv-AV1-4K.sh 1
    sample-multi-transcode-AV1-1080p.sh 1
    sample-multi-transcode-AV1-4K.sh 1

    # AVC to AVC:
    ffmpeg-qsv-AVC-1080p.sh 1
    ffmpeg-qsv-AVC-4K.sh 1
    sample-multi-transcode-AVC-1080p.sh 1
    sample-multi-transcode-AVC-4K.sh 1

    # HEVC to HEVC
    ffmpeg-qsv-HEVC-1080p.sh 1
    ffmpeg-qsv-HEVC-4K.sh 1
    sample-multi-transcode-HEVC-1080p.sh 1
    sample-multi-transcode-HEVC-4K.sh 1

* Below commands will run specified number of parallel transcoding sessions (1080p or 4K).
  No output files will be produced, but you can check performance. Mind that below numbers
  of parallel transcoding sessions are suggested for Intel® Data Center GPU Flex Series.
  Other GPUs might support different number of sessions running at realtime::

    # AV1 to AV1:
    ffmpeg-qsv-AV1-1080p.sh 16
    ffmpeg-qsv-AV1-4K.sh 4
    sample-multi-transcode-AV1-1080p.sh 16
    sample-multi-transcode-AV1-4K.sh 4

    # AVC to AVC:
    ffmpeg-qsv-AVC-1080p.sh 12
    ffmpeg-qsv-AVC-4K.sh 2
    sample-multi-transcode-AVC-1080p.sh 12
    sample-multi-transcode-AVC-4K.sh 2

    # HEVC to HEVC
    ffmpeg-qsv-HEVC-1080p.sh 16
    ffmpeg-qsv-HEVC-4K.sh 4
    sample-multi-transcode-HEVC-1080p.sh 16
    sample-multi-transcode-HEVC-4K.sh 4

These scripts run transcoding command lines which we recommend to use for best performance
and quality in case of Random Access encoding. See `reference command lines <doc/reference-command-lines.rst>`_
for details.

In addition to the simple scripts described above, this  project provides the following
scripts and software which can be tried next:

* `Quality and performance benchmark scripts <doc/benchmarking.rst>`_
* `CDN Demo <doc/demo.rst>`_

For the more complex samples, check out `Open Visual Cloud <https://01.org/openvisualcloud>`_ and
their full scale `CDN Transcode Sample <https://github.com/OpenVisualCloud/CDN-Transcode-Sample>`_.

Running 8K with Intel® Deep Link Hyper Encode
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Intel® Deep Link Hyper Encode Technology was designed to boost transcode performance to achieve 
8K60 real-time throughput.  Currently supported via Sample Multi Transcode application, this 
technology was tested on Intel® Data Center GPU Flex 140 card (2 GPU nodes). Media delivery 
container can be used to check two different flavors of this approach:

- 1 GPU node solution (encoder and decoder workloads are shared between 2 VDBOX engines of a 
  single GPU node and encoding is parallelized on a GOP level)
- 2 GPU node solution (encoder and decoder workloads use 4 VDBOX engines of 2 GPU nodes and 
  encoding is parallelized on a GOP level)

Simple example scripts are provided allowing for a quick test of 8k60 transcoding at the user’s 
end.  First, start docker with mapping **multiple GPU nodes** (mind ``--device /dev/dri`` vs
``--device $DEVICE`` as in previous examples) as follows::

  DEVICE=${DEVICE:-/dev/dri/renderD128}
  DEVICE_GRP=$(stat --format %g $DEVICE)
  mkdir -p /tmp/media-delivery && chmod -R 777 /tmp/media-delivery
  docker run --rm -it -v /tmp/media-delivery:/opt/media-delivery \
    -e DEVICE=$DEVICE --device /dev/dri --group-add $DEVICE_GRP \
    --cap-add SYS_ADMIN \
    -p 8080:8080 \
    intel-media-delivery 

Once inside the container, simple scripts can be used to showcase Intel® Deep Link Hyper 
Encode Technology. If you work behind a firewall, please add HTTPS proxy to your environment 
(via ``export https_proxy=<...>``) before running the scripts.

* Use the following commands to run single 8K transcoding session using either of the two flavors::

    # AV1 to AV1:
    sample-multi-transcode-AV1-8K-hyperenc1gpu.sh
    sample-multi-transcode-AV1-8K-hyperenc2gpu.sh

    # HEVC to HEVC
    sample-multi-transcode-HEVC-8K-hyperenc1gpu.sh
    sample-multi-transcode-HEVC-8K-hyperenc2gpu.sh

More information on Intel® Deep Link Hyper Encode Technology can be found here:

* `Accelerating Media Delivery with Intel® Data Center GPU Flex Series <doc/benchmarks/intel-data-center-gpu-flex-series/intel-data-center-gpu-flex-series.rst>`_ 

Contributing
------------

Feedback and contributions are welcome. Please, submit
`issues <https://github.com/intel/media-delivery/issues>`_ and
`pull requests <https://github.com/intel/media-delivery/pulls>`_ here at GitHub.

Dockerfiles should be supported as described in the `document <doc/docker.rst>`_.

If changes are done to dockerfiles and/or scipts, please, make sure to
run `tests <tests/readme.rst>`_ before submitting pull requests.

Content Attribution
-------------------

Container image comes with some embedded content attributed as follows::

  /opt/data/embedded/WAR_TRAILER_HiQ_10_withAudio.mp4:
    Film: WAR - Courtesy & Copyright: Yash Raj Films Pvt. Ltd.

Inside the container, please, refer to the following file::

  cat /opt/data/embedded/usage.txt

