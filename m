Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A9ACD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 13:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0QjJ0r3T1RYk1i9XytkOvWkCThvCLDC0VRduOm6DpQ=; b=Djzz+/ZGnSLbUhVBYJFbzSfjeO
	Xs+3Z6zNBX6G2EEuzxWKEVloJsjU++ZaWSJkJo/BCvCwGD6DrgZxRa7fp23pnN8O2KzdCQ5nJIjYj
	4dxrBOeHQMsXUZXUG70E3g7NH7l6WVXqaO2DLcDZSfVDB2mSiiNx0yWNNJVLi8MLTB1VAKFZTjRHF
	WCFxMr/pEaz5GThCgjhQ4qUyrncRsCfJ2nSDPj3HSkVKXiP3eLNUJaDemDFI5myOA61FM2fsoMQ4B
	q8dDt/JpQ8COl1DFX/d+UnKogYCDTc23XR2jJHXekNb6gxtKFhhWNOJOs7ZjIbS3wzbXuNEwnNQyE
	/MmnPpbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYvX-00000002S0k-32p1;
	Fri, 19 Jun 2026 13:06:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYvV-00000002S0a-2KrS;
	Fri, 19 Jun 2026 13:06:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D26DD601E1;
	Fri, 19 Jun 2026 13:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E2F1F000E9;
	Fri, 19 Jun 2026 13:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781874388;
	bh=B0QjJ0r3T1RYk1i9XytkOvWkCThvCLDC0VRduOm6DpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c8lS+RKpnAd1keGtLeakexrPve2/AQukDtnReKQWodsuTXoqc3RmD3YqH6q0lM1zn
	 NVAaXx10iVv8pWPUkPoTxE4SH4JOvXxa8uwp5XMP4fOVkaXNfTZSM2bpG6/D4i0WTA
	 heDp4lq5naMqkEao5PRUbl9xn9RHjZfgCj8uEMmUbOC44Djo7Q+IMfWi2jWfMFRMll
	 kN7/Ur3tv+Slwilh/PhJeiQ+xebFleAod0+7JHdnWxDdxR1/QUVt3mx1WEXUO3D4iq
	 BAUwTQmaOeVPvaTV2lXGR8JyLy7GiyX16HT2imNFvxb9qtjav04G/GCHaUpuJewbS2
	 OG+jWtzJDxOOQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.4)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1waYvS-00000000uOT-18em;
	Fri, 19 Jun 2026 15:06:26 +0200
Date: Fri, 19 Jun 2026 15:06:26 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
	Christopher Healy <healych@amazon.com>
Subject: Re: [PATCH v2 2/5] docs: media: add documentation for media client
 usage stats
Message-ID: <ajU9qkexEUtNqOng@foz.lan>
References: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
 <20260617-v4l2-add-fdinfo-v2-2-d298e98ce06a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-v4l2-add-fdinfo-v2-2-d298e98ce06a@collabora.com>
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

On Wed, Jun 17, 2026 at 02:10:57PM -0400, Detlev Casanova wrote:
> From: Christopher Healy <healych@amazon.com>
> 
> Document the media fdinfo interface for per-file-descriptor usage
> statistics exposed by stateless V4L2 codec drivers via
> /proc/<pid>/fdinfo/<fd>.
> 
> This interface is designed for stateless (request API based) codec
> devices where the kernel driver has per-job visibility into hardware
> execution. Stateful codecs cannot support all of this because their
> firmware manages job scheduling opaquely.
> 
> The specification defines media- prefixed keys for engine utilization
> time, and operating frequency, following the same conventions as the DRM
> fdinfo mechanism documented in drm-usage-stats.rst.
> 
> More fields can be added later.
> 
> Signed-off-by: Christopher Healy <healych@amazon.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../userspace-api/media/drivers/index.rst          |  1 +
>  .../media/drivers/media-usage-stats.rst            | 85 ++++++++++++++++++++++

