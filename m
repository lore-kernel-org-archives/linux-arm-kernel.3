Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3660C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tql1m+bGQMDRHYhvNQkD5BUwGzZqgpkkLLwEUbCEnPw=; b=G21yi48L5wasZKXbYx5TVA/uO+
	ASQORJmHi8zrFn1Pf4iLm71GIybb6k2jpOoX4GbZeMhxP32Da+3DA61/ZYN57iLIElCquiyQSk0O2
	sFJycfdgGF/7tSvATWONJLZi+O5gFjUlDiD3ORKZdmTtXc29f9ZDH2xvDvzRISHp8PHVeJ/qg98f7
	mMxWAqjf9tAu6Q1RSasM0VA4gE0DbeZc6JzHgwVL/XRIGz9vE7OYv5erX2acCil6hVAn0oq42krdQ
	iv+wicuLVvHQKYNFHgJxwA9fd5Pvqisl6+afcGi4Cmc9ju3hHbxagcP446Bc6J+roUPi7YFYCtIMB
	Grg0OkMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYgB-0000000HBU0-0fqU;
	Tue, 30 Jun 2026 13:39:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYg8-0000000HBTP-3k5f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:39:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0409219F6;
	Tue, 30 Jun 2026 06:39:01 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7744E3F673;
	Tue, 30 Jun 2026 06:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782826745; bh=C/TZ3bGh+kkFpicAEOzK4d4McZW2dZtSMkIyUAEDH+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lpTYVAAVE4xXlwuOd4iTzsrHrSktagKHLideDJ29Cp/OTEx7F89i4qrF3Zgw2O77e
	 bFiTJNwQ51ykkQXPsy4bfoeyamhhrJLaJhlH/KMSaDouxXGEvZnoQpuRfa4VkdYDL9
	 Iexs6eNKXtXt6Qq81VdQWpTcmxJAkbQr+lLKlV6E=
Date: Tue, 30 Jun 2026 14:38:59 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] ARM: entry: expand comment in __switch_to
Message-ID: <akPG841symlzalh-@J2N7QTR9R3.cambridge.arm.com>
References: <20260630-comments-in-switch-to-v3-1-87a946a3fddd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630-comments-in-switch-to-v3-1-87a946a3fddd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_063908_998348_AFE1DC39 
X-CRM114-Status: GOOD (  26.55  )
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

On Tue, Jun 30, 2026 at 11:38:55AM +0200, Linus Walleij wrote:
> From: Linus Walleij <linus.walleij@linaro.org>
> 
> As per discussion between the developers in the mail thread
> linked, expand the comment in __switch_to so that readers
> of the code understand what is going on.
> 
> Link: https://lore.kernel.org/linux-arm-kernel/ZxDh9biUbf9W8gNN@J2N7QTR9R3/
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> ---
> Changes in v3:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v2: https://lore.kernel.org/r/20251216-comments-in-switch-to-v2-1-190d8741db14@kernel.org

Looks like you might have forgotten something here. ;)

This looks good to me, so I reckon you should drop it into Russell's
patch tracker:

  https://www.armlinux.org.uk/developer/patches/

Mark.

> 
> Changes in v2:
> - Rebased on v6.19-rc1
> - Link to v1: https://lore.kernel.org/r/20241028-comments-in-switch-to-v1-0-7280d09671a8@linaro.org
> ---
>  arch/arm/kernel/entry-armv.S | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
> index a3d050ce9b79..2d2ea3ca880c 100644
> --- a/arch/arm/kernel/entry-armv.S
> +++ b/arch/arm/kernel/entry-armv.S
> @@ -557,9 +557,16 @@ ENTRY(__switch_to)
>  	ldmia	r4, {r4 - sl, fp, ip, lr}	@ Load all regs saved previously
>  #ifdef CONFIG_VMAP_STACK
>  	@
> -	@ Do a dummy read from the new stack while running from the old one so
> -	@ that we can rely on do_translation_fault() to fix up any stale PMD
> -	@ entries covering the vmalloc region.
> +	@ For a non-lazy mm switch, check_vmalloc_seq() has ensured that
> +	@ that the active mm's page tables have mappings for the prev
> +	@ task's stack and the next task's stack.
> +	@
> +	@ For a lazy mm switch the active mm's page tables have mappings
> +	@ for the prev task's stack but might not have mappings for the
> +	@ new task's stack. Do a dummy read from the new stack while
> +	@ running from the old stack so that we can rely on
> +	@ do_translation_fault() to populate missing PMD entries covering the
> +	@ new task's stack in the old task's page tables.
>  	@
>  	ldr	r2, [ip]
>  #ifdef CONFIG_KASAN_VMALLOC
> 
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20241028-comments-in-switch-to-0e24480e8495
> 
> Best regards,
> --  
> Linus Walleij <linusw@kernel.org>
> 

