Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D874C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 08:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXDwnD/b30XvEgElHMMbaRj4A7I5LI8tbLG2ZDxL+yQ=; b=eDfBQzuf6K2tMaNV0VDS+Uw2kj
	pLnOr8eQD11LGFjUvtAhekZ81Y/x3Ut706A2RUV1yKIcqUlHGT22m2wpQz1eUYxJGWrjCXLc2AfSp
	xE2jJ85sTcpBXCT19hqrgPLisLRCcFZd38fu+/68RcnVyWuErLholl+pdXlJlyz5LiU2VwRzAYn1Q
	IHSkgkawhUnxIVEj1VN1LZQ/FGestY6mewE6xgjK5cstWoXJksjcKpjWkK7mlswfjZfVtqPAu2DvD
	6JLo7RnGQKMlidTYJMwtdpWt9Be9lgpBm3jmBekn9uXy6z/Re2YGlS6Ih/MDi82iCH4ZGkg/sWugy
	Rk8CxVNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmSk-0000000B8v0-2WRq;
	Thu, 10 Jul 2025 08:17:02 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlVh-0000000AyiQ-0b92;
	Thu, 10 Jul 2025 07:16:03 +0000
Received: from ideasonboard.com (mob-5-90-141-178.net.vodafone.it [5.90.141.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45227465;
	Thu, 10 Jul 2025 09:15:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752131731;
	bh=y9hF6EZ050Yv7spxWNq7VKXwB2SKwvLGZ5USQEX2/rM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BUpvW6y0Fb2rHiacy8qjEcnsw4yNiL3dYBSo+RJoKrAGhlaWq4jduXJXzq6CNYIS+
	 Lp7Yu5HoJjx04WkfUvZomIainwJT6Hv9K3sRa81jUoSM81Liix6BGU3+sJgrDE1GRr
	 24Vzgxa8h8UPpzyWIq9R2d/zLz8X5gvKe3FUZb4E=
Date: Thu, 10 Jul 2025 09:15:54 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] media: uapi: Introduce V4L2 extensible params
Message-ID: <gemjiujyal7jf6gq7vd5wemriqkz7knxmkoe76fgmhhto6xzqu@zgy4r4ynaoe7>
References: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
 <20250708-extensible-parameters-validation-v1-1-9fc27c9c728c@ideasonboard.com>
 <9b12b035-a80d-4d12-a039-daa94d13280e@ideasonboard.com>
 <yydzeg53koeawjc3vtzwfnq5x6avmv4ep53bcxff6kvzzu36jl@qp37ojw2drug>
 <78006c71-592b-4f54-93ed-5f4b21b5bc33@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78006c71-592b-4f54-93ed-5f4b21b5bc33@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_001601_332609_671E52C8 
X-CRM114-Status: GOOD (  73.10  )
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

Hi Dan

On Wed, Jul 09, 2025 at 02:18:07PM +0100, Dan Scally wrote:
> Hi Jacopo
>
> On 09/07/2025 12:53, Jacopo Mondi wrote:
> > Hi Dan,
> >     thanks for the comments
> >
> > On Wed, Jul 09, 2025 at 12:33:17PM +0100, Dan Scally wrote:
> > > Hi Jacopo - thanks for the patches
> > >
> > > On 08/07/2025 11:40, Jacopo Mondi wrote:
> > > > Introduce v4l2-extensible-params.h in the Linux kernel uAPI.
> > > >
> > > > The header defines two types that all drivers that use the extensible
> > > > parameters format for ISP configuration shall use to build their own
> > > > parameters format.
> > > >
> > > > The newly introduce type v4l2_params_block represent the
> > > > header to be prepend to each ISP configuration block and the
> > > > v4l2_params_buffer type represent the base type for the configuration
> > > > parameters buffer.
> > > >
> > > > The newly introduced header is not meant to be used directly by
> > > > applications which should instead use the platform-specific ones.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > ---
> > > >    MAINTAINERS                                       |   6 ++
> > > >    include/uapi/linux/media/v4l2-extensible-params.h | 106 ++++++++++++++++++++++
> > > >    2 files changed, 112 insertions(+)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 658543062bba3b7e600699d7271ffc89250ba7e5..49a9329e5fe8874bdbaca13946ea28bd80134cb3 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -25968,6 +25968,12 @@ F:	drivers/media/i2c/vd55g1.c
> > > >    F:	drivers/media/i2c/vd56g3.c
> > > >    F:	drivers/media/i2c/vgxy61.c
> > > > +V4L2 EXTENSIBLE PARAMETERS FORMAT
> > > > +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > +L:	linux-media@vger.kernel.org
> > > > +S:	Maintained
> > > > +F:	include/uapi/linux/media/v4l2-extensible-params.h
> > > > +
> > > >    VF610 NAND DRIVER
> > > >    M:	Stefan Agner <stefan@agner.ch>
> > > >    L:	linux-mtd@lists.infradead.org
> > > > diff --git a/include/uapi/linux/media/v4l2-extensible-params.h b/include/uapi/linux/media/v4l2-extensible-params.h
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..ed37da433c6b1a34523b6a9befde5c0dee601cfb
> > > > --- /dev/null
> > > > +++ b/include/uapi/linux/media/v4l2-extensible-params.h
> > > > @@ -0,0 +1,106 @@
> > > > +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR MIT) */
> > > > +/*
> > > > + * Video4Linux2 extensible configuration parameters base types
> > > > + *
> > > > + * Copyright (C) 2025 Ideas On Board Oy
> > > > + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > + */
> > > > +
> > > > +#ifndef _UAPI_V4L2_PARAMS_H_
> > > > +#define _UAPI_V4L2_PARAMS_H_
> > > > +
> > > > +#ifndef _UAPI_V4L2_EXTENSIBLE_PARAMS_GUARD_
> > > > +/*
> > > > + * Note: each ISP driver exposes a different uAPI, where the types layout
> > > > + * match (more or less strictly) the hardware registers layout.
> > > > + *
> > > > + * This file defines the base types on which each ISP driver can implement its
> > > > + * own types that define its uAPI.
> > > > + *
> > > > + * This file is not meant to be included directly by applications which shall
> > > > + * instead only include the ISP-specific implementation.
> > > > + */
> > > > +#error "This file should not be included directly by applications"
> > > > +#endif
> > > > +
> > > > +#include <linux/types.h>
> > > > +
> > > > +/**
> > > > + * struct v4l2_params_block - V4L2 extensible parameters block header
> > > struct v4l2_params_block_header would be nicer I think
> > >
> > That's what I had started with :)
> >
> > I'm debated between a longer but more explicative name, or a shorter
> > one.
>
>
> I vote for longer here but only because I think the phrase "block" applies
> more properly to the likes of struct rkisp1_ext_params_bls_config for
> example.

Thanks, I've seen you made a patch to change this!

>
> >
> > > > + *
> > > > + * This structure represents the common part of all the ISP configuration
> > > > + * blocks. Each parameters block shall embed an instance of this structure type
> > > > + * as its first member, followed by the block-specific configuration data. The
> > > > + * driver inspects this common header to discern the block type and its size and
> > > > + * properly handle the block content by casting it to the correct block-specific
> > > > + * type.
> > > > + *
> > > > + * The @type field is one of the values enumerated by each platform-specific ISP
> > > > + * block types which specifies how the data should be interpreted by the driver.
> > > > + * The @size field specifies the size of the parameters block and is used by the
> > > > + * driver for validation purposes.
> > > > + *
> > > > + * The @flags field is a bitmask of platform-specific control flags.
> > > Since we're including flags in this base struct rather than a platform
> > > specific subclass I think perhaps we should centralise some flags (which I
> > > think is supported by the fact that all three implementations share the same
> > > flags so far). Perhaps we could reserve the bottom 8 bits for common flags
> > > (like ENABLE / DISABLE) and validate them centrally, and leave the top 8 for
> > > platform specific flags. I think we could then drop the platform specific
> > > validation for rkisp1 and c3 and just pass null to the helpers, since they
> > > do the same thing.
> > Yes, that's one of the things I was not sure about... if we should
> > centralize flags definition as well or not...
>
>
> I think probably the ability to have both centralised and platform specific ones would be worthwhile
>
> >
> > Knowing that Mali will use the same flags that the two existing
> > implementations already have is a good indication that we can probably
> > centralize at least the ENABLE/DISABLE ones
>
>
> Yeah
>
> >
> > > > + *
> > > > + * Userspace shall never use this type directly but use the platform specific
> > > > + * one with the associated data types.
> > > Why wouldn't userspace just use these directly? I could see why it might be
> > > difficult for the C3 and Rkisp1 which are merged, but for a new
> > > implementation couldn't they just use these objects without bothering to
> > > define their own?
> > >
> > mmm, my thinking was that each driver implementation shall define
> > their own types because I would expect that they will have to define
> > their own meta image format... For v4l2_params_buffer see below, for
> > the blocks it might be totally possible to use these type most
> > probably..
> >
> > > If we end up using these objects directly I think it would be nice to have
> > > the example code block from the platform specific headers documentation here
> > > too.
> > >
> > > > + *
> > > > + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_block_type`
> > > > + * - Amlogic C3: :c:type:`c3_isp_params_block_type`
> > > > + *
> > > > + * @type: The parameters block type (platform-specific)
> > > > + * @flags: A bitmask of block flags (platform-specific)
> > > > + * @size: Size (in bytes) of the parameters block, including this header
> > > > + */
> > > > +struct v4l2_params_block {
> > > > +	__u16 type;
> > > > +	__u16 flags;
> > > > +	__u32 size;
> > > > +} __attribute__((aligned(8)));
> > > > +
> > > > +/**
> > > > + * struct v4l2_params_buffer - V4L2 extensible parameters configuration
> > > > + *
> > > > + * This struct contains the configuration parameters of the ISP algorithms,
> > > > + * serialized by userspace into a data buffer. Each configuration parameter
> > > > + * block is represented by a block-specific structure which contains a
> > > > + * :c:type:`v4l2_params_block` entry as first member. Userspace populates
> > > > + * the @data buffer with configuration parameters for the blocks that it intends
> > > > + * to configure. As a consequence, the data buffer effective size changes
> > > > + * according to the number of ISP blocks that userspace intends to configure and
> > > > + * is set by userspace in the @data_size field.
> > > > + *
> > > > + * The parameters buffer is versioned by the @version field to allow modifying
> > > > + * and extending its definition. Userspace shall populate the @version field to
> > > > + * inform the driver about the version it intends to use. The driver will parse
> > > > + * and handle the @data buffer according to the data layout specific to the
> > > > + * indicated version and return an error if the desired version is not
> > > > + * supported.
> > > > + *
> > > > + * For each ISP block that userspace wants to configure, a block-specific
> > > > + * structure is appended to the @data buffer, one after the other without gaps
> > > > + * in between nor overlaps. Userspace shall populate the @data_size field with
> > > > + * the effective size, in bytes, of the @data buffer.
> > > > + *
> > > > + * Each ISP driver using the extensible parameters format shall define a
> > > > + * type which is type-convertible to this one, with the difference that the
> > > > + * @data member shall actually a memory buffer of platform-specific size and
> > > > + * not a pointer.
> > > Why not just use this object directly? We could provide a helper in
> > > v4l2-extensible-params.h that calculates the size of the buffer with a given
> > > data array size for the driver's convenience
> > The main reason I thought v4l2_params_buffer cannot be used is because
> > of the flexible-array at the end of the type
> >
> > struct v4l2_params_buffer {
> > 	__u32 version;
> > 	__u32 data_size;
> > 	__u8 data[];
> > };
> >
> > vs
> >
> > struct rkisp1_ext_params_cfg {
> > 	__u32 version;
> > 	__u32 data_size;
> > 	__u8 data[RKISP1_EXT_PARAMS_MAX_SIZE];
> > };
> >
> > I might have missed what you're suggesting here with the helper in
> > v4l2-extensible-params.h :)
>
> So I think a known size is needed to accomodate operations like "memcpy(dst,
> src, sizeof(rkisp1_ext_params_cfg))", but with something like...
>
>
> #define v4l2_params_buffer_size(max_params_size) \
>
>         (offsetof(struct v4l2_params_buffer, data) + max_params_size)
>
>
> then the above operation can be memcpy(dst,
> src, v4l2_params_buffer_size(RKISP1_EXT_PARAMS_MAX_SIZE)) instead

Fine for drivers indeed, my thinking was that we would need to reserve
space for userspace to write configuration blocks in...

However, buffers are allocated by videobuf2 and We could certainly
allocate the appropriate size using the vb2 queue 'buf_struct_size' member...

I can experiment with that indeed, in the meantime I wonder what
maintainers think about this ;)

Thanks
  j

>
>
> Unless I'm missing something that should be enough to drop the driver
> specific struct...it seems to work ok anyway
>
>
> Dan
>
> >
> >
> > >
> > > Thanks
> > >
> > > Dan
> > >
> > > > + *
> > > > + * Userspace shall never use this type directly but use the platform specific
> > > > + * one with the associated data types.
> > > > + *
> > > > + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_cfg`
> > > > + * - Amlogic C3: :c:type:`c3_isp_params_cfg`
> > > > + *
> > > > + * @version: The parameters buffer version (platform-specific)
> > > > + * @data_size: The configuration data effective size, excluding this header
> > > > + * @data: The configuration data
> > > > + */
> > > > +struct v4l2_params_buffer {
> > > > +	__u32 version;
> > > > +	__u32 data_size;
> > > > +	__u8 data[];
> > > > +};
> > > > +
> > > > +#endif /* _UAPI_V4L2_PARAMS_H_ */
> > > >

