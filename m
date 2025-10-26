Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADC8CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 21:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTumC7xnkPewsBCcaAclOtv60mgSjhiVOL32hiUwUd8=; b=tDcwN1UowjaArTJxq/M+hI+oL4
	5TD5FWZ2da+efH1qiFQ08RLuvDVrFEqtZmNAy13uU9Z+xhZysWaDNYnVnu0/plkdRDjI6mqwSWzBO
	7+xnh4J3N80DRhAWJsMAylc7erFdXILuwoJMCCgKjekK+33MEWUX092hFmIGThYYbcZIyPnbgUy+U
	xsfX1lSD5KYAnB4m79+anK6MYIm09nR6ungkmextfhEJAmYzLrgq+ZnU5xHHoGsbnZvl8G79odP4J
	Qdw8p7cNow6X6BOGKcEq/7BSylbu4Wli/CuOEjk3BzV3rI/qeNi+qj6lS8oz93zADl0/87KZbRLRv
	AR1TiqGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7vy-0000000CkC5-15SJ;
	Sun, 26 Oct 2025 21:05:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7vv-0000000CkBg-2j7p
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 21:05:48 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BA7FC21B1;
	Sun, 26 Oct 2025 22:03:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761512638;
	bh=xTj7C6WHH0BI7SqvDLyoTT6OhQ/FzKwl1zNN0hIXilQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kVLf5p/xQFj9mU76DCtLwHZIGUUY97M91qW3pyyHielFFD1/woCia5P227FV+CFCt
	 dmwAMdKjaYFx5WRqCuEWgGSUzssbRePFV2QF94sFM0EhelsueX9BEDGYiHfGYZG0VY
	 He7B8z5iPAEcPA9HWciuu/0Ry3ltkfSr9g4AeWhQ=
Date: Sun, 26 Oct 2025 23:05:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: mchehab@kernel.org, rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank.Li@nxp.com
Subject: Re: [PATCH v5 2/4] media: imx-mipi-csis: Move redundant debug print
 in probe
Message-ID: <20251026210530.GD1025@pendragon.ideasonboard.com>
References: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
 <20251022102228.275627-3-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251022102228.275627-3-isaac.scott@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_140547_833392_23329602 
X-CRM114-Status: GOOD (  17.56  )
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

Hi Isaac,

Thank you for the patch.

On Wed, Oct 22, 2025 at 11:22:26AM +0100, Isaac Scott wrote:
> The number of data lanes is already printed as part of
> mipi_csis_async_register(), making the first part of this print
> redundant. Remove the redundant print, and move the debug print for
> clock frequency to mipi_csis_parse_dt().

There's a bit of room for improvement in the commit message. If you read
it in isolation, without looking at the code change first, you'll see
things like "this print" being quite unclear. No need to change it, just
keep it in mind for your next patch series :-)

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index d5de7854f579..7c2a679dca2e 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1481,6 +1481,7 @@ static int mipi_csis_parse_dt(struct mipi_csis_device *csis)
>  	struct device_node *node = csis->dev->of_node;
>  
>  	of_property_read_u32(node, "clock-frequency", &csis->clk_frequency);
> +	dev_dbg(csis->dev, "clock frequency: %u\n", csis->clk_frequency);
>  
>  	csis->num_channels = 1;
>  	of_property_read_u32(node, "fsl,num-channels", &csis->num_channels);
> @@ -1566,9 +1567,6 @@ static int mipi_csis_probe(struct platform_device *pdev)
>  			goto err_unregister_all;
>  	}
>  
> -	dev_info(dev, "lanes: %d, freq: %u\n",
> -		 csis->bus.num_data_lanes, csis->clk_frequency);
> -
>  	return 0;
>  
>  err_unregister_all:

-- 
Regards,

Laurent Pinchart

