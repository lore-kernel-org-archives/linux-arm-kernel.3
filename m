Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D213CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 19:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OMzXnLutBDyDe0cFRFFwMkAW7rZFHmfwIn2gFvrd1lk=; b=u2aD3nm+4UdQGcp3yKYXtH4E3Q
	b1hrBKI4xfXHSE8g0COEsEp3ZV61FNKG5KnAv9Y7HmD2V5SR2pIvrkLnt7oxIvQEKZ67+q9YUgE6W
	ADIjczI0LlxLw8dwhhBAx7D+wlcFmMCWSzl1f1eCVkYhamGGY2qkgeQafFf/GUBxtzQYbucbamtQb
	MCvnyc0zYMeSigV6+wPAPz49Bxz+31BN2UEfE3gnebFZJRV//M3bViWrJio+Gc8YlsmF+SBMhJM3N
	6jpeYEgNBESmXnt2cmdTiO9C2ZAZSM5FRcoi+Snl8bYOX0wFgIncPQO5Z1EJRJDKx2VbFQHJ5EmxN
	aNC04sjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmox-00000004wpe-2wDq;
	Thu, 11 Sep 2025 19:19:03 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmou-00000004woF-34Ho
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 19:19:02 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2570bf6058aso14685775ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 12:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757618339; x=1758223139; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OMzXnLutBDyDe0cFRFFwMkAW7rZFHmfwIn2gFvrd1lk=;
        b=qEADVH1FvbrSmC4pLVGEX5RXDb/nXFt7Q3X4dO9+cQ9+uDgD/cOL/fgTkG61/5u/UJ
         Mg79JGH9TY5ojvZ6t+YMamc37QdzqIC9/0SCaJUmsGc0DQl6xqDLk7Yijg667/kfWhG6
         2UJ/JrzkP4GiBPL8YpaqiJ03y7r+s4WNHr6SZvRZw8s4b8u+HCj1fXNUmdbUIFLMuOv2
         xpGnWJDwt1j1vC7souve7+FtVSxWTU2k91KVNMO7GNHsx6xWVzgFfJL15p4wDD//0Sdm
         Ft1gSyOP1xFJRlH7Edmr1HE1aC6cCgz5pzFheXVpJNw8EZeOfTpdGOTkasKHRoCkl4B/
         HUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757618339; x=1758223139;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OMzXnLutBDyDe0cFRFFwMkAW7rZFHmfwIn2gFvrd1lk=;
        b=SnMVjJb17MLxwwzE9V5kxNDB5s/XgopQHQ1s/Vh771VSt7d0lI0t+1YtZJXLtV40wX
         ClhlcSC/bsad811GduNAIgQCkeM+1OYz6a3duiI2nyx0ESSdxBUjHbAdVeA1YRKQ/iz3
         xKpuyVmqlVONLiOByvR8Iblr9uPR0Vim/nTJkRMOOij6e9Vaq4M55tKJZOJ6ppCu4Ex0
         OWOcrTcl75BTCOYkjMvh50KktpHwWkVd55J+zMihYHSYO71m9jtNx9yNkIzzAzIWM8kQ
         fZbJEfk75GSoUrNhYu5gJLS+5lFlAqXYwWuOtMu7AAJ7zFJtKDe4o/Mun24VF5v+VkpU
         wuoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNkqsPcg21mIwc0f1us6xENJRldT/aLCR3B8mtrXnOUBzdaVxkuKQ59Ii5e9V+hM4Mq8+GBPXjFGmAVxAKfNht@lists.infradead.org
X-Gm-Message-State: AOJu0YznxvMqSKyaXbX/PU1EygugetOoZH9qRSycLvJWrrFnDu3pYlNN
	Gx1NJu+k7fJd4lXAFtp92XCqcN8AORxjRSARa3AvP47NFUpdB/QYKXQtDcLwxG3Sepy891IfS0g
	l1nE7SjMbkfXUsRznCMnO54w6OV+bF4YmchQVMnXxCg==
