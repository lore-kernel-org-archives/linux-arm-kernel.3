Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61384C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 09:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dmWcBJcs6Wk755m4D9DSq+3kzSFiV3zXYSE9SNe/ZDI=; b=zu3l53tviz+ab8lJudR1c///Ps
	pn4mIOfwcAWXWoFQl6RaXrGMnulcy03yvevRYiqSaTl4mRitwQfzvBo2fb0uYgRPWC43+nqauJev7
	3yIR27uhsE/afk5zQ4gbmQRn3NjVmtDLr1bj9k0nEM6WyXUhWFS/XlUf5kU0wj8XzMdC7T0a8zVwn
	8lZ4+jcJ0/NG3FX+1OJaceRarynaJ218L7l3VPDq3MqnIX+Qwwfx8AGjFDaFCwBoP/BvdlgiJ0kl1
	QcKejcrH1rYg+yfrznOTmhAl2fEe5xwF1hzVVAUE4wIAPTEqywfNPI8bEQKLgyrdhHTbXbrDbN+pH
	Yg1Vr93w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQut-00000008WB9-1l1h;
	Thu, 30 Jan 2025 09:32:55 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQta-00000008W6B-27wo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 09:31:35 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-85c5d4f3d58so115404241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 01:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738229492; x=1738834292; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dmWcBJcs6Wk755m4D9DSq+3kzSFiV3zXYSE9SNe/ZDI=;
        b=N2pm8df7Nr8VihAQv3/hAekBs3hxU5WbefkC+2nn2q1ESo1zIxd6yMIVtbk/y2UplY
         2vZ9UfM0geL7O+Fq/SmX3pq71lob9wNdey8jYeEghYbLY3vi08uZ73Qj3zaY/0QftoSZ
         JjgU7Pn8+ExaNusAoGMJ7lUuLHHPrfMKMFPoVlCKBAX6DuGJH2ArOk5jMjm2cJOgaWU+
         FYi4o/AdW2xA7E3XFQmmGpdOfAa0v08/3VQ3QjZvkOeu+CRD+AWscD+OH5jB0NEMS+oQ
         cG7n8wH5teHhi7/Utzcdhp/91yEF1gXIj68Hd8cbam65p0Bjj21RCdhM/dCh5IZbpuQ8
         owuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738229492; x=1738834292;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dmWcBJcs6Wk755m4D9DSq+3kzSFiV3zXYSE9SNe/ZDI=;
        b=CmsCAcgszMmwNLLmX3CVZBtcUGhr8yWVcfvCQO824nxp9Fz3fbIc2yWRTqDNS9n3Wi
         ni+N+HV9uHa9N0CBo9ldNQDwJ55mUdAVglmAY4qFh0zCOLHWaWkArKzl1SZqJxLD6rL3
         8SLFOa2DfdagxEEAUe1hhOKn311eBzD+hNvLOfDAORB+ffEAgJOhsoTPRhtHxWawd8PV
         BX8KDqqRCyp7bwcrMA7iLP6yuZHPhvskRlEXjmB6Y7ODPK132TjCqoreUDTm1EkaAuaH
         V7VjquGqD7uiNydsClDxn7YHQPkPSt3YpR2/0NUCO4L7WD7sdI11tnz67xION/8HYe71
         TwGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4ZCdUtKQhz+VBh8lr2NVHRMsGkwcyL8V4sPHR/X+SNp7KEYu+DfHnq36z3KGeGrQH76RbNrvX4K1qNOSDtxW1@lists.infradead.org
X-Gm-Message-State: AOJu0YyYEmURdPfNaSninA9ZjSZpIpFoalCTKyt1AcSCxi/jplgp9/0M
	8rg3pfnpPEfJPufLXSl9pct1imvCc0j3H2SX8pMIpunyC/vhOlzA0sp5H6JXpMmJmvsahShrqQy
	1ljFG/qeCpr3G02HKJmJPztCiq4Rgwv7sSzW6ZA==
X-Gm-Gg: ASbGncsw/r4DSkhRRBppOvPylZbkjmW0Kx36HnPEAT6ijPEVjdpBib3Uuep3hoThSJi
	ButRsIBbxpN3vxtSbvkac3V7EVFRGYip3b9Q0slnv1K0dhuUeISZv+PDsgaHsHLSbJq3jA2ucJm
	Q9hU0kA5ecIgAaUP7HL4h3rzGXUyitMQ==
