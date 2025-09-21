Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D7ECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 22:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LD1mbeQ74/5q1XO9NfcB0QF5y5Rx7w9CDZ97fzYolNo=; b=zvu7k90FqKZMSAU1CWI1+3/bM1
	D7qYLr1OFqvc8MJLDTZ5KqOFgpV/jOAQ3o+9z9uxJiB+5LXERfnVSidVQzhpSQ0S0i7YOoguKwMJ9
	220Zj4/1JE7kgkXqprHnmZmZR6aeHpQ6HOC+8WK/4w3ajs1JhJGChzDzdmERiElrYhaWWOJMJf5Oy
	NQNIZdm94KYnGACNNxEBuv1ufYYx2qDZP1biJXJkRF7uwkwrZtTxTHIUskKFilrYMke8JE9fv40tV
	n7eG4gyAHh6gZuJMn0wz53w3ItTG+FjmlLY/AIJTzxsMbQgp6HgrAwbSil24ClPvaVyog8T3JqynU
	oqJacjuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0SXe-00000008LFp-2gOz;
	Sun, 21 Sep 2025 22:28:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0SXX-00000008LF1-2ILl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 22:28:20 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D5BF410C4;
	Mon, 22 Sep 2025 00:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758493612;
	bh=l3Ivsn3JvGxkwHoogNhgmc6pBf/DmzRCG5UoUS6WbEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qoQmMfy9Wo8ZiZpmjKndpoV9optOLxQMacitUd9pcgEQtoB/DuFxrhMJGOirEIQns
	 ts6/8TX2HwqFL2jthkYUuUOkMX0Efj4XlyrjyqLUwNCR3oMMyACyQH93V6ZIVf1izc
	 0GKm3OPYkFbBSWqI5uOZ9Z1iYMrnRF6XpwgYBgV0=
Date: Mon, 22 Sep 2025 01:27:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] media: nxp: imx8-isi: Add ISI support for i.MX91
Message-ID: <20250921222743.GE10540@pendragon.ideasonboard.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <20250905-isi_imx93-v2-5-37db5f768c57@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905-isi_imx93-v2-5-37db5f768c57@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_152815_729410_B3D50334 
X-CRM114-Status: GOOD (  19.15  )
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

Hi Guoniu,

Thank you for the patch.

On Fri, Sep 05, 2025 at 02:56:02PM +0800, Guoniu Zhou wrote:
> The ISI module on i.MX91 implements only one channel and one parallel
> camera input. As no input source selection is required, gasket ops are
> unnecessary.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 12 ++++++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  1 +
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 0155c75983f02f33f7f0669e73188222ebb5e816..c3d411ddf492eb27b372763ce5d344a90c6ec524 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -347,6 +347,17 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
>  	.has_36bit_dma		= false,
>  };
>  
> +static const struct mxc_isi_plat_data mxc_imx91_data = {
> +	.model			= MXC_ISI_IMX91,
> +	.num_ports		= 1,
> +	.num_channels		= 1,
> +	.reg_offset		= 0,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= false,
> +};
> +
>  static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.model			= MXC_ISI_IMX93,
>  	.num_ports		= 1,
> @@ -547,6 +558,7 @@ static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx8qm-isi", .data = &mxc_imx8qm_data },
>  	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
>  	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
> +	{ .compatible = "fsl,imx91-isi", .data = &mxc_imx91_data },
>  	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
>  	{ /* sentinel */ },
>  };
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index e84af5127e4e7938e55e31b7063bee5e2cd4cb11..3cbd35305af0f8026c4f76b5eb5d0864f8e36dc3 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -160,6 +160,7 @@ enum model {
>  	MXC_ISI_IMX8QM,
>  	MXC_ISI_IMX8QXP,
>  	MXC_ISI_IMX8ULP,
> +	MXC_ISI_IMX91,
>  	MXC_ISI_IMX93,
>  };

The model field is unused, should we drop it ? That's a candidate for a
separate patch, for this patch

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  

-- 
Regards,

Laurent Pinchart

