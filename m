Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3076ACCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 00:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDtaGlhgsHK6yCHg1LT1Z6blNfWoVjcwzASPQBRsCeg=; b=cDL0Vp8LivoNIr+nmklt1JTX8M
	tdOXSC2Eip+I/T8RBGN33/bFRERJGb+tB4UwtN+HsTXqNaHmQd6OF/arsm05qgtlJ9LJ6MysGOXJq
	gYlx/ssq+A/Zx2IsYHBGDXKzvtsduNwhMeoKH8A4o877a5Gw3I4TCZi/ZmweMoBPGEVuZ5B+vJMSt
	3ajt7L173JpyuXE7RGTr/YTi6xnFKXWyPRKmh1+MEvmy+tcitzyc82b7Muror47BqkLHAVrFLgbVY
	H5DwtOOhwdM5A8ZXoQ9RzgFggF7004eMk9W/MHdCegaAuTKZ5D7xLBNZqqk2GsN3p1cQrU9Cixg51
	CkUzsfww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBLT-0000000CuKE-455p;
	Mon, 27 Oct 2025 00:44:23 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBLR-0000000CuJl-1Vzb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 00:44:22 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9014D16AE;
	Mon, 27 Oct 2025 01:42:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761525752;
	bh=oGBJ70fWGuRrs7V1TNX5HTXmxCDYsiN9FlE25l3M+Bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WbMhkCGBzud5YNDDtv2InQzvhXDW+1cRob5q2lKZbeYAgBbenRdiU09GHOzZNeyh9
	 yjVcx/S4Sbt/1cq2UWOh4BGcQoMD6yeraACi8w2RX2YzYdJrmRI0a9GenptR6hN9RW
	 QTS2l7Mqa/no3gJcRHSJM2Phb/9zwWnpTfvgx4Ds=
Date: Mon, 27 Oct 2025 02:44:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v7 4/5] media: imx8mq-mipi-csi2: Add support for i.MX8ULP
Message-ID: <20251027004406.GP13023@pendragon.ideasonboard.com>
References: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
 <20251023-csi2_imx8ulp-v7-4-5ecb081ce79b@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251023-csi2_imx8ulp-v7-4-5ecb081ce79b@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_174421_538220_CF4EB686 
X-CRM114-Status: GOOD (  17.27  )
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

On Thu, Oct 23, 2025 at 05:19:45PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The CSI-2 receiver in i.MX8ULP is almost same as i.MX8QXP/QM except
> clocks and resets, so add compatible string for i.MX8ULP to handle
> the difference and reuse platform data of i.MX8QXP/QM.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index fd788a7f48e5feeff658e3d2347db6fefca5d0cf..d8fadb0f1b6b670110ee98a74cffd56a6c96592b 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -1069,6 +1069,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
>  static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
>  	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
>  	{ .compatible = "fsl,imx8qxp-mipi-csi2", .data = &imx8qxp_data },
> +	{ .compatible = "fsl,imx8ulp-mipi-csi2", .data = &imx8qxp_data },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
Regards,

Laurent Pinchart

