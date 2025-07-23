Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE67C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 15:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8rKZEkFrLRFaYQBc3BIIxI8WYrqNMHpEOrc29zdPS4=; b=PCdX0iZMQ5TNO9xIwDrklJ9pEW
	L6a50KSYvyOd9DSecKkktHa6Cpu6SU4BsrUmDz41bOsvf3kb6EygPJhU5bJSRFLEui0WHFrTKlIQu
	l+1QNoSixaN8hMcvPe8+AqeHUevzBx+o5ghxoGde0WaYla2XoYFBVbpbQrWlIBF8Lplf0a82F8zAF
	NMwHAprBUg+29qyaCXs5eWS9xt2cK6HPIMLv9mB+kme+9KRXsUrNrzdXgrG5XZS+aUKydvz7nl7Of
	1IE6C6jxVEQUug8t7jfXlF+E3psFRqnxSwe0TAVCGwVIca+MIMsWM98KPS+yWaWsxLGpJ+XCglCIe
	PzPsuI2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebAA-00000005Lhk-30mm;
	Wed, 23 Jul 2025 15:13:46 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueap6-00000005HBK-385c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 14:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1753282320;
 bh=i8rKZEkFrLRFaYQBc3BIIxI8WYrqNMHpEOrc29zdPS4=;
 b=a1PJZcWHk1Omv9qfFHjPglV4PNASM1w4JJ8eMYDq69DctxkUGWurmgYUzdAekd1HOHLe9u//g
 i/46JSnkTugxpGACg8+YQplWSuhlr9eWRS7yU/Ko3BQ6UTVd1hj3zW8ItMsXv0iV7Fo7rwtmeC9
 3JyTI+qMA+eTof3xibj92lMiRh3t5oNtdvb5L9C+DQszX/QQlBjGSrxtSexmXbmpkjioBFEi0Ow
 qQJCGyKDbfP3Ix9VNWNNfeaL0iUTZaLO/Jabqrd6qhLK0dEptLp2+CHcVbEbZe7hunASuKdkMZL
 1H1Ebo3mS2ccP5SBKOeNS85N/VwVPHcZc1c7rjnWfWHQ==
X-Forward-Email-ID: 6880f6eacb0ee86f9731d64d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <eb7c9e40-3c17-488f-98a2-17b972f61e75@kwiboo.se>
Date: Wed, 23 Jul 2025 16:51:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] phy: rockchip: naneng-combphy: Add RK3528 support
To: Yao Zi <ziyao@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Frank Wang <frank.wang@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Shresth Prasad <shresthprasad7@gmail.com>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
References: <20250624033733.50197-1-ziyao@disroot.org>
 <20250624033733.50197-6-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250624033733.50197-6-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_075200_807865_726B7684 
X-CRM114-Status: GOOD (  26.34  )
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

Hi Yao Zi,

On 6/24/2025 5:37 AM, Yao Zi wrote:
> Rockchip RK3528 integrates one naneng-combphy that is able to operate in
> PCIe and USB3 mode. The control logic is similar to previous variants of
> naneng-combphy but the register layout is apperantly different from the
> RK3568 one.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../rockchip/phy-rockchip-naneng-combphy.c    | 186 +++++++++++++++++-
>  1 file changed, 185 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> index 1d1c7723584b..bf00a85a113b 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -20,7 +20,46 @@
>  #define REF_CLOCK_25MHz			(25 * HZ_PER_MHZ)
>  #define REF_CLOCK_100MHz		(100 * HZ_PER_MHZ)
>  
> -/* COMBO PHY REG */
> +/* RK3528 COMBO PHY REG */
> +#define RK3528_PHYREG6				0x18
> +#define RK3528_PHYREG6_PLL_KVCO			GENMASK(12, 10)
> +#define RK3528_PHYREG6_PLL_KVCO_VALUE		0x2
> +#define RK3528_PHYREG6_SSC_DIR			GENMASK(5, 4)
> +#define RK3528_PHYREG6_SSC_UPWARD		0
> +#define RK3528_PHYREG6_SSC_DOWNWARD		1
> +
> +#define RK3528_PHYREG40				0x100
> +#define RK3528_PHYREG40_SSC_EN			BIT(20)
> +#define RK3528_PHYREG40_SSC_CNT			GENMASK(10, 0)
> +#define RK3528_PHYREG40_SSC_CNT_VALUE		0x17d
> +
> +#define RK3528_PHYREG42				0x108
> +#define RK3528_PHYREG42_CKDRV_CLK_SEL		BIT(29)
> +#define RK3528_PHYREG42_CKDRV_CLK_PLL		0
> +#define RK3528_PHYREG42_CKDRV_CLK_CKRCV		1
> +#define RK3528_PHYREG42_PLL_LPF_R1_ADJ		GENMASK(10, 7)
> +#define RK3528_PHYREG42_PLL_LPF_R1_ADJ_VALUE	0x9
> +#define RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ	GENMASK(6, 4)
> +#define RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ_VALUE 0x7
> +#define RK3528_PHYREG42_PLL_KVCO_ADJ		GENMASK(2, 0)
> +#define RK3528_PHYREG42_PLL_KVCO_ADJ_VALUE	0x0
> +
> +#define RK3528_PHYREG80				0x200
> +#define RK3528_PHYREG80_CTLE_EN			BIT(17)
> +
> +#define RK3528_PHYREG81				0x204
> +#define RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X	BIT(5)
> +#define RK3528_PHYREG81_SLEW_RATE_CTRL		GENMASK(2, 0)
> +#define RK3528_PHYREG81_SLEW_RATE_CTRL_SLOW	0x7
> +
> +#define RK3528_PHYREG83				0x20c
> +#define RK3528_PHYREG83_RX_SQUELCH		GENMASK(2, 0)
> +#define RK3528_PHYREG83_RX_SQUELCH_VALUE	0x6
> +
> +#define RK3528_PHYREG86				0x218
> +#define RK3528_PHYREG86_RTERM_DET_CLK_EN	BIT(14)
> +
> +/* RK3568 COMBO PHY REG */
>  #define RK3568_PHYREG6				0x14
>  #define RK3568_PHYREG6_PLL_DIV_MASK		GENMASK(7, 6)
>  #define RK3568_PHYREG6_PLL_DIV_SHIFT		6
> @@ -398,6 +437,147 @@ static int rockchip_combphy_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
>  
> +static int rk3528_combphy_cfg(struct rockchip_combphy_priv *priv)
> +{
> +	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
> +	unsigned long rate;
> +	u32 val;
> +
> +	/* Set SSC downward spread spectrum */
> +	val = FIELD_PREP(RK3528_PHYREG6_SSC_DIR, RK3528_PHYREG6_SSC_DOWNWARD);
> +	rockchip_combphy_updatel(priv, RK3528_PHYREG6_SSC_DIR, val, RK3528_PHYREG6);
> +
> +	switch (priv->type) {
> +	case PHY_TYPE_PCIE:
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con0_for_pcie, true);
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con1_for_pcie, true);
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con2_for_pcie, true);
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con3_for_pcie, true);
> +		break;
> +	case PHY_TYPE_USB3:
> +		/* Enable adaptive CTLE for USB3.0 Rx */
> +		rockchip_combphy_updatel(priv, RK3528_PHYREG80_CTLE_EN, RK3528_PHYREG80_CTLE_EN,
> +					 RK3528_PHYREG80);
> +
> +		/* Set slow slew rate control for PI */
> +		val = FIELD_PREP(RK3528_PHYREG81_SLEW_RATE_CTRL,
> +				 RK3528_PHYREG81_SLEW_RATE_CTRL_SLOW);
> +		rockchip_combphy_updatel(priv, RK3528_PHYREG81_SLEW_RATE_CTRL, val,
> +					 RK3528_PHYREG81);
> +
> +		/* Set CDR phase path with 2x gain */
> +		rockchip_combphy_updatel(priv, RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X,
> +					 RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X, RK3528_PHYREG81);
> +
> +		/* Set Rx squelch input filler bandwidth */
> +		val = FIELD_PREP(RK3528_PHYREG83_RX_SQUELCH, RK3528_PHYREG83_RX_SQUELCH_VALUE);
> +		rockchip_combphy_updatel(priv, RK3528_PHYREG83_RX_SQUELCH, val, RK3528_PHYREG83);
> +
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txcomp_sel, false);
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txelec_sel, false);
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->usb_mode_set, true);

