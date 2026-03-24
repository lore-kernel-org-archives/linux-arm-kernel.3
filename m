Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939F3E9A74D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6X9Udn42i5EUbiT1HvBdwHo5caGBA3xMD1bamNqILYQ=; b=Gv4aKRcDnSEXjLVdjqaT2lJV1Y
	fvIDzexy2xuEmc/zejbWZ/TYhIW+ydQWfDYAo8Wr1bwnphrBmbjF685r6tSBw7lRPp9DRHu80PuU/
	COgyP6B5n8CjgQtRyyCGf56pdaJefj2DUNhWhGOsWvNfS2TvaxLNohXWu/j6NGiGfh1i3wpsGRS7e
	bfgIlInvVq4EO9i/S9adrQkE9x+mL8VJzeOUAuHlXt8tYhSE0+/hDtK5CXTsNjRclqAEPbtxQhsDB
	8UzPwtFLpP1tolEm5ZQ7m6syA7OyZtZRSj1XjlL/B3DzdKNIo5KU3II0K+VD09EHgGaLpwtBW7VLK
	hKuyRXcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yDx-000000017Dy-0zxR;
	Tue, 24 Mar 2026 09:38:57 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yDv-000000017DJ-0611
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:38:56 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B2858225;
	Tue, 24 Mar 2026 10:37:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774345054;
	bh=TTPPThifz10UfsqhlGlvNt9t21lxMo7c1RkYUe/huN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WrHhV/w89ce/JGcufnnEc3O5NAb+LNDf+08Cx4axQNens7oJanQZOHtm31Pgym1dX
	 w3dPH5viujTqi6TLEDLKhSnodiE8mn8nv2WLT/yLl5L2H4cFcebENPimHq59kXBu6L
	 GaeHDI9MKZ3iR2nZU8450z6rUGQH4R+eE2KVHloQ=
Date: Tue, 24 Mar 2026 11:38:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Correct PAD settings
 for pmicirqgrp
Message-ID: <20260324093850.GA2351719@killaraus.ideasonboard.com>
References: <20260324-imx8mp-dts-fix-v1-1-df0eb2f62543@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324-imx8mp-dts-fix-v1-1-df0eb2f62543@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_023855_206435_3D720870 
X-CRM114-Status: GOOD (  19.76  )
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

Hi Peng,

Thank you for the patch.

On Tue, Mar 24, 2026 at 11:16:13AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
> there is interrupt storm for i.MX8MP DEBIX Model A. Per schematic, there
> is no on board PULL-UP resistors for GPIO1_IO03, so need to set PAD
> PUE and PU together to make pull up work properly.
> 
> Fixes: c86d350aae68e ("arm64: dts: Add device tree for the Debix Model A Board")
> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Closes: https://lore.kernel.org/all/20260323105858.GA2185714@killaraus.ideasonboard.com/
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Frank, would you be able to handle this as a v7.0 regression fix ?

I think the same is needed for imx8mp-debix-som-a.dtsi, but I can't
confirm it as I don't have the schematics for the SoM, neither do I have
access to the board.

Dan, Kieran, Stefan, could one of you check if you get an interrupt
storm from the PMIC on v7.0 ?

> ---
>  arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> index 9422beee30b29c5a551b08476c80fbff96af3439..df7489587e48ed0c678f11291f6f2b77082ade95 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> @@ -440,7 +440,7 @@ MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA					0x400001c3
>  
>  	pinctrl_pmic: pmicirqgrp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x41
> +			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x000001c0
>  		>;
>  	};
>  
> 
> ---
> base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
> change-id: 20260324-imx8mp-dts-fix-512530fe4dcd

-- 
Regards,

Laurent Pinchart

