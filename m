Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3120C54799
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 18:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jkJfwo8xpBpJbrVIx6UOqAm0kur6+ObopwN4A021JGU=; b=tRaugeZCB7Lna3Pgza6ssYxnl2
	ab7HntBARI5ekPYmytgYoGRRnehVM1+ao1Bp20z+EjcjtYwF6k7BlvixctCETTscBYgzD19P2ln71
	9MSagY74zmxyI+W9hGT2NIsdO2Zd0cnTzycPOSRZ/B4gzpqoczCBt9sojZvNMOnrBYfpcnw6svMHQ
	7VB/IbAdkVc20HecXSTU1QVkLzT+CimRki1zcN3QUij8ROjbfX94gvntSl3WpIfrKpVsOM2ipA8Qv
	0jF78NclqeLa1rKmoEx/Y+llsHDJBtxYDmlU3jNts7ZXdDmnBhuLWlhJtGOfwYEto6EA0b68sLJmc
	kZ14U5bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGvN-0000000G1tk-1zTh;
	Wed, 14 May 2025 18:33:49 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFG97-0000000Ft0F-2gCu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 17:43:58 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so365475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 10:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747244635; x=1747849435; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jkJfwo8xpBpJbrVIx6UOqAm0kur6+ObopwN4A021JGU=;
        b=xJLHCBSJSQ4W84rBWFEQQXz6XYPqfAfMMxjj4IsDzdllUc11XvOLop6Jy7pGC1R/Bb
         oOJnah6fPBCqlqVCqsNrZ+eo3ozQkHUXPPh6mwFRAbA81DDWKsO4xrcaj+hCbIRacWMz
         NAv8e20p8QT/mZRpgWy58WbCzW1yyT860w8u5c3yRwCxg4yFB0Mb39MymSHwyeCQNOut
         31GzftQl2+e8M0q/TsLidHT8U+f60sQFdLu8KHA+5kwlApDvQ0qRyy/CgLeLSp6GZdVX
         68EyBSCaLDoeyNfGpWXlRmpW4YQsy5H/MppIbT3l88IcBZlXiZGNlG1BBf1N0taN6hDa
         Nb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747244635; x=1747849435;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jkJfwo8xpBpJbrVIx6UOqAm0kur6+ObopwN4A021JGU=;
        b=sUQGRL2oph2+hhtQtXmH4PVtW41pD/REHOqsOsXGeFubz3E1+jc45Od3Xodpd7tRsV
         LFei5MgVU3p09U77ndQsUAbyrNnsl23XHCNk5qiu6wgwXWJA3WeyYah2Fp8gm4ts0yFS
         qkbzyxJO1YDDOXyuYVJcH4wG+JaqVdPkVL07YR76NVb0W5rd+XckV9R/g5A9vqovf94k
         l+bpYT/JYuKzr4+csTiIYIcz4fHqR8+1slXuckrvB+GZQA7iCoo+B2lAzg3N7JTAD94i
         fw0cmktkZY4+aIMNrZdfakKQQ9JvPqcyA1GFgDjQXvqH/2DtOfmn/BFBY3fTIvVK3bfx
         bRoA==
X-Forwarded-Encrypted: i=1; AJvYcCUty/E+fJxv/N0I1shRT7948NqN0P7eTSRmDjkPcYfYDwKmyGSA1EShuc+4p8f+GiR9s1TELbnpwhqMaWZ2UmdK@lists.infradead.org
X-Gm-Message-State: AOJu0YwpEd8j1AX7PZEPOtwK86IGPBUfrBAPpbb37SpKSufyXVnD9z6K
	5g0AaQ04RnKN8hxvPnERdHmwM3CulvfhrcEs31r6sjaFX1zt+AArbKrDIm769H4XzO7aJA==
X-Google-Smtp-Source: AGHT+IGadySak7rBVDWqJCLGSxkPkZ2SIdOa3WalcC/ytBQcEahJVGu+EdIXS9X2q6vXYOUEx7HQqf+B
X-Received: from wmben12.prod.google.com ([2002:a05:600c:828c:b0:43d:1f28:b8bf])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:d:b0:442:f44f:65b
 with SMTP id 5b1f17b1804b1-442f44f09a9mr28697025e9.32.1747244635236; Wed, 14
 May 2025 10:43:55 -0700 (PDT)
