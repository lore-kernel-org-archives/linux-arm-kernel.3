Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0F7C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 14:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owtiEb/9s85+vaNIn2DyemOpTN58Kpd6RLI0a5U/f48=; b=boJv7RtZ+kEoTCQ9M2HsIDD1Xv
	kCxIT98CNMDRuuXDS/3VaHFFCbJsaNawo4ePVZ0fU+28fPVVjIdqCCrwgT/IRzx+v0N9hTH3VPMfQ
	1+7JKTF9Bg97ZLbn6sjbdVwkftRepfw8OOJPWT5ADdZyoICS0iiUCDQU9rk0x9U69Vu2Try1CLu3p
	viYD6gyGclOFaSfV5mNfYZ8jlzKJYyqyAxbdtoWSXxUv6RPYjTow81/wRs/oUA3e3+KuAvqhSSkei
	S8+O8nVeZu7SO2iByJygMGcVKgszS9pnFQ9lbg5qd3qtEEz5OZ+1JcIsuCObD/L8L2J+h2cvJQAhS
	RJ1zJwrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZW2V-000000091eo-1GjG;
	Wed, 09 Jul 2025 14:44:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZT3G-00000008VtT-2JFI;
	Wed, 09 Jul 2025 11:33:27 +0000
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A6F7669;
	Wed,  9 Jul 2025 13:32:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752060773;
	bh=4CTaLsR8YV2yEQfwN6D2XPkFm5HczJTSutCL69t+3wI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZJzfy1N3ynUaMcXRgYRv1SaGEp9n3diop+9Bju3fdiCxK34zVFboSYxl3XHmPqQUv
	 mTEbLSRI/UujaX3ZLtazI6zh7SW9UX8Vaqey+EcSs3xhFRNo5a0I6R7tCC5ivnC/HX
	 HSRZRJHH5Ttqd9k0YR5xaEpV7xI2z5cOJqnxqDjU=
Message-ID: <9b12b035-a80d-4d12-a039-daa94d13280e@ideasonboard.com>
Date: Wed, 9 Jul 2025 12:33:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: uapi: Introduce V4L2 extensible params
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
 <20250708-extensible-parameters-validation-v1-1-9fc27c9c728c@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20250708-extensible-parameters-validation-v1-1-9fc27c9c728c@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_043326_917770_52CF495D 
X-CRM114-Status: GOOD (  47.41  )
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

Hi Jacopo - thanks for the patches

