Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8179FCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 21:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcE35UqMz+L9UpnW+ySkgWReU5H22Li8Ti6FcmITQU4=; b=BDscfVC6/ve4BMcMu71Fcb0oW/
	mJbTpZStKGhRe16hWQBZAKGai/4GT1yFORqnNNKPlNXKFPupVLOQCymRSfr5uPDPDRPAPP2hkJRiJ
	z5k2iPyZ6RtXC9iFHdvPXB1s36cuX+eF4ZcA4R7HUvdyWia/MSr0ixo8C5OQD0cEV12EcijHL/5dw
	CG9V9bxAiJ8m5Ho8kXE/vmkOe/gfQLC34cfs3UvZHD63ZKZdblBE2cjLrFWkmBgJ7KvxN9aDkar+7
	bJKrIPsLC3ABxO7a0jcrEW61G0J+Smti4Ra5wZvQMLmef6cDJSMHrGOkYai+P71JLySjtsxhTJ08P
	2EDMsylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7xm-0000000CkK0-2r84;
	Sun, 26 Oct 2025 21:07:42 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7xk-0000000CkJE-3sYl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 21:07:42 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 96811129;
	Sun, 26 Oct 2025 22:05:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761512751;
	bh=FX3PJZ4Zx7AunoIvtIIT5LbQdAgzbExv6kJ6VBmjW8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OcSMQaL2aTruoSuT8i+ItTMMlx5+YuMA01qolWkx56SEliWHlNkl2R0pUC2imvG7m
	 HF5VieJN/VQqu0Jv9+qJcgVdeK07SgxVcaRYUG2k7qlpzucdyV8Dzy5s8rvO1mWFuy
	 8trOxSaexrIuaxpwQ+bwHlUD61vKOimvBvz6F2x8=
Date: Sun, 26 Oct 2025 23:07:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: mchehab@kernel.org, rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank.Li@nxp.com
Subject: Re: [PATCH v5 3/4] media: imx-mipi-csis: Add num_data_lanes to
 mipi_csis_device
Message-ID: <20251026210724.GE1025@pendragon.ideasonboard.com>
References: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
 <20251022102228.275627-4-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251022102228.275627-4-isaac.scott@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_140741_101974_898E2D98 
X-CRM114-Status: GOOD (  20.52  )
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

On Wed, Oct 22, 2025 at 11:22:27AM +0100, Isaac Scott wrote:
> Add the num_data_lanes field to the mipi_csis_device struct, and set it
> equal to csis->bus.num_data_lanes. This is in preparation to support
> cases when the data lanes actively used differs from the maximum
> supported data lanes.
> 
> No functional changes intended by this commit.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 7c2a679dca2e..838a1ad123b5 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -351,6 +351,8 @@ struct mipi_csis_device {
>  	u32 hs_settle;
>  	u32 clk_settle;
>  
> +	unsigned int num_data_lanes;
> +
>  	spinlock_t slock;	/* Protect events */
>  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
>  	struct dentry *debugfs_root;
> @@ -573,7 +575,7 @@ static void mipi_csis_system_enable(struct mipi_csis_device *csis, int on)
>  	val = mipi_csis_read(csis, MIPI_CSIS_DPHY_CMN_CTRL);
>  	val &= ~MIPI_CSIS_DPHY_CMN_CTRL_ENABLE;
>  	if (on) {
> -		mask = (1 << (csis->bus.num_data_lanes + 1)) - 1;
> +		mask = (1 << (csis->num_data_lanes + 1)) - 1;
>  		val |= (mask & MIPI_CSIS_DPHY_CMN_CTRL_ENABLE);
>  	}
>  	mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL, val);
> @@ -623,7 +625,7 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
>  
>  	/* Calculate the line rate from the pixel rate. */
>  	link_freq = v4l2_get_link_freq(csis->source.pad, csis_fmt->width,
> -				       csis->bus.num_data_lanes * 2);
> +				       csis->num_data_lanes * 2);
>  	if (link_freq < 0) {
>  		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
>  			(int)link_freq);
> @@ -668,7 +670,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  				 const struct v4l2_mbus_framefmt *format,
>  				 const struct csis_pix_format *csis_fmt)
>  {
> -	int lanes = csis->bus.num_data_lanes;
> +	int lanes = csis->num_data_lanes;
>  	u32 val;
>  
>  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> @@ -1366,8 +1368,9 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  	}
>  
>  	csis->bus = vep.bus.mipi_csi2;
> +	csis->num_data_lanes = csis->bus.num_data_lanes;
>  
> -	dev_dbg(csis->dev, "data lanes: %d\n", csis->bus.num_data_lanes);
> +	dev_dbg(csis->dev, "max data lanes: %d\n", csis->bus.num_data_lanes);
>  	dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
>  
>  	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,

-- 
Regards,

Laurent Pinchart

