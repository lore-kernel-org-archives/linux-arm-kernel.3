Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9FEEDF142
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 10:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3N1Up07EMmzysava2VXwGB3wcnEzoHZw0v6sq+t2sg=; b=Wj0+oYHudlr/E3QOygJT30+pXv
	ynw6ZOweDKbgxtZHpJcXvNh7cLPloJgJMVdJW+NNzr6i9+e78S19Xaq9H7uBiBD9lLAbCHa57EqRx
	hEPn2seBK8iViVGa2K9jpb/FfJrRA+W8y5QSr6OHfKpqvRNElCDgFO1E0C95maUJdbO/6QzczKoxg
	GXbLYAWkfWxn9ywShFwtOTGu7mpH99bhvTUCvpWKgJonqQUztlv70g3Te3j84nExgm3rTjRaeMTye
	ulzUtdPTbYFV5qayy6oqXdpWCvmie7VWjMh8ozJOtzUKdGLf/MmSNhc+tqk4NQqbFKdp5O4H8GMh5
	4XVM10yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqq07-00000003Hle-3SmR;
	Fri, 13 Feb 2026 10:02:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqq04-00000003Hkv-2nSb;
	Fri, 13 Feb 2026 10:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770976929;
	bh=ZjrFTIh7ShrKUOF4gch3jY1m5Y8XkQDW851iXHjOqiA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nqgtNc17ZE531V5rPjG2iYL9agLaXHiIQuf+E4LBTxJH0WbfEqA2kdkeJIWuUAMdf
	 9CfPsDRwCcc6gLF86KT8br+YmQ/xUMuQQORvM8xHYic3k6zVbj4HR+MPWNl5+3S+0F
	 vxb1Vhw1ePb2wDo61w40IdOsitCJfFXeWMJz/ZpdEPI/dXkCOym5BTZYmgUxKuJUsG
	 zDSKtD/e6qfMbcpse9aDoU5ACAJy+CyDxymC+ITkJfrUViHT63BM+oDJrkCCiOFdYM
	 7v5cFncu83TD45F6XFTXzuq+JCpf5rKaAXkFGCygolpChjXd3DvMls7Cq++ee2ofyN
	 fXCs7eVz5YjlA==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 02C0617E01E7;
	Fri, 13 Feb 2026 11:02:08 +0100 (CET)
Message-ID: <4501f80f-c21e-4fe8-af76-93c729ae1803@collabora.com>
Date: Fri, 13 Feb 2026 11:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] media: synopsys: use struct dw_mipi_csi2rx_regs to
 describe register offsets
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <20260210-imx93-dw-csi2-v1-4-69667bb86bfa@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260210-imx93-dw-csi2-v1-4-69667bb86bfa@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_020212_878967_433B7EC5 
X-CRM114-Status: GOOD (  26.30  )
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

Thanks for the patch.

Please keep the order:
 - #includes
 - #defines
 - enum and struct definitions
 - the rest

