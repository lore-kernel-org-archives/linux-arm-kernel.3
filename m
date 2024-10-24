Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC48CE8E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 12:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ortzHB5ZGWllXhL6PwjRGnzN9ka5lOt8LHxudcBkzHI=; b=CUK4xITyLgG9aaO/ObPyYd4myv
	4bVJr3h66QOLLvxwPmsEmMJ2bE/ZoMp4/SRTIDg6l77ERbgtzxmY/zcaVt37gU6t695AzfNlHnHQ8
	JHPNQ7qq1C9+23evbCem/X2jaxtITrCu6d0HU+I3yi0srg3xHBUnT2D44UdhFOTvSTyEeWV/ufN8d
	RSY9XDVoa81MSaYZFFBfJWMIFc8aBrmEYdMa/yRLPcNXUc0QmK+4GehsIz1gTRiIYp/nIRZH/PMRA
	y4CAmHljTf9GEWIw9Sh1ngjKoog+KrnU12ncjXolO4wSJwiVDlYbB2XdUwUFvceJgzHSmn7QCgEzD
	nbBDtdgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wc7-00000000I7F-3hfS;
	Thu, 24 Oct 2024 12:06:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3waZ-00000000HsR-2aMR;
	Thu, 24 Oct 2024 12:05:17 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CACC6353;
	Thu, 24 Oct 2024 14:03:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729771405;
	bh=Y2wiEUdJrkj/gTQbqaSTmIUpHB5u/DfJRkMeoAaWST4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eEkZ7aqZNH1bXN4g4FtnDOlSEZkARZ5KwxSU5QIdusFc6/RzSZBNA/gypzy1RCrvP
	 CIiFeiH08jNVuDHAzzHggkhzCLYjZLKpbBYizpq5YsBXGDLbHdDChyfoV62AA1w4Aq
	 KZ5kvbPHOP7NvOdy/i1hgKd07uI2J3a/Zk2m9Awc=
Date: Thu, 24 Oct 2024 15:05:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v6 3/4] media: raspberrypi: Add support for RP1-CFE
Message-ID: <20241024120507.GA6081@pendragon.ideasonboard.com>
References: <20241003-rp1-cfe-v6-0-d6762edd98a8@ideasonboard.com>
 <20241003-rp1-cfe-v6-3-d6762edd98a8@ideasonboard.com>
 <4d9e340e-2ae7-495b-8623-0d10398e1c3d@xs4all.nl>
 <b185e497-ad40-4fe3-9409-224993ed4924@ideasonboard.com>
 <af1456a3-3de8-4b11-9606-79b260bda47e@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af1456a3-3de8-4b11-9606-79b260bda47e@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_050515_823247_EE4A118D 
X-CRM114-Status: GOOD (  31.72  )
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

On Thu, Oct 24, 2024 at 01:21:43PM +0200, Hans Verkuil wrote:
> On 24/10/2024 13:08, Tomi Valkeinen wrote:
> > On 24/10/2024 11:20, Hans Verkuil wrote:
> >> Hi Tomi,
> >>
> >> I know this driver is already merged, but while checking for drivers that use
> >> q->max_num_buffers I stumbled on this cfe code:
> >>
> >> <snip>
> >>
> >>> +/*
> >>> + * vb2 ops
> >>> + */
> >>> +
> >>> +static int cfe_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
> >>> +               unsigned int *nplanes, unsigned int sizes[],
> >>> +               struct device *alloc_devs[])
> >>> +{
> >>> +    struct cfe_node *node = vb2_get_drv_priv(vq);
> >>> +    struct cfe_device *cfe = node->cfe;
> >>> +    unsigned int size = is_image_node(node) ?
> >>> +                    node->vid_fmt.fmt.pix.sizeimage :
> >>> +                    node->meta_fmt.fmt.meta.buffersize;
> >>> +
> >>> +    cfe_dbg(cfe, "%s: [%s] type:%u\n", __func__, node_desc[node->id].name,
> >>> +        node->buffer_queue.type);
> >>> +
> >>> +    if (vq->max_num_buffers + *nbuffers < 3)
> >>> +        *nbuffers = 3 - vq->max_num_buffers;
> >>
> >> This makes no sense: max_num_buffers is 32, unless explicitly set when vb2_queue_init
> >> is called. So 32 + *nbuffers is never < 3.
> >>
> >> If the idea is that at least 3 buffers should be allocated by REQBUFS, then set
> >> q->min_reqbufs_allocation = 3; before calling vb2_queue_init and vb2 will handle this
> >> for you.
> >>
> >> Drivers shouldn't modify *nbuffers, except in very rare circumstances, especially
> >> since the code is almost always wrong.
> > 
> > Indeed, the code doesn't make sense. I have to say I don't know what
> > was the intent here, but I think "at least 3 buffers should be
> > allocated by REQBUFS" is the likely explanation.
> > 
> > I think the hardware should work with even just a single buffer, so
> > is it then fine to not set either q->min_queued_buffers nor
> > q->min_reqbufs_allocation before calling vb2_queue_init()? This
> > seems to result in REQBUFS giving at least two buffers.
> 
> min_queued_buffers is really HW dependent. If not set, then
> start_streaming can be called even if there are no buffers queued.

Having min_queued_buffers > 1 is bad for userspace, and it's much nicer
to have it set to 0. The main issue with a value of 1 is that validation
of the pipeline ends up being deferred to the first QBUF if it occurs
after STREAMON, and error handling is then complicated.

It's not just a property of the hardware, kernel drivers can decide to
work with scratch buffers if needed. In many cases, a scratch buffer
allocated by the kernel could be very small, either relying on the same
physical page being mapped through the IOMMU to a larger DMA space, or
using a 0 stride value to write all lines to the same location.

For drivers supported by libcamera, we will require min_queued_buffers
<= 1 and may tighten that to == 0. Tomi, if you submit a patch, please
try to target 0, and if that's too much work for now, set it to 1 at
most.

> If your hardware can handle that, then it's fine to not set it.
> 
> >>> +
> >>> +    if (*nplanes) {
> >>> +        if (sizes[0] < size) {
> >>> +            cfe_err(cfe, "sizes[0] %i < size %u\n", sizes[0], size);
> >>> +            return -EINVAL;
> >>> +        }
> >>> +        size = sizes[0];
> >>> +    }
> >>> +
> >>> +    *nplanes = 1;
> >>> +    sizes[0] = size;
> >>> +
> >>> +    return 0;
> >>> +}

-- 
Regards,

Laurent Pinchart

