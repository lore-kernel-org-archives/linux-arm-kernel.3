Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857E3CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 22:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oo2OMzaDRq6/e1VndzUfveXaLMs8qJuahanQzSA8h1M=; b=y1ukINjKOJvc0YRAPXlIvUkGTi
	JViha57ziPVpTICjOAZwl8NHUAG9Owa7VY7F9jfTtiO6rxHngAm57OpYps/T4H7FoWzmWYLkX/wFc
	TYSd4ZG/dYkl5ZLU8qfhkkth7VsROa1ga8KdDty55XPoJnLLZZR5tiQFmJcKrjZZ2ODRa1b7Sh3lh
	WX5iDppgqveYtvkcWuB4CQn9iQBMDTFKlV49CaevAVa+p5IKz0h+fnlrRaDDgJfwR4RCMuN7nhIjY
	2EhrS5IsffIypOJVGyP+HciFJTEhwMvkFIYvO4+XdF/THxLNBEyFavitn5tAOgDgZ2AnBm1GQNwW+
	kP47bYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0SQd-00000008KT7-2XI1;
	Sun, 21 Sep 2025 22:21:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0SQX-00000008KPZ-3kKS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 22:21:05 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 551D710C4;
	Mon, 22 Sep 2025 00:19:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758493178;
	bh=+eOD1GcoHBO726C3msHiBvYXNdElq3AA2TEiC9gvtBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=urhkteUgoEr0pBFx5ZznC9R2+mPCnkVmCYz5NI8vXmF1bE1E22cMMjRdVmF1KKKRD
	 UTiO7k4R30B2fyZLEg2IeT4PCGYPuyY41r3RrPWsSGbYimiIWaV0/+bCl0BdU1zgQv
	 Pb+jYlPU7F6tTtayG/H3hMsVuUvw2m/gLF5P8x9w=
Date: Mon, 22 Sep 2025 01:20:29 +0300
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
Subject: Re: [PATCH v2 4/5] media: nxp: imx8-isi: Reorder the platform data
Message-ID: <20250921222029.GD10540@pendragon.ideasonboard.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <20250905-isi_imx93-v2-4-37db5f768c57@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905-isi_imx93-v2-4-37db5f768c57@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_152102_073505_80EF1C24 
X-CRM114-Status: GOOD (  16.91  )
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

On Fri, Sep 05, 2025 at 02:56:01PM +0800, Guoniu Zhou wrote:
> Sort platform data in the order of compatible strings in of_match table
> to make it more convenient to read.
> 
> No functions changed.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 44 +++++++++++-----------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index adc8d9960bf0df87d4e475661a3439beaf5ce9f6..0155c75983f02f33f7f0669e73188222ebb5e816 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -314,6 +314,28 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  	.has_36bit_dma		= true,
>  };
>  
> +static const struct mxc_isi_plat_data mxc_imx8qm_data = {
> +	.model			= MXC_ISI_IMX8QM,
> +	.num_ports		= 5,
> +	.num_channels		= 8,
> +	.reg_offset		= 0x10000,
> +	.ier_reg		= &mxc_imx8_isi_ier_qm,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= false,
> +};
> +
> +static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
> +	.model			= MXC_ISI_IMX8QXP,
> +	.num_ports		= 5,
> +	.num_channels		= 6,
> +	.reg_offset		= 0x10000,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= false,
> +};
> +
>  static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
>  	.model			= MXC_ISI_IMX8ULP,
>  	.num_ports		= 1,
> @@ -337,28 +359,6 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.has_36bit_dma		= false,
>  };
>  
> -static const struct mxc_isi_plat_data mxc_imx8qm_data = {
> -	.model			= MXC_ISI_IMX8QM,
> -	.num_ports		= 5,
> -	.num_channels		= 8,
> -	.reg_offset		= 0x10000,
> -	.ier_reg		= &mxc_imx8_isi_ier_qm,
> -	.set_thd		= &mxc_imx8_isi_thd_v1,
> -	.buf_active_reverse	= true,
> -	.has_36bit_dma		= false,
> -};
> -
> -static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
> -	.model			= MXC_ISI_IMX8QXP,
> -	.num_ports		= 5,
> -	.num_channels		= 6,
> -	.reg_offset		= 0x10000,
> -	.ier_reg		= &mxc_imx8_isi_ier_v2,
> -	.set_thd		= &mxc_imx8_isi_thd_v1,
> -	.buf_active_reverse	= true,
> -	.has_36bit_dma		= false,
> -};
> -
>  /* -----------------------------------------------------------------------------
>   * Power management
>   */

-- 
Regards,

Laurent Pinchart

