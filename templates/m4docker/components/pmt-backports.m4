dnl BSD 3-Clause License
dnl
dnl Copyright (c) 2022, Intel Corporation
dnl All rights reserved.
dnl
dnl Redistribution and use in source and binary forms, with or without
dnl modification, are permitted provided that the following conditions are met:
dnl
dnl * Redistributions of source code must retain the above copyright notice, this
dnl   list of conditions and the following disclaimer.
dnl
dnl * Redistributions in binary form must reproduce the above copyright notice,
dnl   this list of conditions and the following disclaimer in the documentation
dnl   and/or other materials provided with the distribution.
dnl
dnl * Neither the name of the copyright holder nor the names of its
dnl   contributors may be used to endorse or promote products derived from
dnl   this software without specific prior written permission.
dnl
dnl THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
dnl AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
dnl IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
dnl DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
dnl FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
dnl DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
dnl SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
dnl CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
dnl OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
dnl OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
dnl
include(begin.m4)

dnl This tag covers support for 5.17.0-oem kernel and 5.15.0-x-generic Ubuntu kernels
DECLARE(`PMT_BACKPORTS_VER_DEFAULT',22WW45.5_476.14_UBUNTU517)

DECLARE(`PMT_BACKPORTS_SRC',https://github.com/intel-gpu/intel-gpu-pmt-backports.git)

ifelse(OS_NAME,ubuntu,`
define(`PMT_BACKPORTS_BUILD_DEPS',`ca-certificates build-essential debhelper devscripts dkms git make')
')

define(`BUILD_PMT_BACKPORTS',`
# build pmt backports
ARG PMT_BACKPORTS_REPO=PMT_BACKPORTS_SRC
ARG PMT_BACKPORTS_VER=PMT_BACKPORTS_VER_DEFAULT
RUN cd BUILD_HOME && \
  git clone ${PMT_BACKPORTS_REPO} && \
  cd intel-gpu-pmt-backports && \
  git checkout ${PMT_BACKPORTS_VER} && \
  BUILD_VERSION=1 make -f Makefile.dkms OS_TYPE=OS_NAME`_'OS_VERSION dkmsdeb-pkg && \
  mv BUILD_HOME/intel-gpu-pmt-backports/*.deb BUILD_DESTDIR
')

REG(PMT_BACKPORTS)

include(end.m4)dnl
