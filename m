Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6BDCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LXz7drZR69NRcqoi9vT6ordOH/o85U4ZownXle33jo=; b=wwmG9jiMMWEtpGX5AoImD3OOOA
	tyIM6/NFUh/9loTWIOFxpykzeWeD/W16p6/i3bkkhdbge692YFP/Rh/yWu+EJa2yAJLaGESmd34LI
	j3L0EqcFNBk58UEcsaDGxMMM6FMCTVFHTW62pbaa2CN9dQxCgZRcJoujEjWoxJ1xj1th3TX11VjYh
	NQm1JdyQmaRPR/iNVq1PPxtORyHR59rYOdPPOn7/Eq1JCYKnkBpOMn6kIaGsm4Q1rvFZobOYDSqSy
	/xuxZU5HyPNtWB0jB0xpDvZz3R8SyflQxuW2Qrfqqi22qWwkzvPF9ymFi2haFoczod6efWlANMPsC
	c5rlZuwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBur-0000000H4gU-25fq;
	Thu, 18 Sep 2025 10:31:05 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBuX-0000000H4P6-1s2v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:30:46 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-61d31626b01so590364a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 03:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758191443; x=1758796243; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1LXz7drZR69NRcqoi9vT6ordOH/o85U4ZownXle33jo=;
        b=XV6boU2pW8nfXwmninmsPYZLURbxirSKvFJK2MUOy+qITKpghpS2CuZJ/xVCAoa4FA
         jhbZGe2QnwYrFP7rgQc69igmwXKWqxAwBNQziOQzLbtM8KVY5ErCch+66CfIkp3rX40O
         /y7PRFnao1lrt/+8wvP2yBOYZ/tCwpgixruyasSincq4HBannnV1S7Zd6ck4TVjjgj15
         3HNWgLbxQ+32rRyp49B37Xa6hr+KzGMy16caMPm2zDuJMx034/MHnVq4gOVI3eo9yBut
         1WWfaX+Fw5NJyjsdabxws5CSJk4WzIYn9NDpH9kFMp15gtYM12e4+u/Ct97Vdg6B5FPW
         lfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758191443; x=1758796243;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1LXz7drZR69NRcqoi9vT6ordOH/o85U4ZownXle33jo=;
        b=ujdr2Tdu3VXjbiC8MX24zOg/UfoyEAXGxmzQX85eaVoluTvAgmb+a8AkNxKeKDgu5n
         2g6ZqF5xgb+jTo+rsncKcnop6gt5QG6m3e4riOD2lQkUxBqSwknhoiYIanCFUJHbqx0X
         MUjnDtukRDBSnUmm6HYEa5CjIPw2rTN5iBG66jZpEQ0EAkXW2Kg0BbySy+QvvU24lpaS
         O8wZFvGYwU93VbIPpi6+mvHFuJbVguAQOR5ySmSmDUzO1mbdmw+YxEcW/0fNx+2q08Hi
         KH0e0axNpnlB9YTAgcG4JEhTX+xR4CrxG4EvpqiTM2DNpaju0EfrZVWP3koI84mHJ3Lf
         rb+w==
X-Forwarded-Encrypted: i=1; AJvYcCUefV/3UXBvnRALqpTT4O06/DG7fHT3rcBdZnr+JlKq036f4HQlmluegHDiIUi89lhsNPfDGj8tJbPmw69gsz3N@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3fUqqIjaM48AGtReUMu3TkgnUEel4xM+IBRD81YktKg/P/tBK
	B2zxsfsu2rYG4om8RExYehdfxPHDGipPr3OkvT+eavP1E8Ic33go/xzp6GlWc0mfr/KHDSdlyg=
	=
X-Google-Smtp-Source: AGHT+IGUquYXpi2xrIo18MZawlB6gxNVwBfa77lbrIIZHKX8Fpb5Qx9xXEK4QYttljX7a5cizhaLtJAe
X-Received: from edbev11.prod.google.com ([2002:a05:6402:540b:b0:62f:f6a:43ba])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:5210:b0:62f:3721:fc8c
 with SMTP id 4fb4d7f45d1cf-62f846a13f7mr4583585a12.37.1758191443543; Thu, 18
 Sep 2025 03:30:43 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:30:19 +0200
