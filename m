Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF4AC982C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 14:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vil656UqbjprUdNpPyb3+DTzB2N5swUB89QchYpl8Yo=; b=nLI2ec+xeYkuTI1ZHma3kzCwM3
	3H1NLHx0uJZqTYiwnGrxwgH0VOJ0J0dxbKsFFKeIJLiGKSHG5zYTVZ1p/Heppw1n3EZNMw4XRv6em
	39/Imv2R6oNdjmjQLQrAUqj+u+y4mQw3m5Fon0oQY5ZCj8wcUspu/elX8P6ly8OUszlWoFG28BgdC
	/BF7h3f138tBhhLpDW68seFiI84PTfojqUaBfS9zIRcaZkGL0Gsff/TlU/2SOBI6zpnMypzInU1bS
	pFflL4XxVvtkEASQCI7GaixA1Gh4sBZr2qW8JxUeRbOgx0w0N1fIgBdtiHj/49/F7M953SuE5/QCP
	oWUxBuJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qZh-00000009OIC-3LnU;
	Wed, 16 Sep 2026 14:25:25 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qZg-00000009OHs-2uII
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 14:25:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Vil656UqbjprUdNpPyb3+DTzB2N5swUB89QchYpl8Yo=; b=AY2RHPaJgAl281YUwUH0cQfJU4
	58jbbYNSi8JrR7ACAwnYD3DOX2eT243Qz1PZ4/4lYZuX5LkL1vb5yjMuM18cBhUCERs7KFmWhswiq
	qGx6qRGj8eT5Qw5jfGdCanb4woWAB33xR6Xf7eP5Ca6KvGYw4SPNxpF8OUOjkZawPID1WvCP50sIT
	3IBpueuPt0cHuIyxUVoImgtja8V47wG4dkMmUS59DplpsBJrWep6hwP74BJ2nWJH2Epl2m369RawO
	Y2vhh4iptdIVXZET8oVS5/dU+2WRSwsLkN2WJQOFFLWmsP9+9eIMJymCkV73XZCdCiIqZADmXud7t
	TNYlegCw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6qZC-00000007ySf-1ncV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 14:24:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E627C143D;
	Wed, 16 Sep 2026 07:24:28 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49B2F3F7B4;
	Wed, 16 Sep 2026 07:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789568672; bh=y5EcF/bDhZcEM0MZ71FZRncO8e+ADBprizKCsXz5T/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFwGhLhdM0FUDVlGeDxONnYI05qsWbPanwiPxV7rUn1ovngADP+E+OqTp0JTNNG9u
	 IhD4negOLdgD55P0ZSDuKVRdVawQbCJ+TX+t/bCkZBtuigg7fOj6WvbtHalrJHIunz
	 PVs5cThOhvok9bST1s7Hk6X1unFr6OdbAAHwDidM=
Date: Wed, 16 Sep 2026 15:24:24 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Florian Weimer <fweimer@redhat.com>,
	Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
	Uros Bizjak <ubizjak@gmail.com>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH v8 1/4] arm64: vdso: Prepare for robust futex unlock
 support
Message-ID: <aqqmmNTDnzT5d-ZT@J2N7QTR9R3>
References: <20260821-tonyk-robust_arm-v8-0-077707b6f1c7@igalia.com>
 <20260821-tonyk-robust_arm-v8-1-077707b6f1c7@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260821-tonyk-robust_arm-v8-1-077707b6f1c7@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_152454_741669_987C7F5B 
X-CRM114-Status: GOOD (  44.18  )
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

Hi André,

I have a few comments here; mostly minor nits.

On Fri, Aug 21, 2026 at 06:50:42PM -0300, André Almeida wrote:
> To solve the robust futex's list_pending_op clearing race condition,
> prepare for implement __vdso_futex_robust_try_unlock() for arm64 with the
> following steps:
> 
> - Create a helper function that sets the struct futex_mm_data with the
> VDSO's labels addresses. The robust futex fixup mechanism needs to
> compare the current instruction pointer to the VDSO instructions range.
> 
> - Split vdso_mremap() in vdso_mremap() and aarch32_mremap(), this allows
> the VDSO to be setup correctly regarding the instructions addresses for
> both ABIs when a mremap happens.

