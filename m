Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1D0D5C0C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 12:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzdQS4/ZSL660WMfzgBrIZD7Rk0XpNGJIyiuk2R/8zc=; b=gdSR3zRt8y/L4PMc48De6WCOUk
	tsIDkueSuRjwHjBreBly57SrD/XBGeYaei4+rOqlx1ugnlXPNz1YhMbYiwR2P3HQXRdrcRBdWEGpk
	cwHyYnAc5qCchFn+urpjeR/IUum/Qu7WJsR+rOsas1qSYL7Nk3rvRicWMEOrczFcQiQEao6+FdGCL
	TBm5kzRPiLhCzqzCYVYhb/iqg3aSXDPn6xD0AjCsGFRjLJgVsFBzbgqEj4zJEphGX6/0GoOale1oV
	dsFBbsdZeBkLLu9XtPcJcjXzoFHoBlK/Au+z0bftOGaBECk/euRhlbN6Bl2W96jDIwHondyoMUhyd
	3Lg+Gt7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9O3U-0000000AVxt-1K7W;
	Fri, 08 Nov 2024 12:25:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NuH-0000000ATnl-2go4;
	Fri, 08 Nov 2024 12:16:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66EA15C5470;
	Fri,  8 Nov 2024 12:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CDD2C4CECE;
	Fri,  8 Nov 2024 12:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731068164;
	bh=zumeqdnWgfVudDgu2Wto+bNBu1U0drSMP3Z251G3Lyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p6bE0Jvtry2SCdFKfLNO4drwuBYhL1WXlgfOnUqw+fHd8rIHKFinzksgVuS20W7YF
	 FZaEr/LnpYUoNKzbgfpY/AuL2Dh7xGN4lIno1HYQLmvs/HIXxfF1bd3I6dfHJAJXJy
	 9TEfvMfy7dZs+sAjDY9aTPhTUX8tbHtVOySriWmU0Z48H+AEj5E5YdEBkAR7Ur110h
	 bVGBtBpptEfKNZdm5b7qd5/CBm7xoOvHLTjRvw5pI0H6l6G/b/5C1GF6cFnzTxVU+7
	 D4XvFUGvQQ0j2LXK1RllPn7z489iLi8xaWqA/KFzr7S9zFib3eddNsgFixmO5RoKaY
	 MXv6vPt45NLSQ==
Date: Fri, 8 Nov 2024 13:16:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: clock: actions,owl-cmu: convert to YAML
Message-ID: <a4begcrmbtotl2imd3eaxpdveagvwridy6ev5zmwzvjqt3ovfq@wyj2dj73xe3e>
References: <20241107143431.728669-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241107143431.728669-1-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_041605_745094_CDDCB259 
X-CRM114-Status: GOOD (  14.30  )
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

On Thu, Nov 07, 2024 at 04:34:31PM +0200, Ivaylo Ivanov wrote:
> Convert the Actions Semi Owl CMU bindings to DT schema.
> 
> Changes during conversion:
>  - Since all Actions Semi Owl SoCs utilize the internal low frequency
>    oscillator as a parent for some clocks, require it.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation: Please add
Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
or above your Signed-off-by tag. Tag is "received", when provided
in a message replied to you on the mailing list. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for tags received on the version
they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

I cannot add other people's tags - toolsets ignore it.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

...

> +maintainers:
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +
> +description: |
> +  The Actions Semi Owl Clock Management Unit generates and supplies clock
> +  to various controllers within the SoC.
> +
> +  See also::

Single ':'.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


