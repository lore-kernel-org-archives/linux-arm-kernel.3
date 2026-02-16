Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948A7E63F39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 08:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7iFP6xW5Xf2W9zO9vAqZDJHzHtTHjmzjY02AN6Ld78=; b=vTrVbpv2nFC+v3r6xkI4t/sjl6
	houk/mhtfPy09uvNxkXLth/KcB8ZG7SsD/D8OuoIeUVRZ4yuf8CqX30cWW/Ax2X7MXEPP1/jXkJu3
	gYf5QDKEYu6yhxx0CBGQ7v4FYxszmOjZ0l4iLkNV/c+f5TxMPcmeB7zuNbze0r1++6pLNE9GHpMGK
	qx/D2Itym96C2CSEyNPPt3xfmRoXw5qcOmBly476CTvjEh72NGM5Lmn42UtBlW+2atDU//ZOLQoiK
	yIv+WAWOBE0bdTB4qMVG/Kq2gfw4OPKqD0xFxRl0v5N7LblBs6P46otTcZzIBCpgrN8/mOigx75uH
	RbQPtIfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrtiB-000000067Rk-13tG;
	Mon, 16 Feb 2026 08:12:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrti8-000000067Qs-3K0b;
	Mon, 16 Feb 2026 08:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771229518;
	bh=3HYqKGUDU9JGeXZAcBF46can3OoH/CCNNOhHTr/xDHE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SqF8Smib7nHdDc32RttjOuPwKqz4BLw1OCQwXYrdq2AGpmvo/C6HNk6IK7MGvcm+m
	 jydz1JyhssE5o8cEMkUzIBCdHluxaCRisFF5xIHoy3gQjgvD0U1UJPJ5FRTtni62lD
	 x+2CJO0rMWo42vedhE9z9llD9GcDuFVBmx21BtfVXWeM3zGo9/fLeBl+Y4I3IxX792
	 ZL2XFXFDbM5ELc/7kax9yJ4eGvyVQT4ApOl55AYMaIE41N79vT86tP8lDhLmLbMj/h
	 3rCoyOw/T5z8khP+MJEWr2kHWpLcvskOzKSmV68HvMXCt+MWp43r8XucmgwPXhEEe8
	 cwed7IEOhWRJw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A80217E1406;
	Mon, 16 Feb 2026 09:11:57 +0100 (CET)
Message-ID: <eef04746-00cf-4971-8e65-37a2a3e60672@collabora.com>
Date: Mon, 16 Feb 2026 09:11:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] media: synopsys: csi2rx: Use enum and u32 array
 for register offsets
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev
References: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
 <20260213-imx93-dw-csi2-v2-4-8be6039f44c6@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260213-imx93-dw-csi2-v2-4-8be6039f44c6@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_001205_211354_7B374296 
X-CRM114-Status: GOOD (  31.34  )
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

Thanks for the update.

Some minor nitpicks, but it already looks good.

On 2/13/26 21:25, Frank Li wrote:
> Use enum dw_mipi_csi2rx_regs_index together with a u32 array to describe
> register offsets. This allows supporting new IP versions with different
> register layouts in a structured way.
> 
> Add rk3568_regs matching the previous macro definitions and pass it as
> driver data during probe.
> 
> No functional change intended.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - change to use enum and u32 array method
> - use order
>  - #includes
>  - #defines
>  - enum and struct definitions
>  - the rest
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 91 ++++++++++++++++++++----
>  1 file changed, 78 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index a6d251ca5ad14c5138a6fd0202a970460e64c68f..b00ae5fb328da4cc78fe36b629d6661d438e124a 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -24,15 +24,6 @@
>  #include <media/v4l2-mc.h>
>  #include <media/v4l2-subdev.h>
>  
> -#define DW_MIPI_CSI2RX_N_LANES		0x04
> -#define DW_MIPI_CSI2RX_RESETN		0x10
> -#define DW_MIPI_CSI2RX_PHY_STATE	0x14
> -#define DW_MIPI_CSI2RX_ERR1		0x20
> -#define DW_MIPI_CSI2RX_ERR2		0x24
> -#define DW_MIPI_CSI2RX_MSK1		0x28
> -#define DW_MIPI_CSI2RX_MSK2		0x2c
> -#define DW_MIPI_CSI2RX_CONTROL		0x40
> -
>  #define SW_CPHY_EN(x)		((x) << 0)
>  #define SW_DSI_EN(x)		((x) << 4)
>  #define SW_DATATYPE_FS(x)	((x) << 8)
> @@ -40,12 +31,33 @@
>  #define SW_DATATYPE_LS(x)	((x) << 20)
>  #define SW_DATATYPE_LE(x)	((x) << 26)
>  
> +/* Help check wrong access unexisted register at difference IP version */

Maybe

/* helper for checking whether register exists */

? However, I think the naming speaks for itself and you can leave the
comment away.

