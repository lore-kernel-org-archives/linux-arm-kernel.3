Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4871FC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 23:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBgfAAVX//hcUTxWrTMpWOuKALoXzzLaWIDQmhEhSCw=; b=HkHevpErRjgg0uQgCWPesXmcmZ
	SQ5FpoQJdc953hs02bpRlpkrcFQefRDsGOao+40tZUsDO5v4A/mIcgV35ISFdx5xvRLQlfImLL8d+
	EbKYeaZc8A/4uWKRS3vPlfdhrQkOAS2njxQNSYJc95ghBwDQOc2/EE6QzwkivII8XDrqmDYW9rcUj
	kxDCE4Wu/tR6XwHK6429nXwru0hVfBrwWMRrYAyuwoQx1zPwdgtYehRaETHueffXJWPtpxD34budx
	dc4AsWY2xAStCc0j6ygq78iS0HdlPM4yBitv510WRANRmPaRnK0ZfKU8reMuoTJJSF/IqlC3Sshv6
	hnRdAXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6GS7-00000004t0p-18hK;
	Mon, 14 Sep 2026 23:51:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6GS2-00000004t0Q-3YKh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 23:51:08 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E909D447;
	Tue, 15 Sep 2026 01:49:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789429765;
	bh=sU/PO7Z5sXrjnUmj9i4QwpdDF5i8z7u6FxVpK59VV1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qGfE91vuLn74KbNCwBjGzl/Z7GD3xOOfYm8AVjEX5DmfvWQjb4s7zLrMiT2VU94UX
	 xH6EU+4Sp1mdfDj3t8tQjet/rLJJ9YtKLTANrLnIvXlGp22HYpN1iiby6ejO0bhW80
	 AdaljZPcYv02P/3F2lblPsYx4VBT9smMW8Qwdi1c=
Date: Tue, 15 Sep 2026 02:51:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] media: imx8-isi: Remove unused model field from
 platform data
Message-ID: <20260914235103.GA2804748@killaraus.ideasonboard.com>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-3-fafdb4b446d4@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831-isi_imx952-v2-3-fafdb4b446d4@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_165107_928557_AA0F0B2A 
X-CRM114-Status: GOOD (  20.38  )
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

On Mon, Aug 31, 2026 at 11:36:58AM +0800, Guoniu Zhou wrote:
> The model field in struct mxc_isi_plat_data and the corresponding
> enum model are never referenced in any driver logic. Remove them
> to simplify the platform data structures.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

The idea behind this field was to enable model-specific code paths in
the driver. That may still be useful later, but we can always
reintroduce the model field then. I'm fine dropping it for now.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v2:
> - New added in v2 (Frank)
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c |  8 --------
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 12 ------------
>  2 files changed, 20 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index c1c16dbc1539..e627054bbc8e 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -291,7 +291,6 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
>  };
>  
>  static const struct mxc_isi_plat_data mxc_imx8mn_data = {
> -	.model			= MXC_ISI_IMX8MN,
>  	.num_ports		= 1,
>  	.num_channels		= 1,
>  	.reg_offset		= 0,
> @@ -304,7 +303,6 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
>  };
>  
>  static const struct mxc_isi_plat_data mxc_imx8mp_data = {
> -	.model			= MXC_ISI_IMX8MP,
>  	.num_ports		= 2,
>  	.num_channels		= 2,
>  	.reg_offset		= 0x2000,
> @@ -317,7 +315,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  };
>  
>  static const struct mxc_isi_plat_data mxc_imx8qm_data = {
> -	.model			= MXC_ISI_IMX8QM,
>  	.num_ports		= 5,
>  	.num_channels		= 8,
>  	.num_vc			= 4,
> @@ -330,7 +327,6 @@ static const struct mxc_isi_plat_data mxc_imx8qm_data = {
>  };
>  
>  static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
> -	.model			= MXC_ISI_IMX8QXP,
>  	.num_ports		= 5,
>  	.num_channels		= 6,
>  	.num_vc			= 4,
> @@ -343,7 +339,6 @@ static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
>  };
>  
>  static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
> -	.model			= MXC_ISI_IMX8ULP,
>  	.num_ports		= 1,
>  	.num_channels		= 1,
>  	.reg_offset		= 0x0,
> @@ -355,7 +350,6 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
>  };
>  
>  static const struct mxc_isi_plat_data mxc_imx91_data = {
> -	.model			= MXC_ISI_IMX91,
>  	.num_ports		= 1,
>  	.num_channels		= 1,
>  	.reg_offset		= 0,
> @@ -367,7 +361,6 @@ static const struct mxc_isi_plat_data mxc_imx91_data = {
>  };
>  
>  static const struct mxc_isi_plat_data mxc_imx93_data = {
> -	.model			= MXC_ISI_IMX93,
>  	.num_ports		= 1,
>  	.num_channels		= 1,
>  	.reg_offset		= 0,
> @@ -380,7 +373,6 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
>  };
>  
>  static const struct mxc_isi_plat_data mxc_imx95_data = {
> -	.model			= MXC_ISI_IMX95,
>  	.num_ports		= 4,
>  	.num_channels		= 8,
>  	.num_vc			= 8,
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 05c21c448b93..73f6ea7b0ea1 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -155,19 +155,7 @@ struct mxc_gasket_ops {
>  	void (*disable)(struct mxc_isi_dev *isi, const unsigned int port);
>  };
>  
> -enum model {
> -	MXC_ISI_IMX8MN,
> -	MXC_ISI_IMX8MP,
> -	MXC_ISI_IMX8QM,
> -	MXC_ISI_IMX8QXP,
> -	MXC_ISI_IMX8ULP,
> -	MXC_ISI_IMX91,
> -	MXC_ISI_IMX93,
> -	MXC_ISI_IMX95,
> -};
> -
>  struct mxc_isi_plat_data {
> -	enum model model;
>  	unsigned int num_ports;
>  	unsigned int num_channels;
>  	unsigned int num_vc;		/* Number of VCs, 0 = no VC support */

-- 
Regards,

Laurent Pinchart

