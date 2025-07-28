Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5133C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 05:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHn2A6i/YmxEi8SOrsmwTl/MzTfIRtf59Ruy9S+I07k=; b=c2pGuv9q/6l58Izue30fKNeUvA
	oPGVUGNx1DQLCP1ohKiwLzarLLCShyetoaXyY88gFX/OhqFZ5eCQeGK7yT/XJsUMMPpnFXRwCa1ps
	dPLdQxn/w3TFBfH+jJSLvHDexvOdkUAjvHOEDJc0PzezeFpnB16mAd+2L7u9ZBz4DvzbvAfIZVLeM
	sCMSnb3+RrHmN1fbXYx8Ejd+T2EdeR6REJcJEOsuWKH2bicsch8JDVYcrtSaQbZ4Ewjpzov1hnbPx
	IZTRfw9z9NvXZVRPd0ldW0C6Ow3Mhkv3OdPEmPnqSi79p8c2CWYHllGPSjO5M8FqLgB/0ZD0Ccp1j
	jpb7I4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGAM-0000000Ddt3-24vJ;
	Mon, 28 Jul 2025 05:12:50 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugG5g-0000000DdGJ-3bcF;
	Mon, 28 Jul 2025 05:08:02 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1077A23CB1;
	Mon, 28 Jul 2025 07:07:57 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7ANjcg6Zkbp; Mon, 28 Jul 2025 07:07:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1753679275; bh=C2uPb02MiokZGlv8JpAHMlpdLLPVnFYjfQPmyPpiPuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vls+F+BHomGstKwi/Wa+rUmALYJRPkRqkZ8KMDCahNlCE4kl2Swb1kf/UeexPqkwe
	 feubZnvIKYJcZvz8JdyL8fymUyGbvE9inBw4mUHQ7uGtr/qs53PCOeg1S9zlCwKXuK
	 cK69Rpz+6PlcUP+rxtwufZY2u8kOVh4tm935+/Ft0IC+42DQ6ts3rIBBwXmaHeaRSz
	 mRH3w+OI4tdBaRFywKMwRF6Q746R9DwITrBs7Gqm9JvSdkf0OP4YJpwtfs8St2KJJk
	 hGr21MDMSaP9GYdiCwMjqQ3IerXIjubtup851dBy7mkN0V0rVM3j92qI1xooMEecTA
	 rjD0wYUoBRsow==
Date: Mon, 28 Jul 2025 05:07:38 +0000
From: Yao Zi <ziyao@disroot.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
	linux-arm-kernel@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/6] phy: rockchip: naneng-combphy: Add RK3528 support
Message-ID: <aIcFmhQqLuUlLZb_@pie>
References: <20250624033733.50197-1-ziyao@disroot.org>
 <20250624033733.50197-6-ziyao@disroot.org>
 <eb7c9e40-3c17-488f-98a2-17b972f61e75@kwiboo.se>
 <aIHDSW0XO9BCfch3@pie.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIHDSW0XO9BCfch3@pie.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_220801_446356_A316A822 
X-CRM114-Status: GOOD (  41.10  )
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

On Thu, Jul 24, 2025 at 05:23:55AM +0000, Yao Zi wrote:
> On Wed, Jul 23, 2025 at 04:51:15PM +0200, Jonas Karlman wrote:
> > Hi Yao Zi,
> > 
> > On 6/24/2025 5:37 AM, Yao Zi wrote:
> > > Rockchip RK3528 integrates one naneng-combphy that is able to operate in
> > > PCIe and USB3 mode. The control logic is similar to previous variants of
> > > naneng-combphy but the register layout is apperantly different from the
> > > RK3568 one.
> > > 
> > > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >  .../rockchip/phy-rockchip-naneng-combphy.c    | 186 +++++++++++++++++-
> > >  1 file changed, 185 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > > index 1d1c7723584b..bf00a85a113b 100644
> > > --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > > +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c

...

