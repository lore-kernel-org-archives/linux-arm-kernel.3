Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD04CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 21:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVeBxV3npQhGFjd3cFphrrfxu61g0yoUdtS4oHH6rZ4=; b=2WrQSJ3MxSV7yI0yeaTxJAPGL0
	6IR/myiDuYur1EGhynKAj6/PoCW2ZEquu/9WQiDYjznNwu4alptUj0PDFPHxewjvSkm7+eygTEsak
	bmreVF3hpYZBtvcZVFTDiACN/jYdQuSR7ElhdGdgBwfuoMCyvPD+exki9YLBiHs7Nw7Fu8v1UlK53
	ttszIsKoc/VupjbtyKN0fLbugdmuXf+9pBoYOPvLZ7pBC5PkMsud+HcBRHSdaIay2gPJYaq5rI0ma
	5CS5YpCZtaVpIle5csXnTAE6q3XV9wxwQ0sJ0Kkghl7V6tHUUHUa6baj3KTQrWQ4lksYvyUG+EDIq
	cw7X5myg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTf5-0000000FLoj-16B6;
	Sun, 04 Oct 2026 21:22:23 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTey-0000000FLmS-2jnq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 21:22:21 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5775340E015B;
	Sun,  4 Oct 2026 21:21:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5OJwn_BmlW23; Sun,  4 Oct 2026 21:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1791148908; bh=FVeBxV3npQhGFjd3cFphrrfxu61g0yoUdtS4oHH6rZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OERElRgKK6gtkWWOo+K4+GMnCersfdUlQm+1L0vPIjEhTv+MCfX4edU8Zt2nymUSz
	 1jHn1zY5YQXGvUFsETIG6ipvl5c+KA+MLyF2uQ+wnRBjQWWML1KwdzCbP3ap2GY0Tw
	 2N1cqe9YCVqUtrrMQ58CwPd1mxKhOQi5u0XXyHJFEdcuc+kKFuxYFmTtBJp5zostnk
	 EJvMbRBCHGu7Mwtrw/dcAb9YcrJplgCwONsj2CzWTr1b092uTKHCEhWm6OLQ23wqx+
	 KFreX4bbI3ZteCBluDZKHp6UjylnZYH/nqKV8bfPltIuop9nPaY73yQg3adUDZk62y
	 uJch4X8Jnt8fe0jhivKuxMYEiNcT5144XISF9XKEjRF+spqJft1Vb+tQ1cUzCeJncI
	 Gab3TgOtGdPGC9nb0sd4avZIqaKzX+jK+T+7KRUFULEtXxJE3adpW90sXwbvkvgn3W
	 6N690BoNgE404Paxi6N564DikidG/3TdzEBbzH+FoCGCWnzZf2eBJB1j8CiVS9OsP3
	 1kk9P7aTbQszbcf3JiEx+xAI/ynzwBi2S+1jNECoSQmz9rm2TjMiIjatj2yUrznWdV
	 FGkMOjJokT7L2+I6ofWmL0YbO4+mvAa4Q0fvwCmI83G8kXMPuVNuadroeIlqrQ3vdA
	 EjHY+Frg8Nh4AJk02iARaYac=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DF11F40E01B4;
	Sun,  4 Oct 2026 21:21:33 +0000 (UTC)
Date: Sun, 4 Oct 2026 14:21:29 -0700
From: Borislav Petkov <bp@alien8.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
	Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH v4 2/9] EDAC/aspeed: Free the interrupt before the
 mem_ctl_info on remove
Message-ID: <20261004212129.GBasLDWZyMyVNXIKmq@fat_crate.local>
References: <20260930-edac-v4-0-c2e526f3ed79@aspeedtech.com>
 <20260930-edac-v4-2-c2e526f3ed79@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930-edac-v4-2-c2e526f3ed79@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_142216_855762_79501269 
X-CRM114-Status: GOOD (  27.15  )
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

On Wed, Sep 30, 2026 at 01:15:00PM +0800, Ryan Chen wrote:
> The ECC interrupt is devm-managed, so it is only released after .remove()
> has returned, and masking the controller does not wait for a handler
> already running on another CPU. edac_mc_free() can therefore free the
> mem_ctl_info the handler uses as its context while it is still running.
> 
> Fix the ordering and synchronise by freeing the interrupt prior to
> releasing related memory.
> 
> Fixes: 9b7e6242ee4e ("EDAC, aspeed: Add an Aspeed AST2500 EDAC driver")
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> 
> ---
> Changes in v4:
> - Drop the Cc: stable tag.
> 
> Changes in v2:
> - New patch.
> ---
>  drivers/edac/aspeed_edac.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
> index 83d60414f89a..e05ebed5c2f2 100644
> --- a/drivers/edac/aspeed_edac.c
> +++ b/drivers/edac/aspeed_edac.c
> @@ -359,11 +359,16 @@ static int aspeed_probe(struct platform_device *pdev)
>  static void aspeed_remove(struct platform_device *pdev)
>  {
>  	struct mem_ctl_info *mci;
> +	int irq;
>  
>  	/* disable interrupts */
>  	regmap_update_bits(aspeed_regmap, ASPEED_MCR_INTR_CTRL,
>  			   ASPEED_MCR_INTR_CTRL_ENABLE, 0);
>  
> +	irq = platform_get_irq(pdev, 0);
> +	WARN_ON(irq < 0);
> +	devm_free_irq(&pdev->dev, irq, platform_get_drvdata(pdev));

A couple of things come to mind when looking at this:

- if you have to do platform_get_irq(), then something in the design of this
  driver is missing. Perhaps a private structure:

  struct mem_ctl_info.pvt_info

  which contains driver-specific stuff like the irq number and so on. Look at
  the other EDAC drivers for examples.

- then, what is the point of this being a devm-managed IRQ if you have to
  explicitly free it?

  By that logic, you might as well use the normal IRQ registration stuff.

  But then looking at the other EDAC drivers, they all do devm_request_irq()
  but only the DMC-520 one does free_irq().

  So that would mean that either all the other EDAC drivers need such a fix.
  And they would all need proper auditing to make sure when they disable IRQs,
  all IRQ handlers running have finished.

  Or, their hw can handle that and IRQs firing at driver remove time is not an
  issue...

  Sounds to me like I need to do a EDAC subsystem TODO for all the driver
  owners to go read and check...

So I'm presuming this is Sashiko reporting an issue and you're addressing it.
Or is it a real issue that someone hits?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

