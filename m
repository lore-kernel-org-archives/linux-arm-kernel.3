Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0107D3941F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 08:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYH2YjgEYC2rpDpQm2q/s07TsCOGMMoXxrpVLS1dVrY=; b=Yf1LeYS0oQqKKaNGaxeRCq/haD
	rv/YEJkuGQBxoxT6UW1yaqs5QhhdGU81wluEgibynotOgkFn8Z08x/JSYcJ3IxoB/ON0s02Q2WI3+
	y/XnWcyT6GYyV81GG6CUeX6Q8cMGsskvGVg/u0qae66HcpeYHznV+GtKicdx0zdVHOdd12XtD/y7M
	EwFKdaidwFa+GZQoD7jrcTC6yp5dk3ILzkgjihyI0jkTvOgwN+n6pr6hB89qFLBUn6mxAnascTijz
	E+ScVEUg+XgydwcBjhqOUN3EYuahJF6lAq617OOneJI8lSfnblSzpuwPpB93FJ9tSdJfmxGSOqBZY
	q7jWTKPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Zkf-00000001hbI-3Qfi;
	Fri, 03 Apr 2026 08:19:37 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Zkc-00000001hav-062V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 08:19:36 +0000
Received: from ideasonboard.com (static.170.20.224.46.clients.your-server.de [46.224.20.170])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9467516C5;
	Fri,  3 Apr 2026 10:18:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775204283;
	bh=QQAhwLx44g9tpfTgf2mOOWm0i1b5zm6qaOCMuBNlY3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uX6DuT2BEtS8kqUKmO2p4nF5DQihCT27d1Z/oSCJNxBGGUA56Lns19TrrN3F3o1Mn
	 ijIwV8k6hkoPvOOLgL9iWjr/a3CPcafIOp595XAmx6aSxgA4kJAPBRJRv4dMH9aA6K
	 YppX/4rE9aeG8h1UvdKJzTr/Rf0ATz/0xgB1NDpg=
Date: Fri, 3 Apr 2026 10:19:24 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, 
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com, 
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Jai Luthra <jai.luthra@ideasonboard.com>, 
	paul elder <paul.elder@ideasonboard.com>
Subject: Re: [RFC v1 01/11] media: uapi: v4l2-isp: Add v4l2 ISP extensible
 statistics definitions
Message-ID: <ac93m33MhldSpYDj@zed>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-2-antoine.bouyer@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260123080938.3367348-2-antoine.bouyer@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_011934_203904_2979F5F2 
X-CRM114-Status: GOOD (  31.64  )
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

Hello Antoine

   in cc Jai and Paul

Jai and Paul are working on upstreaming new ISP formats which would
benefit from usage of extensible stats.

No pressure of course, just wanted to check how things are progressing
on your side. Do you have an updated version of this patch which can
be taken in ? Should we sync and work on an updated version ?

Thanks!
   j

