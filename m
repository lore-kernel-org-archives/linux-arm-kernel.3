Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173BECFD65D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDgQg66WtHwoB5p2ozNO+9hOrX3Oztmy8MBfQA8P2JA=; b=cNN//euA+EX7XasODPfevsrq6t
	Lb0H5lcJ5AoT1oU/WIbW5NfHBCtJXeHwTHpmkjsIJQB28lMSOrq0BfiizVjrLVO71daOzh7ZCmerV
	Y8iOtBEFSU+/zRiuq7rqAU90a8ikViBmK4ophkkgDOhB80YSNtAatKPzIgG31hbSf45Do79/sxVdP
	IBFJjc3+CULORDTOL+gYF2qHlCc2XMK0hEQGtnAnqRgzO2twRPNFktssakWvu/mZe6tYCYqh7Vsa4
	KLqwMM80nEoyN21zVkAJApjp999O7qz8k/cPNSkyKhDcWrs4uiDPAiHekukFD8y3HK1X9UBbkVgbK
	yGjIt76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWJP-0000000FGhJ-2Mae;
	Wed, 07 Jan 2026 16:23:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWJG-0000000FGXl-42fH
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 07 Jan 2026 16:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZDgQg66WtHwoB5p2ozNO+9hOrX3Oztmy8MBfQA8P2JA=; b=VjpLKax78RHAwtCf2f7jpg4KCy
	ZlC924ZKNBqr1VzZgml3K9OqPI2sRw6TPozySg0lLBs7dg/PNB006z0lWg9ebFR6G9Drl4DcVlydh
	lZvHm1lZVSwohO1KcH9NmMkI5PmaH8HuWSPoJvij3JBuFyxjvdHEk0na1NjZUOoAC0tgqvXCKRCCD
	9Ubq7rHCPjoll5wh3RHKB6ScQS6syndKdOC6QhDjpwykwuodasq1L2OnTWOhS/BBfejCbvlAcRXvd
	lYnOgVmjoIP/RIIxFVtGc4EzgBDvi1LbHjwRf+33l32vg5TolkNuYNB+qHKJ93wJTmqWB7WXbj/ci
	PAxplQHg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWJD-0000000BgQw-2VNo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:22:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5962442E8;
	Wed,  7 Jan 2026 16:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E877C4CEF1;
	Wed,  7 Jan 2026 16:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767802973;
	bh=h/t0IMw2r1KOgVik7fGfiSYqStx+dX2QtV1GaNuybx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MrdJXSNsL5LUoWximIzD8J5mik0J7vkN/69IxB3kLi2JQbNzM0M/E7WmzHN2322L0
	 pRMDF/eqoJIoeKMjxqqvTQXeaES6SGTonc+KJew1QcPNnAJtJ9HwMqY63Zq0NyMPsj
	 lAQ7abZtSP2JXi7HwtrYj+GYAQlygFZBwgrqt3LJA748pA6bo/GE34QvQi/SuX/C0S
	 RmFsOY/7yJSDH0+jwQK0oLHzmTs98488opQZfVTIoqEMQuOL/F+VqB1PVu37lGaruJ
	 a+71pHzEWLylilQ3GIp4Q8SXkPANYZLge8Te+X9Wv/0qou7ZXCMQop2V6kj0DepxGe
	 Nb3HTggQ9cFcQ==
Date: Wed, 7 Jan 2026 16:22:48 +0000
From: Will Deacon <will@kernel.org>
To: Lucas Wei <lucaswei@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, sjadavani@google.com,
	kernel test robot <lkp@intel.com>, stable@vger.kernel.org,
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	robin.murphy@arm.com
Subject: Re: [PATCH v2] arm64: errata: Workaround for SI L1 downstream
 coherency issue
Message-ID: <aV6IWBtqp1dnOZuX@willie-the-truck>
References: <20251229033621.996546-1-lucaswei@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229033621.996546-1-lucaswei@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_162256_001017_DD4380DE 
X-CRM114-Status: GOOD (  24.97  )
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