Please notice that sysfs/procfs APIs are usually documented at
Documentation/ABI/, using a machine-readable format[1]. Still, we do want
it also at media uAPI. So, please add it there as well on your next spin.

[1] As those are new, Documentation/ABI/testing/ is probably the best place.

>  2 files changed, 86 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> index 02967c9b18d6..61879738836c 100644
> --- a/Documentation/userspace-api/media/drivers/index.rst
> +++ b/Documentation/userspace-api/media/drivers/index.rst
> @@ -34,6 +34,7 @@ For more details see the file COPYING in the source distribution of Linux.
>  	imx-uapi
>  	mali-c55
>  	max2175
> +	media-usage-stats
>  	npcm-video
>  	omap3isp-uapi
>  	thp7312
> diff --git a/Documentation/userspace-api/media/drivers/media-usage-stats.rst b/Documentation/userspace-api/media/drivers/media-usage-stats.rst
> new file mode 100644
> index 000000000000..d3dc07002f62
> --- /dev/null
> +++ b/Documentation/userspace-api/media/drivers/media-usage-stats.rst
> @@ -0,0 +1,85 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _media-usage-stats:
> +
> +==========================
> +Media client usage stats
> +==========================
> +
> +Stateless V4L2 codec drivers can optionally expose per-file-descriptor usage
> +statistics via ``/proc/<pid>/fdinfo/<fd>``. This is analogous to the DRM fdinfo
> +mechanism documented in :ref:`drm-client-usage-stats`, but uses the ``media-``
> +key prefix for V4L2 media devices.
> +
> +This interface is specific to stateless (request API based) codec devices,
> +including both decoders and encoders. With stateless codecs, the kernel driver
> +explicitly submits each frame to the hardware and receives a completion
> +interrupt, providing a clean per-job boundary that can be attributed to the
> +submitting file descriptor.
> +
> +Stateful codec devices cannot support this interface because their firmware
> +manages job scheduling internally. The kernel driver submits bitstream data
> +but has no visibility into per-frame hardware execution timing.
> +
> +Implementation
> +==============
> +
> +The V4L2 core provides the plumbing: drivers implement the ``show_fdinfo``
> +callback in ``struct v4l2_file_operations``, and the core wires it into the
> +kernel ``struct file_operations`` so that ``/proc/<pid>/fdinfo/<fd>`` output
> +includes the driver-provided keys.
> +
> +File format specification
> +=========================
> +
> +- File shall contain one key value pair per one line of text.
> +- Colon character (``:``) must be used to delimit keys and values.
> +- All standardised keys shall be prefixed with ``media-``.
> +- Driver-specific keys shall be prefixed with ``driver_name-``.
> +
> +Mandatory keys
> +--------------
> +
> +- media-driver: <valstr>
> +
> +  String shall contain the name of the media driver.
> +
> +- media-type: <valstr>
> +
> +  String shall identify the type of media engine exposed through this file
> +  descriptor. Standard values are ``decoder`` and ``encoder``.
> +
> +Utilization keys
> +----------------
> +
> +- media-engine-usage: <uint> ns
> +
> +  Time in nanoseconds that the hardware engine spent busy processing work
> +  belonging to this file descriptor. The engine being measured is identified
> +  by the ``media-type`` key.
> +
> +  Values are not required to be constantly monotonic if it makes the driver
> +  implementation easier, but are required to catch up with the previously
> +  reported larger value within a reasonable period.
> +
> +Frequency keys
> +--------------
> +
> +- media-maxfreq: <uint> Hz
> +
> +  Maximum operating frequency of the main engine clock.
> +
> +- media-curfreq: <uint> Hz
> +
> +  Current operating frequency of the main engine clock.
> +
> +Example output
> +==============
> +
> +::
> +
> +  media-driver:           hantro-vpu
> +  media-type:             decoder
> +  media-engine-usage:     123456789 ns
> +  media-maxfreq:          600000000 Hz
> +  media-curfreq:          600000000 Hz
> 
> -- 
> 2.54.0
> 

-- 
Thanks,
Mauro

