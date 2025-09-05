Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D16CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 18:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8ZHeDW24WP1XSFE+jvhzynpDGxt9MOiB64/YvwvtypQ=; b=eohhyf0ElURQ5wwRFvTQA8rrTt
	cbC3nZAmiBpAWJ1HfZtWO2i/PDtefp/DU0JQqe3mTOZBLao54lO0AF5vglhrhgfkhlpLlyDcEmhNk
	619izWrsO4k/s+AOQyVTm63RMwtbXcmwCB15pcrw9Uu5qVFIhaHQJBi7P+ebwBHvrEfrQD1YkZs4r
	66vdpxaqMssIyMVdeS1CHlQ3K5ceUySYGNOTB084rMGDWIeNUdfjCtaJz8KxeRRUakkDQOkYhqspI
	X2Qeu/eRuE0mWiDst565p4qogkB9I1gjjQ9rvNg7tHGv1eFQIp6bB1y12ABC1Y0b222v4R7frUyIg
	KTGzsI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubOW-00000003sGb-0kwt;
	Fri, 05 Sep 2025 18:42:44 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWWd-00000001zOM-1Kgz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 13:30:48 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45ceeae0513so11548915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 06:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757079045; x=1757683845; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8ZHeDW24WP1XSFE+jvhzynpDGxt9MOiB64/YvwvtypQ=;
        b=PQLVIGSaGIzJnGHsTPS4XBlMQd5ETbxAonQT580y5uHQxsvu5Q1Zr/qUh8MwySP7DG
         OI8Em6N8wE4+4odXtrmJ3a7u8l2Bv2YhALgVZT8eu6FOPRDqsm3foF98nOhofcuqms15
         D83khPxhVQaBAbZELPnhbSEaBIMUbbf3qLmObTzldKe0WmydI0398VwIWItSYPz1t/Rz
         nhGp1eZvoQm6N6R0NjYCvs+31i6086lTlvFUi20c0RsxgRwXFaqIcZID1ADcJ6utQOKk
         Itol1tH3rWG26bPEShe0WeZj8407Oaj3yO7r9IviQueyTjaP9As8IPz5SuO6nzOUS8U2
         l+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757079045; x=1757683845;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ZHeDW24WP1XSFE+jvhzynpDGxt9MOiB64/YvwvtypQ=;
        b=ExnD47edwq34xOvXvFE1+Rn3O/LqCnNXTpBC5PK3EJEWfCQAqHMAXNZcAQGEHUxgsR
         pAm5rytnvM1vHNxTe+llDkb2p/JTj3WYllGKT60o8W42c9gvNOKuv6X46Lx9g0sk6FgX
         lsqBPX1lN4eVgA/ZOtDCVTc0EQxcAwp3hR1enmXOp3ihrGqMTVp/dYtpPVCJv64rBdgh
         lrQM3liSVexuxRA/Zc8V/UUp/j7rPq7JtonQPe/CBeEJvKZzODN8d1TG+aTiDXYHSEP1
         3qXthWvJU0mgBiXLXgplIIMZLiX7ZS5uZq967G1m+p++HvJgpccjst+GO4rSGCXZ3tNN
         vPLA==
X-Forwarded-Encrypted: i=1; AJvYcCW1+gRhJDa/p96WDpby9v31WokVh1ENT9GSSned1DauZMj//VK6N1dB18yF/dlbDm7L/ODWKXHp5oeLFtUqWQck@lists.infradead.org
X-Gm-Message-State: AOJu0YyCNzuTUKc5T9+aGFKYheqfvt0TU2eeKVfJJXOCBKKDAxtAyBBk
	hKohw0X5/DgIJJFzBUqkrbpDcZFyQlLfVeH7Rjx2zoIKkd+mxp+ChUGBJvlpROEe5W8wNlb+sg=
	=
X-Google-Smtp-Source: AGHT+IEcAay+d9Q2HsIqksVMZuwbG0fIEpd9hdFpt9bpO8YYAbsVZJ7hLJVUgxBdyn6pNK9245tvkFy+
X-Received: from wmbez15.prod.google.com ([2002:a05:600c:83cf:b0:45d:d3ef:abb8])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e91:b0:45d:5c71:76a9
 with SMTP id 5b1f17b1804b1-45d5c71790bmr73776295e9.24.1757079045445; Fri, 05
 Sep 2025 06:30:45 -0700 (PDT)
Date: Fri,  5 Sep 2025 15:30:36 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3170; i=ardb@kernel.org;
 h=from:subject; bh=JoTq1uEfGexvL5NaCkoOvfw2N83VC/SjYfCd8EObR0A=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWPX0z+6Ky32OJn582/nqjMS+dvcaZvE9luse25HgcKnW
 t6ujlsdpSwMYlwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCKyTxgZduyImn9pcsfZ5GDD
 2zHSRUlG/hr3lGN3W+tada9l8ZKOYGT4dVPw7USe2ceu/tOX33tk+ZNpQTX7b7zqPnNMpnvP53Y lbgA=
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250905133035.275517-9-ardb+git@google.com>
Subject: [PATCH v2 0/7] arm64: Make EFI calls preemptible
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_063047_375163_7F0D8C0F 
X-CRM114-Status: GOOD (  14.28  )
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

Changes since v1/RFC:
- Disable uaccess for SWPAN before updating the preserved TTBR0 value
- Document why disabling migration is needed
- Rebase onto v6.17-rc1

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
 arch/arm64/include/asm/efi.h            | 15 ++----
 arch/arm64/kernel/efi.c                 | 57 +++++++++++++++++---
 arch/arm64/kernel/fpsimd.c              |  4 +-
 arch/loongarch/include/asm/efi.h        |  2 +-
 arch/riscv/include/asm/efi.h            |  2 +-
 arch/x86/include/asm/efi.h              |  2 +-
 arch/x86/platform/efi/efi_32.c          |  3 +-
 arch/x86/platform/efi/efi_64.c          |  3 +-
 arch/x86/platform/uv/bios_uv.c          |  3 +-
 drivers/firmware/efi/efi.c              |  3 ++
 drivers/firmware/efi/riscv-runtime.c    |  3 +-
 drivers/firmware/efi/runtime-wrappers.c | 20 ++++---
 include/linux/efi.h                     |  8 +--
 14 files changed, 89 insertions(+), 38 deletions(-)


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.51.0.355.g5224444f11-goog


