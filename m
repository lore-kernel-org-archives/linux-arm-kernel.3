Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967D9CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GjEUs0e8c/MtNVMy6JsCll6Hs84uHZfmaP0PVL0fO4=; b=FarABRg8kZ0M1Ejfgfi4oKYX0C
	9gaHrpJPRb1/IBGuKXyWWk07euvVOZSQxqwv8pZ3tLzwySxPzU4TrefDDym4uIps8jvdOMQnh26YT
	snyn9hGJ8d7TSc/JUSDPI1sMkR38EGdwMOpATFQK2R12xbt1R23LMMil5ttICn7xucQdZfpUt3c2W
	dm/JQrkicjnYCFAZUvcbFfnx1A6I0Yh4geE3DpPjhBx/fPhO7PFbO0kq7a2OmIwyXdbbTke3gqgwB
	Du0VHsAkTKyoK3ZgH4TNYyjIms+VCVZarfKBL/nBSsw5tFM5lvpnkaqfQhYu14+sWtzovEFpMI64j
	iIP/jF9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuG0u-0000000E3Fb-2oYC;
	Thu, 04 Sep 2025 19:52:56 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuBTe-0000000COy1-0mMp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 15:02:23 +0000
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 77E6818B9;
	Thu,  4 Sep 2025 17:01:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756998064;
	bh=mH9Qa53DW8rPCvOMKW7s4T0USBUdqkx8bGES1nfIJtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cl98NBHPhv8LuCGb6sR/py4+vw3iWwjNP/4f5ksPgnzKCh0fcSyh0rfe9BttjWpEg
	 m0kGsY2utSojhny9N0pv2QghIQw7qIZp6mZIZsme5LJXSPkV/8ImfwDbUgIiR9LQGD
	 IiKP+HjihV1AwWqsl2HinB2tMnMK9Xrt93pDqSdc=
Date: Thu, 4 Sep 2025 17:01:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, rmfrfs@gmail.com,
	martink@posteo.de, kernel@puri.sm, mchehab@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hverkuil@kernel.org,
	nicolas.dufresne@collabora.com, sakari.ailus@linux.intel.com,
	tomi.valkeinen@ideasonboard.com, jonas@kwiboo.se,
	dan.scally+renesas@ideasonboard.com, m.szyprowski@samsung.com,
	mehdi.djait@linux.intel.com, niklas.soderlund+renesas@ragnatech.se
Subject: Re: [PATCH v2 2/3] media: imx-mipi-csis: Store the number of
 data_lanes configured in dt
Message-ID: <20250904150153.GB6174@pendragon.ideasonboard.com>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
 <20250903102243.1563527-3-isaac.scott@ideasonboard.com>
 <aLhfu0KK5NHIGH/W@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLhfu0KK5NHIGH/W@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_080218_651547_A7BE9CDD 
X-CRM114-Status: GOOD (  27.53  )
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

On Wed, Sep 03, 2025 at 11:33:15AM -0400, Frank Li wrote:
> On Wed, Sep 03, 2025 at 11:22:41AM +0100, Isaac Scott wrote:
> > The number of lanes actively used by a MIPI CSI transmitter may differ
> > from that which is defined in device tree. To allow us to be able to set
> > the number of configured lanes without changing the maximum lane count,
> > store the number of lanes configured in device tree, and adjust the
> > debug print to reflect the device tree value.
> >
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 2beb5f43c2c0..fc89325f2f94 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -313,6 +313,8 @@ struct mipi_csis_device {
> >  	u32 hs_settle;
> >  	u32 clk_settle;
> >
> > +	unsigned int max_data_lanes;
> > +
> 
> is num_data_lanes better? you get from vep.bus.mipi_csi2.num_data_lanes

That's a good point, but I think I prefer max_data_lanes here as it
conveys better the fact that the field stores the maximum number of data
lanes that can be used, not the number of data lanes being used at a
given point of time.

This being said, why do we need this ? The maximum number of data lanes
can be accessed through csis->bus.num_data_lanes. I've looked at patch
3/3 to answer this question, it there csis->bus.num_data_lanes is
modified to store the number of data lanes used at runtime. I think it
would be better to consider csis->bus as immutable after probe, and
store the number of used data lanes in csis->num_data_lanes.

Isaac, could you replace this patch by another one that adds
csis->num_data_lanes, sets it to csis->bus.num_data_lanes in
mipi_csis_async_register(), and replace usage of
csis->bus.num_data_lanes with csis->num_data_lanes through the driver ?
Patch 3/3 should then modify csis->num_data_lanes, not
csis->bus.num_data_lanes.

> >  	spinlock_t slock;	/* Protect events */
> >  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
> >  	struct dentry *debugfs_root;
> > @@ -1299,8 +1301,9 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
> >  	}
> >
> >  	csis->bus = vep.bus.mipi_csi2;
> > +	csis->max_data_lanes = vep.bus.mipi_csi2.num_data_lanes;
> >
> > -	dev_dbg(csis->dev, "data lanes: %d\n", csis->bus.num_data_lanes);
> > +	dev_dbg(csis->dev, "data lanes: %d\n", csis->max_data_lanes);
> >  	dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
> >
> >  	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,

-- 
Regards,

Laurent Pinchart

