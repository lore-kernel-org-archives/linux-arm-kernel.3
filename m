Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90330C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 21:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ts8BkD5f4yGedC++cJoZGfwHNcxsOssCtYtDkAppaig=; b=Pp45eFw33iU/WMGdXuK9WlVCrw
	hG8syzTYeYhy6BuTDsqWMlcAZpIpL2h9XgdSlHy+iQEUXEefi9ybJ1JlAwCLare692RrPJaiwp6CQ
	T3+dkQ+/yhYyGLFLwxjMVQMougAgzBedfaf1lFty3szhZgr8TJrm5rTUFIV+xMIEBMorbauLmG8IT
	C5/G2uB9ivU9/8wADyIYyqqict9QS5QesDK2KBXPoTl+AULZXdFKdXUAP6zajmnyP9jmwYEiMhGVL
	0JEHh2lMSdvX9Gq1qGQAqfQLX5jtJkNzJTSY1G7FW5+CJF4ualyqAVFAOfLxHXj5znQB3oOt30S9s
	Z8tE7nqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6z4W-00000005F2Z-3Jp9;
	Mon, 21 Apr 2025 21:53:00 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ytP-00000005CYS-1roq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 21:41:32 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 439426D6;
	Mon, 21 Apr 2025 23:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745271563;
	bh=ngbOkPt44/5lw29YiWRn3ahAnnvgeNx9uKhvIob9OW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YsJXTjO7jyrXG2ntRWEgm8DS3eQK5PNbbQSQvl0CioGBsYAARezH/bJNWZJOHxF+k
	 0a1zIMuFlBxzlodxTclryAlgbzhP+0vxh0F8H6Dl3HnDGnPCP93x8XhzP6eG6dqyU1
	 kwukkO79y5qAhhS7kLZptWvySWOX5qZpgrvZaGUw=
Date: Tue, 22 Apr 2025 00:41:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v4 10/13] media: imx8mq-mipi-csi2: Add support for
 i.MX8QXP
Message-ID: <20250421214128.GR17813@pendragon.ideasonboard.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
 <20250408-8qxp_camera-v4-10-ef695f1b47c4@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408-8qxp_camera-v4-10-ef695f1b47c4@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_144131_628643_CD4346A1 
X-CRM114-Status: GOOD (  30.49  )
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

Hi Frank,

Thank you for the patch.

