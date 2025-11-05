Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A74ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 17:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=My4cU8qWSoMNi9OQrPdePDhFoFW6Hi9mVPGSgPNQeMM=; b=5BlufpJZVWGuJAb2waNXQjE9hT
	XuGqKCpgeNyQpXT1naa6r7ElVCT4HCcxqtfb10kobqdAQWMJRylHgrBEFMgIg/peUIspdD6Zr5ZCp
	uj5uBjC8q4Dch4F1SIKHmnhcojkroSySs8/ry62VDjT50IytK8n39g+OStYGCBEXNMonjFn41mNCr
	N7mxP2kfPmNKlhSKiH8MTEh9TZ5SGpDdKpn5S0PznXN8F+2v9+Icc1o1BA/FGiqHTaYb/bCtn4anW
	DdhgaCJSVTsmqKJdSpwj1HRquZBOyWQIv4lNJiiZ/D8hmW5UTWAK7SQxt0ovXtK/y8gmaWCp5H7En
	wsT1+XSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhIr-0000000EApU-3Bvf;
	Wed, 05 Nov 2025 17:28:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhIq-0000000EAnc-0BVI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Nov 2025 17:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=My4cU8qWSoMNi9OQrPdePDhFoFW6Hi9mVPGSgPNQeMM=; b=CT69QDGNIMil9Hue7n57JBufcc
	/IepQT/xyKkNP6WVFHY427KDpHhfX1gNVulZRFyAgba1oIeye4rlCi8QVtfNF3EXsiDo8+tGLIbx1
	bx8c3f5d7DJ43hb0vV/nMeH8NGYA7xWD6IewVQr504XznCM9LyYF4Hw/bVlztGNkxi1kMNzv9V3oa
	4NWPzTMjC7etEk8L6ZzZrY0rZFhL36YuZnhlSbIk3MxTq8TTY9up0ONDSjLLCmxlP4fYA5Ii8TddM
	QWEZADqJI6by5QMoo9lEUwQh9WdVWJoC81WcxLoRyzmuOQW96UlZ4UNMlbOo6Wal74BWi8FX2xdgL
	t+dikmog==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgR6-00000002chD-0IdJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 16:32:41 +0000
Received: from pendragon.ideasonboard.com (82-203-161-95.bb.dnainternet.fi [82.203.161.95])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 91ED17E0;
	Wed,  5 Nov 2025 18:26:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762363573;
	bh=A9meDTqC5tJJ9U1Z7d2WJ+ZnrwYNX1upajzsMqtt0GA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVu3H3vkW9ImWiDmVZWXQk25mP1UZAc5e0AIFNxJj8bJ+jylfadg6y1p31lKqCBdJ
	 DkKyukRbSJQyviLKV0480hplT/mE0jZ1CX7PSmqg13Op9pJtuOSy27QUe6d0nNeLd4
	 /G2ArQYKft0dqux/Xct+HTMnxAkqwbdvmcWrEXa0=
Date: Wed, 5 Nov 2025 19:28:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 3/3] media: nxp: imx8-isi: Add ISI support for i.MX95
Message-ID: <20251105172803.GD6046@pendragon.ideasonboard.com>
References: <20251105-isi_imx95-v3-0-3987533cca1c@nxp.com>
 <20251105-isi_imx95-v3-3-3987533cca1c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251105-isi_imx95-v3-3-3987533cca1c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_163240_186584_1067C61C 
X-CRM114-Status: GOOD (  20.56  )
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

On Wed, Nov 05, 2025 at 01:55:12PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The ISI module on i.MX95 supports up to eight channels and four link
> sources to obtain the image data for processing in its pipelines. It
> can process up to eight image sources at the same time.
> 
> Add ISI basic functions support for i.MX95.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I will take this series in my tree and include it in my next pull
request.

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 12 ++++++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  1 +
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index adc8d9960bf0df87d4e475661a3439beaf5ce9f6..cf609320f19e91c9c0f57634fabd62e0ff65123b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -337,6 +337,17 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.has_36bit_dma		= false,
>  };
>  
> +static const struct mxc_isi_plat_data mxc_imx95_data = {
> +	.model			= MXC_ISI_IMX95,
> +	.num_ports		= 4,
> +	.num_channels		= 8,
> +	.reg_offset		= 0x10000,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= true,
> +};
> +
>  static const struct mxc_isi_plat_data mxc_imx8qm_data = {
>  	.model			= MXC_ISI_IMX8QM,
>  	.num_ports		= 5,
> @@ -548,6 +559,7 @@ static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
>  	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
>  	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
> +	{ .compatible = "fsl,imx95-isi", .data = &mxc_imx95_data },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index e84af5127e4e7938e55e31b7063bee5e2cd4cb11..e52c7fc334b0f5624ade600914c275e7539290b4 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -161,6 +161,7 @@ enum model {
>  	MXC_ISI_IMX8QXP,
>  	MXC_ISI_IMX8ULP,
>  	MXC_ISI_IMX93,
> +	MXC_ISI_IMX95,
>  };
>  
>  struct mxc_isi_plat_data {

-- 
Regards,

Laurent Pinchart