> > > @@ -398,6 +437,147 @@ static int rockchip_combphy_probe(struct platform_device *pdev)
> > >  	return PTR_ERR_OR_ZERO(phy_provider);
> > >  }
> > >  
> > > +static int rk3528_combphy_cfg(struct rockchip_combphy_priv *priv)
> > > +{
> > > +	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
> > > +	unsigned long rate;
> > > +	u32 val;
> > > +
> > > +	/* Set SSC downward spread spectrum */
> > > +	val = FIELD_PREP(RK3528_PHYREG6_SSC_DIR, RK3528_PHYREG6_SSC_DOWNWARD);
> > > +	rockchip_combphy_updatel(priv, RK3528_PHYREG6_SSC_DIR, val, RK3528_PHYREG6);
> > > +
> > > +	switch (priv->type) {
> > > +	case PHY_TYPE_PCIE:
> > > +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con0_for_pcie, true);
> > > +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con1_for_pcie, true);
> > > +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con2_for_pcie, true);
> > > +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con3_for_pcie, true);
> > > +		break;
> > > +	case PHY_TYPE_USB3:
> > > +		/* Enable adaptive CTLE for USB3.0 Rx */
> > > +		rockchip_combphy_updatel(priv, RK3528_PHYREG80_CTLE_EN, RK3528_PHYREG80_CTLE_EN,
> > > +					 RK3528_PHYREG80);
> > > +
> > > +		/* Set slow slew rate control for PI */
> > > +		val = FIELD_PREP(RK3528_PHYREG81_SLEW_RATE_CTRL,
> > > +				 RK3528_PHYREG81_SLEW_RATE_CTRL_SLOW);
> > > +		rockchip_combphy_updatel(priv, RK3528_PHYREG81_SLEW_RATE_CTRL, val,
> > > +					 RK3528_PHYREG81);
> > > +
> > > +		/* Set CDR phase path with 2x gain */
> > > +		rockchip_combphy_updatel(priv, RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X,
> > > +					 RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X, RK3528_PHYREG81);
> > > +
> > > +		/* Set Rx squelch input filler bandwidth */
> > > +		val = FIELD_PREP(RK3528_PHYREG83_RX_SQUELCH, RK3528_PHYREG83_RX_SQUELCH_VALUE);
> > > +		rockchip_combphy_updatel(priv, RK3528_PHYREG83_RX_SQUELCH, val, RK3528_PHYREG83);
> > > +
> > > +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txcomp_sel, false);
> > > +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txelec_sel, false);
> > > +		rockchip_combphy_param_write(priv->phy_grf, &cfg->usb_mode_set, true);
> > 
> > I suggest we add something like following here:
> > 
> > 		rockchip_combphy_param_write(priv->pipe_grf, &cfg->u3otg0_port_en, true);
> > 
> > to ensure that U3 is enabled in case boot firmware disable the U3 port.
> 
> Thanks for the hint, I'm willing to adapt it. Should we handle the case
> that USB is enabled by firmware but PCIe is going to be used in kernel,
> too? It's desirable to make fewer assumptions about the state set by
> firmware.
> 
> P.S., I'm assuming the register should be written as "disabled" value
> whenever PCIe is used, and "enabled" whenever USB is used, as
> the LSB of USB_GRF_USB3OTG0_CON1 is said to be "USB 3.0 SS Port Disable
> control" according to RK3588's TRM, which doesn't look like something
> compatible with PCIe mode when setting to 1'b0 (port enabled). Please
> correct me if I'm wrong.

I've read through the manual and done some tests today, and it seems I
misunderstood the purpose of USB3OTG0_CON1. This register has only
something to do with USB3, but not PCIe. Writing either "disabled" or
"enabled" value to it doesn't affect PCIe functionality. Thus for the
naneng-combphy driver, it should be enough to only write the "enabled"
value to u3otg0_port_en if USB-3 mode is used.

Anyway, thanks for your remind on this register :) Its reset value
allows USB-3 to function thus I just forgot about it during clean-up.
I'll send v5 soon.

...

> > > +static const struct rockchip_combphy_grfcfg rk3528_combphy_grfcfgs = {
> > > +	/* pipe-phy-grf */
> > > +	.pcie_mode_set		= { 0x0000, 5, 0, 0x00, 0x11 },
> > > +	.usb_mode_set		= { 0x0000, 5, 0, 0x00, 0x04 },
> > > +	.pipe_rxterm_set	= { 0x0000, 12, 12, 0x00, 0x01 },
> > > +	.pipe_txelec_set	= { 0x0004, 1, 1, 0x00, 0x01 },
> > > +	.pipe_txcomp_set	= { 0x0004, 4, 4, 0x00, 0x01 },
> > > +	.pipe_clk_24m		= { 0x0004, 14, 13, 0x00, 0x00 },
> > > +	.pipe_clk_100m		= { 0x0004, 14, 13, 0x00, 0x02 },
> > > +	.pipe_rxterm_sel	= { 0x0008, 8, 8, 0x00, 0x01 },
> > > +	.pipe_txelec_sel	= { 0x0008, 12, 12, 0x00, 0x01 },
> > > +	.pipe_txcomp_sel	= { 0x0008, 15, 15, 0x00, 0x01 },
> > > +	.pipe_clk_ext		= { 0x000c, 9, 8, 0x02, 0x01 },
> > > +	.pipe_phy_status	= { 0x0034, 6, 6, 0x01, 0x00 },
> > > +	.con0_for_pcie		= { 0x0000, 15, 0, 0x00, 0x110 },
> > > +	.con1_for_pcie		= { 0x0004, 15, 0, 0x00, 0x00 },
> > > +	.con2_for_pcie		= { 0x0008, 15, 0, 0x00, 0x101 },
> > > +	.con3_for_pcie		= { 0x000c, 15, 0, 0x00, 0x0200 },
> > 
> > And adding something like this:
> > 
> > 	/* pipe-grf */
> > 	.u3otg0_port_en		= { 0x0044, 15, 0, 0x0181, 0x1100 },
> > 
> > Should be possible with ("phy: rockchip: naneng-combphy: Enable U3 OTG
> > port for RK3568") [1].
> > 
> > Most RK3528 boards I have come across this far seem to use PCIe instead
> > of USB3, so having boot firmware disable U3 early (to help support USB
> > gadget in boot firmware) and instead having this PHY driver re-enable U3
> > when needed seem most logical to me.

Thank you for the U-Boot patch! While reading through, I saw commit
"rockchip: rk3528: Disable USB3OTG U3 port early" states,

> Some board designs may not use the COMBPHY for USB3 purpose. For these
> board to use USB OTG the input clock source must change to use UTMI
> clk instead of PIPE clk.

Does this mean we should ideally add similar handling for USB3OTG in the
kernel's usb2phy driver, too? Otherwise if the firmware doesn't handle
clock stuff well, the kernel'll fail to operate in OTG mode, either.

> > 
> > I will push an updated U-Boot rk3528 branch [2] where I include such
> > early U3 port disable once source.denx.de is back online again.
> > 
> > [1] https://lore.kernel.org/r/20250723072324.2246498-1-jonas@kwiboo.se
> > [2] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528
> > 
> > Regards,
> > Jonas

Thanks,
Yao Zi

