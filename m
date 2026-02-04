Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1473FE9539B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 13:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBc2rwYRPLu0JbOcwo887nyzO+rPuAKxPa8KqT7h7s4=; b=qRAZO5Nxxh/y03M+7dqtOs/vsr
	dGo7RQ/qViTduCJJk7P+pFy//Vmc7Cf2IBOAPrxAWoNrbD8MZ2rm5BnQQ6ciYxkjcyWQZoSC6jpIh
	zo7OtdjxJfMKS+/NHebnj7USf//La1yzLTP3dE9g283uCp5ibqRQOWOZ5Sx/khVzPB0rCNxEAjgjh
	EJgEkZX2LCqp8L0gpV7xT95YUzf8IJIaNN2wryDJb7m0Z0dwAokAZDRPfuRNVUAsnguuWfmiSNZVt
	Gh+H0RQTv5fZR+jYclxqpM5C7aXlBt8J8Z2QlcwND/PGKSpsQG2UprPeQ+mkdezWZsdQC8fq8jBcN
	ewPmFh1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncig-00000008U8A-2VN8;
	Wed, 04 Feb 2026 13:14:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncie-00000008U7R-0Aur
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 13:14:57 +0000
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F27EE833;
	Wed,  4 Feb 2026 14:14:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770210851;
	bh=Nfoc7+w8xyU2KFGJ2g3NVQQ2nhWSMSasZ+FAcVUen80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SW62mAuNolLJ3881WEkiRfWmRZ7eOwd1Yxnnwtck+8ragCUiX/rLIPtsBJbOrxW9D
	 0fvs2A8APWQEb0vKEsUyIkHZ2lbtjLzm/qWc5TebIwoIBffoMNTSZPSgG5bw4mW7dW
	 fGDjUmRwD8Bu154pgyIyRLk6ILo7WeeW1ryMoA5o=
Date: Wed, 4 Feb 2026 14:14:50 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com, 
	frank.li@nxp.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC v1 01/11] media: uapi: v4l2-isp: Add v4l2 ISP extensible
 statistics definitions
Message-ID: <aYNEtmJwnAtYitHO@zed>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-2-antoine.bouyer@nxp.com>
 <aYIb8ZIZDfCJZEZ9@zed>
 <71b57f1c-be22-46a2-89a2-5abae11e0436@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <71b57f1c-be22-46a2-89a2-5abae11e0436@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_051456_359376_9878A2AC 
X-CRM114-Status: GOOD (  55.79  )
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

Hi Antoine

On Wed, Feb 04, 2026 at 12:07:41PM +0100, Antoine Bouyer wrote:
> Hi Jacopo
>
> On 2/3/26 5:15 PM, Jacopo Mondi wrote:
> >
> >
> > Hi Antoine
> >    thanks a lot for extendable stats
> >
> > On Fri, Jan 23, 2026 at 09:09:28AM +0100, Antoine Bouyer wrote:
> > > Extend the v4l2-isp extensible format introduced for isp parameters buffer
> > > to the statistics buffer as well.
> > >
> > > Like for ISP configuration purpose, that will help supporting various ISP
> > > hardware versions reporting different statistics data with less impact on
> > > userspace.
> > >
> > > The `v4l2_isp_stats_buffer` reuses the `v4l2_isp_params_buffer` container
> > > definitions, with similar header, versions and flags. V0 and V1 versions
> >
> > Why do you need two flags ?
> >
> > Params had to introduce two because we had two drivers already
> > mainlined using the pre-v4l2-isp version of extensible params which
> > had defined their version identifier as 1 and 0 and we didn't want to
> > break existing userspace using those identifiers. So we had to accept
> > both V0 and V1 as "first version of the v4l2-isp extensible parameters
> > format".
> >
> > For stats we don't have users, so I guess we can start with V1 == 0 ?
>
> I wanted to keep it aligned with params, so that any driver/userspace can
> use the same API version value for both params and stats buffers, and limit
> headache.
>
> >
> > > are provided to match with params versions. On the other side, ENABLE and
> > > DISABLE flags are not really meaningfull for statistics purpose. So VALID
> > > and INVALID flags are introduced. Purpose is to force ISP driver to
> > > validate a statistics buffer, before it is consumed by userspace.
> >
> > Interesting. What do you mean with "validate a statistics buffer" ?
> > And if a driver has to do validation, why would it send upstream a
> > non-validated buffer ?
>
> Like for version, I wanted to keep same header structure, including flags.
> Since ENABLE/DISABLE is not relevant for statistics, I thought about using a
> "validation" flag, to force driver confirming statistics blocks are valid or
> not.

See the question on the documentation patches.

>
> If you feel it is useless, I'm fine with removing it. Should I keep a flag
> field anyway to stay aligned with params then ?
>

RkISP1 has support for both "legacy" and "extensible" formats because
it has been mainline for a long time with the legacy format only. We
couldn't simply replace the existing format with the new one because
we would break existing users.

All the other drivers that have been upstreamed with extensible only
(Amlogic C3 and Mali C55) do not expose a legacy format as there was
not prior version in mainline on which userspace might depend on.

Unless you have very convincing reason, I would certainly drop the
legacy format and only use extensible.

Thanks
  j

