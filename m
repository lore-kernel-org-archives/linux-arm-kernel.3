Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A32EDF14F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 10:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XG8TgAnHXMqWcA/B7406yi5JVBZWo5+L80MgIAZD6TY=; b=qSvWFdXMirdZIFC6aeYJm84pmJ
	Cpc/HdPcldYt8WfmUxasNv1zvt0LV9NqWM7f9Y9MAjQmNbTF4OqBQd6rJPSDQyPjb4Funo9XKkZyd
	/Sj7BB/zXLDlMDl4lSxuW43FsJE2Xze7nx/TykXj20bfYzeUQy+BCvzk56tG/dtafm26ifY/rdTmr
	uaBkFuVvSGNqv9gnbGClzgEoNUuM3ZGiC/QqNjBDS3+P4NEjTdALmbba8XNhxev1MsgSNfwS/GVE3
	a+dD+CEqqJicj80jo30HxEJAbII/iWH7+7Ba9watUCTWp9YrVbs6glAISSthmEXYxiXz+oUAnYC/7
	XQgNkHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqKB-00000003JKO-1OpV;
	Fri, 13 Feb 2026 10:22:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqK8-00000003JJz-18T6;
	Fri, 13 Feb 2026 10:22:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770978173;
	bh=Z0fTwmaTjvJNrz/Gt0ZUo6wcx97uwvHxFeAAaxaBFzs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E07HSzJZ7yBd3MFz7f70B7cfN6CbRLT/b4jd1X1zFENR/RuYNbm7HBtp5gcQwfUYz
	 Z1pO8IJI5mi3sOFPDUWLDpM9o0p86pUHFF4fywh3AkNOFACTzjHEbm4tR4aAIdBhZQ
	 eM4CDrm4Z1iSCMkeWyfMNMjoZwzn+3HCzO61OPsThpC3fMJCYvczcQfa/poEUTSgyU
	 aFwMy+fALMbCe1rN4XHV9xtmG477Z5tn+VqP3/m/vjtoagrDd6P9pxUybfZsiphuTj
	 5uXOLwD4X6FgXmM1dTb4eiFKKNlUoiqiCSeVgorxsPcY9tDJsPECFH1G3im6ueqfXT
	 SUG+X7KnSRvzA==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB9F017E12E2;
	Fri, 13 Feb 2026 11:22:52 +0100 (CET)
Message-ID: <9e14d605-9419-441e-a554-432d435191b3@collabora.com>
Date: Fri, 13 Feb 2026 11:22:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] media: synopsys: add i.MX93 support
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <20260210-imx93-dw-csi2-v1-6-69667bb86bfa@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260210-imx93-dw-csi2-v1-6-69667bb86bfa@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_022256_497762_C41AD9EA 
X-CRM114-Status: GOOD (  27.99  )
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

On 2/10/26 18:11, Frank Li wrote:
> The i.MX93 uses a newer version of the DW CSI-2 controller with a changed
> register layout and an added IPI block.

What does this IPI block do? Please add a short description.

> 
> The reset flow also differs, so add the .assert_reset(), .deassert_reset(),
> and .ipi_enable() callbacks to support it.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 163 ++++++++++++++++++++++-
>  1 file changed, 156 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 6a2966c9e3a2eac661fa1f8610c9f021d6e26cf8..5dc55b59d6aeed4b6cb207c8e2ebe0fb3c462644 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -33,10 +33,24 @@ struct dw_mipi_csi2rx_regs {
>  	u32 msk1;
>  	u32 msk2;
>  	u32 control;
> +	u32 phy_tst_ctrl0;
> +	u32 phy_tst_ctrl1;
> +	u32 dphy_rstz;
> +	u32 phy_shutdownz;
> +	u32 ipi_softrstn;
> +	u32 ipi_datatype;
> +	u32 ipi_vcid;
> +	u32 ipi_mode;
> +	u32 ipi_mem_flush;
>  };
>  
> +struct dw_mipi_csi2rx_device;
> +
>  struct dw_mipi_csi2rx_drvdata {
>  	const struct dw_mipi_csi2rx_regs *regs;
> +	void (*dphy_assert_reset)(struct dw_mipi_csi2rx_device *csi2);
> +	void (*dphy_deassert_reset)(struct dw_mipi_csi2rx_device *csi2);
> +	void (*ipi_enable)(struct dw_mipi_csi2rx_device *csi2);
>  };
>  
>  /* Help check wrong access unexisted register at difference IP version */
> @@ -54,6 +68,21 @@ static const struct dw_mipi_csi2rx_regs rk3568_regs = {
>  	.control = DW_REG(0x40),
>  };
>  
> +static const struct dw_mipi_csi2rx_regs imx93_regs = {
> +	.n_lanes = DW_REG(0x4),
> +	.resetn = DW_REG(0x8),
> +	.phy_shutdownz = DW_REG(0x40),
> +	.dphy_rstz = DW_REG(0x44),
> +	.phy_state = DW_REG(0x48),
> +	.phy_tst_ctrl0 = DW_REG(0x50),
> +	.phy_tst_ctrl1 = DW_REG(0x54),
> +	.ipi_mode = DW_REG(0x80),
> +	.ipi_vcid = DW_REG(0x84),
> +	.ipi_datatype = DW_REG(0x88),
> +	.ipi_mem_flush = DW_REG(0x8c),
> +	.ipi_softrstn = DW_REG(0xa0),
> +};
> +
>  static const struct dw_mipi_csi2rx_drvdata rk3568_drvdata = {
>  	.regs = &rk3568_regs,
>  };
> @@ -302,14 +331,30 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
>  		return -EINVAL;
>  	}
>  
> +	dw_mipi_csi2rx_write(csi2, resetn, 0);
> +
> +	if (csi2->drvdata->dphy_assert_reset)
> +		csi2->drvdata->dphy_assert_reset(csi2);
> +
>  	control |= SW_DATATYPE_FS(0x00) | SW_DATATYPE_FE(0x01) |
>  		   SW_DATATYPE_LS(0x02) | SW_DATATYPE_LE(0x03);
>  
>  	dw_mipi_csi2rx_write(csi2, n_lanes, lanes - 1);
> -	dw_mipi_csi2rx_write(csi2, control, control);
> +
> +	if (dw_reg_exist(csi2, control))