[+Robin as he's been involved with this]

On Mon, Dec 29, 2025 at 03:36:19AM +0000, Lucas Wei wrote:
> When software issues a Cache Maintenance Operation (CMO) targeting a
> dirty cache line, the CPU and DSU cluster may optimize the operation by
> combining the CopyBack Write and CMO into a single combined CopyBack
> Write plus CMO transaction presented to the interconnect (MCN).
> For these combined transactions, the MCN splits the operation into two
> separate transactions, one Write and one CMO, and then propagates the
> write and optionally the CMO to the downstream memory system or external
> Point of Serialization (PoS).
> However, the MCN may return an early CompCMO response to the DSU cluster
> before the corresponding Write and CMO transactions have completed at
> the external PoS or downstream memory. As a result, stale data may be
> observed by external observers that are directly connected to the
> external PoS or downstream memory.
> 
> This erratum affects any system topology in which the following
> conditions apply:
>  - The Point of Serialization (PoS) is located downstream of the
>    interconnect.
>  - A downstream observer accesses memory directly, bypassing the
>    interconnect.
> 
> Conditions:
> This erratum occurs only when all of the following conditions are met:
>  1. Software executes a data cache maintenance operation, specifically,
>     a clean or invalidate by virtual address (DC CVAC, DC CIVAC, or DC
>     IVAC), that hits on unique dirty data in the CPU or DSU cache. This
>     results in a combined CopyBack and CMO being issued to the
>     interconnect.

Why do we need to worry about IVAC here? Even though that might be
upgraded to CIVAC and result in the erratum conditions, the DMA API
shouldn't use IVAC on dirty lines so I don't think we need to worry
about it.

> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
> index f0ca7196f6fa..d3d46e5f7188 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -381,6 +381,9 @@ alternative_endif
>  	.macro dcache_by_myline_op op, domain, start, end, linesz, tmp, fixup
>  	sub	\tmp, \linesz, #1
>  	bic	\start, \start, \tmp
> +alternative_if ARM64_WORKAROUND_4311569
> +	mov	\tmp, \start
> +alternative_else_nop_endif
>  .Ldcache_op\@:
>  	.ifc	\op, cvau
>  	__dcache_op_workaround_clean_cache \op, \start
> @@ -402,6 +405,13 @@ alternative_endif
>  	add	\start, \start, \linesz
>  	cmp	\start, \end
>  	b.lo	.Ldcache_op\@
> +alternative_if ARM64_WORKAROUND_4311569
> +	.ifnc	\op, cvau
> +	mov	\start, \tmp
> +	mov	\tmp, xzr
> +	cbnz	\start, .Ldcache_op\@
> +	.endif
> +alternative_else_nop_endif

So you could also avoid this for ivac, although it looks like this is
only called for civac, cvau, cvac and cvap so perhaps not worth it.

> diff --git a/arch/arm64/mm/cache.S b/arch/arm64/mm/cache.S
> index 503567c864fd..ddf0097624ed 100644
> --- a/arch/arm64/mm/cache.S
> +++ b/arch/arm64/mm/cache.S
> @@ -143,9 +143,14 @@ SYM_FUNC_END(dcache_clean_pou)
>   *	- end     - kernel end address of region
>   */
>  SYM_FUNC_START(__pi_dcache_inval_poc)
> +alternative_if ARM64_WORKAROUND_4311569
> +	mov	x4, x0
> +	mov	x5, x1
> +	mov	x6, #1
> +alternative_else_nop_endif
>  	dcache_line_size x2, x3
>  	sub	x3, x2, #1
> -	tst	x1, x3				// end cache line aligned?
> +again:	tst	x1, x3				// end cache line aligned?
>  	bic	x1, x1, x3
>  	b.eq	1f
>  	dc	civac, x1			// clean & invalidate D / U line
> @@ -158,6 +163,12 @@ SYM_FUNC_START(__pi_dcache_inval_poc)
>  3:	add	x0, x0, x2
>  	cmp	x0, x1
>  	b.lo	2b
> +alternative_if ARM64_WORKAROUND_4311569
> +	mov	x0, x4
> +	mov	x1, x5
> +	sub	x6, x6, #1
> +	cbz	x6, again
> +alternative_else_nop_endif
>  	dsb	sy
>  	ret
>  SYM_FUNC_END(__pi_dcache_inval_poc)

But this whole part could be dropped? The CIVACs are just for the
unaligned parts at the ends of the buffer and we shouldn't need to worry
about propagating them -- we just don't want to chuck them away with an
invalidation!

Will

