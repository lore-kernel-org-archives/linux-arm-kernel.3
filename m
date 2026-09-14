Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAEDC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 23:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HFCzZR0hMJi/a540zVR/6fIa99eldcjXfsghzBOCwI=; b=ZRR8CB8gR7KTv9kXzmK0QrUwhS
	Ji5RKqiWcJ2KrVsI92U35HL4VZ4hE9nvvMzlDGpDJEkjTrj7gLC+MDsUQbEONYHFktnroWvvRtDSv
	yWKOW31ldmwDvUbi45ojJOew285/kvJtQeammgCGC13WE+pxuJ7oPKZ8pOJfJZ4NY0+ilyUe8W5pT
	AFp7SA/eq6jK1qThrEcuKYh+Hx/GL1A3hk3/BC3FsxEg6XkOH/+q/dwMs9m2GL//F4OwXPyOjbb7W
	iZI7DWB9kBNtLyW9W9yGZp2F+pB2lxBRwpXZpuVDbjfjx1A24io+w9gW0BWN0df8aQPa9Dz8Szt9H
	+QXgH1Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6GPc-00000004slU-05qm;
	Mon, 14 Sep 2026 23:48:36 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6GPY-00000004skl-2RAS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 23:48:34 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C06D447;
	Tue, 15 Sep 2026 01:46:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789429606;
	bh=tULWwH62VQMESKfBVhG2CV6lqkdVfbuPf1NEtG0VYdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pj96U3pX/+W6GwchjLwZPO+Fx2cGKnYC2ZTcIgcjIammj/C8i5GZOTmO2GG1WoueV
	 5IPdszO+1egDGAP7IktJY4f/IdIXNQR0lEwx1XW6XrhvGj3teNuNaq4nja2ZoI3A89
	 bot6RDCJhWliXHqRUNd9SDU+ctgb3AWyP+FN11zc=
Date: Tue, 15 Sep 2026 02:48:25 +0300
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
Subject: Re: [PATCH v2 1/6] media: imx8-isi: Reorder mxc_imx95_data to follow
 mxc_imx93_data
Message-ID: <20260914234825.GB2796257@killaraus.ideasonboard.com>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-1-fafdb4b446d4@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831-isi_imx952-v2-1-fafdb4b446d4@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_164832_770160_A4DAF59D 
X-CRM114-Status: GOOD (  17.04  )
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

On Mon, Aug 31, 2026 at 11:36:56AM +0800, Guoniu Zhou wrote:
> Move mxc_imx95_data definition after mxc_imx93_data to match the
> order defined in the of_match array.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 24 +++++++++++-----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 0ae5f35e017c..f2a8eb82fbfd 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -314,18 +314,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  	.has_36bit_dma		= true,
>  };
>  
> -static const struct mxc_isi_plat_data mxc_imx95_data = {
> -	.model			= MXC_ISI_IMX95,
> -	.num_ports		= 4,
> -	.num_channels		= 8,
> -	.num_vc			= 8,
> -	.reg_offset		= 0x10000,
> -	.ier_reg		= &mxc_imx8_isi_ier_v2,
> -	.set_thd		= &mxc_imx8_isi_thd_v1,
> -	.buf_active_reverse	= true,
> -	.has_36bit_dma		= true,
> -};
> -
>  static const struct mxc_isi_plat_data mxc_imx8qm_data = {
>  	.model			= MXC_ISI_IMX8QM,
>  	.num_ports		= 5,
> @@ -384,6 +372,18 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.has_36bit_dma		= false,
>  };
>  
> +static const struct mxc_isi_plat_data mxc_imx95_data = {
> +	.model			= MXC_ISI_IMX95,
> +	.num_ports		= 4,
> +	.num_channels		= 8,
> +	.num_vc			= 8,
> +	.reg_offset		= 0x10000,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= true,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Power management
>   */

-- 
Regards,

Laurent Pinchart