On Tue, Apr 08, 2025 at 05:53:08PM -0400, Frank Li wrote:
> Add support for i.MX8QXP, which has a dedicated control and status register
> (CSR) space. Enable obtaining the second register space and initializing
> PHY and link settings accordingly.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v3 to v4
> - remove reset_delay
> - sort register field defination
> - fix error messag in dev_err_probe
> - fix comments
> - use true for 1
> - regmap_clear_bits(state->phy_gpr, CSI2SS_CTRL_CLK_RESET, CSI2SS_CTRL_CLK_RESET_EN);
> in imx8qxp_gpr_disable()
> - use regmap_write to clean register at imx8qxp_gpr_enable()
> - remove reduntant CSI2SS_PLM_CTRL_POLARITY
> - rename register DATA_TYPE to DATA_TYPE_DISABLE_BF
> 
> change from v2 to v3
> - use dedicate csr reg to control phy and link settings.
> 
> Change from v1 to v2
> - change 8QM go 8QXP, 8QM will failback to 8QXP to keep consisense with
> phy drivers
> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 111 ++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 59ec7107b4508..c6eb6dd0d9e5a 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2021 Purism SPC
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/delay.h>
> @@ -88,6 +89,7 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
>  struct imx8mq_plat_data {
>  	int (*enable)(struct csi_state *state, u32 hs_settle);
>  	void (*disable)(struct csi_state *state);
> +	bool use_reg_csr;
>  };
>  
>  /*
> @@ -167,6 +169,95 @@ static const struct imx8mq_plat_data imx8mq_data = {
>  	.enable = imx8mq_gpr_enable,
>  };
>  
> +/* -----------------------------------------------------------------------------
> + * i.MX8QXP
> + */
> +
> +#define CSI2SS_PL_CLK_INTERVAL_US		100
> +#define CSI2SS_PL_CLK_TIMEOUT_US		100000
> +
> +#define CSI2SS_PLM_CTRL				0x0
> +#define CSI2SS_PLM_CTRL_ENABLE_PL		BIT(0)
> +#define CSI2SS_PLM_CTRL_VSYNC_OVERRIDE		BIT(9)
> +#define CSI2SS_PLM_CTRL_HSYNC_OVERRIDE		BIT(10)
> +#define CSI2SS_PLM_CTRL_VALID_OVERRIDE		BIT(11)
> +#define CSI2SS_PLM_CTRL_POLARITY_HIGH		BIT(12)
> +#define CSI2SS_PLM_CTRL_PL_CLK_RUN		BIT(31)
> +
> +#define CSI2SS_PHY_CTRL				0x4
> +#define CSI2SS_PHY_CTRL_RX_ENABLE		BIT(0)
> +#define CSI2SS_PHY_CTRL_AUTO_PD_EN		BIT(1)
> +#define CSI2SS_PHY_CTRL_DDRCLK_EN		BIT(2)
> +#define CSI2SS_PHY_CTRL_CONT_CLK_MODE		BIT(3)
> +#define CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK	GENMASK(9, 4)
> +#define CSI2SS_PHY_CTRL_RTERM_SEL		BIT(21)
> +#define CSI2SS_PHY_CTRL_PD			BIT(22)
> +
> +#define CSI2SS_DATA_TYPE_DISABLE_BF		0x38
> +#define CSI2SS_DATA_TYPE_DISABLE_BF_MASK	GENMASK(23, 0)
> +
> +#define CSI2SS_CTRL_CLK_RESET			0x44
> +#define CSI2SS_CTRL_CLK_RESET_EN		BIT(0)
> +
> +static int imx8qxp_gpr_enable(struct csi_state *state, u32 hs_settle)
> +{
> +	int ret;
> +	u32 val;
> +
> +	/* Clear format */
> +	regmap_clear_bits(state->phy_gpr,
> +			  CSI2SS_DATA_TYPE_DISABLE_BF, CSI2SS_DATA_TYPE_DISABLE_BF_MASK);

	regmap_clear_bits(state->phy_gpr, CSI2SS_DATA_TYPE_DISABLE_BF,
			  CSI2SS_DATA_TYPE_DISABLE_BF_MASK);

> +
> +	regmap_write(state->phy_gpr, CSI2SS_PLM_CTRL, 0x0);
> +	regmap_write(state->phy_gpr, CSI2SS_PHY_CTRL, 0x0);

This write to CSI2SS_PHY_CTRL is overridden by the next line. Is it
needed ?

> +
> +	regmap_write(state->phy_gpr, CSI2SS_PHY_CTRL,
> +		     FIELD_PREP(CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK, hs_settle) |
> +		     CSI2SS_PHY_CTRL_RX_ENABLE | CSI2SS_PHY_CTRL_DDRCLK_EN |
> +		     CSI2SS_PHY_CTRL_CONT_CLK_MODE | CSI2SS_PHY_CTRL_PD |
> +		     CSI2SS_PHY_CTRL_RTERM_SEL | CSI2SS_PHY_CTRL_AUTO_PD_EN);
> +
> +	ret = regmap_read_poll_timeout(state->phy_gpr, CSI2SS_PLM_CTRL,
> +				       val, !(val & CSI2SS_PLM_CTRL_PL_CLK_RUN),
> +				       CSI2SS_PL_CLK_INTERVAL_US,
> +				       CSI2SS_PL_CLK_TIMEOUT_US);
> +
> +	if (ret) {
> +		dev_err(state->dev, "Timeout waiting for Pixel-Link clock");

Missing \n at end of string.

> +		return ret;
> +	}
> +
> +	/* Enable Pixel link Master */
> +	regmap_set_bits(state->phy_gpr, CSI2SS_PLM_CTRL,
> +			CSI2SS_PLM_CTRL_ENABLE_PL | CSI2SS_PLM_CTRL_VALID_OVERRIDE);
> +
> +	/* PHY Enable */
> +	regmap_clear_bits(state->phy_gpr, CSI2SS_PHY_CTRL,
> +			  CSI2SS_PHY_CTRL_PD | CSI2SS_PLM_CTRL_POLARITY_HIGH);
> +
> +	/* Release Reset */
> +	regmap_set_bits(state->phy_gpr, CSI2SS_CTRL_CLK_RESET, CSI2SS_CTRL_CLK_RESET_EN);
> +
> +	return ret;
> +}
> +
> +static void imx8qxp_gpr_disable(struct csi_state *state)
> +{
> +	/* Disable Pixel Link */
> +	regmap_write(state->phy_gpr, CSI2SS_PLM_CTRL, 0x0);
> +
> +	/* Disable PHY */
> +	regmap_write(state->phy_gpr, CSI2SS_PHY_CTRL, 0x0);
> +
> +	regmap_clear_bits(state->phy_gpr, CSI2SS_CTRL_CLK_RESET, CSI2SS_CTRL_CLK_RESET_EN);

	regmap_clear_bits(state->phy_gpr, CSI2SS_CTRL_CLK_RESET,
			  CSI2SS_CTRL_CLK_RESET_EN);

With those small issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +};
> +
> +static const struct imx8mq_plat_data imx8qxp_data = {
> +	.enable = imx8qxp_gpr_enable,
> +	.disable = imx8qxp_gpr_disable,
> +	.use_reg_csr = true,
> +};
> +
>  static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
>  	/* RAW (Bayer and greyscale) formats. */
>  	{
> @@ -865,6 +956,25 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
>  		return PTR_ERR(state->rst);
>  	}
>  
> +	if (state->pdata->use_reg_csr) {
> +		const struct regmap_config regmap_config = {
> +			.reg_bits = 32,
> +			.val_bits = 32,
> +			.reg_stride = 4,
> +		};
> +		void __iomem *base;
> +
> +		base = devm_platform_ioremap_resource(to_platform_device(dev), 1);
> +		if (IS_ERR(base))
> +			return dev_err_probe(dev, IS_ERR(base), "Missing CSR register\n");
> +
> +		state->phy_gpr = devm_regmap_init_mmio(dev, base, &regmap_config);
> +		if (IS_ERR(state->phy_gpr))
> +			return dev_err_probe(dev, PTR_ERR(state->phy_gpr),
> +					     "Failed to init CSI MMIO regmap\n");
> +		return 0;
> +	}
> +
>  	ret = of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
>  					 ARRAY_SIZE(out_val));
>  	if (ret) {
> @@ -984,6 +1094,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
>  	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
> +	{ .compatible = "fsl,imx8qxp-mipi-csi2", .data = &imx8qxp_data },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
Regards,

Laurent Pinchart

