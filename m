Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6C0C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 01:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DU9y6yZFUhKLDqjMEgCthMnBwUR9V9PmJRu0Ttl8fKU=; b=n3F3/FGv4gl9qYQPWiDGgxNvjn
	qj9EHnnD5x4rOBl8nOHr+bZfo6aLRi4/Lq70wEHB2GRf7AAyJGMjFsGCkbdVBQcpt+C9GjmAciaXO
	l5MoiDDUzBF5J09KOgHVL7RT341ZhvLAiDt5fxojnSK7wVIdCosR1MSYFrElbrgwkQohPw5wqW9pf
	HokPVEYdglmE4KIyvxJ8bcOutEewOmIyDcZQVXWPdqZ52drGRz8x0Nw1JUa0FptJVFYpqq+sM9m0n
	/17Bt9pzA1simWTKb2sYPR5s+0MYbGTVg+VYt8sCg6iH+fehK6mSOqXq+rQan/Yjk0xBeG6JehLp/
	fci6wd7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uORhm-00000003Ff9-29rE;
	Mon, 09 Jun 2025 01:53:42 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQWa-00000003C2o-3Y49;
	Mon, 09 Jun 2025 00:38:06 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33C923D5;
	Mon,  9 Jun 2025 02:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749429477;
	bh=VNImrDurwZK0+nYH5ILKXX5q7TG/MFOjxrqpLuoNmTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pwuXG8b7/mU1AjzKo96JkUt8kxMaGNh6RAw5ecbjkKIdCngiaVh+4DHxUN0JixM8w
	 Xv2trPT3CrltYX6iZyzNIAxh89GroguvRpnrAV1/qqERIBzk+AI3Yi+rFyJkpmv8Wq
	 VkGfv4ATvf4/93cY30rB5LsY7Z8TjOlDGg3rR/Ls=
Date: Mon, 9 Jun 2025 03:37:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: bcm2835-unicam: Remove RGB24 support
Message-ID: <20250609003751.GD14545@pendragon.ideasonboard.com>
References: <20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_173805_025547_EB189213 
X-CRM114-Status: GOOD (  21.98  )
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

Hi Maxime,

Thank you for the patch.

On Fri, Jun 06, 2025 at 04:53:03PM +0200, Maxime Ripard wrote:
> The RGB24 V4L2 format is defined as a pixel format with 8 bits per
> components, with the components being in the red, green, and blue order
> from left to right.
> 
> The RGB MIPI-CSI2 is defined in the specification (Section 11.3.1,
> RGB888) with blue coming first, then green, then red. So the opposite of
> what V4L2 means by RGB.
> 
> Since the hardware cannot reorder the components, this means that when
> selecting the RGB24 format, you get inverted red and blue components
> compared to what you'd expect.
> 
> The driver already supports BGR24, so we can simply remove the RGB24
> format from the driver.

The only reason I could think of to explain why the driver exposes
V4L2_PIX_FMT_RGB24 is to support CSI-2 sources that transfer RGB888 data
with a non-standard order. I don't know what hardware would do that.
Dave, Naush, do you recall why this pixel format is supported by the
unicam driver ?

> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index f10064107d543caf867249d0566a0f42d6d8c4c6..1f549019efd53c9aae83193e74f1a3601ebf274d 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -338,15 +338,10 @@ static const struct unicam_format_info unicam_image_formats[] = {
>  	/* RGB Formats */
>  		.fourcc		= V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
>  		.code		= MEDIA_BUS_FMT_RGB565_1X16,
>  		.depth		= 16,
>  		.csi_dt		= MIPI_CSI2_DT_RGB565,
> -	}, {
> -		.fourcc		= V4L2_PIX_FMT_RGB24, /* rgb */
> -		.code		= MEDIA_BUS_FMT_RGB888_1X24,
> -		.depth		= 24,
> -		.csi_dt		= MIPI_CSI2_DT_RGB888,
>  	}, {
>  		.fourcc		= V4L2_PIX_FMT_BGR24, /* bgr */
>  		.code		= MEDIA_BUS_FMT_BGR888_1X24,
>  		.depth		= 24,
>  		.csi_dt		= MIPI_CSI2_DT_RGB888,
> 
> ---
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> change-id: 20250606-rpi-unicam-rgb-bgr-fix-d1b6f46a75ad

-- 
Regards,

Laurent Pinchart