X-Google-Smtp-Source: AGHT+IHHO4p75yBvoZrH4CWt7Sm3+WjJipBubc0F5yEZyIihuApBbf7n+j83VZzoGbXPEsG7JEuXYNAUETI3Fr3UyNs=
X-Received: by 2002:a05:6102:161e:b0:4b2:5d16:f75 with SMTP id
 ada2fe7eead31-4b9a4ec7f86mr5303490137.4.1738229492696; Thu, 30 Jan 2025
 01:31:32 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 30 Jan 2025 15:01:21 +0530
X-Gm-Features: AWEUYZmjjTJhG4gbVvsZPMKcHyLA3_iG79mE5k3okwZmPnMLWYy8tDLAX5wqlig
Message-ID: <CA+G9fYtNfM399_=_ff81zeRJv=0+z7oFJfPGmJgTp6yrJmU+1w@mail.gmail.com>
Subject: linux: master: x86_64: gcc-8: error: call to '__compiletime_assert_909'
 declared with attribute error: clamp() low limit dsc_min_bpc * 3 greater than
 high limit dsc_max_bpc * 3
To: lkft-triage@lists.linaro.org, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: David Laight <david.laight@aculab.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_013134_548150_5ACDF0BF 
X-CRM114-Status: UNSURE (   6.69  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The x86_64 and i386 build failed with defconfig with gcc-8 toolchain due to
following build warnings / errors on the Torvalds Linux master branch.
But gcc-13 builds pass.

First seen on v6.13-9485-g72deda0abee6 on Jan. 27, 2025
Good:  v6.13-7644-gc2da8b3f914f on Jan. 27, 2025
Bad:  v6.13-8265-g9c5968db9e62 on Jan. 27, 2025

i386:
  build:
    * gcc-8-i386_defconfig

x86_64:
  build:
    * gcc-8-x86_64_defconfig

Reported-by: Linux Kernel Functional Testing

Build log:
---
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 SRCARCH=x86
CROSS_COMPILE=x86_64-linux-gnu- 'CC=sccache x86_64-linux-gnu-gcc'
'HOSTCC=sccache gcc'
In file included from <command-line>:
In function 'intel_dp_dsc_compute_pipe_bpp_limits.isra.80',
    inlined from 'intel_dp_compute_config_limits' at
drivers/gpu/drm/i915/display/intel_dp.c:2547:3:
include/linux/compiler_types.h:542:38: error: call to
'__compiletime_assert_909' declared with attribute error: clamp() low
limit dsc_min_bpc * 3 greater than high limit dsc_max_bpc * 3
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                      ^
include/linux/compiler_types.h:523:4: note: in definition of macro
'__compiletime_assert'
    prefix ## suffix();    \
    ^~~~~~
include/linux/compiler_types.h:542:2: note: in expansion of macro
'_compiletime_assert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro
'compiletime_assert'
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^~~~~~~~~~~~~~~~~~
include/linux/minmax.h:188:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
  BUILD_BUG_ON_MSG(statically_true(ulo > uhi),    \
  ^~~~~~~~~~~~~~~~
include/linux/minmax.h:195:2: note: in expansion of macro '__clamp_once'
  __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_),
__UNIQUE_ID(h_))
  ^~~~~~~~~~~~
include/linux/minmax.h:206:28: note: in expansion of macro '__careful_clamp'
 #define clamp(val, lo, hi) __careful_clamp(__auto_type, val, lo, hi)
                            ^~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_dp.c:2506:25: note: in expansion of
macro 'clamp'
  limits->pipe.max_bpp = clamp(limits->pipe.max_bpp, dsc_min_bpc * 3,
dsc_max_bpc * 3);
                         ^~~~~
make[7]: *** [scripts/Makefile.build:194:
drivers/gpu/drm/i915/display/intel_dp.o] Error 1


Links:
---
 build log: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.13-9485-g72deda0abee6/testrun/27066663/suite/build/test/gcc-8-x86_64_defconfig/log
 details: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.13-9485-g72deda0abee6/testrun/27066663/suite/build/test/gcc-8-x86_64_defconfig/details/
 history: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.13-9485-g72deda0abee6/testrun/27066663/suite/build/test/gcc-8-x86_64_defconfig/history/

Steps to reproduce:
------------
$ tuxmake --runtime podman --target-arch x86_64 --toolchain gcc-8
--kconfig x86_64_defconfig

metadata:
---
  git describe: v6.13-9485-g72deda0abee6
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
  git sha: 72deda0abee6e705ae71a93f69f55e33be5bca5c
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2sKEcVft7ytiSSvOSnAuAxlCgRH/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2sKEcVft7ytiSSvOSnAuAxlCgRH/
  toolchain: gcc8
  config: gcc-8-defconfig
  arch: i386 and x86_64

--
Linaro LKFT
https://lkft.linaro.org

