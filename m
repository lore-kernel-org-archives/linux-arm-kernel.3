Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E044EC83F18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 07:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDYeU3foOCib4PybAdueoCMev0P/nDTiYfS9DGogkgg=; b=ifYOXoN8Jp1DVlGzz2/WjNGm+2
	79Wj2R40xK46pWMBp3XCdLDLIGMInj4R8Awn9CvePbl9D/SuNWilHwGxNXmbczlnXz9ebCH46txkC
	Rpvo5jH62RL0VKucIFyjfiLdTKWrIRVQ99o27//XuvCJIzlnaW9Oguf7m3NigbJPwseVCz3kosyV6
	uUy28XqKoZRR4VGiRuq4rKDoSVFRZbCqhBb2Qdc6xwUsabP2pU40GKrSYT+eZJPOmgiWB11R/yCLx
	55ArsluChlsVr+pTH2icGFRRmjPM8ctovyuzqRWSypyCkyVVUPrxD9Nhb+Z11Da2o3B+zBYOzUtSz
	Qeit7mfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlq5-0000000B2EM-0b06;
	Thu, 10 Jul 2025 07:37:05 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZl1Z-0000000Aty3-46Rs;
	Thu, 10 Jul 2025 06:44:55 +0000
Received: from ideasonboard.com (mob-5-90-141-178.net.vodafone.it [5.90.141.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FBE4B2B;
	Thu, 10 Jul 2025 08:44:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752129862;
	bh=G2mP+TzUpeF4VFP/EQ7A/yoG+29WO+bDjDJWRAYrtuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PyRV9bH3jTKdG61AxpHwFNrD5ZlVCKtu1dsfjtd9DN1UJuO+mKEYI+KILfjwjeoC6
	 +brRni8FqbT6gb+vSERcsif0R4l85tmvx0x82mLnYo44CNzXx73rXVzCUN/pHFRHXo
	 Q1gae9a/49W4znJEAraMCWAZ2RXoe3EtfTMfwLNI=
Date: Thu, 10 Jul 2025 08:44:40 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Keke Li <keke.li@amlogic.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Dan Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/8] media: uapi: Convert Amlogic C3 to V4L2 extensible
 params
Message-ID: <y6d6slegpjoduxnvmed3xurjwt7t6me2jiy65u743lk4wc6zny@zhed5vdusmen>
References: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
 <20250708-extensible-parameters-validation-v1-3-9fc27c9c728c@ideasonboard.com>
 <968ffcce-9fef-4336-b83d-f9cd7ade6ea0@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <968ffcce-9fef-4336-b83d-f9cd7ade6ea0@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_234454_355623_E3FFA72A 
X-CRM114-Status: GOOD (  39.61  )
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

Hi Keke

   thanks for the comment and for testing

On Thu, Jul 10, 2025 at 10:32:01AM +0800, Keke Li wrote:
> Hi Jacopo
>
> On 2025/7/8 18:40, Jacopo Mondi wrote:
> > [ EXTERNAL EMAIL ]
> >
> > With the introduction of common types for extensible parameters
> > format, convert the c3-isp-config.h header to use the new types.
> >
> > Factor-out the documentation that is now part of the common header
> > and only keep the driver-specific on in place.
> >
> > The conversion to use common types doesn't impact userspace as the
> > new types are either identical to the ones already existing in the
> > C3 ISP uAPI or are 1-to-1 type convertible.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >   include/uapi/linux/media/amlogic/c3-isp-config.h | 45 +++++++-----------------
> >   1 file changed, 12 insertions(+), 33 deletions(-)
> >
> > diff --git a/include/uapi/linux/media/amlogic/c3-isp-config.h b/include/uapi/linux/media/amlogic/c3-isp-config.h
> > index ed085ea62a574932c7ad8d59d34b2c5c74a597d8..203116cdfb89356301c16c98cb40e5b83efe71d6 100644
> > --- a/include/uapi/linux/media/amlogic/c3-isp-config.h
> > +++ b/include/uapi/linux/media/amlogic/c3-isp-config.h
> > @@ -6,8 +6,12 @@
> >   #ifndef _UAPI_C3_ISP_CONFIG_H_
> >   #define _UAPI_C3_ISP_CONFIG_H_
> >
> > +#include <linux/build_bug.h>
> >   #include <linux/types.h>
> >
> > +#define _UAPI_V4L2_EXTENSIBLE_PARAMS_GUARD_
> > +#include <linux/media/v4l2-extensible-params.h>
> > +
> >   /*
> >    * Frames are split into zones of almost equal width and height - a zone is a
> >    * rectangular tile of a frame. The metering blocks within the ISP collect
> > @@ -183,11 +187,6 @@ enum c3_isp_params_block_type {
> >    * struct c3_isp_params_block_header - C3 ISP parameter block header
> >    *
> >    * This structure represents the common part of all the ISP configuration
> > - * blocks. Each parameters block shall embed an instance of this structure type
> > - * as its first member, followed by the block-specific configuration data. The
> > - * driver inspects this common header to discern the block type and its size and
> > - * properly handle the block content by casting it to the correct block-specific
> > - * type.
> >    *
> >    * The @type field is one of the values enumerated by
> >    * :c:type:`c3_isp_params_block_type` and specifies how the data should be
> > @@ -223,15 +222,8 @@ enum c3_isp_params_block_type {
> >    *                     gamma->pst_gamma_lut[i] = i;
> >    *     }
> >    *
> > - * @type: The parameters block type from :c:type:`c3_isp_params_block_type`
> > - * @flags: A bitmask of block flags
> > - * @size: Size (in bytes) of the parameters block, including this header
> >    */
> > -struct c3_isp_params_block_header {
> > -       __u16 type;
> > -       __u16 flags;
> > -       __u32 size;
> > -};
> > +#define c3_isp_params_block_header v4l2_params_block
>
> Why not use v4l2_params_block directly?

The types of the Amlogic C3 and RkISP1 headers are already part of the
kernel userspace API and we can't change them without breaking
existing users I'm afraid. In the C3 case the kernel support has been
collected in the v6.16 merge window, and v6.16 has not been released yet,
so one could argue there are no "existing users" yet.

It's however too late in my opinion to make modifications that depend
on this patch series which will, be collected for v6.18 at the
earliest.

Thanks
  j

>
> Thanks
>
> Keke
>
> >
> >   /**
> >    * struct c3_isp_params_awb_gains - Gains for auto-white balance
> > @@ -498,26 +490,9 @@ struct c3_isp_params_blc {
> >   /**
> >    * struct c3_isp_params_cfg - C3 ISP configuration parameters
> >    *
> > - * This struct contains the configuration parameters of the C3 ISP
> > - * algorithms, serialized by userspace into an opaque data buffer. Each
> > - * configuration parameter block is represented by a block-specific structure
> > - * which contains a :c:type:`c3_isp_param_block_header` entry as first
> > - * member. Userspace populates the @data buffer with configuration parameters
> > - * for the blocks that it intends to configure. As a consequence, the data
> > - * buffer effective size changes according to the number of ISP blocks that
> > - * userspace intends to configure.
> > - *
> > - * The parameters buffer is versioned by the @version field to allow modifying
> > - * and extending its definition. Userspace should populate the @version field to
> > - * inform the driver about the version it intends to use. The driver will parse
> > - * and handle the @data buffer according to the data layout specific to the
> > - * indicated revision and return an error if the desired revision is not
> > - * supported.
> > - *
> > - * For each ISP block that userspace wants to configure, a block-specific
> > - * structure is appended to the @data buffer, one after the other without gaps
> > - * in between nor overlaps. Userspace shall populate the @total_size field with
> > - * the effective size, in bytes, of the @data buffer.
> > + * This is the driver-specific implementation of :c:type:`v4l2_params_buffer`.
> > + *
> > + * Currently only C3_ISP_PARAM_BUFFER_V0 is supported.
> >    *
> >    * The expected memory layout of the parameters buffer is::
> >    *
> > @@ -561,4 +536,8 @@ struct c3_isp_params_cfg {
> >          __u8 data[C3_ISP_PARAMS_MAX_SIZE];
> >   };
> >
> > +/* Make sure the header is type-convertible to the generic v4l2 params one */
> > +static_assert((sizeof(struct c3_isp_params_cfg) - C3_ISP_PARAMS_MAX_SIZE) ==
> > +             sizeof(struct v4l2_params_buffer));
> > +
> >   #endif
> >
> > --
> > 2.49.0
> >
>

