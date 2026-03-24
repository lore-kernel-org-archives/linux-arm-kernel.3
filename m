Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810FBFEC102
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 19:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xy4AcXiCfmb46opde9bAvmfTfMxlHNxoXypu3VRt80A=; b=i2JNAEwT0Axp1XTJW3biFD948T
	Y+XB2zyFPNSvG7PwmC93Jl/xGdO+ehvB97E1lPjxRLTXFXHxsrE3yJ1ubVddh0iTjN91xteOS7Ugb
	M9pvS1Kc3bNFn0Hpxo6FpbhB0sEyVXl0iA4Z7C/dNyPQDJ0FGCSSCnEwf5f1CQl+pesZ3RkjPUFB1
	byjKOq2r3dbUbwcHBNz3I3TiNT/BKBBKDC6iUbZ2E2jghwXrLpF5+S1uRVzQ55uakOfcjgA9KOKZy
	25mz0n6YT53gK7YGeGrvusmf7LuaIX7D20TBRUMQPc5LIiClZQGNqqFL6OOF4tb90lL+dzY+zl7Pv
	vBlRaplQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57fV-00000002AC5-3hXK;
	Tue, 24 Mar 2026 19:44:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57fT-00000002ABR-2XcS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 19:44:00 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 78789591;
	Tue, 24 Mar 2026 20:42:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774381357;
	bh=kNNB3ARW8MAB0TKKRx9eUF6IcUYNngEha9H4UXUg9yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sAJ34CpZdDWJm18yKHVWUdPrzJRwvPjbjmdZTBpbW7Y6OdXPde+6yM4MxQ+8CZyld
	 YmpFyI8wB1rKiLEtT8hXEf+PaH62eBO2tkYlQHXminxPj/O25j7D9Y52fyG9KmZtS8
	 nfR2UT8uZnclssb4uVlvRz8srtjRHhRIKaCKM6c8=
Date: Tue, 24 Mar 2026 21:43:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Correct PAD settings
 for pmicirqgrp
Message-ID: <20260324194353.GB2352505@killaraus.ideasonboard.com>
References: <20260324-imx8mp-dts-fix-v1-1-df0eb2f62543@nxp.com>
 <20260324093850.GA2351719@killaraus.ideasonboard.com>
 <177437389415.1230693.16040948368071205395@ping.linuxembedded.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177437389415.1230693.16040948368071205395@ping.linuxembedded.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_124359_786935_6A89BB84 
X-CRM114-Status: GOOD (  26.96  )
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

On Tue, Mar 24, 2026 at 05:38:14PM +0000, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2026-03-24 09:38:50)
> > On Tue, Mar 24, 2026 at 11:16:13AM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > > 
> > > With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
> > > there is interrupt storm for i.MX8MP DEBIX Model A. Per schematic, there
> > > is no on board PULL-UP resistors for GPIO1_IO03, so need to set PAD
> > > PUE and PU together to make pull up work properly.
> > > 
> > > Fixes: c86d350aae68e ("arm64: dts: Add device tree for the Debix Model A Board")
> > > Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Closes: https://lore.kernel.org/all/20260323105858.GA2185714@killaraus.ideasonboard.com/
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Frank, would you be able to handle this as a v7.0 regression fix ?
> > 
> > I think the same is needed for imx8mp-debix-som-a.dtsi, but I can't
> > confirm it as I don't have the schematics for the SoM, neither do I have
> > access to the board.
> > 
> > Dan, Kieran, Stefan, could one of you check if you get an interrupt
> > storm from the PMIC on v7.0 ?
> 
> Confirmed:
>  35:      83626          0          0          0 gpio-mxc   3 Level     pca9450-irq
> 
>  and
> 
> 200:     270180          0          0          0    GICv3  67 Level     30a20000.i2c
> ...
> 200:     400925          0          0          0    GICv3  67 Level     30a20000.i2c
> ...
> 
> increasing rapidly on the debix-som.
> 
> I started out on the linux-media branches which were 7.0-rc2 based, and
> this didn't happen but cherry-picking in 5d0efaf47ee90 certainly causes
> this issue to occur on my board.

Could you confirm that setting MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03 to
0x000001c0 fixes the issue ?

> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > > index 9422beee30b29c5a551b08476c80fbff96af3439..df7489587e48ed0c678f11291f6f2b77082ade95 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > > @@ -440,7 +440,7 @@ MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA                                   0x400001c3
> > >  
> > >       pinctrl_pmic: pmicirqgrp {
> > >               fsl,pins = <
> > > -                     MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03                             0x41
> > > +                     MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03                             0x000001c0
> > >               >;
> > >       };
> > >  
> > > 
> > > ---
> > > base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
> > > change-id: 20260324-imx8mp-dts-fix-512530fe4dcd

-- 
Regards,

Laurent Pinchart

