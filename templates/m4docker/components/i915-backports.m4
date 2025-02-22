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

DECLARE(`I915_BACKPORTS_VER_DEFAULT',I915_22WW45.5_476.14_6213_220914.5)
DECLARE(`I915_BACKPORTS_SRC',https://github.com/intel-gpu/intel-gpu-i915-backports.git)

ifelse(OS_NAME,ubuntu,`
define(`I915_BACKPORTS_BUILD_DEPS',`ca-certificates build-essential debhelper devscripts dkms git make')
')

dnl build-essential debhelper devscripts dkms

define(`BUILD_I915_BACKPORTS',`
# build i915 backports
ARG I915_BACKPORTS_REPO=I915_BACKPORTS_SRC
ARG I915_BACKPORTS_VER=I915_BACKPORTS_VER_DEFAULT
RUN cd BUILD_HOME && \
  git clone ${I915_BACKPORTS_REPO} && \
  cd intel-gpu-i915-backports && \
  git checkout ${I915_BACKPORTS_VER} && \
  make i915dkmsdeb-pkg && \
  mv BUILD_HOME/intel-i915-dkms* BUILD_DESTDIR
')

REG(I915_BACKPORTS)

include(end.m4)dnl