On Fri, Jan 23, 2026 at 09:09:28AM +0100, Antoine Bouyer wrote:
> Extend the v4l2-isp extensible format introduced for isp parameters buffer
> to the statistics buffer as well.
>
> Like for ISP configuration purpose, that will help supporting various ISP
> hardware versions reporting different statistics data with less impact on
> userspace.
>
> The `v4l2_isp_stats_buffer` reuses the `v4l2_isp_params_buffer` container
> definitions, with similar header, versions and flags. V0 and V1 versions
> are provided to match with params versions. On the other side, ENABLE and
> DISABLE flags are not really meaningfull for statistics purpose. So VALID
> and INVALID flags are introduced. Purpose is to force ISP driver to
> validate a statistics buffer, before it is consumed by userspace.
>
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
>  include/uapi/linux/media/v4l2-isp.h | 85 +++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
>
> diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
> index 779168f9058e..ed1279b86694 100644
> --- a/include/uapi/linux/media/v4l2-isp.h
> +++ b/include/uapi/linux/media/v4l2-isp.h
> @@ -99,4 +99,89 @@ struct v4l2_isp_params_buffer {
>  	__u8 data[] __counted_by(data_size);
>  };
>
> +/**
> + * enum v4l2_isp_stats_version - V4L2 ISP statistics versioning
> + *
> + * @V4L2_ISP_STATS_VERSION_V0: First version of the V4L2 ISP statistics format
> + *			       (for compatibility)
> + * @V4L2_ISP_STATS_VERSION_V1: First version of the V4L2 ISP statistics format
> + *
> + * V0 and V1 are identical, and comply with V4l2 ISP parameters versions. So
> + * both V0 and V1 refers to the first version of the V4L2 ISP statistics
> + * format.
> + *
> + * Future revisions of the V4L2 ISP statistics format should start from the
> + * value of 2.
> + */
> +enum v4l2_isp_stats_version {
> +	V4L2_ISP_STATS_VERSION_V0 = 0,
> +	V4L2_ISP_STATS_VERSION_V1,
> +};
> +
> +#define V4L2_ISP_PARAMS_FL_BLOCK_VALID		(1U << 0)
> +#define V4L2_ISP_PARAMS_FL_BLOCK_INVALID	(1U << 1)
> +
> +/*
> + * Reserve the first 8 bits for V4L2_ISP_STATS_FL_* flag.
> + *
> + * Driver-specific flags should be defined as:
> + * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(0))
> + * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(1))
> + */
> +#define V4L2_ISP_STATS_FL_DRIVER_FLAGS(n)       ((n) + 8)
> +
> +/**
> + * struct v4l2_isp_stats_block_header - V4L2 extensible statistics block header
> + * @type: The statistics block type (driver-specific)
> + * @flags: A bitmask of block flags (driver-specific)
> + * @size: Size (in bytes) of the statistics block, including this header
> + *
> + * This structure represents the common part of all the ISP statistics blocks.
> + * Each statistics block shall embed an instance of this structure type as its
> + * first member, followed by the block-specific statistics data.
> + *
> + * The @type field is an ISP driver-specific value that identifies the block
> + * type. The @size field specifies the size of the parameters block.
> + *
> + * The @flags field is a bitmask of per-block flags V4L2_STATS_ISP_FL_* and
> + * driver-specific flags specified by the driver header.
> + */
> +struct v4l2_isp_stats_block_header {
> +	__u16 type;
> +	__u16 flags;
> +	__u32 size;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct v4l2_isp_stats_buffer - V4L2 extensible statistics data
> + * @version: The statistics buffer version (driver-specific)
> + * @data_size: The statistics data effective size, excluding this header
> + * @data: The statistics data
> + *
> + * This structure contains the statistics information of the ISP hardware,
> + * serialized for userspace into a data buffer. Each statistics block is
> + * represented by a block-specific structure which contains a
> + * :c:type:`v4l2_isp_stats_block_header` entry as first member. Driver
> + * populates the @data buffer with statistics information of the ISP blocks it
> + * intends to share to userspace. As a consequence, the data buffer effective
> + * size changes according to the number of ISP blocks that driver intends to
> + * provide and is set by the driver in the @data_size field.
> + *
> + * The statistics buffer is versioned by the @version field to allow modifying
> + * and extending its definition. Driver shall populate the @version field to
> + * inform the userpsace about the version it intends to use. The userspace will
> + * parse and handle the @data buffer according to the data layout specific to
> + * the indicated version.
> + *
> + * For each ISP block that driver wants to report, a block-specific structure
> + * is appended to the @data buffer, one after the other without gaps in
> + * between. Driver shall populate the @data_size field with the effective
> + * size, in bytes, of the @data buffer.
> + */
> +struct v4l2_isp_stats_buffer {
> +	__u32 version;
> +	__u32 data_size;
> +	__u8 data[] __counted_by(data_size);
> +};
> +
>  #endif /* _UAPI_V4L2_ISP_H_ */
> --
> 2.52.0
>

