Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BE6CEB2DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 09:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t1KkDbfeRb8/B89WlBjrN65+9n5V//dcukh2+tciQ0U=; b=wHSJw8ThmqyyxUyCCIujrn480c
	QD1Y3/z+9R5MwjMB6u+5Cc0abuIwFcDSMahIxmhd3QgfELbLoy3DOpeekNV2G/XGOlRgCrvOPk04W
	5hLtSi1StJmiIFrMm9jKKMgwRNeBKjLAgm5OotuYAfjEbQeq/pVr++flVahDARmRs0KwQyVcXatYL
	dzN8YK2nYMxckoPT9MbcfxTgi7wjnVr8KqhWP3wbLjTz8HFlUp11vvE5Qastg/yVR2XlmnErvISKg
	nKDLAymBg+xzAC52A/Vkh7BCheDPofWLDSd0Q9I0AGuuGv2JofhLCQ5zjsXuA1WbO5ApDH+raK8pK
	aeBrpnVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6np5-00000006NTH-34mb;
	Fri, 01 Nov 2024 09:20:03 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6nnF-00000006MsM-3gzY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 09:18:11 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-4a74cfa7671so1456512137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 02:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730452687; x=1731057487; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t1KkDbfeRb8/B89WlBjrN65+9n5V//dcukh2+tciQ0U=;
        b=YrVNangHX1T0go0kXOukF0fB2Mx186NEFDaAoCPFqjLYYD3hQcILzLDBpmJi32XmnY
         g8ntc8mA5gume3vs9ILEf9IObX7tBUZwgaa6VPl10QHoEgIek1xk8BqX3izj7AwKZRfS
         FaAgPfSH/wiHgFEseWf2+atQGdBDSlWc9tphJIkmeTuHMbb+V9kJ7gOLDqpULYHHeDLE
         +VZGKIt1RxyOAt97Wk3YNq8tQkb2wrR+PCPorO0jzzW9sbXbJasArhwD6zSoiOOV6Qck
         vwPmI6qjwR0ssUAJVHDSy3rRXI6O89x96vg6VDiZ5xGtmWUp126uaQgZPeY/0COUnwAU
         /NhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730452687; x=1731057487;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t1KkDbfeRb8/B89WlBjrN65+9n5V//dcukh2+tciQ0U=;
        b=GJiG5qr4scEGDXoU3XgxV4WOJvEey1KQgKZAIpFZr6DfWddO1gW0YM6zXReiEPxjx5
         tZ9NbxJiaqozCajXWkp0DhYxIRZCifWnJTK7C6eoWXvMYcMCcLD7yEM9/objS4a1xiFx
         o07i5K3QcLHtE1RYg2je4KcXTFsJWurXc24to5cHiko0umTh/40la1aEJWCd7EZINNt1
         YF44v/uveT2WriZ2SI9tuY3W+3AUsbRZSoKtruzwpNN+h+kpbbA+M1akJ0FZXwGEUbhO
         IPMJWanTsNTw+iMbSUnC04MAKleDdf0MRkGUI1W7CTNBkBCkp9kpBcX4w4GBrRGjRPi8
         upiw==
X-Gm-Message-State: AOJu0YxWSai9aC6WgRb4HH+bTkni2n2+FIZTQUaM+8jdngnd9/0weW7b
	I9uPnCO5Nwsd4EkJnn4jNZ4TrvJq6Hz+q4C94VJgb/XWwLheLAU/rstO/i5KtjUOVqXC1mcHMVm
	F7h8CSsXd+4Xvrwfgi44SmoLU5OtTykZYxxOYFDmwho43VGnq33k=
X-Google-Smtp-Source: AGHT+IF/7VeE0qypAZsvB0GHvJRs7OROyaNMivE3QaLLNk11pGcfGJx4Il504Fo5uGv0ogFJJ2/UpZC3ZSupAKDX6qc=
X-Received: by 2002:a05:6102:d8e:b0:4a4:4868:cfd9 with SMTP id
 ada2fe7eead31-4a956c98c4bmr4297604137.1.1730452687441; Fri, 01 Nov 2024
 02:18:07 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 1 Nov 2024 14:47:56 +0530
Message-ID: <CA+G9fYtioQ22nVr9m22+qyMqUNRsGdA=cFw_j1OUv=x8Pcs-bw@mail.gmail.com>
Subject: next-20241031: drivers/pmdomain/ti/ti_sci_pm_domains.c:134:26: error:
 called object type 'void *' is not a function or function pointer
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux PM <linux-pm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, d-gole@ti.com, 
	zhangzekun11@huawei.com, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_021809_950461_9B428C62 
X-CRM114-Status: UNSURE (   6.10  )
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

 The arm clang-19-keystone_defconfig builds failed with clang-19 and
gcc-13 on the
Linux next-20241031 tag.

First seen on Linux next-20241031 tag.
  Good: next-20241030
  Bad:  next-20241031

arm:
  build:
  * gcc-13-keystone_defconfig
  * clang-19-keystone_defconfig
  * clang-nightly-keystone_defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
drivers/pmdomain/ti/ti_sci_pm_domains.c:134:26: error: called object
type 'void *' is not a function or function pointer
  134 |         ret = pm_generic_suspend(dev);
      |               ~~~~~~~~~~~~~~~~~~^
1 error generated.
make[6]: *** [scripts/Makefile.build:229:
drivers/pmdomain/ti/ti_sci_pm_domains.o] Error 1

Build image:
-----------
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241101/testrun/25629126/suite/build/test/clang-19-keystone_defconfig/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241101/testrun/25629126/suite/build/test/clang-19-keystone_defconfig/history/
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2oElzrg2GdPSWnESXlKVCgvhX5u/
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2oElzrg2GdPSWnESXlKVCgvhX5u/build.log

Steps to reproduce:
------------
- # tuxmake --runtime podman --target-arch arm --toolchain clang-19
--kconfig keystone_defconfig LLVM=1 LLVM_IAS=1

metadata:
----
  git describe: next-20241101
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: c88416ba074a8913cf6d61b789dd834bbca6681c
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2oElzrg2GdPSWnESXlKVCgvhX5u/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2oElzrg2GdPSWnESXlKVCgvhX5u/
  toolchain: clang-19 (19.1.3) and gcc-13
  config: defconfig
  arch: arm

--
Linaro LKFT
https://lkft.linaro.org