When I commented back on v5, I'd meant that the mremap changes should be
a separate patch. I've included a patch for that below; are you're happy
to take that as a prefix of this series?

> - Implement arch_futex_robust_unlock_get_pop() for arm64, checking for r2
> and r3 registers values for the fixup function. The role of this registers
> is explained in the commit that implement the assembly portion of the VDSO.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v6:
>  - Restructured this commit. Move the arch bits away, kept just the
>  generic/helper functions.
> 
> v4:
> - Guard symbols from vdso.lds.S with ifdef
> - drop update_ips() from sigpage remap function
> 
> v3:
>  - Fix adding vdso base addr twice
>  - Call vdso_futex_robust_unlock_update_ips() on remap as well
> v2:
>  - Fixed linker not finding VDSO symbols
> ---
> ---
>  arch/arm64/include/asm/futex_robust.h | 19 +++++++++++++++++++
>  arch/arm64/kernel/vdso.c              | 27 ++++++++++++++++++++++++++-
>  2 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/futex_robust.h b/arch/arm64/include/asm/futex_robust.h
> new file mode 100644
> index 000000000000..4ff783bb2dc3
> --- /dev/null
> +++ b/arch/arm64/include/asm/futex_robust.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_ARM64_FUTEX_ROBUST_H
> +#define _ASM_ARM64_FUTEX_ROBUST_H
> +
> +#include <asm/ptrace.h>
> +
> +static __always_inline void __user *arm64_futex_robust_unlock_get_pop(struct pt_regs *regs)
> +{
> +	/*
> +	 * w3 stores the result of the stlxr instruction. If it's zero, the then
> +	 * the ll/sc cmpxchg succeeded and the pending op pointer needs to be cleared.
> +	 */

It would be good if the comment could refer to the functions with the
critical sections, e.g.

	/*
	 * In the asm for __vdso_futex_robust_list{64,32}_try_unlock(), ...
	 */

That way it will be easier for folk to cross-reference this later.

> +	return (regs->user_regs.regs[3]) ? NULL : (void __user *) regs->user_regs.regs[2];

You can use 'regs->regs[n]' in place of 'regs->user_regs.regs[n]' here,
which will make this a bit shorter and easier to read.

I reckon this might also be clearer as:

| 	if (regs->regs[3])
| 		return NULL;
| 	
| 	return (void __user *)regs->regs[2];

Do we need a __force cast here, or is sparse happy without that?

> +}
> +
> +#define arch_futex_robust_unlock_get_pop(regs) \
> +	arm64_futex_robust_unlock_get_pop(regs)
> +
> +#endif /* _ASM_ARM64_FUTEX_ROBUST_H */
> diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
> index 592dd8668de4..3ef331b5b240 100644
> --- a/arch/arm64/kernel/vdso.c
> +++ b/arch/arm64/kernel/vdso.c
> @@ -11,6 +11,7 @@
>  #include <linux/clocksource.h>
>  #include <linux/elf.h>
>  #include <linux/err.h>
> +#include <linux/futex.h>
>  #include <linux/errno.h>
>  #include <linux/gfp.h>
>  #include <linux/kernel.h>
> @@ -57,6 +58,22 @@ static struct vdso_abi_info vdso_info[] __ro_after_init = {
>  #endif /* CONFIG_COMPAT_VDSO */
>  };
>  
> +#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
> +static inline void __vdso_futex_update_ips(struct mm_struct *mm, bool is_32bit, void *startp,
> +					   void *endp)
> +{
> +	unsigned long start = (unsigned long) startp;
> +	unsigned long end = (unsigned long) endp;

Nit: there shouldn't be a space between the cast and the expression:

	unsigned long start = (unsigned long)startp;
	unsigned long end = (unsigned long)endp;

> +	struct futex_mm_data *fd = &mm->futex;
> +
> +	futex_set_vdso_cs_range(fd, is_32bit ? 1 : 0, start, end, is_32bit);

On arm64 (and every architecture other than x86, AFAICT), the
native/compat VDSOs are mutually exclusive, and a single mm can only
have one of them.

Given that, I think we can make this:

	futex_set_vdso_cs_range(fd, 0, start, end, is_32bit);

That way we'll avoid confusing/bikesheeding over 'is_32bit ? 1 : 0',
without having to add mnemnonics for the native/compat CS indices.

That said, what's the plan for 32-bit robust lists on a 64-bit host?
IIUC you wanted that for emulation, and AFAICT you have no way to call
__vdso_futex_robust_list32_try_unlock() from a native task.

> +}
> +
> +#else
> +static inline void __vdso_futex_update_ips(struct mm_struct *mm, bool is_32bit, void *startp,
> +					   void *endp)
> +#endif /* CONFIG_FUTEX_ROBUST_UNLOCK */
> +
>  static int vdso_mremap(const struct vm_special_mapping *sm,
>  		struct vm_area_struct *new_vma)
>  {
> @@ -162,6 +179,14 @@ static int aarch32_sigpage_mremap(const struct vm_special_mapping *sm,
>  	return 0;
>  }
>  
> +static int aarch32_mremap(const struct vm_special_mapping *sm,
> +		struct vm_area_struct *new_vma)
> +{
> +	current->mm->context.vdso = (void *)new_vma->vm_start;
> +
> +	return 0;
> +}
> +
>  static struct vm_special_mapping aarch32_vdso_maps[] = {
>  	[AA32_MAP_VECTORS] = {
>  		.name	= "[vectors]", /* ABI */
> @@ -174,7 +199,7 @@ static struct vm_special_mapping aarch32_vdso_maps[] = {
>  	},
>  	[AA32_MAP_VDSO] = {
>  		.name = "[vdso]",
> -		.mremap = vdso_mremap,
> +		.mremap = aarch32_mremap,
>  	},
>  };

As above, I'd prefer if the mremap changes were a separate patch, e.g.
as below.

Mark.

---->8----
From 39029dfea82a54bd7b511cc036d10ef8e8ee4ccd Mon Sep 17 00:00:00 2001
From: Mark Rutland <mark.rutland@arm.com>
Date: Wed, 16 Sep 2026 11:03:32 +0100
Subject: [PATCH] arm64: vdso: Split native/compat mremap callbacks

Currently the native and compat VDSOs share a common vdso_mremap()
function which is used as their vm_special_mapping::mremap callback.

In subsequent patches the native and compat VDSOs will need distinct
mremap logic, which will be easier to manage with separate functions.

Give the compat VDSO its own aarch32_vdso_mremap() function. For now
this is identical to vdso_mremap().

At the same time, fix the odd whitespace in the vdso_mremap() prototype.

There should be no functional change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
---
 arch/arm64/kernel/vdso.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 592dd8668de46..089a70d962204 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -58,7 +58,7 @@ static struct vdso_abi_info vdso_info[] __ro_after_init = {
 };
 
 static int vdso_mremap(const struct vm_special_mapping *sm,
-		struct vm_area_struct *new_vma)
+		       struct vm_area_struct *new_vma)
 {
 	current->mm->context.vdso = (void *)new_vma->vm_start;
 
@@ -162,6 +162,14 @@ static int aarch32_sigpage_mremap(const struct vm_special_mapping *sm,
 	return 0;
 }
 
+static int aarch32_vdso_mremap(const struct vm_special_mapping *sm,
+			       struct vm_area_struct *new_vma)
+{
+	current->mm->context.vdso = (void *)new_vma->vm_start;
+
+	return 0;
+}
+
 static struct vm_special_mapping aarch32_vdso_maps[] = {
 	[AA32_MAP_VECTORS] = {
 		.name	= "[vectors]", /* ABI */
@@ -174,7 +182,7 @@ static struct vm_special_mapping aarch32_vdso_maps[] = {
 	},
 	[AA32_MAP_VDSO] = {
 		.name = "[vdso]",
-		.mremap = vdso_mremap,
+		.mremap = aarch32_vdso_mremap,
 	},
 };
 
-- 
2.30.2