On 08/07/2025 11:40, Jacopo Mondi wrote:
> Introduce v4l2-extensible-params.h in the Linux kernel uAPI.
>
> The header defines two types that all drivers that use the extensible
> parameters format for ISP configuration shall use to build their own
> parameters format.
>
> The newly introduce type v4l2_params_block represent the
> header to be prepend to each ISP configuration block and the
> v4l2_params_buffer type represent the base type for the configuration
> parameters buffer.
>
> The newly introduced header is not meant to be used directly by
> applications which should instead use the platform-specific ones.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>   MAINTAINERS                                       |   6 ++
>   include/uapi/linux/media/v4l2-extensible-params.h | 106 ++++++++++++++++++++++
>   2 files changed, 112 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 658543062bba3b7e600699d7271ffc89250ba7e5..49a9329e5fe8874bdbaca13946ea28bd80134cb3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25968,6 +25968,12 @@ F:	drivers/media/i2c/vd55g1.c
>   F:	drivers/media/i2c/vd56g3.c
>   F:	drivers/media/i2c/vgxy61.c
>   
> +V4L2 EXTENSIBLE PARAMETERS FORMAT
> +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	include/uapi/linux/media/v4l2-extensible-params.h
> +
>   VF610 NAND DRIVER
>   M:	Stefan Agner <stefan@agner.ch>
>   L:	linux-mtd@lists.infradead.org
> diff --git a/include/uapi/linux/media/v4l2-extensible-params.h b/include/uapi/linux/media/v4l2-extensible-params.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..ed37da433c6b1a34523b6a9befde5c0dee601cfb
> --- /dev/null
> +++ b/include/uapi/linux/media/v4l2-extensible-params.h
> @@ -0,0 +1,106 @@
> +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR MIT) */
> +/*
> + * Video4Linux2 extensible configuration parameters base types
> + *
> + * Copyright (C) 2025 Ideas On Board Oy
> + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> + */
> +
> +#ifndef _UAPI_V4L2_PARAMS_H_
> +#define _UAPI_V4L2_PARAMS_H_
> +
> +#ifndef _UAPI_V4L2_EXTENSIBLE_PARAMS_GUARD_
> +/*
> + * Note: each ISP driver exposes a different uAPI, where the types layout
> + * match (more or less strictly) the hardware registers layout.
> + *
> + * This file defines the base types on which each ISP driver can implement its
> + * own types that define its uAPI.
> + *
> + * This file is not meant to be included directly by applications which shall
> + * instead only include the ISP-specific implementation.
> + */
> +#error "This file should not be included directly by applications"
> +#endif
> +
> +#include <linux/types.h>
> +
> +/**
> + * struct v4l2_params_block - V4L2 extensible parameters block header

struct v4l2_params_block_header would be nicer I think

> + *
> + * This structure represents the common part of all the ISP configuration
> + * blocks. Each parameters block shall embed an instance of this structure type
> + * as its first member, followed by the block-specific configuration data. The
> + * driver inspects this common header to discern the block type and its size and
> + * properly handle the block content by casting it to the correct block-specific
> + * type.
> + *
> + * The @type field is one of the values enumerated by each platform-specific ISP
> + * block types which specifies how the data should be interpreted by the driver.
> + * The @size field specifies the size of the parameters block and is used by the
> + * driver for validation purposes.
> + *
> + * The @flags field is a bitmask of platform-specific control flags.
Since we're including flags in this base struct rather than a platform specific subclass I think 
perhaps we should centralise some flags (which I think is supported by the fact that all three 
implementations share the same flags so far). Perhaps we could reserve the bottom 8 bits for common 
flags (like ENABLE / DISABLE) and validate them centrally, and leave the top 8 for platform specific 
flags. I think we could then drop the platform specific validation for rkisp1 and c3 and just pass 
null to the helpers, since they do the same thing.
> + *
> + * Userspace shall never use this type directly but use the platform specific
> + * one with the associated data types.

Why wouldn't userspace just use these directly? I could see why it might be difficult for the C3 and 
Rkisp1 which are merged, but for a new implementation couldn't they just use these objects without 
bothering to define their own?


If we end up using these objects directly I think it would be nice to have the example code block 
from the platform specific headers documentation here too.

> + *
> + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_block_type`
> + * - Amlogic C3: :c:type:`c3_isp_params_block_type`
> + *
> + * @type: The parameters block type (platform-specific)
> + * @flags: A bitmask of block flags (platform-specific)
> + * @size: Size (in bytes) of the parameters block, including this header
> + */
> +struct v4l2_params_block {
> +	__u16 type;
> +	__u16 flags;
> +	__u32 size;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct v4l2_params_buffer - V4L2 extensible parameters configuration
> + *
> + * This struct contains the configuration parameters of the ISP algorithms,
> + * serialized by userspace into a data buffer. Each configuration parameter
> + * block is represented by a block-specific structure which contains a
> + * :c:type:`v4l2_params_block` entry as first member. Userspace populates
> + * the @data buffer with configuration parameters for the blocks that it intends
> + * to configure. As a consequence, the data buffer effective size changes
> + * according to the number of ISP blocks that userspace intends to configure and
> + * is set by userspace in the @data_size field.
> + *
> + * The parameters buffer is versioned by the @version field to allow modifying
> + * and extending its definition. Userspace shall populate the @version field to
> + * inform the driver about the version it intends to use. The driver will parse
> + * and handle the @data buffer according to the data layout specific to the
> + * indicated version and return an error if the desired version is not
> + * supported.
> + *
> + * For each ISP block that userspace wants to configure, a block-specific
> + * structure is appended to the @data buffer, one after the other without gaps
> + * in between nor overlaps. Userspace shall populate the @data_size field with
> + * the effective size, in bytes, of the @data buffer.
> + *
> + * Each ISP driver using the extensible parameters format shall define a
> + * type which is type-convertible to this one, with the difference that the
> + * @data member shall actually a memory buffer of platform-specific size and
> + * not a pointer.

Why not just use this object directly? We could provide a helper in v4l2-extensible-params.h that 
calculates the size of the buffer with a given data array size for the driver's convenience


Thanks

Dan

> + *
> + * Userspace shall never use this type directly but use the platform specific
> + * one with the associated data types.
> + *
> + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_cfg`
> + * - Amlogic C3: :c:type:`c3_isp_params_cfg`
> + *
> + * @version: The parameters buffer version (platform-specific)
> + * @data_size: The configuration data effective size, excluding this header
> + * @data: The configuration data
> + */
> +struct v4l2_params_buffer {
> +	__u32 version;
> +	__u32 data_size;
> +	__u8 data[];
> +};
> +
> +#endif /* _UAPI_V4L2_PARAMS_H_ */
>