X-Gm-Gg: ASbGncsHZbTdHcY0z5dJ9+j6XrCT/y4NYIllHwIYjedyWphOayjE8IYh6gb2XEnNrrX
	4NW9tRqYMEEW/TuoUDUbRlbmaMK3TB7aYfMFpVqWeGsEjWNIUaEM1mCWPIwf45j/sPd+08HsrM7
	yUN4gGQNWijREz8/lD767XUeSWei5paE520fz7xZ9w9YKjByiKkd2h17hx+8ZWVjVCGXN+nb+RF
	UCxfzR2m7dxUFjBfOZr+IKFmQZEovBr1x89tqVDXHchJyMNi2O27LKOz1+eytQvdaw4vK5V6IE3
	a79dHg==
X-Google-Smtp-Source: AGHT+IFcvNFERCt1pxcRVC0LrxIO5qX9I6ZaHaKu41AXHxq/mmXTSKA/Xpf/xNIANgUEzlw3GdicyiK9s1eIUs3kKeA=
X-Received: by 2002:a17:902:f60c:b0:24c:c8d1:2bec with SMTP id
 d9443c01a7336-25d26a50ba4mr4742195ad.40.1757618339416; Thu, 11 Sep 2025
 12:18:59 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 12 Sep 2025 00:48:47 +0530
X-Gm-Features: AS18NWDec12kyfne2e8LlQ-fqp880gCW8MHrmOTo3P_JiNjAs1Vmr9Ipa42F9ss
Message-ID: <CA+G9fYv77X+kKz2YT6xw7=9UrrotTbQ6fgNac7oohOg8BgGvtw@mail.gmail.com>
Subject: next-20250909: selftests/arm64/gcs/basic-gcs.c:390:30: error: use of
 undeclared identifier 'HWCAP_GCS'
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_121900_791836_D343E5AF 
X-CRM114-Status: UNSURE (   5.29  )
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

The following build warnings / errors noticed on arm64 defconfig
with clang-20 and gcc-13 toolchains on the Linux next-20250909
till next-20250911 tag while building selftests/arm64.

Regression Analysis:
- New regression? Yes
- Reproducibility? yes

First seen on  next-20250909
 Good: next-20250908
 Bad: next-20250909 till next-20250911

Test regression: next-20250909:
selftests/arm64/gcs/basic-gcs.c:390:30: error: use of undeclared
identifier 'HWCAP_GCS'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
selftests/arm64/gcs/basic-gcs.c:390:30: error: use of undeclared
identifier 'HWCAP_GCS'
  390 |         if (!(getauxval(AT_HWCAP) & HWCAP_GCS))
      |                                     ^
1 error generated.

The suspected commit pointing to,
  kselftest/arm64/gcs: Use nolibc's getauxval()
  a985fe638344492727528e52416211dda1c391d5


## Source
* Kernel version: 6.17.0-rc5
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: 6.17.0-rc5-next-20250911
* Git commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
* Architectures: arm64
* Toolchains: gcc-13 and clang-20
* Kconfigs: defconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29827060/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250909/log-parser-build-clang/clang-compiler-basic-gcs_c-error-use-of-undeclared-identifier-hwcap_gcs/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/32RzudgbCUiqGUoFtquJ9IEIDXZ
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32RzudgbCUiqGUoFtquJ9IEIDXZ/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/32RzudgbCUiqGUoFtquJ9IEIDXZ/config

## Steps to reproduce
 $ tuxmake --runtime podman --target-arch arm64 \
 --toolchain clang-nightly \
 --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/32RzudgbCUiqGUoFtquJ9IEIDXZ/config
\
 LLVM=1 LLVM_IAS=1 debugkernel dtbs dtbs-legacy headers kernel kselftest modules

--
Linaro LKFT

