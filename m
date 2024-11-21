Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551C0D75BA7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 03:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2zPlG/SgBSPolOF1L72nMUpJ4HsSBiermwNcNgSvgUY=; b=FbgdoK1tKPnkJvK+4fSxaNZc0g
	bsqEsYHrqa6ahvd5uV74FAdq7QincegbINOYhJpGj/3ismXwbTi0vwzZL5xLiMTeXbujREaKRiS/V
	XL+VS9Y+7E7pX6bGAPXUbXZd2r8+5n8wObTOByLU1UWy5YBlWvXH/PvIpdDOZWTpZZGhcbiHJO/Vd
	KvgljMTUEZNuc7V3lhbguH2q6Z2RiF/6yGcXiKiCAmg07XfpxkxWkQckON5qI20k4ncNOrBzu5zSE
	8S/fvtnWeWZmEPue56/4fmuJIQHqSciQ39nYHSwt1S5T87lYjBihs1evNsQ+inji9yRDLB3VDFpqo
	ygxby6Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDy9f-0000000GjI3-1WO2;
	Thu, 21 Nov 2024 03:46:55 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDy8j-0000000GjA0-1UJH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 03:45:58 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D831E219;
	Thu, 21 Nov 2024 04:45:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732160737;
	bh=W6NRhNfE/tN5Hbr1vVe7ak6L9aO11G7A1l6/pEAVtAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RqZ15P5GNl+znM1p21KhrhS9yJJ+oOxvta1u/t17xJ9auQg+4ohsHufLOVv0R6+XG
	 ySCzDgYUW3FJ1BDlrVbJcFBcJOyq7iiRae2tvX/dPFWX/FyVBA2iYv1YUgxyMdtFxc
	 b1VMAig4wULTt3/G9pjywCsDzPMGH1N/h6YiMLTs=
Date: Thu, 21 Nov 2024 05:45:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/4] media: i2c: imx290: Add configuration for IMX462
Message-ID: <20241121034546.GG12409@pendragon.ideasonboard.com>
References: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
 <20241120-media-imx290-imx462-v2-4-7e562cf191d8@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241120-media-imx290-imx462-v2-4-7e562cf191d8@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_194557_534845_4EAF2CE2 
X-CRM114-Status: GOOD (  20.73  )
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

Hi Dave,

Thank you for the patch.

On Wed, Nov 20, 2024 at 07:17:06PM +0000, Dave Stevenson wrote:
> IMX462 is the successor to IMX290, and wants very minor
> changes to the register setup.
> 
> Add the relevant configuration to support it.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx290.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 7d794a509670..3bad7779d0d0 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -170,6 +170,8 @@ enum imx290_model {
>  	IMX290_MODEL_IMX290LQR,
>  	IMX290_MODEL_IMX290LLR,
>  	IMX290_MODEL_IMX327LQR,
> +	IMX290_MODEL_IMX462LQR,
> +	IMX290_MODEL_IMX462LLR,
>  };
>  
>  struct imx290_model_info {
> @@ -316,6 +318,50 @@ static const struct cci_reg_sequence imx290_global_init_settings_290[] = {
>  	{ CCI_REG8(0x33b3), 0x04 },
>  };
>  
> +static const struct cci_reg_sequence imx290_global_init_settings_462[] = {
> +	{ CCI_REG8(0x300f), 0x00 },
> +	{ CCI_REG8(0x3010), 0x21 },
> +	{ CCI_REG8(0x3011), 0x02 },
> +	{ CCI_REG8(0x3016), 0x09 },
> +	{ CCI_REG8(0x3070), 0x02 },
> +	{ CCI_REG8(0x3071), 0x11 },
> +	{ CCI_REG8(0x309b), 0x10 },
> +	{ CCI_REG8(0x309c), 0x22 },
> +	{ CCI_REG8(0x30a2), 0x02 },
> +	{ CCI_REG8(0x30a6), 0x20 },
> +	{ CCI_REG8(0x30a8), 0x20 },
> +	{ CCI_REG8(0x30aa), 0x20 },
> +	{ CCI_REG8(0x30ac), 0x20 },
> +	{ CCI_REG8(0x30b0), 0x43 },
> +	{ CCI_REG8(0x3119), 0x9e },
> +	{ CCI_REG8(0x311c), 0x1e },
> +	{ CCI_REG8(0x311e), 0x08 },
> +	{ CCI_REG8(0x3128), 0x05 },
> +	{ CCI_REG8(0x313d), 0x83 },
> +	{ CCI_REG8(0x3150), 0x03 },
> +	{ CCI_REG8(0x317e), 0x00 },
> +	{ CCI_REG8(0x32b8), 0x50 },
> +	{ CCI_REG8(0x32b9), 0x10 },
> +	{ CCI_REG8(0x32ba), 0x00 },
> +	{ CCI_REG8(0x32bb), 0x04 },
> +	{ CCI_REG8(0x32c8), 0x50 },
> +	{ CCI_REG8(0x32c9), 0x10 },
> +	{ CCI_REG8(0x32ca), 0x00 },
> +	{ CCI_REG8(0x32cb), 0x04 },
> +	{ CCI_REG8(0x332c), 0xd3 },
> +	{ CCI_REG8(0x332d), 0x10 },
> +	{ CCI_REG8(0x332e), 0x0d },
> +	{ CCI_REG8(0x3358), 0x06 },
> +	{ CCI_REG8(0x3359), 0xe1 },
> +	{ CCI_REG8(0x335a), 0x11 },
> +	{ CCI_REG8(0x3360), 0x1e },
> +	{ CCI_REG8(0x3361), 0x61 },
> +	{ CCI_REG8(0x3362), 0x10 },
> +	{ CCI_REG8(0x33b0), 0x50 },
> +	{ CCI_REG8(0x33b2), 0x1a },
> +	{ CCI_REG8(0x33b3), 0x04 },
> +};
> +
>  #define IMX290_NUM_CLK_REGS	2
>  static const struct cci_reg_sequence xclk_regs[][IMX290_NUM_CLK_REGS] = {
>  	[IMX290_CLK_37_125] = {
> @@ -1456,6 +1502,20 @@ static const struct imx290_model_info imx290_models[] = {
>  		.max_analog_gain = 98,
>  		.name = "imx327",
>  	},
> +	[IMX290_MODEL_IMX462LQR] = {
> +		.colour_variant = IMX290_VARIANT_COLOUR,
> +		.init_regs = imx290_global_init_settings_462,
> +		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
> +		.max_analog_gain = 98,
> +		.name = "imx462",
> +	},
> +	[IMX290_MODEL_IMX462LLR] = {
> +		.colour_variant = IMX290_VARIANT_MONO,
> +		.init_regs = imx290_global_init_settings_462,
> +		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
> +		.max_analog_gain = 98,
> +		.name = "imx462",
> +	},
>  };
>  
>  static int imx290_parse_dt(struct imx290 *imx290)
> @@ -1654,6 +1714,12 @@ static const struct of_device_id imx290_of_match[] = {
>  	}, {
>  		.compatible = "sony,imx327lqr",
>  		.data = &imx290_models[IMX290_MODEL_IMX327LQR],
> +	}, {
> +		.compatible = "sony,imx462lqr",
> +		.data = &imx290_models[IMX290_MODEL_IMX462LQR],
> +	}, {
> +		.compatible = "sony,imx462llr",
> +		.data = &imx290_models[IMX290_MODEL_IMX462LLR],
>  	},
>  	{ /* sentinel */ },
>  };

-- 
Regards,

Laurent Pinchart

