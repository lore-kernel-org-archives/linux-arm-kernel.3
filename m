Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC8CD609AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 15:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbIyuGUCEu+WrLjGPqPjVoeBl4WzNFLoBz/Ts+Zzwsw=; b=kiWg/amudp+avHPZaauHzuCwtl
	RAvXeERHnmXjBs2X6MujUjHo5v1nU8fCEk2+8eMmDurK1V5BaFh7Na46jI4HvrsAZOF8/qlz9o58u
	gmgYKNWJ8WSoqqzE5z53wtVOfW0gwSfyyoPWWqIRh6K7hY9XvwrvSFJaEWcRkYjIofQUFNekBUHnh
	Tj+85dTaIFqkG9ICimInwzb4XhtkFu1DZZSaBVz8PEHtrQNjxUf3qdxAdjodeS/8HYJXxR8Br4qyQ
	F+m4QVcezhg7w2LrmYszXhHcPInuFO7zEwENEgq7Ez7viopw/rZgh92zfiz51eethE4xIM3YNNIfU
	y88fdFSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWs2-00000005R3R-1bp2;
	Tue, 16 Dec 2025 15:21:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWrz-00000005R35-46as
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 15:21:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6661BFEC;
	Tue, 16 Dec 2025 07:21:38 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F9013F73B;
	Tue, 16 Dec 2025 07:21:44 -0800 (PST)
Date: Tue, 16 Dec 2025 15:21:38 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] ARM: entry: expand comment in __switch_to
Message-ID: <aUF5AofX5plUo9pq@J2N7QTR9R3>
References: <20251216-comments-in-switch-to-v2-1-190d8741db14@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216-comments-in-switch-to-v2-1-190d8741db14@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_072148_077868_A57E5BCC 
X-CRM114-Status: GOOD (  25.92  )
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

Hi Linus,

On Tue, Dec 16, 2025 at 03:27:37PM +0100, Linus Walleij wrote:
> From: Linus Walleij <linus.walleij@linaro.org>
> 
> As per discussion between the developers in the mail thread
> linked, expand the comment in __switch_to so that readers
> of the code understand what is going on.
> 
> Link: https://lore.kernel.org/linux-arm-kernel/ZxDh9biUbf9W8gNN@J2N7QTR9R3/
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

This looks fine to me, with two minor nits noted below. With those
fixed, feel free to add:

  Acked-by: Mark Rutland <mark.rutland@arm.com>

... and I'd recommend dropping this into the patch system.

> ---
> Changes in v2:
> - Rebased on v6.19-rc1
> - Link to v1: https://lore.kernel.org/r/20241028-comments-in-switch-to-v1-0-7280d09671a8@linaro.org
> ---
>  arch/arm/kernel/entry-armv.S | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
> index ef6a657c8d13..5c016c68b5a3 100644
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
> +	@ new taks stack. Do a dummy read from the new stack while

Typo: s/task/task's/

> +	@ running from the old stack so that we can rely on
> +	@ do_translation_fault() to fix up any stale PMD entries
> +	@ covering the vmalloc region.

Ard requested in:

  https://lore.kernel.org/linux-arm-kernel/CAMj1kXFn=pfJqTrMrnqT+OLi3UqAq0PieROQhbC2M3B2uAzyEQ@mail.gmail.com/

That we change this last part from:

  to fix up any stale PMD entries covering the vmalloc region.

... to:

  to populate missing PMD entries covering the new task's stack in the
  old task's page tables.

... and I think that'd be worthwhile.

Mark.

>  	@
>  	ldr	r2, [ip]
>  #ifdef CONFIG_KASAN_VMALLOC
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20241028-comments-in-switch-to-0e24480e8495
> 
> Best regards,
> -- 
> Linus Walleij <linusw@kernel.org>
> 

