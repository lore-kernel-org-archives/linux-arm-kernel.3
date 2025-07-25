Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A306C87FCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 08:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6SlG4p7PzGNJex+qeliN43z/Wd9scMaF4+MTCIpEF4U=; b=nR1ZB5t1iwIQlPFGMGh49XXn5E
	dQOm2TlM3KebHkC8r9oypZ+HErI0qe8lpiDNFeEPS/GJ6bhwyoUPT3hhoOnNNCN8zSNMAOPoijgSy
	Um0Gx3lUZLjsPUz8UjI9R+6tzjmOWIBkJP8vbuietrbyIESEyNuolsGJEs/T0ld3+5ShVpCvaNE6b
	mqdVLG9dnR35a9hMDY3wluZbPq5x+37W7fmilHTh4GY01DSpHuPA+8+xucPY9xrjsX+Uu76cqdZda
	chPokcNn1crP9ZkBBZo4mrfdipCPTLly1KJdZhBa/1pOEoa/P8m0MYCegodMnhgmV87b0TLAT0GcD
	bcpQWi0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufDqH-00000009MVX-19aX;
	Fri, 25 Jul 2025 08:31:49 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufDnm-00000009MAB-44ir
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 08:29:16 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b271f3ae786so1526587a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 01:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753432153; x=1754036953; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6SlG4p7PzGNJex+qeliN43z/Wd9scMaF4+MTCIpEF4U=;
        b=BJiRv1PVw1Sp5xigQxVamhWuPGIDX10a5QtGekhfKMj7EOLSCq68ESTUUx1xI8gk1K
         HmcFEk39h8zUwyDCicjVtnZUzFY3lluH6TUVpOX4rrz7J/erlPJvDLj7h2Vl+Z4P11q5
         o1dscPZ2QXKKbGKf3yQQpoyEPGx11/40ANh20nKNtertSRYV3lChknkVNs5gD1ZeEvCJ
         +5dobbTW1+pC0eeSD5LpfYgs6ZnjJiBIpyzmAbgG5C6zyDjRQvMF4xmwX2/MmkktmyM5
         lfTKcHuYL/RnO1xCUuGc7fyTgkheWtapiRDOm/6bM6IGe6X1HRBJ6zyMliXQuWP3Sv7X
         u9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753432153; x=1754036953;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6SlG4p7PzGNJex+qeliN43z/Wd9scMaF4+MTCIpEF4U=;
        b=QUgNds8Gu02ZKukykTNHlFq9SB2LuZL+jdDMU+J+p80f09QgO7Qj1NglenhdTr3/ma
         P9YYX2Gq1gypg9rW8hi7bwr1MsQh225ExyHI0Rf0Jr/URotknEFBSKMsYRY3ve2+rgUy
         SHtn1DagADbWSLd710Wp9A5bbXK5rQYdY4/uaWpvAHO8QlG7nHdr9bVly8OK+7wcJugy
         cBrIWmafsagfFIt/0OsebP8f6JfZthpsYaOLueutHutlVG9A1aE9Xs0mgDrZ5Ad6S0/G
         3TAXU3zm28TL1JG0EVzSVfrwT/jAz5CDy6bTEf3z61Mk+XHURxYgKTkn+SW0vGu1Abo9
         eO3g==
X-Gm-Message-State: AOJu0Yxd5ZuxyB9Ok0O6vve+5is4rAzbk5HI3XElQHQJmeHBupsOLBZF
	i7NLSwU4ZbAsXJnJVe2rKlAkGspr1ajECc/aReHU/rtBEQzABJe4ePZ6YFCO+c2Y5tOk8Vb5mFw
	AvVykh6p1nt3eloWEXMKhB5apdgAurCZTDlTAyVQnuwsrlLVITB4Fal8=
X-Gm-Gg: ASbGncsRxgArU6BWy0+XSssrcpNMY6CDDzd+hL/kaGw2VyqWRWXbYOX+esF+Jxhekch
	Wl6rBnNhK1dpyF6S9+nmPMAfAEY8tK27hu4ZN2LailM1YZvYzhqodQj1jhY5+jK+Te3Z7GkEFnh
	qNEb3CfkcGkr4vyWOTpOaUU22ea0Dk8YRJikrtdlAZKQ439im5WJZEnRfVv1t6SXQTQn/lOPwzK
	RQ4RNYvwxNVCGHhS2VUHwLMfAlq3xnWeJGFhIw=
X-Google-Smtp-Source: AGHT+IFSOXd5d9LlBPfvNONAe739PRS1T7pG7hnn8qLMr/8kfPoBeVKvxu7CgmKTzBsjPnN0S5gW0/AjsKP4cqXAV5c=
X-Received: by 2002:a17:902:ea0e:b0:234:c8f6:1b11 with SMTP id
 d9443c01a7336-23fb3167767mr14742145ad.44.1753432153221; Fri, 25 Jul 2025
 01:29:13 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 25 Jul 2025 13:59:02 +0530
X-Gm-Features: Ac12FXzWcEWmXcr7ADQOYVMNJ8JhbU_ZioQdsFR-c7JnlJg189CYfO6gbl9zBIk
Message-ID: <CA+G9fYtBk8qnpWvoaFwymCx5s5i-5KXtPGpmf=_+UKJddCOnLA@mail.gmail.com>
Subject: next-20250723 arm atags_to_fdt.c undefined reference to `__sanitizer_cov_stack_depth'
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, kees@kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_012915_038918_526E0CF3 
X-CRM114-Status: UNSURE (   7.04  )
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

Regressions noticed while building arm builds with gcc-13 and gcc-8
toolchains on the Linux next-20250723 to next-20250725 tags.

First seen on the Linux next-20250723
Good: next-20250722
Bad:  next-20250723 and next-20250725

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

## Build regressions
* arm, build
  - gcc-13-lkftconfig-hardening
  - gcc-8-lkftconfig-hardening

Build regression: next-20250723 arm atags_to_fdt.c undefined reference
to `__sanitizer_cov_stack_depth'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
arm-linux-gnueabihf-ld: arch/arm/boot/compressed/atags_to_fdt.o: in
function `atags_to_fdt':
arch/arm/boot/compressed/atags_to_fdt.c:135:(.text+0x118): undefined
reference to `__sanitizer_cov_stack_depth'

## Source
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Project: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250725/
* Git sha: d7af19298454ed155f5cf67201a70f5cf836c842
* Git describe: 6.16.0-rc7-next-20250725
* kernel version: next-20250723 next-20250725
* Architectures: arm
* Toolchains: gcc-8 gcc-13
* Kconfigs: hardening

## Test
* Test log: https://qa-reports.linaro.org/api/testruns/29244662/log_file/
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250725/log-parser-build-gcc/general-ld-undefined-reference-undefined-reference-to-__sanitizer_cov_stack_depth/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250725/testrun/29244662/suite/build/test/gcc-13-lkftconfig-hardening/history/
* Test plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/30LiHIefapv5cGlikeKrTz4lSKR
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/30LiHIefapv5cGlikeKrTz4lSKR/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/30LiHIefapv5cGlikeKrTz4lSKR/config

## steps to reproduce
   *  tuxmake --runtime podman --target-arch arm --toolchain gcc-13 \
              --kconfig defconfig --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/netdev.config
\
              --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/systemd.config
\
              --kconfig-add CONFIG_ARM_LPAE=y \
              --kconfig-add hardening.config

--
Linaro LKFT
https://lkft.linaro.org