In-Reply-To: <20250918103010.2973462-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20250918103010.2973462-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3226; i=ardb@kernel.org;
 h=from:subject; bh=AwRe+ieGv51rAlmd3os99ZtjQYVM4Fjtomg80IO3BGI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeP0ffu7Hx2rC6Yu2+C13jZCdw5DvK+nWau/35sVhftaX
 tp8npDfUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbyIp6RYcV5l8DV7Qfd7C7x
 d5Wun8r8crV6ic8C9h1zMjXOSHO8v8rwP3F1/+/nc0s3B19zT/4R/KFS8CZb2eepvuv4xAMuFnN LcgMA
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918103010.2973462-18-ardb+git@google.com>
Subject: [PATCH v3 8/8] arm64/efi: Call EFI runtime services without disabling preemption
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_033045_511542_EC4BB531 
X-CRM114-Status: GOOD (  19.13  )
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

The only remaining reason why EFI runtime services are invoked with
preemption disabled is the fact that the mm is swapped out behind the
back of the context switching code.

The kernel no longer disables preemption in kernel_neon_begin().
Furthermore, the EFI spec is being clarified to explicitly state that
only baseline FP/SIMD is permitted in EFI runtime service
implementations, and so the existing kernel mode NEON context switching
code is sufficient to preserve and restore the execution context of an
in-progress EFI runtime service call.

Most EFI calls are made from the efi_rts_wq, which is serviced by a
kthread. As kthreads never return to user space, they usually don't have
an mm, and so we can use the existing infrastructure to swap in the
efi_mm while the EFI call is in progress. This is visible to the
scheduler, which will therefore reactivate the selected mm when
switching out the kthread and back in again.

Given that the EFI spec explicitly permits runtime services to be called
with interrupts enabled, firmware code is already required to tolerate
interruptions. So rather than disable preemption, disable only migration
so that EFI runtime services are less likely to cause scheduling delays.
To avoid potential issues where runtime services are interrupted while
polling the secure firmware for async completions, keep migration
disabled so that a runtime service invocation does not resume on a
different CPU from the one it was started on.

Note, though, that the firmware executes at the same privilege level as
the kernel, and is therefore able to disable interrupts altogether.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/efi.c | 23 ++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index a60444dcec68..9b1603a69b69 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -10,6 +10,7 @@
 #include <linux/efi.h>
 #include <linux/init.h>
 #include <linux/kmemleak.h>
+#include <linux/kthread.h>
 #include <linux/screen_info.h>
 #include <linux/vmalloc.h>
 
@@ -181,7 +182,19 @@ bool arch_efi_call_virt_setup(void)
 	if (WARN_ON(!mutex_trylock(&efi_rt_lock)))
 		return false;
 
-	efi_virtmap_load();
+	if (preemptible() && (current->flags & PF_KTHREAD)) {
+		/*
+		 * Disable migration to ensure that a preempted EFI runtime
+		 * service call will be resumed on the same CPU. This avoids
+		 * potential issues with EFI runtime calls that are preempted
+		 * while polling for an asynchronous completion of a secure
+		 * firmware call, which may not permit the CPU to change.
+		 */
+		migrate_disable();
+		kthread_use_mm(&efi_mm);
+	} else {
+		efi_virtmap_load();
+	}
 
 	/*
 	 * Enable access to the valid TTBR0_EL1 and invoke the errata
@@ -207,7 +220,13 @@ void arch_efi_call_virt_teardown(void)
 	 */
 	uaccess_ttbr0_disable();
 
-	efi_virtmap_unload();
+	if (preemptible() && (current->flags & PF_KTHREAD)) {
+		kthread_unuse_mm(&efi_mm);
+		migrate_enable();
+	} else {
+		efi_virtmap_unload();
+	}
+
 	mutex_unlock(&efi_rt_lock);
 }
 
-- 
2.51.0.384.g4c02a37b29-goog


