Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3EBCA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIpPz1UpL3BQdxIYnLSMw5YshVJjbS8hyfzOYYSfnhE=; b=XhEnIo+wLkX2BwhYHapUBwpc7V
	TobVY/fTgy1qUzs0iyXHGlgRUPJrAU692rX2eWBsB3Av4SypARaFGQgNuYV11CBUWy4I0g4EwB4Sm
	eUGKM2ty1Ap8WrU4I+Nt4RGAXi1XT6V+ccmgIyacjl4j9W4w3AhDamZO9T3ntoLaGto5VjeVN3rm1
	qdbuqln2acwt2nMbR22wL8qKiagPsJwlfmAAxObZHrZMrGIzTighxa7/dw0irIjW7+i4EH7JXbmEs
	rCjhWkl9tz1URpzk75ZBlbeWMaAhJqIcF1O9FwjOSHrtFc8AtebIVO1ol9JTVf2XkVThD28CifzU6
	Tga1Y7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7jA-000000062LS-1Xau;
	Fri, 09 Oct 2026 10:21:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7j9-000000062LL-25P3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:21:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E9A6B6053A;
	Fri,  9 Oct 2026 10:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7654C1F000FF;
	Fri,  9 Oct 2026 10:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791541282;
	bh=YIpPz1UpL3BQdxIYnLSMw5YshVJjbS8hyfzOYYSfnhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y5cvMEgLaLkeEj2DUK34+2bylqpEZVynN5T0cYRkzBCUfc+Rnd+eRFJ4QzX/4zdDz
	 3A/LJdi/4FVwRQg5HoQrNJZyZepbdi4tCWvBz/4Wag+Hr85uEBMYdFUn9SqlaLibIl
	 yicsJa0nQi4Qb9H1vMwpXrkODEDqdt4mWxbqjdgUwPKr8mHAHWjd5FiK+MEZWQ1iwO
	 4E/SoDsM7dmXLmNiP2pU3gViTBVs2qWewhD6n4CuZPDEBG/CtRtBHfkGpgKvYZX525
	 4uI0kFt9f7XX03G3YcM6fB6Q5vkKZ6+L1BnF+EWwy/5zvRXxBO6dlFpW0xwCHy0UQ5
	 NS6Be/cluAiew==
Date: Fri, 9 Oct 2026 12:21:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	=?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 1/3] arm64: dts: freescale: imx8mp: skov: fix sort
 order
Message-ID: <20261009-obedient-vulture-of-courtesy-6a061c@quoll>
References: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>
 <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-1-11fa90f531fc@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-1-11fa90f531fc@pengutronix.de>
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

On Thu, Oct 08, 2026 at 11:15:59AM +0200, Steffen Trumtrar wrote:
> The imx8mp-skov-revc-jutouch should be alphabetically before the
> imx8mp-skov-revc-tian variant.
> 
> Sort the entries in the correct order.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 95ae85ab4adf5..49025ae465f22 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -475,8 +475,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb

Odd diff hunk. Next has offset difference of 300 (!!!), thus this
suggests you develop on some old tree.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


