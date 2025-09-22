Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC77CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNQymtDL04NlArXg7TMdDb0ZZRfUYKB8rTe/arIQWMc=; b=0WjAhwyBgS2ssWKxq+wGJC7gI/
	Qso+3lJnejoDdzH0P4kxWORCX4FuMGWlntfA+CJy3U8TQ0hEPF5Ds172vjsSbEvp8LsROPpdkIlXX
	cD2ho4rJoh6LCMRs3qjjf/fqY5+Rs2Lo2DQVsxYSJMTLyCIFjzATLeStg6xqUCbjD7uNMF7uxyuVO
	X0MyCQNqqZYRBmZOvFz5+9/bLekNPj+zlpqQHtjMP5d6H54zYsB96QocrWuI7lv26PH/zjnmfKM7Q
	l1jcUzkfyL836o8WY9q/eSgTI0SAU9nFZXKNtVJPvNrzIli1rI/N7BSHnZd98IEfhnSF4HxbW8siV
	56y/0qJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0baY-00000009c2j-3STl;
	Mon, 22 Sep 2025 08:07:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0baW-00000009c1q-1Tjj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:07:57 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 54D0BF89;
	Mon, 22 Sep 2025 10:06:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758528392;
	bh=vhNsUXDWD5mlApfmMJfi5q4ViL1LmxbLuD0y5YquSBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pzp+430zL259s4SgzVaIeEXvGiwDzPVPmd9jsSQzvLDxnSNdgcAL7fPJ7Q7RRR3PZ
	 56129ewwGgIXI1tIyeum9dD1sHNrfcGxr0rJfAeE+ClmvRvlQ2emgMG2id2eRaviMX
	 HK7yw9bW6fxlOKWgY+g477a9rXINLXzqA3Goyh7o=
Date: Mon, 22 Sep 2025 11:07:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] media: imx-mipi-csis: Store the number of
 data_lanes configured in dt
Message-ID: <20250922080723.GI10540@pendragon.ideasonboard.com>
References: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
 <20250915-mbus-config-active-lanes-v3-2-97a1282a410b@ideasonboard.com>
 <aNDxd9rWjmgrVCd9@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aNDxd9rWjmgrVCd9@valkosipuli.retiisi.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_010756_536233_F1971568 
X-CRM114-Status: GOOD (  29.05  )
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

On Mon, Sep 22, 2025 at 09:49:27AM +0300, Sakari Ailus wrote:
> On Mon, Sep 15, 2025 at 02:18:34PM +0100, Isaac Scott wrote:
> > The number of lanes actively used by a MIPI CSI transmitter may differ
> > from that which is defined in device tree. To allow us to be able to set
> > the number of configured lanes without changing the maximum lane count,
> > store the number of lanes configured in device tree, and adjust the
> > debug print to reflect the device tree value.
> > 
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 2beb5f43c2c0..6afbedfe131e 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -313,6 +313,8 @@ struct mipi_csis_device {
> >  	u32 hs_settle;
> >  	u32 clk_settle;
> >  
> > +	unsigned int num_data_lanes;
> > +
> >  	spinlock_t slock;	/* Protect events */
> >  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
> >  	struct dentry *debugfs_root;
> > @@ -535,7 +537,7 @@ static void mipi_csis_system_enable(struct mipi_csis_device *csis, int on)
> >  	val = mipi_csis_read(csis, MIPI_CSIS_DPHY_CMN_CTRL);
> >  	val &= ~MIPI_CSIS_DPHY_CMN_CTRL_ENABLE;
> >  	if (on) {
> > -		mask = (1 << (csis->bus.num_data_lanes + 1)) - 1;
> > +		mask = (1 << (csis->num_data_lanes + 1)) - 1;
> 
> Please use 1U or BIT() for bit-shifted values.

BIT() isn't appropriate here. GENMASK(csis->num_data_lanes, 0) could be
fine, but this patch just changes the variable, I wouldn't insist in
fixing separate issues.

> >  		val |= (mask & MIPI_CSIS_DPHY_CMN_CTRL_ENABLE);
> >  	}
> >  	mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL, val);
> > @@ -586,7 +588,7 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
> >  
> >  	/* Calculate the line rate from the pixel rate. */
> >  	link_freq = v4l2_get_link_freq(src_pad, csis_fmt->width,
> > -				       csis->bus.num_data_lanes * 2);
> > +				       csis->num_data_lanes * 2);
> >  	if (link_freq < 0) {
> >  		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
> >  			(int)link_freq);
> > @@ -631,7 +633,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
> >  				 const struct v4l2_mbus_framefmt *format,
> >  				 const struct csis_pix_format *csis_fmt)
> >  {
> > -	int lanes = csis->bus.num_data_lanes;
> > +	int lanes = csis->num_data_lanes;
> >  	u32 val;
> >  
> >  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> > @@ -1299,8 +1301,10 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
> >  	}
> >  
> >  	csis->bus = vep.bus.mipi_csi2;
> > +	csis->bus.num_data_lanes = vep.bus.mipi_csi2.num_data_lanes;

That doesn't seem to be needed.

> > +	csis->num_data_lanes = csis->bus.num_data_lanes;
> >  
> > -	dev_dbg(csis->dev, "data lanes: %d\n", csis->bus.num_data_lanes);
> > +	dev_dbg(csis->dev, "data lanes: %d\n", csis->num_data_lanes);

Neither is this change. What you print here is the number of connected
data lanes, not the number of effectively used lanes. You could change
it to 

	dev_dbg(csis->dev, "max data lanes: %u\n", csis->bus.num_data_lanes);

You'll want to also update the commit message, which I think needs some
improvement regardless.

> >  	dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
> >  
> >  	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
> > @@ -1498,7 +1502,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
> >  	}
> >  
> >  	dev_info(dev, "lanes: %d, freq: %u\n",
> > -		 csis->bus.num_data_lanes, csis->clk_frequency);
> > +		 csis->num_data_lanes, csis->clk_frequency);

Drop this change too. This message is actually redundant, the number of
lanes is printed in mipi_csis_async_register(). You could submit a
separate patch to remove this, possibly replacing it with a dev_dbg() in
mipi_csis_parse_dt() to print clk_frequency.

> >  
> >  	return 0;
> >  

-- 
Regards,

Laurent Pinchart

