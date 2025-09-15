Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2830CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMV8CvHK9SXzg+YmUkszr6MZd3d4cHP+WkwExfNZAf8=; b=K+nll/5g2TkJWuApL0LZXGaZi+
	SaZ/wJksjMMZ+6xQjMcnFPG30C1+rIhpXhLnpxeu7W13bS6qiuN7te0O08WWTtu9ZPfxqDVTAH3FH
	vhrtseO2zOHPjU3DzAZtVgimMamc4xIqsaRY9f8Jw4RDPQd36XvkGlirP8Q/DDyYmIgyMx6NO7lLs
	7uw4P9OCPN28h9LVMd3/X2wivwXMJgQbroaQkCff3jXjZBVexZ2LiD+QTHeST0rLlqmGWxRFCMfn2
	65to/jActvpDT8wfZMqQlJaTLLUV+3ADVRPLKmhEU3oDdibApfMmiPNGOyF/7u+6WcFZf+YpknGAL
	Nas5tETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5SK-00000003SjY-3AMO;
	Mon, 15 Sep 2025 09:25:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5SI-00000003ShM-2yjg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:25:04 +0000
Received: from thinkpad.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB5E722CF;
	Mon, 15 Sep 2025 11:23:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757928222;
	bh=q5RA/RaHr9bqdc2QYzU95opigf2/icTVMiyCVrzT/HA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=O/6DYqcm91ykCd6LEz2Gfd0XuyJBeV7P5y7EtdQ53V7GebfEUjnQLhOqE/FQ2IJOd
	 4MBpJiKNNv8CsjH/l7DSPGDLvS8gxrR/oQRTL7bF3gxGlLSr/W+4pbXd/Pnm6QA7Dl
	 LSHqzy9ctbj3FvaWP0k8LlKVOye27UqT19OpSESM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250904150153.GB6174@pendragon.ideasonboard.com>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com> <20250903102243.1563527-3-isaac.scott@ideasonboard.com> <aLhfu0KK5NHIGH/W@lizhi-Precision-Tower-5810> <20250904150153.GB6174@pendragon.ideasonboard.com>
Subject: Re: [PATCH v2 2/3] media: imx-mipi-csis: Store the number of data_lanes configured in dt
From: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hverkuil@kernel.org, nicolas.dufresne@collabora.com, sakari.ailus@linux.intel.com, tomi.valkeinen@ideasonboard.com, jonas@kwiboo.se, dan.scally+renesas@ideasonboard.com, m.szyprowski@samsung.com, mehdi.djait@linux.intel.com, niklas.soderlund+renesas@ragnatech.se
To: Frank Li <Frank.li@nxp.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Mon, 15 Sep 2025 10:24:56 +0100
Message-ID: <175792829662.11401.2553264927858948770@isaac-ThinkPad-T16-Gen-2>
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_022502_907899_778679DC 
X-CRM114-Status: GOOD (  33.02  )
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

Hi all,

Thank you very much for the reviews!

Quoting Laurent Pinchart (2025-09-04 16:01:53)
> On Wed, Sep 03, 2025 at 11:33:15AM -0400, Frank Li wrote:
> > On Wed, Sep 03, 2025 at 11:22:41AM +0100, Isaac Scott wrote:
> > > The number of lanes actively used by a MIPI CSI transmitter may differ
> > > from that which is defined in device tree. To allow us to be able to =
set
> > > the number of configured lanes without changing the maximum lane coun=
t,
> > > store the number of lanes configured in device tree, and adjust the
> > > debug print to reflect the device tree value.
> > >
> > > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > > ---
> > >  drivers/media/platform/nxp/imx-mipi-csis.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/med=
ia/platform/nxp/imx-mipi-csis.c
> > > index 2beb5f43c2c0..fc89325f2f94 100644
> > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > @@ -313,6 +313,8 @@ struct mipi_csis_device {
> > >     u32 hs_settle;
> > >     u32 clk_settle;
> > >
> > > +   unsigned int max_data_lanes;
> > > +
> >=20
> > is num_data_lanes better? you get from vep.bus.mipi_csi2.num_data_lanes
>=20
> That's a good point, but I think I prefer max_data_lanes here as it
> conveys better the fact that the field stores the maximum number of data
> lanes that can be used, not the number of data lanes being used at a
> given point of time.
>=20
> This being said, why do we need this ? The maximum number of data lanes
> can be accessed through csis->bus.num_data_lanes. I've looked at patch
> 3/3 to answer this question, it there csis->bus.num_data_lanes is
> modified to store the number of data lanes used at runtime. I think it
> would be better to consider csis->bus as immutable after probe, and
> store the number of used data lanes in csis->num_data_lanes.

Yes, this makes a lot of sense. I only used max_data_lanes because I
wanted to avoid potential confusion between csis->bus.num_data_lanes and
csis->num_data_lanes; if that's not acutally an issue, I'll change it to
num_data_lanes.

>=20
> Isaac, could you replace this patch by another one that adds
> csis->num_data_lanes, sets it to csis->bus.num_data_lanes in
> mipi_csis_async_register(), and replace usage of
> csis->bus.num_data_lanes with csis->num_data_lanes through the driver ?
> Patch 3/3 should then modify csis->num_data_lanes, not
> csis->bus.num_data_lanes.
>=20

Good idea! Thanks, I'll take a look at submitting a v3.

Best wishes,

Isaac

> > >     spinlock_t slock;       /* Protect events */
> > >     struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
> > >     struct dentry *debugfs_root;
> > > @@ -1299,8 +1301,9 @@ static int mipi_csis_async_register(struct mipi=
_csis_device *csis)
> > >     }
> > >
> > >     csis->bus =3D vep.bus.mipi_csi2;
> > > +   csis->max_data_lanes =3D vep.bus.mipi_csi2.num_data_lanes;
> > >
> > > -   dev_dbg(csis->dev, "data lanes: %d\n", csis->bus.num_data_lanes);
> > > +   dev_dbg(csis->dev, "data lanes: %d\n", csis->max_data_lanes);
> > >     dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
> > >
> > >     asd =3D v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

