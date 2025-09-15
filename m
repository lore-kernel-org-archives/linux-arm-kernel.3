Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47152CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOHEiPYXvUr6gKTsQoEHdgEipFp7/iuUHD/gTijLfpE=; b=2az51/Ktev4zSDi6aXtzApq4DK
	A8SGznlu8MI4BBPVrcIBwEMENZHEgTW0YHEDL2U4zTkwEeQwAVlIr4z6hocZsH+bT3uHCyY0IVwJW
	oj5153q8JvddxdqDN2AqgOfsEABt5SgVZxqBHkUTzv81sKL1mnRvMlYNwjBpRsUV44C6X5I0p37TM
	9wmlwtTkwF80kONb23zSdpd3VOjlK4XgdNwAFCVrLRld9krYG0PfOpXuR045soAjjwJ0LYcyIOpQ6
	kzmgZJopBXfwqerBejRP0GRqLVgTNcZM73ll5xd/G+SpIyAJ4bDpLDT24IB2qqtlEqczH81WHcEKB
	UHyTt+gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4cV-00000003Dad-0pKt;
	Mon, 15 Sep 2025 08:31:31 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4cQ-00000003DV4-0cfL;
	Mon, 15 Sep 2025 08:31:29 +0000
Received: from ideasonboard.com (mob-5-90-56-182.net.vodafone.it [5.90.56.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F159E19E5;
	Mon, 15 Sep 2025 10:30:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757925002;
	bh=cBpTVNqPicaQ2318y2FR5BI1VBvytrRzeoBNsCGZJeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n6ubdRhqEemjt7wZ/oCRovFq5wMyGe4T0jMUMJz1O4H8XzVXw3+C0ZiN6ZGfe2KMN
	 8Q4OykSLzs2IoB5vo0lnFbMLSXtWgk2kYVE3NwN/LorCeC3IVY5KgnP2Swh763j3Gg
	 sypj+7v6b6+9Mt+3TyX0nej8R+pI/jfQ/i6WlLY8=
Date: Mon, 15 Sep 2025 10:31:14 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Keke Li <keke.li@amlogic.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Dan Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/8] media: uapi: Introduce V4L2 extensible params
Message-ID: <pmvm3rzynu6s6zaayg3gnjkdphcobuhwb6jwk3hpwpvkvl6e7a@l2ixrpgvatdx>
References: <20250820-extensible-parameters-validation-v4-0-30fe5a99cb1f@ideasonboard.com>
 <20250820-extensible-parameters-validation-v4-1-30fe5a99cb1f@ideasonboard.com>
 <20250908073534.GD4105@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250908073534.GD4105@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_013126_368060_C1ED651A 
X-CRM114-Status: GOOD (  61.75  )
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

Hi Laurent

On Mon, Sep 08, 2025 at 09:35:34AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Wed, Aug 20, 2025 at 02:58:09PM +0200, Jacopo Mondi wrote:
> > Introduce v4l2-extensible-params.h in the Linux kernel uAPI.
>
> I expect more ISP-related helpers, such as extensible statistics
> formats, and more. How about already moving this to v4l2-isp.h ?
>
> > The header defines two types that all drivers that use the extensible
> > parameters format for ISP configuration shall use to build their own
> > format versions.
> >
> > The newly introduce type v4l2_params_block represent the
>
> "The v4l2_params_block structure represents the"
>
> except the structure name is v4l2_params_block_header.
>
> > header to be prepend to each ISP configuration block and the
> > v4l2_params_buffer type represent the base type for the configuration
> > parameters buffer.
> >
> > The v4l2_params_buffer represents the container for the ISP
> > configuration data block. The generic type is defined with a 0-sized
> > data block that specific ISP implementation shall properly size
> > according to their capabilities.
> >
> > [Add v4l2_params_buffer_size()]
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  MAINTAINERS                                       |   6 +
> >  include/uapi/linux/media/v4l2-extensible-params.h | 146 ++++++++++++++++++++++
> >  2 files changed, 152 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index fe168477caa45799dfe07de2f54de6d6a1ce0615..67216d1e92d7ac81617bb3c4329e4096aa205706 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -26380,6 +26380,12 @@ F:	drivers/media/i2c/vd55g1.c
> >  F:	drivers/media/i2c/vd56g3.c
> >  F:	drivers/media/i2c/vgxy61.c
> >
> > +V4L2 EXTENSIBLE PARAMETERS FORMAT
> > +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +F:	include/uapi/linux/media/v4l2-extensible-params.h
> > +
> >  VF610 NAND DRIVER
> >  M:	Stefan Agner <stefan@agner.ch>
> >  L:	linux-mtd@lists.infradead.org
> > diff --git a/include/uapi/linux/media/v4l2-extensible-params.h b/include/uapi/linux/media/v4l2-extensible-params.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..aca643f505f2705eeca7337f0dd182bcfd1ea60d
> > --- /dev/null
> > +++ b/include/uapi/linux/media/v4l2-extensible-params.h
> > @@ -0,0 +1,146 @@
> > +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR MIT) */
>
> Why the MIT license ? And why GPL-2.0+ instead of GPL-2.0 ?
>

