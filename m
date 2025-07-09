Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD78C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 14:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8YdkbndrCFA+hG9JsiiMTccsLn2s8swhY7uludKpLw=; b=xeTcLYgv/G/fOQd4CyPEvKgrS8
	ES0L726M/DUBfQR6syBw16ahtaNrpvrktEtY1W4Og9R8SvBc5vd23SL7vu4Pe+6JKYpSYxHL/PliE
	07nv0QlMr4fGCNDObwgsnxK8JaACpIP/l/801R57qYAVbio0WIVhsAw7v5BCab1mRkz5LukAUJIJw
	fCX5Q6/Zas6oerFMnrkqVj4Fga1Ncn0/j9K94vW1Y+RsOU3WS0PX8+IR7NOcSRhtSUeP/Rfb2X3Kf
	cvB6y/R4X6T9YxdUxPH9WzpMNuai6DDD+kp3xuIlYDfgazvvqUM60LEQqA7Z65tG2UhC+24irb+v1
	bJGZOAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZW4p-000000092H3-1DtY;
	Wed, 09 Jul 2025 14:47:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTN0-00000008YKK-2grI;
	Wed, 09 Jul 2025 11:53:52 +0000
Received: from ideasonboard.com (mob-5-90-141-178.net.vodafone.it [5.90.141.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E59D0669;
	Wed,  9 Jul 2025 13:53:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752061999;
	bh=DoyjVHx3V4D/LlpaXO0wCC/NZ6ww2nexB0QU8JuI/VE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKNvO5DUSSpDSn3S8IrpERtXLHDldnLJTZ8rS7YRJXPCWEPoOFAh9RF7N8BF2lCoO
	 bYq7uBk6e3/oaNtJ+vtFb24Uh3TBH+Gshc8LWganCmmc4Pd28WRb5ynM2T0sXqIAja
	 c5OtLoiZbqsEbkTw3kLB7QvoqC3KnIU4DUjU7PDE=
Date: Wed, 9 Jul 2025 13:53:39 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] media: uapi: Introduce V4L2 extensible params
Message-ID: <yydzeg53koeawjc3vtzwfnq5x6avmv4ep53bcxff6kvzzu36jl@qp37ojw2drug>
References: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
 <20250708-extensible-parameters-validation-v1-1-9fc27c9c728c@ideasonboard.com>
 <9b12b035-a80d-4d12-a039-daa94d13280e@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9b12b035-a80d-4d12-a039-daa94d13280e@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_045350_867771_B79AB266 
X-CRM114-Status: GOOD (  60.61  )
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

Hi Dan,
   thanks for the comments

On Wed, Jul 09, 2025 at 12:33:17PM +0100, Dan Scally wrote:
> Hi Jacopo - thanks for the patches
>
> On 08/07/2025 11:40, Jacopo Mondi wrote:
> > Introduce v4l2-extensible-params.h in the Linux kernel uAPI.
> >
> > The header defines two types that all drivers that use the extensible
> > parameters format for ISP configuration shall use to build their own
> > parameters format.
> >
> > The newly introduce type v4l2_params_block represent the
> > header to be prepend to each ISP configuration block and the
> > v4l2_params_buffer type represent the base type for the configuration
> > parameters buffer.
> >
> > The newly introduced header is not meant to be used directly by
> > applications which should instead use the platform-specific ones.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >   MAINTAINERS                                       |   6 ++
> >   include/uapi/linux/media/v4l2-extensible-params.h | 106 ++++++++++++++++++++++
> >   2 files changed, 112 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 658543062bba3b7e600699d7271ffc89250ba7e5..49a9329e5fe8874bdbaca13946ea28bd80134cb3 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25968,6 +25968,12 @@ F:	drivers/media/i2c/vd55g1.c
> >   F:	drivers/media/i2c/vd56g3.c
> >   F:	drivers/media/i2c/vgxy61.c
> > +V4L2 EXTENSIBLE PARAMETERS FORMAT
> > +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +F:	include/uapi/linux/media/v4l2-extensible-params.h
> > +
> >   VF610 NAND DRIVER
> >   M:	Stefan Agner <stefan@agner.ch>
> >   L:	linux-mtd@lists.infradead.org
> > diff --git a/include/uapi/linux/media/v4l2-extensible-params.h b/include/uapi/linux/media/v4l2-extensible-params.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..ed37da433c6b1a34523b6a9befde5c0dee601cfb
> > --- /dev/null
> > +++ b/include/uapi/linux/media/v4l2-extensible-params.h
> > @@ -0,0 +1,106 @@
> > +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR MIT) */
> > +/*
> > + * Video4Linux2 extensible configuration parameters base types
> > + *
> > + * Copyright (C) 2025 Ideas On Board Oy
> > + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > + */
> > +
> > +#ifndef _UAPI_V4L2_PARAMS_H_
> > +#define _UAPI_V4L2_PARAMS_H_
> > +
> > +#ifndef _UAPI_V4L2_EXTENSIBLE_PARAMS_GUARD_
> > +/*
> > + * Note: each ISP driver exposes a different uAPI, where the types layout
> > + * match (more or less strictly) the hardware registers layout.
> > + *
> > + * This file defines the base types on which each ISP driver can implement its
> > + * own types that define its uAPI.
> > + *
> > + * This file is not meant to be included directly by applications which shall
> > + * instead only include the ISP-specific implementation.
> > + */
> > +#error "This file should not be included directly by applications"
> > +#endif
> > +
> > +#include <linux/types.h>
> > +
> > +/**
> > + * struct v4l2_params_block - V4L2 extensible parameters block header
>
> struct v4l2_params_block_header would be nicer I think
>

That's what I had started with :)

I'm debated between a longer but more explicative name, or a shorter
one.

> > + *
> > + * This structure represents the common part of all the ISP configuration
> > + * blocks. Each parameters block shall embed an instance of this structure type
> > + * as its first member, followed by the block-specific configuration data. The
> > + * driver inspects this common header to discern the block type and its size and
> > + * properly handle the block content by casting it to the correct block-specific
> > + * type.
> > + *
> > + * The @type field is one of the values enumerated by each platform-specific ISP
> > + * block types which specifies how the data should be interpreted by the driver.
> > + * The @size field specifies the size of the parameters block and is used by the
> > + * driver for validation purposes.
> > + *
> > + * The @flags field is a bitmask of platform-specific control flags.
> Since we're including flags in this base struct rather than a platform
> specific subclass I think perhaps we should centralise some flags (which I
> think is supported by the fact that all three implementations share the same
> flags so far). Perhaps we could reserve the bottom 8 bits for common flags
> (like ENABLE / DISABLE) and validate them centrally, and leave the top 8 for
> platform specific flags. I think we could then drop the platform specific
> validation for rkisp1 and c3 and just pass null to the helpers, since they
> do the same thing.

Yes, that's one of the things I was not sure about... if we should
centralize flags definition as well or not...

Knowing that Mali will use the same flags that the two existing
implementations already have is a good indication that we can probably
centralize at least the ENABLE/DISABLE ones

> > + *
> > + * Userspace shall never use this type directly but use the platform specific
> > + * one with the associated data types.
>
> Why wouldn't userspace just use these directly? I could see why it might be
> difficult for the C3 and Rkisp1 which are merged, but for a new
> implementation couldn't they just use these objects without bothering to
> define their own?
>

mmm, my thinking was that each driver implementation shall define
their own types because I would expect that they will have to define
their own meta image format... For v4l2_params_buffer see below, for
the blocks it might be totally possible to use these type most
probably..

>
> If we end up using these objects directly I think it would be nice to have
> the example code block from the platform specific headers documentation here
> too.
>
> > + *
> > + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_block_type`
> > + * - Amlogic C3: :c:type:`c3_isp_params_block_type`
> > + *
> > + * @type: The parameters block type (platform-specific)
> > + * @flags: A bitmask of block flags (platform-specific)
> > + * @size: Size (in bytes) of the parameters block, including this header
> > + */
> > +struct v4l2_params_block {
> > +	__u16 type;
> > +	__u16 flags;
> > +	__u32 size;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct v4l2_params_buffer - V4L2 extensible parameters configuration
> > + *
> > + * This struct contains the configuration parameters of the ISP algorithms,
> > + * serialized by userspace into a data buffer. Each configuration parameter
> > + * block is represented by a block-specific structure which contains a
> > + * :c:type:`v4l2_params_block` entry as first member. Userspace populates
> > + * the @data buffer with configuration parameters for the blocks that it intends
> > + * to configure. As a consequence, the data buffer effective size changes
> > + * according to the number of ISP blocks that userspace intends to configure and
> > + * is set by userspace in the @data_size field.
> > + *
> > + * The parameters buffer is versioned by the @version field to allow modifying
> > + * and extending its definition. Userspace shall populate the @version field to
> > + * inform the driver about the version it intends to use. The driver will parse
> > + * and handle the @data buffer according to the data layout specific to the
> > + * indicated version and return an error if the desired version is not
> > + * supported.
> > + *
> > + * For each ISP block that userspace wants to configure, a block-specific
> > + * structure is appended to the @data buffer, one after the other without gaps
> > + * in between nor overlaps. Userspace shall populate the @data_size field with
> > + * the effective size, in bytes, of the @data buffer.
> > + *
> > + * Each ISP driver using the extensible parameters format shall define a
> > + * type which is type-convertible to this one, with the difference that the
> > + * @data member shall actually a memory buffer of platform-specific size and
> > + * not a pointer.
>
> Why not just use this object directly? We could provide a helper in
> v4l2-extensible-params.h that calculates the size of the buffer with a given
> data array size for the driver's convenience

The main reason I thought v4l2_params_buffer cannot be used is because
of the flexible-array at the end of the type

struct v4l2_params_buffer {
	__u32 version;
	__u32 data_size;
	__u8 data[];
};

vs

struct rkisp1_ext_params_cfg {
	__u32 version;
	__u32 data_size;
	__u8 data[RKISP1_EXT_PARAMS_MAX_SIZE];
};

I might have missed what you're suggesting here with the helper in
v4l2-extensible-params.h :)


>
>
> Thanks
>
> Dan
>
> > + *
> > + * Userspace shall never use this type directly but use the platform specific
> > + * one with the associated data types.
> > + *
> > + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_cfg`
> > + * - Amlogic C3: :c:type:`c3_isp_params_cfg`
> > + *
> > + * @version: The parameters buffer version (platform-specific)
> > + * @data_size: The configuration data effective size, excluding this header
> > + * @data: The configuration data
> > + */
> > +struct v4l2_params_buffer {
> > +	__u32 version;
> > +	__u32 data_size;
> > +	__u8 data[];
> > +};
> > +
> > +#endif /* _UAPI_V4L2_PARAMS_H_ */
> >