> +#define DW_REG_EXIST		BIT(31)
> +#define DW_REG(x)		(DW_REG_EXIST | (x))
> +
> +enum dw_mipi_csi2rx_regs_index {
> +	DW_MIPI_CSI2RX_N_LANES,
> +	DW_MIPI_CSI2RX_RESETN,
> +	DW_MIPI_CSI2RX_PHY_STATE,
> +	DW_MIPI_CSI2RX_ERR1,
> +	DW_MIPI_CSI2RX_ERR2,
> +	DW_MIPI_CSI2RX_MSK1,
> +	DW_MIPI_CSI2RX_MSK2,
> +	DW_MIPI_CSI2RX_CONTROL,
> +
> +	DW_MIPI_CSI2RX_MAX,
> +};
> +
>  enum {
>  	DW_MIPI_CSI2RX_PAD_SINK,
>  	DW_MIPI_CSI2RX_PAD_SRC,
>  	DW_MIPI_CSI2RX_PAD_MAX,
>  };
>  
> +struct dw_mipi_csi2rx_drvdata {
> +	const u32 *regs;
> +};
> +
>  struct dw_mipi_csi2rx_format {
>  	u32 code;
>  	u8 depth;
> @@ -72,6 +84,23 @@ struct dw_mipi_csi2rx_device {
>  
>  	enum v4l2_mbus_type bus_type;
>  	u32 lanes_num;
> +
> +	const struct dw_mipi_csi2rx_drvdata *drvdata;
> +};
> +
> +static const u32 rk3568_regs[DW_MIPI_CSI2RX_MAX] = {
> +	[DW_MIPI_CSI2RX_N_LANES] = DW_REG(0x4),
> +	[DW_MIPI_CSI2RX_RESETN] = DW_REG(0x10),
> +	[DW_MIPI_CSI2RX_PHY_STATE] = DW_REG(0x14),
> +	[DW_MIPI_CSI2RX_ERR1] = DW_REG(0x20),
> +	[DW_MIPI_CSI2RX_ERR2] = DW_REG(0x24),
> +	[DW_MIPI_CSI2RX_MSK1] = DW_REG(0x28),
> +	[DW_MIPI_CSI2RX_MSK2] = DW_REG(0x2c),
> +	[DW_MIPI_CSI2RX_CONTROL] = DW_REG(0x40),
> +};
> +
> +static const struct dw_mipi_csi2rx_drvdata rk3568_drvdata = {
> +	.regs = rk3568_regs,
>  };
>  
>  static const struct v4l2_mbus_framefmt default_format = {
> @@ -186,16 +215,46 @@ static inline struct dw_mipi_csi2rx_device *to_csi2(struct v4l2_subdev *sd)
>  	return container_of(sd, struct dw_mipi_csi2rx_device, sd);
>  }
>  
> +static bool dw_mipi_csi2rx_is_exist(struct dw_mipi_csi2rx_device *csi2,

Sounds a bit weird to me, maybe "dw_mipi_csi2rx_has_reg(ister)" or
"dw_mipi_csi2rx_reg(ister)_exists?

> +				    enum dw_mipi_csi2rx_regs_index index)
> +{
> +	if (index < DW_MIPI_CSI2RX_MAX &&
> +	    (csi2->drvdata->regs[index] & DW_REG_EXIST))
> +		return true;
> +
> +	return false;
> +}
> +
> +static void __iomem *
> +dw_mipi_csi2rx_get_regaddr(struct dw_mipi_csi2rx_device *csi2,
> +			   enum dw_mipi_csi2rx_regs_index index)
> +{
> +	u32 off = (~DW_REG_EXIST) & csi2->drvdata->regs[index];
> +
> +	return csi2->base_addr + off;
> +}
> +
>  static inline void dw_mipi_csi2rx_write(struct dw_mipi_csi2rx_device *csi2,
> -					unsigned int addr, u32 val)
> +					enum dw_mipi_csi2rx_regs_index index,
> +					u32 val)
>  {
> -	writel(val, csi2->base_addr + addr);
> +	if (dw_mipi_csi2rx_is_exist(csi2, index))
> +		writel(val, dw_mipi_csi2rx_get_regaddr(csi2, index));
> +
> +	dev_err_once(csi2->dev,
> +		     "write to non-existent register index: %d\n", index);

Not sure about to control flow here, as the error message is shown in
any case. Do you mean

{
	if (!dw_mipi_csi2rx_is_exist(csi2, index)) {
		dev_err_once(csi2->dev,
			"write to non-existent register index: %d\n",
			index);
		return;
	}

	writel(val, dw_mipi_csi2rx_get_regaddr(csi2, index));
}

?

>  }
>  
>  static inline u32 dw_mipi_csi2rx_read(struct dw_mipi_csi2rx_device *csi2,
> -				      unsigned int addr)
> +				      enum dw_mipi_csi2rx_regs_index index)
>  {
> -	return readl(csi2->base_addr + addr);
> +	if (dw_mipi_csi2rx_is_exist(csi2, index))
> +		return readl(dw_mipi_csi2rx_get_regaddr(csi2, index));

Here it seems to be correct, but personally I'd prefer

{
	if (!dw_mipi_csi2rx_is_exist(csi2, index)) {
		// print error
		return 0;
	}

	return readl(...);
}
Anyway, it should match the write method.

> +
> +	dev_err_once(csi2->dev,
> +		     "read non-existent register index: %d\n", index);
> +	/* Return 0 for unexisted registers */

/* return 0 for non-existent registers */

or leave away altogether.

> +	return 0;
>  }
>  
>  static const struct dw_mipi_csi2rx_format *
> @@ -631,6 +690,7 @@ static void dw_mipi_csi2rx_unregister(struct dw_mipi_csi2rx_device *csi2)
>  static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
>  	{
>  		.compatible = "rockchip,rk3568-mipi-csi2",
> +		.data = &rk3568_drvdata,
>  	},
>  	{}
>  };
> @@ -652,6 +712,11 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
>  	if (IS_ERR(csi2->base_addr))
>  		return PTR_ERR(csi2->base_addr);
>  
> +	csi2->drvdata = device_get_match_data(dev);
> +	if (!csi2->drvdata)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "failed to get driver data\n");
> +
>  	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
>  	if (ret < 0)
>  		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
> 

With the comments above addressed,

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael


