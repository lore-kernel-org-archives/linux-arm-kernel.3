Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0517C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 23:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=225LG7KVRfVg2Tx9cNUybQTD1Q0WQJOEjTxN1dPrQHI=; b=OAQHGajAG1kzvPS8B2mApYz9Dg
	D070iwj/RU7zTAukDSXn2ghsFPeD7qhZ/BY8f6lebx4Efj7ls74jxn56wdb2tagilwnqflYbHhT61
	Uz4p3+Hg4fV1UjxfXL+z/vPSKniG21ACiPOWBD1YitvllxDciY02lbVrLQ5SlmeStC/We914oC1RU
	mb7EEs1aHDU44uKFfEZE4mUm5Ez7uDqt1T/gyymGSdav/fCLnIL27otYwCp0NTuEyppMJurp8vi6A
	F85nWy8LoVapPF0S/+vjAzeKitid79aPgyLLPqCdVpExsua7J5udyB+O+eYIVHEanJN4ovJ/C0oTj
	5a7iro/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uboyn-00000006Ohw-2fpU;
	Tue, 15 Jul 2025 23:22:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubouc-00000006O6v-0dNA;
	Tue, 15 Jul 2025 23:18:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5607D5C606C;
	Tue, 15 Jul 2025 23:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDDDC4CEE3;
	Tue, 15 Jul 2025 23:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752621493;
	bh=AUahzZtoXc5ty3fkQO9PKsTZSnvoat888MImzDyfSaU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RxebOClDE6XG13qHrmUoM/32uqXeyE68HU7kXpwgYwSgjCaQdOUtfzfzf2a6Xl4ia
	 7beFC/fw/a9gkJ1bLE+iJaKDUxb98U1I98V8pvfYJh1npd7qY5wvhBSN7XBG40ZB9G
	 sAf1oEUDazh+zUz1qEpgQijFmtaV5ne4YyPAB9qN+ZlQkaUsaoJCoN+b3hFxouKQ2R
	 PDKqUGDaWouD6jY1UfF3kPyqW0+V/vm5O2XGEELUgGlZmGQasqZMuO/7gIYr79oiw0
	 FSLW9E7D7OnaNQbbo80UdDeXEKg6eQqcild99OPbCztgrszE/KYR7TNNlNzT8bW3XB
	 HJziJTSqD9dag==
Message-ID: <5a7f47a7-c81e-4f70-9391-0dd1e3aa9f65@kernel.org>
Date: Wed, 16 Jul 2025 08:18:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: rockchip-snps-pcie3: add support for
 rockchip,phy-ref-use-pad
To: Rick Wertenbroek <rick.wertenbroek@gmail.com>
Cc: rick.wertenbroek@heig-vd.ch, alberto.dassatti@heig-vd.ch,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250715105820.4037272-1-rick.wertenbroek@gmail.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20250715105820.4037272-1-rick.wertenbroek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_161814_277774_C9874716 
X-CRM114-Status: GOOD (  28.96  )
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

On 7/15/25 19:58, Rick Wertenbroek wrote:
>>From the RK3588 Technical Reference Manual, Part1,
> section 6.19 PCIe3PHY_GRF Register Description: "ref_use_pad"
> 
> "Select reference clock connected to ref_pad_clk_p/ref_pad_clk_m.
> Selects the external ref_pad_clk_p and ref_pad_clk_m inputs as the
> reference clock source when asserted. When de-asserted, ref_alt_clk_p
> and ref_alt_clk_m are the sources of the reference clock."
> 
> The hardware reset value for this field is 0x1 (enabled).
> Note that this register field is only available on RK3588, not on RK3568.
> 
> Add support for the device tree property rockchip,phy-ref-use-pad,
> such that the PCIe PHY can be used on boards where there is no PCIe
> reference clock generated or connected to the external pad, by setting
> this property to 0 so that the internal clock is used.
> 
> DT bindings for internal clocks are CLK_PHY0_REF_ALT_P/M and
> CLK_PHY1_REF_ALT_P/M and clock rate should be set to 100MHz in
> the RK3588 cru clock controller (PLL_PPLL).
> 
> Example DT overlay where PHY0 uses internal clock (the first clock of
> the cru (PLL_PPLL) must be set to 100MHz, other values are copied from
> rk3588-base.dtsi) and PHY1 uses the external pad (the default):
> 
> ---
> &cru {
>         assigned-clock-rates =
>                 <100000000>, <786432000>,
>                 <850000000>, <1188000000>,
>                 <702000000>,
>                 <400000000>, <500000000>,
>                 <800000000>, <100000000>,
>                 <400000000>, <100000000>,
>                 <200000000>, <500000000>,
>                 <375000000>, <150000000>,
>                 <200000000>;
> };
> 
> &pcie30phy {
>         rockchip,rx-common-refclk-mode = <0 0 1 1>;
>         rockchip,phy-ref-use-pad = <0 1>;
>         clocks = <&cru PCLK_PCIE_COMBO_PIPE_PHY>, <&cru CLK_PHY0_REF_ALT_P>,
>                          <&cru CLK_PHY0_REF_ALT_M>, <&cru CLK_PHY1_REF_ALT_P>,
>                          <&cru CLK_PHY1_REF_ALT_M>;
>         clock-names = "pclk", "phy0_ref_alt_p",
>                               "phy0_ref_alt_m", "phy1_ref_alt_p",
>                               "phy1_ref_alt_m";
> };
> ---
> 

