Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65655FF60D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZGH3ymB2jwjCiHm6wtb76PJ1E35x0Um1oAlYfSnm17o=; b=vDztiHM93kLri+tnTJimnEYP/M
	2ThsSzONqb6Pqr8AXnYDRySNrgJpWkS00cNCCwN5EwmqveSRAoU12hBNsoor2311v/6Q4M7H2qWmt
	VenlnFeR6FQZSbcswvqUmuKBoj5Jvn+6aH5NV92VAsupGsMynb1pYeJCRrDrOguqfQqs2xAvvonvH
	D0zZZ1OI/t4XT071YumGfpDiPp7jsQoW98tCvrakZVtrZHibQ8j9J+SzJcbwtamtwVE/YgzqVo1PX
	XkF0vyLnMMkbfUfnMILavDeZB+Htq2HDuLjtvZ/D5ZDuEKyH87UUJQBE/Pos46JMVcj3f39Va7azX
	9ZA3lTCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TrI-0000000CWOp-0K42;
	Tue, 31 Mar 2026 07:49:56 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TrF-0000000CWNs-3IFD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:49:54 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-660a48777b3so6427316a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 00:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774943391; x=1775548191; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZGH3ymB2jwjCiHm6wtb76PJ1E35x0Um1oAlYfSnm17o=;
        b=a5eUM0ccvsm8JrzEALpN0aZkef64HrDJGGViTtuYkZN6YyoqREKbtrmMlBkGDwQGaF
         hJUUFHYLgixAIpuGMORxTnkpi2vCl+3PjhxKJGavL4UvBi6kd+BAIOWVlHnaslh1O7yj
         3wnjqC/UND3YryoLBmmRKbHbYmW6adW3EEck/5wwxZ2tWJqDDMaaX8h8OURad/SxXBog
         xad/sG5BHYNx4FTWzA5bLSuKkRfUZrIjnofFZeWnXdPJBGIj4Nt++Weumx3bw2eBjfbE
         cO5F1PNbQcBGt6Hdf1L1E+b0Ul+4BQ2Vh0HUIzBrrqZ6BvJNJ9gtYqdpwJIJ3eqc+qvu
         mKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943391; x=1775548191;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGH3ymB2jwjCiHm6wtb76PJ1E35x0Um1oAlYfSnm17o=;
        b=KTwH6X9/4shFoJmbJiqzoUG4b7f3wa4KtspfUr6cr2enYk2Eg+VgiRmpMvtmuSgsmm
         vaZWYrXRSJxUp/DQ1GbC8BjdtOR5LRTjGqNuDk7l/lMp8VRfQ3bE2zgA203NKgtJJBF2
         JAZKETGJymhTqA9x4UyvxvOOIRi/om57BnY/khcNpVxTy63nPnBUlmS5yZKeD1kK+zVo
         REkDhoV/R18m9NchB9j+89tJOKxhWH3BtGUV7jOPLsnf7Fp2nyDGjptcp8bg9y0D42VY
         IffC2r/TX4vF2AecL3+nybNLifG1rdQFPo3+Nz2hgoaJqSsyZndX89RM30Ghwt8Gj3nN
         CQuA==
X-Gm-Message-State: AOJu0YwPUy5j9pgIA71vs7Em27jfY+uZx+Ho7wqhMmnn302U/st3i14A
	Mkr/X0iskQCZKQmZD/vBOHBwP8oeEQicIwIENEfNVMlZF36j1+pXOww1nurkqzHZxl4BrcQBQg=
	=
X-Received: from eday9.prod.google.com ([2002:a05:6402:4409:b0:66b:a77e:548e])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:46db:b0:661:8ccc:473
 with SMTP id 4fb4d7f45d1cf-66b28c6ac35mr7784086a12.27.1774943391017; Tue, 31
 Mar 2026 00:49:51 -0700 (PDT)
Date: Tue, 31 Mar 2026 09:49:40 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2643; i=ardb@kernel.org;
 h=from:subject; bh=zSkjOYBXbEwftTvpZU0nBNQV37U7ijaf9h5sMhcXtdM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN0zZRXt/cX/t1Uv+9+V197wPEbC1971nnN7nh85P+T4
 myVpztKOkpZGMS4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEfsszMqzZ7C0+2a4gdZOy
 cWiLnK/U7piDl4ydXjMxJzX0/53zchLD/5r6H65XFsbfEbZRyczUjHwy/Uj3tnadPSXqnX6bGEI 6WAE=
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331074940.55502-7-ardb+git@google.com>
Subject: [PATCH v2 0/5] xor/arm: Replace vectorized version with intrinsics
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-raid@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_004953_873091_B63A75F2 
X-CRM114-Status: GOOD (  14.57  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Replace the compiler vectorized XOR implementation for ARM with the
existing NEON intrinsics implementation used by arm64. This is slightly
faster, and allows some minor cleanups of the type hacks in the headers
now that intrinsics are the only C code permitted to use FP/SIMD
instructions.

Changes since v1:
- Update kernel_mode_neon.rst to state that arm_neon.h must not be
  included directly, but the new asm/neon-intrinsics.h should be used
  instead
- Avoid #include's of .c files - instead, build arm/xor-neon.c for arm64
  as a separate compilation unit, and export the symbol that is shared
  between the EOR and EOR3 implementations.

Performance (QEMU mach-virt VM running on Synquacer [Cortex-A53 @ 1 GHz]

Before:

[    3.519687] xor: measuring software checksum speed
[    3.521725]    neon            :  1660 MB/sec
[    3.524733]    32regs          :  1105 MB/sec
[    3.527751]    8regs           :  1098 MB/sec
[    3.529911]    arm4regs        :  1540 MB/sec

After:

[    3.517654] xor: measuring software checksum speed
[    3.519454]    neon            :  1896 MB/sec
[    3.522499]    32regs          :  1090 MB/sec
[    3.525560]    8regs           :  1083 MB/sec
[    3.527700]    arm4regs        :  1556 MB/sec

This applies onto Christoph's XOR cleanup series.

Cc: Christoph Hellwig <hch@lst.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Eric Biggers <ebiggers@kernel.org>

Ard Biesheuvel (5):
  ARM: Add a neon-intrinsics.h header like on arm64
  crypto: aegis128 - Use neon-intrinsics.h on ARM too
  xor/arm: Replace vectorized implementation with arm64's intrinsics
  xor/arm64: Use shared NEON intrinsics implementation from 32-bit ARM
  ARM: Remove hacked-up asm/types.h header

 Documentation/arch/arm/kernel_mode_neon.rst |   4 +-
 arch/arm/include/asm/neon-intrinsics.h      |  64 +++++++
 arch/arm/include/uapi/asm/types.h           |  41 -----
 crypto/aegis128-neon-inner.c                |   4 +-
 lib/raid/xor/Makefile                       |   3 +-
 lib/raid/xor/arm/xor-neon.c                 | 187 ++++++++++++++++++--
 lib/raid/xor/arm/xor-neon.h                 |   7 +
 lib/raid/xor/arm/xor_arch.h                 |   7 +-
 lib/raid/xor/arm64/xor-neon.c               | 172 +-----------------
 lib/raid/xor/xor-8regs.c                    |   2 -
 10 files changed, 251 insertions(+), 240 deletions(-)
 create mode 100644 arch/arm/include/asm/neon-intrinsics.h
 delete mode 100644 arch/arm/include/uapi/asm/types.h
 create mode 100644 lib/raid/xor/arm/xor-neon.h

-- 
2.53.0.1018.g2bb0e51243-goog