Blindly copied from the rkisp1 header. I'll use GPL-2.0

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
> > +#include <linux/stddef.h>
> > +#include <linux/types.h>
> > +
> > +#define V4L2_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
> > +#define V4L2_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
> > +
> > +/*
> > + * Reserve the first 8 bits for V4L2_PARAMS_FL_* flag.
> > + *
> > + * Platform-specific flags should be defined as:
> > + * #define PLATFORM_SPECIFIC_FLAG0     ((1U << V4L2_PARAMS_FL_PLATFORM_FLAGS(0))
> > + * #define PLATFORM_SPECIFIC_FLAG1     ((1U << V4L2_PARAMS_FL_PLATFORM_FLAGS(1))
> > + */
> > +#define V4L2_PARAMS_FL_PLATFORM_FLAGS(n)       ((n) + 8)
>
> s/PLATFORM/DRIVER/
>
> > +
> > +/**
> > + * struct v4l2_params_block_header - V4L2 extensible parameters block header
> > + *
> > + * This structure represents the common part of all the ISP configuration
> > + * blocks. Each parameters block shall embed an instance of this structure type
> > + * as its first member, followed by the block-specific configuration data. The
> > + * driver inspects this common header to discern the block type and its size and
> > + * properly handle the block content by casting it to the correct block-specific
> > + * type.
>
> The last sentence is not relevant for the userspace API.
>
> > + *
> > + * The @type field is one of the values enumerated by each platform-specific ISP
> > + * block types which specifies how the data should be interpreted by the driver.
> > + * The @size field specifies the size of the parameters block and is used by the
> > + * driver for validation purposes.
>
>  * The @type field is an ISP driver-specific value that identifies the block type.
>  * The @size field specifies the size of the parameters block.
>
> but that seems to duplicate the documentation of the fields below. I'd
> move the field documentation up, and then only add additional paragraphs
> when they contain extra information.
>
> > + *
> > + * The @flags field is a bitmask of per-block flags V4L2_PARAMS_FL_* and
> > + * platform-specific flags specified by the platform-specific header.
>
> It's not platform-specific but ISP driver-specific (or you could just
> write driver-specific).
>
> > + *
> > + * Documentation of the platform-specific flags handling is specified by the
> > + * platform-specific block header type:
> > + *
> > + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_block_type`
> > + * - Amlogic C3: :c:type:`c3_isp_params_block_type`
>
> I wouldn't mention specific platforms here, that won't really scale.
>
> > + *
> > + * Userspace is responsible for correctly populating the parameters block header
> > + * fields (@type, @flags and @size) and the block-specific parameters.
>
> This is the kind of information I think I would expect in
> Documentation/userspace-api/media/v4l/extensible-parameters.rst more
> than here. We usually keep documentation minimal in header files for the
> userspace API, and document the behaviour in .rst files. This being
> said, if you think having more documentation in the headers is better,
> that could work too.
>

No worries, I wasn't sure how much documentation is the right amount
of documentation. I'm fine reducing it.

> > + *
> > + * @type: The parameters block type (platform-specific)
> > + * @flags: A bitmask of block flags (platform-specific)
> > + * @size: Size (in bytes) of the parameters block, including this header
> > + */
> > +struct v4l2_params_block_header {
> > +	__u16 type;
> > +	__u16 flags;
> > +	__u32 size;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * v4l2_params_buffer_size - Calculate size of v4l2_params_buffer for a platform
> > + *
> > + * Users of the v4l2 extensible parameters will have differing sized data arrays
> > + * depending on their specific parameter buffers. Drivers and userspace will
> > + * need to be able to calculate the appropriate size of the struct to
> > + * accommodate all ISP configuration blocks provided by the platform.
> > + * This macro provides a convenient tool for the calculation.
> > + *
> > + * Each driver shall provide a definition of their extensible parameters
> > + * implementation data buffer size. As an example:
> > + *
> > + * #define PLATFORM_BLOCKS_MAX_SIZE		\
> > + *	sizeof(platform_block_0)	+	\
> > + *	sizeof(platform_block_1)
> > + *
> > + * #define PLATFORM_BUFFER_SIZE			\
> > + *	v4l2_params_buffer_size(PLATFORM_BLOCKS_MAX_SIZE)
> > + *
> > + * Drivers are then responsible for allocating buffers of the proper size
> > + * by assigning PLATFORM_BUFFER_SIZE to the per-plane size of the videobuf2
> > + * .queue_setup() operation and userspace shall use PLATFORM_BUFFER_SIZE
> > + * when populating the ISP configuration data buffer.
>
> Most if not all of this also seems to be information for drivers, not
> for userspace. I doesn't belong in the UAPI documentation.
>
> > + *
> > + * @max_params_size: The total size of the ISP configuration blocks
> > + */
> > +#define v4l2_params_buffer_size(max_params_size) \
> > +	(offsetof(struct v4l2_params_buffer, data) + (max_params_size))
> > +
> > +/**
> > + * struct v4l2_params_buffer - V4L2 extensible parameters configuration
> > + *
> > + * This struct contains the configuration parameters of the ISP algorithms,
> > + * serialized by userspace into a data buffer. Each configuration parameter
> > + * block is represented by a block-specific structure which contains a
> > + * :c:type:`v4l2_params_block_header` entry as first member. Userspace populates
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
>
> How does userspace know which versions are supported ?
>

Good question. There are no negotiation/discoverability uAPI at the
moment.

> > + *
> > + * For each ISP block that userspace wants to configure, a block-specific
> > + * structure is appended to the @data buffer, one after the other without gaps
> > + * in between nor overlaps. Userspace shall populate the @data_size field with
> > + * the effective size, in bytes, of the @data buffer.
> > + *
> > + * Drivers shall take care of properly sizing of the extensible parameters
> > + * buffer @data array. The v4l2_params_buffer type is defined with a
> > + * flexible-array-member at the end, which resolves to a size of 0 bytes when
> > + * inspected with sizeof(struct v4l2_params_buffer). This of course is not
> > + * suitable for neither buffer allocation in the kernel driver nor for proper
> > + * handling in userspace of the @data buffer it has to populate.
> > + *
> > + * Drivers using this type in their userspace API definition are responsible
> > + * for providing the exact definition of the @data buffer size using the
> > + * v4l2_params_buffer_size() macro. The size shall be used
> > + * by the driver for buffers allocation and by userspace for populating the
> > + * @data buffer before queueing it to the driver
>
> Most of those two paragraphs are driver documentation too.
>
> > + *
> > + * Drivers that were already using extensible-parameters before the introduction
> > + * of this file define their own type-convertible implementation of this
> > + * type, see:
> > + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_cfg`
> > + * - Amlogic C3: :c:type:`c3_isp_params_cfg`
>
> Drop this too.
>

Ack.

Thanks
   j

> > + *
> > + * @version: The parameters buffer version (platform-specific)
> > + * @data_size: The configuration data effective size, excluding this header
> > + * @data: The configuration data
> > + */
> > +struct v4l2_params_buffer {
> > +	__u32 version;
> > +	__u32 data_size;
> > +	__u8 data[] __counted_by(data_size);
> > +};
> > +
> > +#endif /* _UAPI_V4L2_PARAMS_H_ */
>
> --
> Regards,
>
> Laurent Pinchart
>

