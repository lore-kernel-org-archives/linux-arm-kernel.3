Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9252CC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 20:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hm42TMK3ebEtihAgbTcozLyNxXtDoEr2DYPUzvP0Mc=; b=dzMxHgHEymsAuPVHEdsqv2GD+4
	NUNVZS2a3pCX/5pfPzKnARiP8HjqU3RZLl8bZs4tVrgiPYWfGb7SbOvSTn+lKdS3vIwcNTw5Vxcv3
	wofgG2mvVR/oIdGTB3qP1wZY/PjTnmfrBdY5hA8wQhV4Sq6/xxhNQk5iln2jVgcUiB0UYrZtk2eOt
	yvk7OZMzQliE+LOzgQiIWLuwd4X+I6f8XS3lk6a1Q4BLLf6hyrKcCHQHQecrEZZyZqDPuE/iAviQW
	lTCqDek7sBig3yaee55pzQQX/8dMZzMfv1CSZY/avugMfRvOOz5qhRmw6Eu1hocoihwtmU/DZyBTS
	gR2SlNpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtrC-0000000BxyM-1dtq;
	Thu, 27 Mar 2025 20:29:42 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtZt-0000000BwLz-2cR3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 20:11:50 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91BC0F6;
	Thu, 27 Mar 2025 21:09:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743106198;
	bh=LmKNL4zB6Iz8Ceg/EZ9Ki+Bqelt5gOeg9dk/BVwMtr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PIzAMG7JaaXrGdj2WRj3GziQY7hur0VwbrnmCods9opEDs5fe3YSJNZVk4bqx+5wO
	 c29A89plU0IDKIw+qUPypXAl7pMU56aT7QBmkc+0gJEpsaaw1tHMjVZkQCTgYIT+WR
	 lKskW++LtDibbeOP5LngZMQnLSoTMMP4D0wst2Dc=
Date: Thu, 27 Mar 2025 22:11:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 05/12] media: imx8-isi: Add support for i.MX8QM and
 i.MX8QXP
Message-ID: <20250327201124.GI4861@pendragon.ideasonboard.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-5-324f5105accc@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-5-324f5105accc@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_131149_807698_DF5DA462 
X-CRM114-Status: GOOD (  23.67  )
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

On Mon, Feb 10, 2025 at 03:59:24PM -0500, Frank Li wrote:
> From: Robert Chiras <robert.chiras@nxp.com>
> 
> Add compatibles and platform data for i.MX8QM and i.MX8QXP platforms.
> There are 8 ISI channels on i.MX8QM while there are only 5 channels on
> i.MX8QXP.

There's a discrepancy between this series and the reference manuals.
I've raised that issue in the review of the DT bindings, let's discuss
it there. I'll skip that part of this patch for now.

> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v2 to v3
> - none
> 
> change from v1 to v2
> - remove intenal review tags
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 47 ++++++++++++++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  2 +
>  2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 1e79b1211b603..a3237d76f7aa5 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -274,6 +274,25 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
>  	.panic_set_thd_v = { .mask = 0xf0000, .offset = 16, .threshold = 0x7 },
>  };
>  
> +static const struct clk_bulk_data mxc_imx8qm_clks[] = {
> +	{ .id = "per0" },
> +	{ .id = "per1" },
> +	{ .id = "per2" },
> +	{ .id = "per3" },
> +	{ .id = "per4" },
> +	{ .id = "per5" },
> +	{ .id = "per6" },
> +	{ .id = "per7" },
> +};
> +
> +static const struct clk_bulk_data mxc_imx8qxp_clks[] = {
> +	{ .id = "per0" },
> +	{ .id = "per4" },
> +	{ .id = "per5" },
> +	{ .id = "per6" },
> +	{ .id = "per7" },
> +};
> +
>  static const struct clk_bulk_data mxc_imx8mn_clks[] = {
>  	{ .id = "axi" },
>  	{ .id = "apb" },
> @@ -334,6 +353,32 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.has_36bit_dma		= false,
>  };
>  
> +static const struct mxc_isi_plat_data mxc_imx8qm_data = {
> +	.model			= MXC_ISI_IMX8QM,
> +	.num_ports		= 5,
> +	.num_channels		= 8,
> +	.reg_offset		= 0x10000,
> +	.ier_reg		= &mxc_imx8_isi_ier_v1,

Are you sure about this ? According to the reference manual, QXP seems
to match mxc_imx8_isi_ier_v2, and QM doesn't seem to match either v1 or
v2.

> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.clks			= mxc_imx8qm_clks,
> +	.num_clks		= ARRAY_SIZE(mxc_imx8qm_clks),
> +	.buf_active_reverse	= true,

I'll trust you on this value, I can't verify it.

> +	.has_36bit_dma		= false,
> +};
> +
> +static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
> +	.model			= MXC_ISI_IMX8QXP,
> +	.num_ports		= 5,
> +	.num_channels		= 5,
> +	.reg_offset		= 0x10000,
> +	.ier_reg		= &mxc_imx8_isi_ier_v1,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.clks			= mxc_imx8qxp_clks,
> +	.num_clks		= ARRAY_SIZE(mxc_imx8qxp_clks),
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= false,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Power management
>   */
> @@ -541,6 +586,8 @@ static void mxc_isi_remove(struct platform_device *pdev)
>  static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
>  	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
> +	{ .compatible = "fsl,imx8qm-isi", .data = &mxc_imx8qm_data },
> +	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
>  	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
>  	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
>  	{ /* sentinel */ },
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 9c7fe9e5f941f..496cad3f9423d 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -158,6 +158,8 @@ struct mxc_gasket_ops {
>  enum model {
>  	MXC_ISI_IMX8MN,
>  	MXC_ISI_IMX8MP,
> +	MXC_ISI_IMX8QM,
> +	MXC_ISI_IMX8QXP,
>  	MXC_ISI_IMX8ULP,
>  	MXC_ISI_IMX93,
>  };

-- 
Regards,

Laurent Pinchart