> >
> > >
> > > Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> > > ---
> > >   include/uapi/linux/media/v4l2-isp.h | 85 +++++++++++++++++++++++++++++
> > >   1 file changed, 85 insertions(+)
> > >
> > > diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
> > > index 779168f9058e..ed1279b86694 100644
> > > --- a/include/uapi/linux/media/v4l2-isp.h
> > > +++ b/include/uapi/linux/media/v4l2-isp.h
> > > @@ -99,4 +99,89 @@ struct v4l2_isp_params_buffer {
> > >        __u8 data[] __counted_by(data_size);
> > >   };
> > >
> > > +/**
> > > + * enum v4l2_isp_stats_version - V4L2 ISP statistics versioning
> > > + *
> > > + * @V4L2_ISP_STATS_VERSION_V0: First version of the V4L2 ISP statistics format
> > > + *                          (for compatibility)
> > > + * @V4L2_ISP_STATS_VERSION_V1: First version of the V4L2 ISP statistics format
> > > + *
> > > + * V0 and V1 are identical, and comply with V4l2 ISP parameters versions. So
> > > + * both V0 and V1 refers to the first version of the V4L2 ISP statistics
> > > + * format.
> > > + *
> > > + * Future revisions of the V4L2 ISP statistics format should start from the
> > > + * value of 2.
> > > + */
> > > +enum v4l2_isp_stats_version {
> > > +     V4L2_ISP_STATS_VERSION_V0 = 0,
> > > +     V4L2_ISP_STATS_VERSION_V1,
> >
> > As suggested I would make V1 == 0
> >
> > > +};
> > > +
> > > +#define V4L2_ISP_PARAMS_FL_BLOCK_VALID               (1U << 0)
> > > +#define V4L2_ISP_PARAMS_FL_BLOCK_INVALID     (1U << 1)
> > > +
> > > +/*
> > > + * Reserve the first 8 bits for V4L2_ISP_STATS_FL_* flag.
> > > + *
> > > + * Driver-specific flags should be defined as:
> > > + * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(0))
> > > + * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(1))
> > > + */
> > > +#define V4L2_ISP_STATS_FL_DRIVER_FLAGS(n)       ((n) + 8)
> >
> > Currently we have no users of V4L2_ISP_PARAMS_FL_DRIVER_FLAGS so we
> > could even consider making it a V4L2_ISP_FL_DRIVER_FLAGS
> >
> > Or do you think it is worth creating a new symbol ?
>
> To limit impact on potential on-going development, and future conflict,
> creating new symbol may be safer IMO. But I'm fine with using a single
> symbol if you prefer. Most probably this flag customization is not used yet
> by any driver.
>
> >
> > > +
> > > +/**
> > > + * struct v4l2_isp_stats_block_header - V4L2 extensible statistics block header
> > > + * @type: The statistics block type (driver-specific)
> > > + * @flags: A bitmask of block flags (driver-specific)
> > > + * @size: Size (in bytes) of the statistics block, including this header
> > > + *
> > > + * This structure represents the common part of all the ISP statistics blocks.
> > > + * Each statistics block shall embed an instance of this structure type as its
> > > + * first member, followed by the block-specific statistics data.
> > > + *
> > > + * The @type field is an ISP driver-specific value that identifies the block
> > > + * type. The @size field specifies the size of the parameters block.
> > > + *
> > > + * The @flags field is a bitmask of per-block flags V4L2_STATS_ISP_FL_* and
> > > + * driver-specific flags specified by the driver header.
> > > + */
> > > +struct v4l2_isp_stats_block_header {
> > > +     __u16 type;
> > > +     __u16 flags;
> > > +     __u32 size;
> > > +} __attribute__((aligned(8)));
> > > +
> >
> > This is currently identical to v4l2_isp_params_block_header.
> >
> > Can we create a single header for both stats and params and provide a
> >
> > #define v4l2_isp_params_block_header v4l2_isp_block_header
> >
> > for maintaining compatibility with existing users ?
> >
> > Or do you expect stats and params to eventually need different headers ?
> >
>
> Current approach is to use same structure definitions as for params. So I'm
> fine with creating a single header as suggested, and provide symbols to keep
> compatibility.
>
> > > +/**
> > > + * struct v4l2_isp_stats_buffer - V4L2 extensible statistics data
> > > + * @version: The statistics buffer version (driver-specific)
> > > + * @data_size: The statistics data effective size, excluding this header
> > > + * @data: The statistics data
> > > + *
> > > + * This structure contains the statistics information of the ISP hardware,
> > > + * serialized for userspace into a data buffer. Each statistics block is
> > > + * represented by a block-specific structure which contains a
> > > + * :c:type:`v4l2_isp_stats_block_header` entry as first member. Driver
> > > + * populates the @data buffer with statistics information of the ISP blocks it
> > > + * intends to share to userspace. As a consequence, the data buffer effective
> > > + * size changes according to the number of ISP blocks that driver intends to
> > > + * provide and is set by the driver in the @data_size field.
> > > + *
> > > + * The statistics buffer is versioned by the @version field to allow modifying
> > > + * and extending its definition. Driver shall populate the @version field to
> > > + * inform the userpsace about the version it intends to use. The userspace will
> > > + * parse and handle the @data buffer according to the data layout specific to
> > > + * the indicated version.
> > > + *
> > > + * For each ISP block that driver wants to report, a block-specific structure
> > > + * is appended to the @data buffer, one after the other without gaps in
> > > + * between. Driver shall populate the @data_size field with the effective
> > > + * size, in bytes, of the @data buffer.
> > > + */
> > > +struct v4l2_isp_stats_buffer {
> > > +     __u32 version;
> > > +     __u32 data_size;
> > > +     __u8 data[] __counted_by(data_size);
> > > +};
> > > +
> >
> > Same question. Should we introduce a struct v4l2_isp_buffer ?
>
> Yes, sounds reasonable.
>
> BR
> Antoine
>
> >
> > Thanks!
> >
> > >   #endif /* _UAPI_V4L2_ISP_H_ */
> > > --
> > > 2.52.0
> > >
> > >
>

