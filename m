Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E289CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 01:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0k3UIPNlyfEREDqW/PYf0UH8O4nMA008gGanrdPsaDY=; b=tLzysl2+2mTCI5TaWRy0JwqjOd
	n5RRYie8YYmmzVLIKVRqO+4nc2W8mnUaBwh2lmZC+CvFvuzwfvKjuEvhw/FOIkVAzrcBi6raDGUgR
	H6PJXhBOpEeRIfebmOD19Ok08DBhjDVFWJzWy96WLmjkVQjIzWjg31xPHDAL0d310WYl0537Is547
	FPBa6Uczv7qx1kkTiL0nzqC9iw/oYoQ/OtPu5+Ryo0Dk4H9ukGx3SjoEkKdbM/YY7AphVV+kKtkOm
	+7h+Tv/k5dHM7rv9D/PlkNTaIDcyNPtN/aoLRGnle/fDyioMXF25w7XzGWnjtpvyx7btDMODwdolM
	YDR5cbbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Zi6-0000000Gnvs-1ZZF;
	Mon, 06 Oct 2025 01:08:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Zi3-0000000GnvR-1ZCd;
	Mon, 06 Oct 2025 01:08:16 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5183AB7D;
	Mon,  6 Oct 2025 03:06:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759712801;
	bh=o6QmQSvJJPrSva3mlI/9eET1mNbdleWnwcP/Ja4gBCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vhmp1PLlg/x3uztDk+EBOf47gIskZ/+YJizDLHLM3p+pCr2IlV8L6dS6xJtLNfReN
	 oYjIf1aOxBMocnXV//szzTrbOdkNmxFKre+a39AL2zjmBUxtqYMLmK2N9ASECAE1Hu
	 bf7GaK6DJ21FRg7hEic0NV4AA8EJspeOi5m6xIz0=
Date: Mon, 6 Oct 2025 04:08:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antoine Bouyer <antoine.bouyer@nxp.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/8] media: v4l2-core: Introduce v4l2-isp.c
Message-ID: <20251006010806.GB3305@pendragon.ideasonboard.com>
References: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
 <20250915-extensible-parameters-validation-v5-5-e6db94468af3@ideasonboard.com>
 <20251006004741.GA29231@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251006004741.GA29231@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_180815_695427_EDFE2466 
X-CRM114-Status: GOOD (  57.29  )
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

