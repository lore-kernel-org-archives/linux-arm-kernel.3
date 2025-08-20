Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E190ECA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 22:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzDFiOpjRLlbHQfddlIazcw4li2buRLnzj+tlUDzLn0=; b=hBW0Z9sRy0O87roZ4jpzBCh7np
	3WlBM9MoOrCchGvZU2YpckVWjX3AqFUAYvSf5DHefZWc9L9moN2FUdo0352HItTZ+JQ4Rd2FPUmOD
	mPw1Op9yt4/Mw9eV6OGoId1OwqysAoLEuW0nTr8Mw/4K2EZoSeiBR1k9V4AUfmaptDW2iablQG2N3
	v6cUMIaaX437zkHNwCDw60ACCp146wNhqfg0q7+dq8qaX0Q3+Rh0mhxmFWhXCpOi/EWMN6mItrJlb
	Rg1xXitjAwxyH3onRKE8obbdOGILSLdUpDHgssGhc/+VmOUkOGkxcfLID7jmy0L1x1Ugob4GiAm7A
	LSwG7VSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorcP-0000000F7vh-3nDg;
	Wed, 20 Aug 2025 22:49:21 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonYz-0000000EgRc-2Y8l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 18:29:35 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AC3FA24AB;
	Wed, 20 Aug 2025 20:28:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755714511;
	bh=nknvIm7qouE2F67cnbHIE1UPId2DhzpV9SfuOm3wm0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LxCtZOlguIBb6tO4Jdxx9cqEy09BUrfn4pCtYJ/tpo3TdT62btrbz5JQVKq+DdA/H
	 KTZZDTHhj5MiypO+nmyr8Mq3MZHYu6dopZaWfXRThGoIvzPA+y/xK2hHsfTHJR316r
	 bspyR0SJ28MLF7Opfw6+wl14CSljjFTz/wtp5CqU=
Date: Wed, 20 Aug 2025 21:29:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: imx95: Fix JPEG encoder node assigned clock
Message-ID: <20250820182906.GI10308@pendragon.ideasonboard.com>
References: <20250820162747.209626-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820162747.209626-1-marek.vasut@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_112933_797217_DA7284AB 
X-CRM114-Status: GOOD (  16.88  )
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

Hi Marek,

Thank you for the patch.

On Wed, Aug 20, 2025 at 06:27:26PM +0200, Marek Vasut wrote:
> The assigned clock for JPEG encoder IP has to be IMX95_CLK_VPUBLK_JPEG_ENC
> and not IMX95_CLK_VPUBLK_JPEG_DEC (_ENC at the end, not _DEC). This is a
> simple copy-paste error, fix it.
> 
> Fixes: 153c039a7357 ("arm64: dts: imx95: add jpeg encode and decode nodes")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Looks like a straightforward fix.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 4ca6a7ea586ea..8296888bce594 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1843,7 +1843,7 @@ jpegenc: jpegenc@4c550000 {
>  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&scmi_clk IMX95_CLK_VPU>,
>  				 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_ENC>;
> -			assigned-clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_DEC>;
> +			assigned-clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_ENC>;
>  			assigned-clock-parents = <&scmi_clk IMX95_CLK_VPUJPEG>;
>  			power-domains = <&scmi_devpd IMX95_PD_VPU>;
>  		};

-- 
Regards,

Laurent Pinchart

