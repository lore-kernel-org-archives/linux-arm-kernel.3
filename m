Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6BFD74EE7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 15:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAUkfiLygEMeS191w3n1EDUBTXgMuCq386mzawqLbSA=; b=oFIk3nplbg33UkDx4kQouPpWp+
	HfT9+yYpIlKrofmosdV77LtXw3GDD6zeMVUej98bwXhu+sUE4XfVTjlt/vYyl07zteQN6soMfwW1H
	Fr4pMMhxxf4ESx8cZDfhl4OjLJ6RRjH7BKKZkL2AU2zXFsdeJTO5bsvQLLI6km0VCgUqyRnbt279M
	sbgMe23yVpua0kXViX+3cmGJmC7Ve42KDyEXXxJaXLSCY8aeOv/pX2iwsltT5zvmmRV6BKq0QCigD
	z8OHIJw+Bi3q1OhFaAUEJJ+FG3tY3CjEx0t8vhn3cnTJ7T/lqSnn2QtJBeiAmLOIIsiAKy0v6BIeZ
	t6N9Dltg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJCt-000000096o3-0SfI;
	Fri, 23 Jan 2026 15:36:19 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJCq-000000096ni-09wY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 15:36:17 +0000
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CE1AE9CE;
	Fri, 23 Jan 2026 16:35:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769182539;
	bh=veP5Zq0B8RmCRU3vzf5VmdMpehKE3iDoJc4G6/L9dd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r0+peo8QYRalO+QSLfjqcbJOcDTsJiZrHlspFkoCh6updd9oxLVN3ckGQ6x58TG6a
	 ZdNFAlc8UCrRa2PReYeGZlrZ9ppWSfl35ZYlx+ncbKYWmHogHAKcY6aZz7xqr9YJ4l
	 Vq9/RU2fUpHO0jXZWWEsC5ElIDg9FwEYu/Kz0QNk=
Date: Fri, 23 Jan 2026 17:36:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nick Huang <sef1548@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kusogame68@gmail.com
Subject: Re: [PATCH] drm/xcsi2rxss: use str_true_false() for boolean dev_info
 output
Message-ID: <20260123153610.GB415966@killaraus>
References: <20260123153108.19204-1-sef1548@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260123153108.19204-1-sef1548@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_073616_235776_FC649D09 
X-CRM114-Status: GOOD (  17.70  )
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

On Fri, Jan 23, 2026 at 03:31:04PM +0000, Nick Huang wrote:
> Refactor dev_info calls in xcsi2rxss_log_status() to use the
> str_true_false() helper instead of inline ternary operators
> ("true" : "false"). This makes the code cleaner, more readable,
> and easier to maintain.

That's a matter of personal preference, and I disagree with that. Please
don't post this kind of refactoring that doesn't bring actual
improvements, that's not a good use of reviewers and maintainers' time.

> Added #include <linux/string_choices.h>
> for future use if symbolic flag printing is needed.
> 
> Signed-off-by: Nick Huang <sef1548@gmail.com>
> ---
>  drivers/media/platform/xilinx/xilinx-csi2rxss.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> index 146131b8f..e0c5b2ceb 100644
> --- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> +++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> @@ -17,6 +17,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <linux/v4l2-subdev.h>
> +#include <linux/string_choices.h>
>  #include <media/media-entity.h>
>  #include <media/mipi-csi2.h>
>  #include <media/v4l2-common.h>
> @@ -400,19 +401,19 @@ static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
>  	dev_info(dev, "***** Core Status *****\n");
>  	data = xcsi2rxss_read(xcsi2rxss, XCSI_CSR_OFFSET);
>  	dev_info(dev, "Short Packet FIFO Full = %s\n",
> -		 data & XCSI_CSR_SPFIFOFULL ? "true" : "false");
> +		 str_true_false(data & XCSI_CSR_SPFIFOFULL));
>  	dev_info(dev, "Short Packet FIFO Not Empty = %s\n",
> -		 data & XCSI_CSR_SPFIFONE ? "true" : "false");
> +		 str_true_false(data & XCSI_CSR_SPFIFONE));
>  	dev_info(dev, "Stream line buffer full = %s\n",
> -		 data & XCSI_CSR_SLBF ? "true" : "false");
> +		 str_true_false(data & XCSI_CSR_SLBF));
>  	dev_info(dev, "Soft reset/Core disable in progress = %s\n",
> -		 data & XCSI_CSR_RIPCD ? "true" : "false");
> +		 str_true_false(data & XCSI_CSR_RIPCD));
>  
>  	/* Clk & Lane Info  */
>  	dev_info(dev, "******** Clock Lane Info *********\n");
>  	data = xcsi2rxss_read(xcsi2rxss, XCSI_CLKINFR_OFFSET);
>  	dev_info(dev, "Clock Lane in Stop State = %s\n",
> -		 data & XCSI_CLKINFR_STOP ? "true" : "false");
> +		 str_true_false(data & XCSI_CLKINFR_STOP));
>  
>  	dev_info(dev, "******** Data Lane Info *********\n");
>  	dev_info(dev, "Lane\tSoT Error\tSoT Sync Error\tStop State\n");
> @@ -421,9 +422,9 @@ static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
>  		data = xcsi2rxss_read(xcsi2rxss, reg);
>  
>  		dev_info(dev, "%d\t%s\t\t%s\t\t%s\n", i,
> -			 data & XCSI_DLXINFR_SOTERR ? "true" : "false",
> -			 data & XCSI_DLXINFR_SOTSYNCERR ? "true" : "false",
> -			 data & XCSI_DLXINFR_STOP ? "true" : "false");
> +			 str_true_false(data & XCSI_DLXINFR_SOTERR),
> +			 str_true_false(data & XCSI_DLXINFR_SOTSYNCERR),
> +			 str_true_false(data & XCSI_DLXINFR_STOP));
>  
>  		reg += XCSI_NEXTREG_OFFSET;
>  	}

-- 
Regards,

Laurent Pinchart

