Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9354ACD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 01:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgG/WK4w3DmgQeJigoCOVGTZUreRd8ANchlOeI9Sask=; b=aGG+OdOMFmSwEb5N0FXEP7cecF
	yFkoR62Ues55pU8xZoBH1oKx+BqKIwjT5BvSPd4x03JKFeZlDSi+xF6gGlt+li3JVjJuiUVhxr26H
	KoTkLYmcKrKNQgjmu0ybIuh/RPbcaISyR52qG5FIWLxFjAE36z3HFB58A1hO542j+VAiSQleBR8Fh
	3PDHZF2Oylza3RVhlCgkHolINSE1haLsBTfRF79Xk8YyOFhglnm/UZfOex1IXjObiWpkRHgIjJXs6
	8AepKxAohiLnWvLeqdUSjP20BOaGehrRbvIfCGsEmkxijTycjLx3rq48UKASz67gH6Y+sqylewp9Y
	TdssfLvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQazt-0000000CNbu-1iKP;
	Sat, 23 May 2026 01:17:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQazr-0000000CNbd-40bQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 01:17:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 04AB460103;
	Sat, 23 May 2026 01:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C44A1F000E9;
	Sat, 23 May 2026 01:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779499066;
	bh=HgG/WK4w3DmgQeJigoCOVGTZUreRd8ANchlOeI9Sask=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UN9bHPFU251YKJIEQ6b68/REcbApvPpea4AqPunrvaf0B5eHUiZ6rWBwKtmkUnzcu
	 O8Q9N3jZxaZ1u7WXAJPP4cxt4oupewzOjy1TKcQrUfPBXNtSscgKsSJfZ2T2bw29yG
	 YKTupMsk4bp2hiqanw8s67ClVh9s7ijpqoco8GA1tYT+wYdunu8EdCD6As7uhSl5sA
	 uhTvbsg67bvxUEfJL9/PG3JPRGd30ZapdGBEB9ZmAqxsdfiR3tFMX8PkBdVNqr/Zth
	 o5NfNCu+yqV82zPDeNVt+nCTjnyqXmy9diKuEw42XzMogEae/E596Z3dOezD50wGFR
	 bf2gf9TSGRyjw==
Date: Fri, 22 May 2026 18:17:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: OMAP2+: Add CFI type for omap4_finish_suspend
Message-ID: <20260523011741.GC520407@ax162>
References: <20260522233036.12277-1-bavishimithil@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522233036.12277-1-bavishimithil@gmail.com>
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

On Fri, May 22, 2026 at 04:30:36PM -0700, Mithil Bavishi wrote:
> With CONFIG_CFI enabled, OMAP4 can trap in omap4_enter_lowpower()
> because omap_pm_ops.finish_suspend points directly to the assembly
> routine omap4_finish_suspend, which lacks the expected KCFI type
> metadata.
> 
> Annotate omap4_finish_suspend with SYM_TYPED_FUNC_START so the assembly
> routine carries the KCFI type metadata.
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm/mach-omap2/sleep44xx.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-omap2/sleep44xx.S b/arch/arm/mach-omap2/sleep44xx.S
> index f09c91978..0b48df6fc 100644
> --- a/arch/arm/mach-omap2/sleep44xx.S
> +++ b/arch/arm/mach-omap2/sleep44xx.S
> @@ -58,7 +58,7 @@
>   * stack frame and it expects the caller to take care of it. Hence the entire
>   * stack frame is saved to avoid possible stack corruption.
>   */
> -ENTRY(omap4_finish_suspend)
> +SYM_TYPED_FUNC_START(omap4_finish_suspend)
>  	stmfd	sp!, {r4-r12, lr}
>  	cmp	r0, #0x0
>  	beq	do_WFI				@ No lowpower state, jump to WFI
> @@ -223,7 +223,7 @@ skip_scu_gp_clear:
>  	isb
>  	dsb
>  	ldmfd	sp!, {r4-r12, pc}
> -ENDPROC(omap4_finish_suspend)
> +SYM_FUNC_END(omap4_finish_suspend)
>  
>  /*
>   * ============================
> -- 
> 2.43.0
> 

-- 
Cheers,
Nathan

