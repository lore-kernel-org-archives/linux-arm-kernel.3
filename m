Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5372DCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 22:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5y5C7U0eJNMWpozPRhpxeJdIqeK0zzLaadU8ylQbPm8=; b=upkZVTVyIwhAoypgZzXjUTnIbh
	jfs0s+lSqT0OMYDAMxtN7zCMP6jYmFz6iMwi0dOt2jMOR1f6m/UaJNFzDR14lUD/UjbxfSSakh8gs
	K7pOkNMhUkBCzAwIOVt0RJGUGfbj3p8aLF/mxcZqcZjMNBUrbjkokeeZKMpkb+Z2VHSWQJY1fRikT
	WMlNt+mKMXhWKjrSQYSACuoi/OAgrSkpfgu1vugUDHSQcL65mgb57MfA5dthOX+pIKvrHKoF8XMPu
	ifcm7FpufnOsEtc49vgAh2Q7NjMRnYzpObZfxU+8RcWs4LftVqHGdKafcTtKpK5YY9shMrEwJ/Dn4
	y1WAmZ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQuT7-0000000E3II-1sV0;
	Sat, 23 May 2026 22:05:17 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQuT4-0000000E3HR-28AU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 22:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=5y5C7U0eJNMWpozPRhpxeJdIqeK0zzLaadU8ylQbPm8=; b=29eVPFxrSct7jQWCF+6gO7VEHs
	zKAP0Qda313Jh20BQWWgKsnRy1pBtFicxbgKdgC+UZNl9mNE2ESJ65O+vwTbr4DBVdTrjeqg6wR8L
	saOEkvzVEY1VE2xp9ZYWdUfITY1x72Yt4GTaVgaP9gTF3KQqNscluekNakGKl4cro6dHMxjj9xeek
	30PT+yCxhZmCUr5AdO9vAW3XdmXNUzWSjQ6w6P3CJSTz/Fx2x+EqkL6U9jymtBr/xAEc8ygNjbuIa
	H3uj5A9XYEFwlb/lpVf6QpJ7qTtxOjYvw3w11jiicIcuT5SgSwyb57cH/eRRXhlp3NIXzn32Ttvf/
	wAifhk3Q==;
Date: Sun, 24 May 2026 00:04:52 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Sami Tolvanen
 <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: OMAP2+: Add CFI type for omap4_finish_suspend
Message-ID: <20260524000452.0d67f884@kemnade.info>
In-Reply-To: <20260522233036.12277-1-bavishimithil@gmail.com>
References: <20260522233036.12277-1-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_150514_557416_8EA21F9D 
X-CRM114-Status: GOOD (  14.22  )
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

On Fri, 22 May 2026 16:30:36 -0700
Mithil Bavishi <bavishimithil@gmail.com> wrote:

> With CONFIG_CFI enabled, OMAP4 can trap in omap4_enter_lowpower()
> because omap_pm_ops.finish_suspend points directly to the assembly
> routine omap4_finish_suspend, which lacks the expected KCFI type
> metadata.
> 
> Annotate omap4_finish_suspend with SYM_TYPED_FUNC_START so the assembly
> routine carries the KCFI type metadata.
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
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