On Mon, Oct 06, 2025 at 03:47:43AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Mon, Sep 15, 2025 at 07:18:14PM +0200, Jacopo Mondi wrote:
> > Add to the v4l2 framework helper functions to support drivers
> 
> s/v4l2/V4L2/
> 
> > when validating a buffer of extensible ISP parameters.
> > 
> > Introduce new types in include/media/v4l2-isp.h that drivers shall use
> > in order to comply with the generic ISP parameters validation procedure,
> > and add helper functionss to v4l2-isp.c to perform blocks and buffer
> > validation.
> > 
> > Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  MAINTAINERS                        |   2 +
> >  drivers/media/v4l2-core/Kconfig    |   4 ++
> >  drivers/media/v4l2-core/Makefile   |   1 +
> >  drivers/media/v4l2-core/v4l2-isp.c | 108 +++++++++++++++++++++++++++++++++++++
> >  include/media/v4l2-isp.h           | 100 ++++++++++++++++++++++++++++++++++
> >  5 files changed, 215 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index abba872cb63f1430a49a2afbace4b9f9958c3991..5e0e4208ebe6c58a9ea0834e1ebb36abd2de06e1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -26415,6 +26415,8 @@ M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
> > +F:	drivers/media/v4l2-core/v4l2-isp.c
> > +F:	include/media/v4l2-isp.h
> >  F:	include/uapi/linux/media/v4l2-isp.h
> >  
> >  VF610 NAND DRIVER
> > diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> > index 331b8e535e5bbf33f22638b2ae8bc764ad5fc407..d50ccac9733cc39a43426ae7e7996dd0b5b45186 100644
> > --- a/drivers/media/v4l2-core/Kconfig
> > +++ b/drivers/media/v4l2-core/Kconfig
> > @@ -82,3 +82,7 @@ config V4L2_CCI_I2C
> >  	depends on I2C
> >  	select REGMAP_I2C
> >  	select V4L2_CCI
> > +
> > +config V4L2_ISP
> > +	tristate
> > +	depends on VIDEOBUF2_CORE
> > diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> > index 2177b9d63a8ffc1127c5a70118249a2ff63cd759..329f0eadce994cc1c8580beb435f68fa7e2a7aeb 100644
> > --- a/drivers/media/v4l2-core/Makefile
> > +++ b/drivers/media/v4l2-core/Makefile
> > @@ -29,6 +29,7 @@ obj-$(CONFIG_V4L2_CCI) += v4l2-cci.o
> >  obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
> >  obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
> >  obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
> > +obj-$(CONFIG_V4L2_ISP) += v4l2-isp.o
> >  obj-$(CONFIG_V4L2_JPEG_HELPER) += v4l2-jpeg.o
> >  obj-$(CONFIG_V4L2_MEM2MEM_DEV) += v4l2-mem2mem.o
> >  obj-$(CONFIG_V4L2_VP9) += v4l2-vp9.o
> > diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e350bdaf53b5502e1ec2a4989c20df1100ab2d2a
> > --- /dev/null
> > +++ b/drivers/media/v4l2-core/v4l2-isp.c
> > @@ -0,0 +1,108 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Video4Linux2 generic ISP parameters and statistics support
> > + *
> > + * Copyright (C) 2025 Ideas On Board Oy
> > + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > + */
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/device.h>
> > +
> > +#include <media/videobuf2-core.h>
> > +#include <media/v4l2-isp.h>
> 
> v4l2-isp goes first.
> 
> > +
> > +int v4l2_params_buffer_validate(struct device *dev, struct vb2_buffer *vb,
> > +				size_t max_size)
> > +{
> > +	size_t header_size = offsetof(struct v4l2_params_buffer, data);
> > +	struct v4l2_params_buffer *buffer = vb2_plane_vaddr(vb, 0);
> > +	size_t payload_size = vb2_get_plane_payload(vb, 0);
> > +	size_t buffer_size;
> > +
> > +	/* Payload size can't be greater than the destination buffer size */
> > +	if (payload_size > max_size) {
> > +		dev_dbg(dev, "Payload size is too large: %zu\n", payload_size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Payload size can't be smaller than the header size */
> > +	if (payload_size < header_size) {
> > +		dev_dbg(dev, "Payload size is too small: %zu\n", payload_size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Validate the size reported in the parameter buffer header */
> > +	buffer_size = header_size + buffer->data_size;
> > +	if (buffer_size != payload_size) {
> > +		dev_dbg(dev, "Data size %zu and payload size %zu are different\n",
> > +			buffer_size, payload_size);
> > +		return -EINVAL;
> > +	}
> 
> This check needs to go to v4l2_params_blocks_validate() as it has to be
> performed on the data after copying.
> 
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_params_buffer_validate);
> > +
> > +int v4l2_params_blocks_validate(struct device *dev,
> > +				const struct v4l2_params_buffer *buffer,
> > +				const struct v4l2_params_handler *handlers,
> > +				size_t num_handlers)
> > +{
> > +	size_t block_offset = 0;
> > +	size_t buffer_size;
> > +
> > +	/* Walk the list of parameter blocks and validate them. */
> > +	buffer_size = buffer->data_size;
> > +	while (buffer_size >= sizeof(struct v4l2_params_block_header)) {
> > +		const struct v4l2_params_handler *handler;
> > +		const struct v4l2_params_block_header *block;
> > +
> > +		/* Validate block sizes and types against the handlers. */
> > +		block = (const struct v4l2_params_block_header *)
> > +			(buffer->data + block_offset);
> > +
> > +		if (block->type >= num_handlers) {
> > +			dev_dbg(dev, "Invalid parameters block type\n");
> 
> I'd print the type and offset in the message to ease debugging.
> 
> > +			return -EINVAL;
> > +		}
> > +
> > +		if (block->size > buffer_size) {
> > +			dev_dbg(dev, "Premature end of parameters data\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		/* It's invalid to specify both ENABLE and DISABLE. */
> > +		if ((block->flags & (V4L2_PARAMS_FL_BLOCK_ENABLE |
> > +				     V4L2_PARAMS_FL_BLOCK_DISABLE)) ==
> > +		     (V4L2_PARAMS_FL_BLOCK_ENABLE |
> > +		     V4L2_PARAMS_FL_BLOCK_DISABLE)) {
> > +			dev_dbg(dev, "Invalid parameters block flags\n");
> 
> Same here (print the flags and offset).
> 
> > +			return -EINVAL;
> > +		}
> > +
> > +		/*
> > +		 * Match the block reported size against the handler's expected
> > +		 * one, but allow the block to only contain the header in
> > +		 * case it is going to be disabled.
> > +		 */
> > +		handler = &handlers[block->type];
> > +		if (block->size != handler->size &&
> > +		    (!(block->flags & V4L2_PARAMS_FL_BLOCK_DISABLE) ||
> > +		    block->size != sizeof(*block))) {
> > +			dev_dbg(dev, "Invalid parameters block size\n");
> 
> And here too (print the size and offset).
> 
> > +			return -EINVAL;
> > +		}
> > +
> > +		block_offset += block->size;
> > +		buffer_size -= block->size;
> > +	}
> > +
> > +	if (buffer_size) {
> > +		dev_dbg(dev, "Unexpected data after the parameters buffer end\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_params_blocks_validate);
> > diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..2ad62c6169eef3d0fb8d245de56cc6bd7e6227e4
> > --- /dev/null
> > +++ b/include/media/v4l2-isp.h
> > @@ -0,0 +1,100 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Video4Linux2 generic ISP parameters and statistics support
> > + *
> > + * Copyright (C) 2025 Ideas On Board Oy
> > + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > + */
> > +
> > +#ifndef V4L2_PARAMS_H_
> > +#define V4L2_PARAMS_H_
> 
> V4L2_ISP_H_
> 
> > +
> > +#include <linux/media/v4l2-isp.h>
> > +
> > +struct device;
> > +struct vb2_buffer;
> > +
> > +/**
> > + * typedef v4l2_params_block_handler - V4L2 extensible format block handler
> 
> As commented on 1/8, let's use the v4l2_isp_ prefix.
> 
> > + * @arg: pointer the driver-specific argument
> > + * @block: the ISP configuration block to handle
> > + *
> > + * Defines the function signature of the functions that handle an ISP block
> > + * configuration.
> > + */
> > +typedef void (*v4l2_params_block_handler)(void *arg,
> > +					  const struct v4l2_params_block_header *block);
> > +
> > +/**
> > + * struct v4l2_params_handler - V4L2 extensible format handler
> > + * @size: the block expected size
> > + * @handler: the block handler function
> > + *
> > + * The v4l2_params_handler defines the type that driver making use of the
> > + * V4L2 extensible parameters shall use to define their own ISP block
> > + * handlers.
> > + *
> > + * Drivers shall prepare a list of handlers, one for each supported ISP block
> > + * and correctly populate the structure's field with the expected block @size
> > + * (used for validation) and a pointer to each block @handler function.
> > + */
> > +struct v4l2_params_handler {
> > +	size_t size;
> > +	v4l2_params_block_handler handler;
> > +};
> > +
> > +/**
> > + * v4l2_params_buffer_validate - Validate a V4L2 extensible parameters buffer
> 
> As this is the pre-copy validation, what would you think of calling the
> function v4l2_isp_params_pre_validate_buffer() ? The next function would
> be called v4l2_isp_params_validate_buffer(), as they're both about
> buffer validation. I'm also OK to keep the current names (with a
> v4l2_isp_ prefix).
> 
> I'm also thinking that the copy could be moved to the helper, but it can
> be done later.
> 
> > + * @dev: the driver's device pointer
> > + * @vb: the videobuf2 buffer
> > + * @max_size: the maximum allowed buffer size
> > + * @buffer_validate: callback to the driver-specific buffer validation
> 
> You forgot to drop the documentation for this argument.
> 
> > + *
> > + * Helper function that performs validation of an extensible parameters buffer.
> > + *
> > + * The helper is meant to be used by drivers to perform validation of the
> > + * extensible parameters buffer size correctness.
> > + *
> > + * The @vb buffer as received from the vb2 .buf_prepare() operation is checked
> > + * against @max_size and its validated to be large enough to accommodate at
> > + * least one ISP configuration block. The effective buffer size is compared
> > + * with the reported data size to make sure they match.
> > + *
> > + * Drivers should use this function to validate the buffer size correctness
> > + * before performing a copy of the user-provided videobuf2 buffer content into a
> > + * kernel-only memory buffer to prevent userspace from modifying the buffer
> > + * content after it has been submitted to the driver.
> > + */
> > +int v4l2_params_buffer_validate(struct device *dev, struct vb2_buffer *vb,
> > +				size_t max_size);
> > +
> > +/**
> > + * v4l2_params_blocks_validate - Validate V4L2 extensible parameters ISP
> > + *				 configuration blocks
> > + * @dev: the driver's device pointer
> > + * @buffer: the extensible parameters configuration buffer
> > + * @handlers: the list of block handlers
> 
> array of block handlers
> 
> > + * @num_handlers: the number of block handlers
> > + *
> > + * Helper function that performs validation of the ISP configuration blocks in
> > + * an extensible parameters buffer.
> > + *
> > + * The helper is meant to be used by drivers to perform validation of the
> > + * ISP configuration data blocks. For each block in the extensible parameters
> > + * buffer, its size and correctness are validated against its associated handler
> > + * in the @handlers list.
> 
> You need to explain somewhere that the handlers array is indexed by
> block type.
> 
> > + *
> > + * Drivers should use this function to validate the ISP configuration blocks
> > + * after having validated the correctness of the vb2 buffer sizes by using the
> > + * v4l2_params_buffer_validate() helper first. Once the buffer size has been
> > + * validated, drivers should perform a copy of the user-provided buffer into a
> > + * kernel-only memory buffer to prevent userspace from modifying the buffer
> > + * content after it has been submitted to the driver, and then call this
> > + * function to perform per-block validation.
> 
> There's room for improvement in the documentation. I think it would be
> clearer if you explained the big picture in
> Documentation/userspace-api/media/v4l/extensible-parameters.rst

My bad, that should be Documentation/driver-api/media/v4l2-isp.rst.

> (pre-validation, copy and post-validation), and only focussed on what
> those two functions do in their kerneldoc. That can be done later,
> nothing that you say here is incorrect.
> 
> With the other comments addressed,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> > + */
> > +int v4l2_params_blocks_validate(struct device *dev,
> > +				const struct v4l2_params_buffer *buffer,
> > +				const struct v4l2_params_handler *handlers,
> > +				size_t num_handlers);
> > +
> > +#endif /* V4L2_PARAMS_H_ */

-- 
Regards,

Laurent Pinchart