Why? The _write functions check for existance anyway, right?

> +		dw_mipi_csi2rx_write(csi2, control, control);
> +
> +	ret = phy_power_on(csi2->phy);

Does it make sense to continue if phy_power_on fails? Check the return
value and return early.

> +
> +	if (csi2->drvdata->dphy_deassert_reset)
> +		csi2->drvdata->dphy_deassert_reset(csi2);
> +
>  	dw_mipi_csi2rx_write(csi2, resetn, 1);
>  
> -	return phy_power_on(csi2->phy);
> +	if (csi2->drvdata->ipi_enable)
> +		csi2->drvdata->ipi_enable(csi2);
> +
> +	return ret;
>  }
>  
>  static void dw_mipi_csi2rx_stop(struct dw_mipi_csi2rx_device *csi2)
> @@ -317,8 +362,12 @@ static void dw_mipi_csi2rx_stop(struct dw_mipi_csi2rx_device *csi2)
>  	phy_power_off(csi2->phy);
>  
>  	dw_mipi_csi2rx_write(csi2, resetn, 0);
> -	dw_mipi_csi2rx_write(csi2, msk1, ~0);
> -	dw_mipi_csi2rx_write(csi2, msk2, ~0);
> +
> +	if (dw_reg_exist(csi2, msk1))
> +		dw_mipi_csi2rx_write(csi2, msk1, ~0);
> +
> +	if (dw_reg_exist(csi2, msk2))
> +		dw_mipi_csi2rx_write(csi2, msk2, ~0);

Again, the dw_reg_exist checks seem superfluous.

>  }
>  
>  static const struct media_entity_operations dw_mipi_csi2rx_media_ops = {
> @@ -670,10 +719,110 @@ static void dw_mipi_csi2rx_unregister(struct dw_mipi_csi2rx_device *csi2)
>  	v4l2_async_nf_cleanup(&csi2->notifier);
>  }
>  
> +#define DPHY_TEST_CTRL0_TEST_CLR	BIT(0)

All #defines at the top, as already pointed out before. Holds for all
other bit defines, too.

