Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255DCE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 06:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzTEATMaOgR8IFhnvifxbxIozTAuiuGHacflvMohElg=; b=N3ikMTAnEgW5F1KIgHqJqsfh5L
	Y3Zoz9PcE1n+OzgoZBuoVeTfkyv+/7YalAWC8lUJ2lCy6Jb2Uny+JoZuuQ/LoapwsN9B4xsi8rtWd
	hGAlwJzynqDTpE0EvfR7+t4oRB+82Y8yhnSLnyusRWfF5oLz2F0ycoS8oeyr0/VmjME5npvFkj1LC
	7Dr3Auw/AGe6Dlb3xppGLYXDOojVZTCwT1WzH+THVTiUOxRlDNPj1Acvkvt8On6/wQZDvd18cGzfB
	negMUmtcF4xO+sOJZkAVddXL7332wNsSnoEUhBdEaxkk2stxsDDC+2F9CHA8SGOHj26vOXhQr1pvp
	1BxZwk/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV353-00000003dXz-2XdO;
	Tue, 07 Jan 2025 06:28:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV33a-00000003dOc-3XtS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 06:27:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 028835C4A4A;
	Tue,  7 Jan 2025 06:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C94C4CED6;
	Tue,  7 Jan 2025 06:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736231233;
	bh=UVQgtjQxvgRicW5E5yKP/ya2Ld4413TGyATLXPsQGas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lHuoo+CMNc33N5APJY1RsuszW++HdcenKZBmVb9V84LEyXVoi32Q7sxzUbfIrBhzh
	 6TDzxly+5AaM1nC/8LWgsOvRKWDOw89ru2CAAUD20zeKl+L1+bVXJQl+BgHYOroYBM
	 vbHm0RZgQzbBerzFmHsr9IHkafuKnb+txjdGJYkD4giiCSgqcdMY2Zw4Ci22JQRVM3
	 PqrGgWxnPYOOSHV4pYZJtHxDfx8MPsTWpnsAIX0k/wnl7TND6UryACPbLmNLhDAw4H
	 2J6uts79haPNDQEJENOH5AcO8HmZW/lg6WS6Sw1oW1ygAmdaDX0MzNHToak33JB7g1
	 +KOA5Yv8k0Kgg==
Date: Tue, 7 Jan 2025 07:27:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: vendor-prefixes: Add NetCube Systems
 Austria name
Message-ID: <lkbvp57zvhd6dzti3pikoshywyvcpo3br7mry6sduimduebtla@ui3dge5j6cak>
References: <20250106190703.4015-1-lukas.schmid@netcube.li>
 <20250106190703.4015-2-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250106190703.4015-2-lukas.schmid@netcube.li>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_222714_927145_EE715333 
X-CRM114-Status: GOOD (  14.78  )
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

On Mon, Jan 06, 2025 at 07:06:59PM +0000, Lukas Schmid wrote:
> NetCube Systems Austria builds Embedded Systems for use in IoT, IIoT,
> or Smart Home scenarios.
> 
> Website is still WIP, but the Links on it are active:
> https://netcubesystems.at/
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>

Last time:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof


