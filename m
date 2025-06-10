Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F652C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 11:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/KbPqIjq6A0gP5OwcTzAJtKToDqxED7lTQn+3ShWhu4=; b=1qEIywAoxigpQscrtKWHXuw1BY
	38A3Pni/6XfUnwtU32pHhjy20gU8nvj0DkdltA19qqDWFu5qnLAkDZj7nNH0VawMQvPGfa0SmGw46
	zwWTrHACKTKDh7+VCkX678uTuJG51uhmhYiXrqJom7bFlqMSFDqidpFo4OWQGcqAn45j6CtvQKYxH
	GEXBUCu+o0cID8rBNAKEJOAJEwQH3flcXLVzeeoct+NrmiL0B5e12XUpUOprHrLaPj7l+CSPHbNRb
	QMZlDjZPYpLU6yiAjvR9Gtpy1ITQwFBpKKe9H8WsTYCMpjgssOAUcs9EG1n0olO23zP98MfnfeVtl
	gED2r5Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwvx-00000006d4v-0mLm;
	Tue, 10 Jun 2025 11:14:25 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwAp-00000006UQq-46ZM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 10:25:45 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-5290be1aedcso4166371e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 03:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749551143; x=1750155943; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/KbPqIjq6A0gP5OwcTzAJtKToDqxED7lTQn+3ShWhu4=;
        b=KZRILPvubmC0JfFo+IJkn8Kg6piuRYrxpBrDZDzTWEOpB6EruJIhIPMfMItUph2+Gb
         iOmWpdImNeCZzzoqJFYB79jJb07ZeCWk7WzacwO6CNwM39D2XaVhzZ1J5TvEiId5e98S
         LWQwymD34qOzmrt3PKQFm0KE9AvqMO5JY+FrDn1FBe6Q/WI0NQx+A1w1G2bJ9pwTFPAO
         ZARYd92zvZDRBcbehoWJjlCUmI7Xt9ib0y3bPq8obpTfSllVPTkpSYtwN2oRDp27Q9KG
         lIwmua57FYrYIBhKQhyLE+2wWfXGJWQT56C+OBp4zu6k+ZhPupPDyXCozbbN5VCX2LBa
         sa5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749551143; x=1750155943;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/KbPqIjq6A0gP5OwcTzAJtKToDqxED7lTQn+3ShWhu4=;
        b=Riy/gz4vYz4kZrNlaZ/ekahvHhGyWYFoGcEk2G0tz9CFTvpRz2Weatd4A4Ky3B5+tj
         XEgiMq7GLCtEkTNC5TB9umAaWHL6OhpqC4nKgEBuG6LWCbE16ZNfRMK+jtKzINjU43GP
         Qrmdc+MuUv7HzUb+l4XtqER9Rn1LFhDiu3O6h1Hc49OTi+yEjNWaxj3LgZaHFVjGsa2P
         RXJ54ae67ACa7g5NuEmcrN0E8KNe6SdMUNvqNv9N3G7TUIiJRWFMAC1LQU2nRW9kLQ0i
         f1vCaun96XxBwYy0qsDawdt5FJgjHS0zZ++TAKsP00KTuJVu9Lm44pJY6iX4aUOvf63V
         Q8pA==
X-Forwarded-Encrypted: i=1; AJvYcCVwOETkoFevVAypo5DBu5M24WJjtWotQEl+en+U5IetoS5uU09gVOFwaT0weH+AjB9u6sR6s7azotR+MyuhXu48@lists.infradead.org
X-Gm-Message-State: AOJu0YzFhJg/qaRx7fnpkzxFPR37uGwV8iQto65DvEwGBe4uvjFTPPBW
	L+VWeZv0MlKxWAlq38PiG4qt34ncAWxfDAQNsdvhw70HfgJQPv4smx3bx9S8fwIodWlgQnrdcgj
	glfSzy6xeKrsYlpZ8Xs0oMUdazq8F6pNA9nMG/7RiSQ==
X-Gm-Gg: ASbGncszv3ImAFhWE1drBGFdFm6FuNP4kle0IdGpNIY8JM670xHUoaX+ZhxzUykl/IR
	2Q+jLDhNd27qLmfAKPnjHqLnba+3gvl+rNICwcLGCWEvPCfh6GM1O94IjSOA2260girnqi2CAn0
	+lJcBQ1n/X7xDftlxxJ0h3MysYYClLEdCVtiJRvYcGp9p3oNTvA0KHy1OOyMVL9iliGN0enNLwK
	4yG8SDqlOKMkR8=
X-Google-Smtp-Source: AGHT+IHshLTe8OuH7+ip/8ueWp0i74zRNPn5hHiiSdvdI8UuOJ6eD1FAplWjvLZQZJWIGjYXeSMeV/zYAYuInU3pbBs=
X-Received: by 2002:a05:6122:640c:10b0:530:2c65:5bb8 with SMTP id
 71dfb90a1353d-531131187b5mr1514506e0c.1.1749551142776; Tue, 10 Jun 2025
 03:25:42 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 10 Jun 2025 15:55:31 +0530
X-Gm-Features: AX0GCFuPO70Fr5H2aOlLeOzXniiVZlpD36FORRmiAmu3qpXvFghQfZN4JyKcc9A
Message-ID: <CA+G9fYuppX5LeRjOAZWsYRCs76PVbnv-TN_RrszhDsk=KregyA@mail.gmail.com>
Subject: next-20250610: arm64 No rule to make target rockchip rk3399-rockpro64-screen.dtso
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Regressions <regressions@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Peter Robinson <pbrobinson@gmail.com>, krzk+dt@kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_032544_018167_6B059EE0 
X-CRM114-Status: UNSURE (   6.49  )
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

Regression while building arm64 with the Linux next-20250610
the following dtb build errors noticed.

Regressions found on arm64 builds
- dtb build error

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

First seen on the next-20250610
Good: next-20250606
Bad:  next-20250610

Anders bisected this to,
# first bad commit:
  [49760b9f60528393cca3ea35c4d0719f84215a48]
  arm64: dts: rockchip: add overlay for RockPro64 screen

Build regression: arm64 No rule to make target rockchip
rk3399-rockpro64-screen.dtso

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build error
*** No rule to make target
'arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso', needed by
'__dtbs_install'.

## Source
* Kernel version: 6.16.0-rc1
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha:  b27cc623e01be9de1580eaa913508b237a7a9673
* git describe: next-20250610
* Toolchains: gcc-8, gcc-13, clang-20
* Config: defconfig
* Architecture: arm64

## Build details
* Build warning:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgmzjEl7VszYE9/build.log
* Build link:  https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgmzjEl7VszYE9/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgmzjEl7VszYE9/config

## Steps to reproduce
 - tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
--kconfig defconfig

--
Linaro LKFT
https://lkft.linaro.org