> +
> +static void imx93_csi2rx_dphy_assert_reset(struct dw_mipi_csi2rx_device *csi2)
> +{
> +	u32 val;
> +
> +	/* Release synopsis DPHY test codes from reset */
> +	dw_mipi_csi2rx_write(csi2, dphy_rstz, 0);
> +	dw_mipi_csi2rx_write(csi2, phy_shutdownz, 0);
> +
> +	val = dw_mipi_csi2rx_read(csi2, phy_tst_ctrl0);
> +	val &= ~DPHY_TEST_CTRL0_TEST_CLR;
> +	dw_mipi_csi2rx_write(csi2, phy_tst_ctrl0, val);
> +
> +	/*
> +	 * ndelay is not necessary have MMIO operation, need dummy read to make
> +	 * sure above write reach target.
> +	 */
> +	val = dw_mipi_csi2rx_read(csi2, phy_tst_ctrl0);
> +	/* Wait for at least 15ns */
> +	ndelay(15);
> +	val |= DPHY_TEST_CTRL0_TEST_CLR;
> +	dw_mipi_csi2rx_write(csi2, phy_tst_ctrl0, val);
> +}
> +
> +#define CSI2RX_DPHY_STOPSTATE_CLK_LANE BIT(16)
> +
> +static void imx93_csi2rx_dphy_deassert_reset(struct dw_mipi_csi2rx_device *csi2)
> +{
> +	/* Release PHY from reset */
> +	dw_mipi_csi2rx_write(csi2, phy_shutdownz, 0x1);
> +	/*
> +	 * ndelay is not necessary have MMIO operation, need dummy read to make
> +	 * sure above write reach target.
> +	 */
> +	dw_mipi_csi2rx_read(csi2, phy_shutdownz);
> +	ndelay(5);
> +	dw_mipi_csi2rx_write(csi2, dphy_rstz, 0x1);
> +
> +	dw_mipi_csi2rx_read(csi2, dphy_rstz);
> +	ndelay(5);
> +}
> +
> +#define IPI_VCID_VC(x)			FIELD_PREP(GENMASK(1, 0), (x))
> +#define IPI_VCID_VC_0_1(x)		FIELD_PREP(GENMASK(3, 2), (x))
> +#define IPI_VCID_VC_2			BIT(4)
> +
> +#define IPI_DATA_TYPE_DT(x)		FIELD_PREP(GENMASK(5, 0), (x))
> +#define IPI_DATA_TYPE_EMB_DATA_EN	BIT(8)
> +
> +#define IPI_MODE_CONTROLLER		BIT(1)
> +#define IPI_MODE_COLOR_MODE16		BIT(8)
> +#define IPI_MODE_CUT_THROUGH		BIT(16)
> +#define IPI_MODE_ENABLE			BIT(24)
> +
> +#define IPI_MEM_FLUSH_AUTO		BIT(8)
> +
> +static void imx93_csi2rx_dphy_ipi_enable(struct dw_mipi_csi2rx_device *csi2)
> +{
> +	int dt = csi2->formats->csi_dt;
> +	u32 val;
> +
> +	/* Do IPI soft reset */
> +	dw_mipi_csi2rx_write(csi2, ipi_softrstn, 0x0);
> +	dw_mipi_csi2rx_write(csi2, ipi_softrstn, 0x1);
> +
> +	/* Select virtual channel and data type to be processed by IPI */
> +	val = IPI_DATA_TYPE_DT(dt);
> +	dw_mipi_csi2rx_write(csi2, ipi_datatype, val);
> +
> +	/* Set virtual channel 0 as default */
> +	val  = IPI_VCID_VC(0);
> +	dw_mipi_csi2rx_write(csi2, ipi_vcid, val);
> +
> +	/*
> +	 * Select IPI camera timing mode and allow the pixel stream
> +	 * to be non-continuous when pixel interface FIFO is empty
> +	 */
> +	val = dw_mipi_csi2rx_read(csi2, ipi_mode);
> +	val &= ~IPI_MODE_CONTROLLER;
> +	val &= ~IPI_MODE_COLOR_MODE16;
> +	val |= IPI_MODE_CUT_THROUGH;
> +	dw_mipi_csi2rx_write(csi2, ipi_mode, val);
> +
> +	/* Memory is automatically flushed at each Frame Start */
> +	val = IPI_MEM_FLUSH_AUTO;
> +	dw_mipi_csi2rx_write(csi2, ipi_mem_flush, val);
> +
> +	/* Enable IPI */
> +	val = dw_mipi_csi2rx_read(csi2, ipi_mode);
> +	val |= IPI_MODE_ENABLE;
> +	dw_mipi_csi2rx_write(csi2, ipi_mode, val);
> +}
> +
> +static const struct dw_mipi_csi2rx_drvdata imx93_drvdata = {
> +	.regs = &imx93_regs,
> +	.dphy_assert_reset = imx93_csi2rx_dphy_assert_reset,
> +	.dphy_deassert_reset = imx93_csi2rx_dphy_deassert_reset,
> +	.ipi_enable = imx93_csi2rx_dphy_ipi_enable,
> +};
> +
>  static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
> -	{
> -		.compatible = "rockchip,rk3568-mipi-csi2", .data = &rk3568_drvdata,
> -	},
> +	{ .compatible = "fsl,imx93-mipi-csi2", .data = &imx93_drvdata, },

As pointed out before,
	{
		.compatible = "fsl,imx93-mipi-csi2",
		.data = &imx93_drvdata,
	},

Best regards,
Michael

> +	{ .compatible = "rockchip,rk3568-mipi-csi2", .data = &rk3568_drvdata, },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dw_mipi_csi2rx_of_match);
> 


