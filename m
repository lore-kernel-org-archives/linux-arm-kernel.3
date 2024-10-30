Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD56D5CCAF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 13:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xqOd1GRqoUCqzf3wqicTqRcRpHE5Pp00F4b9OuTbBLs=; b=yyrjVOKZvuK3oireynIsHPhjg9
	e8OrlKeoauIQBIVxFYrL5KbhOv4TlocKy+70WRVSsGf/Q5lPt7EZMra+NtL3hGqatNAfCqA20XyRA
	eKagGjGuvFWsfSkbAWRBSnwdYrh0xX1z3TfLcKHV6KzChsPHzAY98QjnjW89ah0nWDletJwpJFPet
	mHnLocg13qyaDPvjOIi7jP5jb+6PjyM89dKxGkcoDfTkJ/wQYO1bydEtLKrB9fUz3ekLdsMRDjYZk
	iw/2V6lCPwPNlFc538+pIh3mKvJa/X3HnytepHD6CiQu6DFfCzmRyKLVjdf8uNNvm5vvx8uIJNzyw
	eAJkdEsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t68p2-00000000UJE-46mo;
	Wed, 30 Oct 2024 13:33:17 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t68fM-00000000SUa-0TVA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 13:23:18 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-84fd50f2117so2107133241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730294593; x=1730899393; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xqOd1GRqoUCqzf3wqicTqRcRpHE5Pp00F4b9OuTbBLs=;
        b=Ck8dwN8tGAyPiLozbm6tOpz5FRle474R/8vi7G3A1QBZZZYxdAmiAzbhIC65dXayQ/
         EGSyXBftG5ZVYJQGh7Uwi67cIuRldXl+N0y+GeEO31fecNpTkWCKzmzgnfsdQo3nbWea
         HeAMdmB4w6eCXzlUtMfccNhR13BfgaXA4twlhLBsYw6PpVNHx4Stj2K4q0JftR/IHXeA
         3duffSzpW6evg24bR+N7/0r1iG+JQBwWeVBLJ5VyAPvXoNUwzetLo0aBlBJqwW9aeCZm
         DFp2k1V28LnOi4NG2mdsmJg/N9NseNqGdPSSIOsDMtdvpXNdGml12pdn9okmo4JHLDlc
         0kyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730294593; x=1730899393;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xqOd1GRqoUCqzf3wqicTqRcRpHE5Pp00F4b9OuTbBLs=;
        b=V8670VIJf2sLgJyJ71VBNfogz0eWQz0xCoHCrm2dBY2WUaiHk5a64Flb8e4ufEc7AQ
         q3IlYR0okBXBLgr5oOvudD7q+cBx6oQe8UF9VWkfAufbW3kDOjri0dq3BsHblduHr50Q
         gpk6jd2O07rgu9jMYHyUDZxP9xu6smTQhfolHgbfrK8rOC1Q58x4qy5KCDpuHU9cMK/c
         +uKgGf9S66saCT1jA5bSI66voqRdW3qRgr+FfqAZ8NG8m0Zn3SPzz7Ny6mnU0KbgWg1r
         LdwimidhtP6hGo/usy3gySvjh5DzMVqPmx3wZCkQGsYsqEim/W7ob1l9TVAToIewjT26
         QDIA==
X-Gm-Message-State: AOJu0YyI3q8HcdApeREVYF+tSl6NyUAT5Z8kYWoXkVmRGHcKf3ojBQLb
	u8wWz33oeA506bE5/sMzFymWOzH76/86jpR1K8oEuT4TRyfb+8hZOLKHIonbJF5Wjy1BpdKZ6Ea
	2ib9DQuo+pw3zz/vXAIFR9e1/nSBNtofIUbuuJfmJtPcIbmiafbY=
X-Google-Smtp-Source: AGHT+IH+WumONmNdzunnvczfZxAebXCyl/J6gvEjlXtHtquei4NUDtL+2W3YfXhmxPl83u3TC15QF98lawvQNCJ4xU4=
X-Received: by 2002:a05:6122:1697:b0:50d:3ec1:1534 with SMTP id
 71dfb90a1353d-51015071471mr13246416e0c.7.1730294592926; Wed, 30 Oct 2024
 06:23:12 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 30 Oct 2024 18:53:01 +0530
Message-ID: <CA+G9fYvvNm-aYodLaAwwTjEGtX0YxR-1R14FOA5aHKt0sSVsYg@mail.gmail.com>
Subject: next-20241028: gcc-8-defconfig : ERROR: modpost: "__aeabi_uldivmod"
 [drivers/media/dvb-frontends/cxd2841er.ko] undefined!
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org
Cc: Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_062316_193971_FAB0C7AC 
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

The arm builds failed with gcc-8 on Linux next-20241028
and builds pass with gcc-13.

First seen on Linux next-20241028 tag.
  Good: next-20241025
  Bad:  next-20241028

arm:
  build:
    * gcc-8-imx_v6_v7_defconfig
    * gcc-8-defconfig
    * gcc-8-omap2plus_defconfig
    * gcc-8-davinci_all_defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
ERROR: modpost: "__aeabi_uldivmod"
[drivers/media/dvb-frontends/cxd2841er.ko] undefined!
make[3]: *** [/builds/linux/scripts/Makefile.modpost:145:
Module.symvers] Error 1
make[3]: Target '__modpost' not remade because of errors.

Build image:
-----------
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/build.log

Steps to reproduce:
------------
   - tuxmake --runtime podman --target-arch arm --toolchain gcc-8
--kconfig defconfig

metadata:
----
  git describe: next-20241030
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: 86e3904dcdc7e70e3257fc1de294a1b75f3d8d04
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/
  toolchain: gcc-8
  config: defconfig
  arch: arm

--
Linaro LKFT
https://lkft.linaro.org