This looks OK to me, but don't you need to also update the dt-bindings yaml to
document this new "phy-ref-use-pad" property ?


> Signed-off-by: Rick Wertenbroek <rick.wertenbroek@gmail.com>
> ---
>  .../phy/rockchip/phy-rockchip-snps-pcie3.c    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c b/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
> index 4e8ffd173096..0859c7960167 100644
> --- a/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
> +++ b/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
> @@ -33,6 +33,8 @@
>  /* Register for RK3588 */
>  #define PHP_GRF_PCIESEL_CON			0x100
>  #define RK3588_PCIE3PHY_GRF_CMN_CON0		0x0
> +#define RK3588_PCIE3PHY_GRF_PHY0_CONTROL6	0x118
> +#define RK3588_PCIE3PHY_GRF_PHY1_CONTROL6	0x218
>  #define RK3588_PCIE3PHY_GRF_PHY0_STATUS1	0x904
>  #define RK3588_PCIE3PHY_GRF_PHY1_STATUS1	0xa04
>  #define RK3588_PCIE3PHY_GRF_PHY0_LN0_CON1	0x1004
> @@ -44,6 +46,8 @@
>  #define RK3588_BIFURCATION_LANE_0_1		BIT(0)
>  #define RK3588_BIFURCATION_LANE_2_3		BIT(1)
>  #define RK3588_LANE_AGGREGATION		BIT(2)
> +#define RK3588_PHY_REF_USE_PAD_EN		((BIT(2) << 16 | BIT(2)))
> +#define RK3588_PHY_REF_USE_PAD_DIS		((BIT(2) << 16))
>  #define RK3588_RX_CMN_REFCLK_MODE_EN		((BIT(7) << 16) |  BIT(7))
>  #define RK3588_RX_CMN_REFCLK_MODE_DIS		(BIT(7) << 16)
>  #define RK3588_PCIE1LN_SEL_EN			(GENMASK(1, 0) << 16)
> @@ -67,6 +71,7 @@ struct rockchip_p3phy_priv {
>  	int num_lanes;
>  	u32 lanes[4];
>  	u32 rx_cmn_refclk_mode[4];
> +	u32 phy_ref_use_pad[2];
>  };
>  
>  struct rockchip_p3phy_ops {
> @@ -157,6 +162,14 @@ static int rockchip_p3phy_rk3588_init(struct rockchip_p3phy_priv *priv)
>  		     priv->rx_cmn_refclk_mode[3] ? RK3588_RX_CMN_REFCLK_MODE_EN :
>  		     RK3588_RX_CMN_REFCLK_MODE_DIS);
>  
> +	/* Select PHY reference clock, external pad or internal clock */
> +	regmap_write(priv->phy_grf, RK3588_PCIE3PHY_GRF_PHY0_CONTROL6,
> +		     priv->phy_ref_use_pad[0] ? RK3588_PHY_REF_USE_PAD_EN :
> +		     RK3588_PHY_REF_USE_PAD_DIS);
> +	regmap_write(priv->phy_grf, RK3588_PCIE3PHY_GRF_PHY1_CONTROL6,
> +		     priv->phy_ref_use_pad[1] ? RK3588_PHY_REF_USE_PAD_EN :
> +		     RK3588_PHY_REF_USE_PAD_DIS);
> +
>  	/* Deassert PCIe PMA output clamp mode */
>  	regmap_write(priv->phy_grf, RK3588_PCIE3PHY_GRF_CMN_CON0, BIT(8) | BIT(24));
>  
> @@ -312,6 +325,25 @@ static int rockchip_p3phy_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	ret = of_property_read_variable_u32_array(dev->of_node,
> +						  "rockchip,phy-ref-use-pad",
> +						  priv->phy_ref_use_pad, 1,
> +						  ARRAY_SIZE(priv->phy_ref_use_pad));
> +
> +	/*
> +	 * if no rockhip,phy-use-internal-clk, assume PHY uses pad for the
> +	 * reference clock in order to be DT backwards compatible. (Since HW
> +	 * reset val is enabled.)
> +	 */
> +	if (ret == -EINVAL) {
> +		for (int i = 0; i < ARRAY_SIZE(priv->phy_ref_use_pad); i++)
> +			priv->phy_ref_use_pad[i] = 1;
> +	} else if (ret < 0) {
> +		dev_err(dev, "failed to read rockchip,phy-ref-use-pad property %d\n",
> +			ret);
> +		return ret;
> +	}
> +
>  	priv->phy = devm_phy_create(dev, NULL, &rockchip_p3phy_ops);
>  	if (IS_ERR(priv->phy)) {
>  		dev_err(dev, "failed to create combphy\n");


-- 
Damien Le Moal
Western Digital Research

