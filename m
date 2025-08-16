Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8378CCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 13:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J14h36s1IFH9p1SV0hLYYv79Hf8e1aYiuqy/5ouMzJw=; b=U0+Wog7SFCPva4IGfroZOThQgF
	bXN/jIFjU99yPAT3OTcZVy34rgoNaBEuUzl83UgRFPR5BFJOaSdPLMzoWjByQ2/rrTrhLW8+hFeDx
	BMADXuEmA2VjuhernUBix+PZSCHoddv0S/O/VNelmamv+W721GV68Pu7up2cX21Qr9ZtakZRG6Dme
	tp2msQNVHE0PupzlQprM6hTaE4YthZw07aOkcwlZ7qoJ5AfGxP1+3v1uraGt2VkDVGfVnZk6RDB5N
	/zohwabIYVe+DnMk3A6REE7TIGg66WfYUncR9uFyW/iBFrznFyCegZ1b3dqz1eeOtX04xxiZq9lu1
	eWuIHGBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unH5Z-00000004hFJ-36ps;
	Sat, 16 Aug 2025 13:36:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unH2w-00000004h7Z-2dra;
	Sat, 16 Aug 2025 13:34:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 940551691;
	Sat, 16 Aug 2025 06:33:59 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 874CD3F5A1;
	Sat, 16 Aug 2025 06:34:05 -0700 (PDT)
Date: Sat, 16 Aug 2025 14:31:17 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: iuncuim <iuncuim@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/7] phy: sun4i-usb: a523: add support for the USB2 PHY
Message-ID: <20250816143117.4b86ecc6@minigeek.lan>
In-Reply-To: <20250816084700.569524-4-iuncuim@gmail.com>
References: <20250816084700.569524-1-iuncuim@gmail.com>
	<20250816084700.569524-4-iuncuim@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_063410_754967_2C667B66 
X-CRM114-Status: GOOD (  24.24  )
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

On Sat, 16 Aug 2025 16:46:56 +0800
iuncuim <iuncuim@gmail.com> wrote:

Hi Mikhail,

many thanks for posting these patches, that's a nice surprise to see
this moving forward!

I think there are some issues with this series, but we can surely iron
those out.

> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> Previously, USB PHY was compatible with D1 and did not require
> separatedata options. But now we need to add a third PHY, which makes it
> incompatible. The third PHY is used together with USB3/PCIe combophy with
> DWC3 controller.

It is really used together? I think on IRC we lately established that
the USB2.0 and USB3.0 parts are somewhat independent, and I think the
Radxa board wires PHY1 to the D-/D+ pins of the USB3.0 socket, instead
of PHY2.

Regardless: this change would be a compatibility break: When a new
kernel with this change sees an old DT, it would bail out, because it
doesn't find the resources for the third PHY in the DT.

What I'd suggest instead is to drop the hardcoded assumption about the
number of PHYs, and instead just enumerate all "pmu<x>" cells in
reg-names. That would work with both old and new DTs, and then we can
also keep the fallback compatible name in the DT, to allow new DTs on
older kernels (for instance a U-Boot provided DT on a stable kernel).

As an added benefit, it would make future enablement easier, as we are
more likely to find a matching compatible string, even when the number
of PHYs differ.

Cheers,
Andre

> In the BSP code, the third PHY requires a separate glue
> driver, but it seems that it is not needed.





> 
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
> index 8873aed3a..bb79339f2 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -1025,6 +1025,15 @@ static const struct sun4i_usb_phy_cfg sun50i_h616_cfg = {
>  	.siddq_in_base = true,
>  };
>  
> +static const struct sun4i_usb_phy_cfg sun55i_a523_cfg = {
> +	.num_phys = 3,
> +	.phyctl_offset = REG_PHYCTL_A33,
> +	.dedicated_clocks = true,
> +	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
> +	.phy0_dual_route = true,
> +	.siddq_in_base = true,
> +};
> +
>  static const struct of_device_id sun4i_usb_phy_of_match[] = {
>  	{ .compatible = "allwinner,sun4i-a10-usb-phy", .data = &sun4i_a10_cfg },
>  	{ .compatible = "allwinner,sun5i-a13-usb-phy", .data = &sun5i_a13_cfg },
> @@ -1041,6 +1050,7 @@ static const struct of_device_id sun4i_usb_phy_of_match[] = {
>  	  .data = &sun50i_a64_cfg},
>  	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = &sun50i_h6_cfg },
>  	{ .compatible = "allwinner,sun50i-h616-usb-phy", .data = &sun50i_h616_cfg },
> +	{ .compatible = "allwinner,sun55i-a523-usb-phy", .data = &sun55i_a523_cfg },
>  	{ .compatible = "allwinner,suniv-f1c100s-usb-phy",
>  	  .data = &suniv_f1c100s_cfg },
>  	{ },