I suggest we add something like following here:

		rockchip_combphy_param_write(priv->pipe_grf, &cfg->u3otg0_port_en, true);

to ensure that U3 is enabled in case boot firmware disable the U3 port.

> +		break;
> +	default:
> +		dev_err(priv->dev, "incompatible PHY type\n");
> +		return -EINVAL;
> +	}
> +
> +	rate = clk_get_rate(priv->refclk);
> +
> +	switch (rate) {
> +	case REF_CLOCK_24MHz:
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_24m, true);
> +		if (priv->type == PHY_TYPE_USB3) {
> +			/* Set ssc_cnt[10:0]=00101111101 & 31.5KHz */
> +			val = FIELD_PREP(RK3528_PHYREG40_SSC_CNT, RK3528_PHYREG40_SSC_CNT_VALUE);
> +			rockchip_combphy_updatel(priv, RK3528_PHYREG40_SSC_CNT, val,
> +						 RK3528_PHYREG40);
> +		} else if (priv->type == PHY_TYPE_PCIE) {
> +			/* tx_trim[14]=1, Enable the counting clock of the rterm detect */
> +			rockchip_combphy_updatel(priv, RK3528_PHYREG86_RTERM_DET_CLK_EN,
> +						 RK3528_PHYREG86_RTERM_DET_CLK_EN, RK3528_PHYREG86);
> +		}
> +		break;
> +	case REF_CLOCK_100MHz:
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_100m, true);
> +		if (priv->type == PHY_TYPE_PCIE) {
> +			/* PLL KVCO tuning fine */
> +			val = FIELD_PREP(RK3528_PHYREG6_PLL_KVCO, RK3528_PHYREG6_PLL_KVCO_VALUE);
> +			rockchip_combphy_updatel(priv, RK3528_PHYREG6_PLL_KVCO, val,
> +						 RK3528_PHYREG6);
> +
> +			/* su_trim[6:4]=111, [10:7]=1001, [2:0]=000, swing 650mv */
> +			writel(0x570804f0, priv->mmio + RK3528_PHYREG42);
> +		}
> +		break;
> +	default:
> +		dev_err(priv->dev, "Unsupported rate: %lu\n", rate);
> +		return -EINVAL;
> +	}
> +
> +	if (device_property_read_bool(priv->dev, "rockchip,ext-refclk")) {
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_ext, true);
> +
> +		if (priv->type == PHY_TYPE_PCIE && rate == REF_CLOCK_100MHz) {
> +			val = FIELD_PREP(RK3528_PHYREG42_CKDRV_CLK_SEL,
> +					 RK3528_PHYREG42_CKDRV_CLK_CKRCV);
> +			val |= FIELD_PREP(RK3528_PHYREG42_PLL_LPF_R1_ADJ,
> +					  RK3528_PHYREG42_PLL_LPF_R1_ADJ_VALUE);
> +			val |= FIELD_PREP(RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ,
> +					  RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ_VALUE);
> +			val |= FIELD_PREP(RK3528_PHYREG42_PLL_KVCO_ADJ,
> +					  RK3528_PHYREG42_PLL_KVCO_ADJ_VALUE);
> +			rockchip_combphy_updatel(priv,
> +						 RK3528_PHYREG42_CKDRV_CLK_SEL		|
> +						 RK3528_PHYREG42_PLL_LPF_R1_ADJ		|
> +						 RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ	|
> +						 RK3528_PHYREG42_PLL_KVCO_ADJ,
> +						 val, RK3528_PHYREG42);
> +
> +			val = FIELD_PREP(RK3528_PHYREG6_PLL_KVCO, RK3528_PHYREG6_PLL_KVCO_VALUE);
> +			rockchip_combphy_updatel(priv, RK3528_PHYREG6_PLL_KVCO, val,
> +						 RK3528_PHYREG6);
> +		}
> +	}
> +
> +	if (priv->type == PHY_TYPE_PCIE) {
> +		if (device_property_read_bool(priv->dev, "rockchip,enable-ssc"))
> +			rockchip_combphy_updatel(priv, RK3528_PHYREG40_SSC_EN,
> +						 RK3528_PHYREG40_SSC_EN, RK3528_PHYREG40);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct rockchip_combphy_grfcfg rk3528_combphy_grfcfgs = {
> +	/* pipe-phy-grf */
> +	.pcie_mode_set		= { 0x0000, 5, 0, 0x00, 0x11 },
> +	.usb_mode_set		= { 0x0000, 5, 0, 0x00, 0x04 },
> +	.pipe_rxterm_set	= { 0x0000, 12, 12, 0x00, 0x01 },
> +	.pipe_txelec_set	= { 0x0004, 1, 1, 0x00, 0x01 },
> +	.pipe_txcomp_set	= { 0x0004, 4, 4, 0x00, 0x01 },
> +	.pipe_clk_24m		= { 0x0004, 14, 13, 0x00, 0x00 },
> +	.pipe_clk_100m		= { 0x0004, 14, 13, 0x00, 0x02 },
> +	.pipe_rxterm_sel	= { 0x0008, 8, 8, 0x00, 0x01 },
> +	.pipe_txelec_sel	= { 0x0008, 12, 12, 0x00, 0x01 },
> +	.pipe_txcomp_sel	= { 0x0008, 15, 15, 0x00, 0x01 },
> +	.pipe_clk_ext		= { 0x000c, 9, 8, 0x02, 0x01 },
> +	.pipe_phy_status	= { 0x0034, 6, 6, 0x01, 0x00 },
> +	.con0_for_pcie		= { 0x0000, 15, 0, 0x00, 0x110 },
> +	.con1_for_pcie		= { 0x0004, 15, 0, 0x00, 0x00 },
> +	.con2_for_pcie		= { 0x0008, 15, 0, 0x00, 0x101 },
> +	.con3_for_pcie		= { 0x000c, 15, 0, 0x00, 0x0200 },

And adding something like this:

	/* pipe-grf */
	.u3otg0_port_en		= { 0x0044, 15, 0, 0x0181, 0x1100 },

Should be possible with ("phy: rockchip: naneng-combphy: Enable U3 OTG
port for RK3568") [1].

Most RK3528 boards I have come across this far seem to use PCIe instead
of USB3, so having boot firmware disable U3 early (to help support USB
gadget in boot firmware) and instead having this PHY driver re-enable U3
when needed seem most logical to me.

I will push an updated U-Boot rk3528 branch [2] where I include such
early U3 port disable once source.denx.de is back online again.

[1] https://lore.kernel.org/r/20250723072324.2246498-1-jonas@kwiboo.se
[2] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528

Regards,
Jonas

> +};
> +
> +static const struct rockchip_combphy_cfg rk3528_combphy_cfgs = {
> +	.num_phys	= 1,
> +	.phy_ids	= {
> +		0xffdc0000,
> +	},
> +	.grfcfg		= &rk3528_combphy_grfcfgs,
> +	.combphy_cfg	= rk3528_combphy_cfg,
> +};
> +
>  static int rk3562_combphy_cfg(struct rockchip_combphy_priv *priv)
>  {
>  	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
> @@ -1213,6 +1393,10 @@ static const struct rockchip_combphy_cfg rk3588_combphy_cfgs = {
>  };
>  
>  static const struct of_device_id rockchip_combphy_of_match[] = {
> +	{
> +		.compatible = "rockchip,rk3528-naneng-combphy",
> +		.data = &rk3528_combphy_cfgs,
> +	},
>  	{
>  		.compatible = "rockchip,rk3562-naneng-combphy",
>  		.data = &rk3562_combphy_cfgs,