Date: Wed, 14 May 2025 19:43:40 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3009; i=ardb@kernel.org;
 h=from:subject; bh=K7cxMrEeOi5MLsm9UXTEEGQ2PJi6zRJCdveu0RXcm6U=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUPlmk908a2ewi2NlRcOfrzbEr36wZqdbZ3PEpNTpiy60
 K6i4buto5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzkHDPD/zy39z+f8TwJtWj2
 Pjj/75SX7elf5hawnNNtq9IT3sr9kZ3hn8ndvqiO38aGxc+NSk4ytGereTr6HWhKlPLfyFm5Nqa RFwA=
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514174339.1834871-9-ardb+git@google.com>
Subject: [RFC PATCH 0/7] arm64: Make EFI calls preemptible
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_104357_699457_7F20EAFF 
X-CRM114-Status: GOOD (  13.66  )
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

The arm64 port permits the use of the baseline FP/SIMD register file in
kernel mode, and no longer requires preemption to be disabled. Now that
the EFI spec is being clarified to state that EFI runtime services may
only use baseline FP/SIMD, the fact that EFI may code may use FP/SIMD
registers (while executing at the same privilege level as the kernel) is
no longer a reason to disable preemption when invoking them.

This means that the only remaining reason for disabling preemption is
the fact that the active mm is swapped out and replaced with efi_mm in a
way that is hidden from the scheduler, and so scheduling is not
supported currently. However, given that virtually all (*) EFI runtime
calls are made from the efi_rts_wq workqueue, the efi_mm can simply be
loaded into the workqueue worker kthread while the call is in progress,
and this does not require preemption to be disabled.

Note that this is only a partial solution in terms of RT guarantees,
given that the runtime services execute at the same privilege level as
the kernel, and can therefore disable interrupts (and therefore
preemption) directly. But it should prevent scheduling latency spikes
for EFI calls that simply take a long time to run to completion.

(*) only efi_reset_system() and EFI pstore invoke EFI runtime services
    without going through the workqueue, and the latter only when saving
    a kernel oops log to the EFI varstore

Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>

Ard Biesheuvel (7):
  efi: Add missing static initializer for efi_mm::cpus_allowed_lock
  efi/runtime: Return success/failure from arch_efi_call_virt_setup()
  efi/runtime: Deal with arch_efi_call_virt_setup() returning failure
  arm64/fpsimd: Don't warn when EFI execution context is preemptible
  arm64/efi: Use a semaphore to protect the EFI stack and FP/SIMD state
  arm64/efi: Move uaccess en/disable out of efi_set_pgd()
  arm64/efi: Call EFI runtime services without disabling preemption

 arch/arm/include/asm/efi.h              |  2 +-
 arch/arm64/include/asm/efi.h            |  5 +--
 arch/arm64/kernel/efi.c                 | 34 ++++++++++++++++----
 arch/arm64/kernel/fpsimd.c              |  4 +--
 arch/loongarch/include/asm/efi.h        |  2 +-
 arch/riscv/include/asm/efi.h            |  2 +-
 arch/x86/include/asm/efi.h              |  2 +-
 arch/x86/platform/efi/efi_32.c          |  3 +-
 arch/x86/platform/efi/efi_64.c          |  3 +-
 arch/x86/platform/uv/bios_uv.c          |  3 +-
 drivers/firmware/efi/efi.c              |  3 ++
 drivers/firmware/efi/riscv-runtime.c    |  3 +-
 drivers/firmware/efi/runtime-wrappers.c | 20 ++++++++----
 include/linux/efi.h                     |  8 ++---
 14 files changed, 63 insertions(+), 31 deletions(-)


base-commit: e04796c8b5980700c78f2fd1b29724afd80dcc62
-- 
2.49.0.1101.gccaa498523-goog