On 2/10/26 18:11, Frank Li wrote:
> Use struct dw_mipi_csi2rx_regs to describe register offsets and support
> new IP versions with differing register layouts.
> 
> Add rk3568_regs, matching the previous macro definitions, and pass it as
> driver data retrieved during probe.
> 
> No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 96 +++++++++++++++++-------
>  1 file changed, 69 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 4ad4e3b23448affeeaa932a706653818ba4019ba..6a2966c9e3a2eac661fa1f8610c9f021d6e26cf8 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -24,14 +24,39 @@
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
> +struct dw_mipi_csi2rx_regs {
> +	u32 n_lanes;
> +	u32 resetn;
> +	u32 phy_state;
> +	u32 err1;
> +	u32 err2;
> +	u32 msk1;
> +	u32 msk2;
> +	u32 control;
> +};
> +
> +struct dw_mipi_csi2rx_drvdata {
> +	const struct dw_mipi_csi2rx_regs *regs;
> +};
> +
> +/* Help check wrong access unexisted register at difference IP version */
> +#define DW_REG_EXIST	BIT(31)
> +#define DW_REG(x)	(DW_REG_EXIST | (x))
> +
> +static const struct dw_mipi_csi2rx_regs rk3568_regs = {
> +	.n_lanes = DW_REG(0x4),
> +	.resetn = DW_REG(0x10),
> +	.phy_state = DW_REG(0x14),
> +	.err1 = DW_REG(0x20),
> +	.err2 = DW_REG(0x24),
> +	.msk1 = DW_REG(0x28),
> +	.msk2 = DW_REG(0x2c),
> +	.control = DW_REG(0x40),
> +};
> +
> +static const struct dw_mipi_csi2rx_drvdata rk3568_drvdata = {
> +	.regs = &rk3568_regs,
> +};
>  
>  #define SW_CPHY_EN(x)		((x) << 0)
>  #define SW_DSI_EN(x)		((x) << 4)
> @@ -74,8 +99,35 @@ struct dw_mipi_csi2rx_device {
>  
>  	enum v4l2_mbus_type bus_type;
>  	u32 lanes_num;
> +
> +	const struct dw_mipi_csi2rx_drvdata *drvdata;
>  };
>  
> +static int
> +dw_mipi_csi2rx_reg_err(struct dw_mipi_csi2rx_device *csi2, const char *name)
> +{
> +	dev_err_once(csi2->dev, "access to non-existent register: %s\n", name);
> +	return 0;
> +}
> +
> +#define __dw_reg_exist(offset) ((offset) & DW_REG_EXIST)
> +
> +#define dw_reg_exist(csi2, __name) __dw_reg_exist((csi2)->drvdata->regs->__name)
> +
> +#define dw_mipi_csi2rx_write(csi2, __name, value)		\
> +({	auto __csi2 = csi2;					\
> +	u32 offset = __csi2->drvdata->regs->__name;		\
> +	__dw_reg_exist(offset) ?					\
> +		writel(value, __csi2->base_addr + (offset & ~DW_REG_EXIST)) : \
> +		dw_mipi_csi2rx_reg_err(__csi2, #__name); })
> +
> +#define dw_mipi_csi2rx_read(csi2, __name)			\
> +({	auto __csi2 = csi2;					\
> +	u32 offset = __csi2->drvdata->regs->__name;		\
> +	__dw_reg_exist(offset) ?					\
> +		readl(__csi2->base_addr + (offset & ~DW_REG_EXIST)) : \
> +		dw_mipi_csi2rx_reg_err(__csi2, #__name); })

Please use an

enum {
	DW_MIPI_CSI2RX_N_LANES,
	DW_MIPI_CSI2RX_RESETN,
	...,
	DW_MIPI_CSI2RX_MAX
};

a member regs[DW_MIPI_CSI2RX_MAX] in dw_mipi_csi2rx_drvdata, and adjust
the dw_mipi_csi2rx_{read,write} accordingly. This is cleaner IMHO and
integrates better with the existing code.

> +
>  static const struct v4l2_mbus_framefmt default_format = {
>  	.width = 3840,
>  	.height = 2160,
> @@ -188,18 +240,6 @@ static inline struct dw_mipi_csi2rx_device *to_csi2(struct v4l2_subdev *sd)
>  	return container_of(sd, struct dw_mipi_csi2rx_device, sd);
>  }
>  
> -static inline void dw_mipi_csi2rx_write(struct dw_mipi_csi2rx_device *csi2,
> -					unsigned int addr, u32 val)
> -{
> -	writel(val, csi2->base_addr + addr);
> -}
> -
> -static inline u32 dw_mipi_csi2rx_read(struct dw_mipi_csi2rx_device *csi2,
> -				      unsigned int addr)
> -{
> -	return readl(csi2->base_addr + addr);
> -}
> -
>  static const struct dw_mipi_csi2rx_format *
>  dw_mipi_csi2rx_find_format(struct dw_mipi_csi2rx_device *csi2, u32 mbus_code)
>  {
> @@ -265,9 +305,9 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
>  	control |= SW_DATATYPE_FS(0x00) | SW_DATATYPE_FE(0x01) |
>  		   SW_DATATYPE_LS(0x02) | SW_DATATYPE_LE(0x03);
>  
> -	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_N_LANES, lanes - 1);
> -	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_CONTROL, control);
> -	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 1);
> +	dw_mipi_csi2rx_write(csi2, n_lanes, lanes - 1);
> +	dw_mipi_csi2rx_write(csi2, control, control);
> +	dw_mipi_csi2rx_write(csi2, resetn, 1);
>  
>  	return phy_power_on(csi2->phy);
>  }
> @@ -276,9 +316,9 @@ static void dw_mipi_csi2rx_stop(struct dw_mipi_csi2rx_device *csi2)
>  {
>  	phy_power_off(csi2->phy);
>  
> -	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 0);
> -	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK1, ~0);
> -	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK2, ~0);
> +	dw_mipi_csi2rx_write(csi2, resetn, 0);
> +	dw_mipi_csi2rx_write(csi2, msk1, ~0);
> +	dw_mipi_csi2rx_write(csi2, msk2, ~0);
>  }
>  
>  static const struct media_entity_operations dw_mipi_csi2rx_media_ops = {
> @@ -632,7 +672,7 @@ static void dw_mipi_csi2rx_unregister(struct dw_mipi_csi2rx_device *csi2)
>  
>  static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
>  	{
> -		.compatible = "rockchip,rk3568-mipi-csi2",
> +		.compatible = "rockchip,rk3568-mipi-csi2", .data = &rk3568_drvdata,

		.compatible = "rockchip,rk3568-mipi-csi2",
		.data = &rk3568_drvdata,

for minimal diff and cleanliness.

Please make sure that the last patch of this series is adjusted
accordingly and continues this formatting.


>  	},
>  	{}
>  };
> @@ -654,6 +694,8 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
>  	if (IS_ERR(csi2->base_addr))
>  		return PTR_ERR(csi2->base_addr);
>  
> +	csi2->drvdata = device_get_match_data(dev);

Check for (!csi2->drvdata)

> +
>  	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
>  	if (ret < 0)
>  		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
> 

Best regards,
Michael


