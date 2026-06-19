Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5182FCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0Pi+BMv6vNYyFoag1XFUtPquKbXVfT0i1yiV+bM+HU=; b=WZ8tGWgEtlnjVf94nNJJFgojta
	ec9kYT6RvuWYLS19gJrC4aFcVvkP5QCMP/TVFhs8M4xYI8KtRoc4dUyYfVWI9qPtExEQdRLhuQHSH
	glzVui0gtAHPSA3OmZq8UFogFbDRHA1ysheI8cabf+swBQYBworwi3IgJTQPmZnkaIYGI1OLg3Kso
	YWkFzaF4MkzEQItSda2baC9Yy8cq1NUQjnbkOxeQr+ij8Y4GGpTlVmI+8wX1xIHq3EjbJDnzN5+SK
	gNMMNMJUalNS9dLkt6Zy5Uq2CUxTqJG50cRyS1W9IdgwRucZ4+jL4TkmwNKbZA2uhvKabTT0LPFQ9
	m5yYvtkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYnv-00000002R6r-1wO5;
	Fri, 19 Jun 2026 12:58:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYnu-00000002R6T-2Ckq;
	Fri, 19 Jun 2026 12:58:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 88FDD601E3;
	Fri, 19 Jun 2026 12:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1A51F000E9;
	Fri, 19 Jun 2026 12:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781873917;
	bh=d0Pi+BMv6vNYyFoag1XFUtPquKbXVfT0i1yiV+bM+HU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=PSqkhaxR3FQBweBoWpSc2EorY9Pez8SIDdeV3sC6lRA+WQgDMLdZA+W2gA/jtTjk6
	 Ekiyp7acgu6TijirW2qXF2y9K6x5DYjccWRB1qYutK9TB9SpkY8pqSf95PdLaJhdxv
	 P5f1YgY2ouHTHsw3CjKy5MoE4mQ13d1RVh47iHECGArbDe2eqUIWgJ5fValDrya85S
	 tpAjHsJGrPe4YJhVtSDcMRrDjgy3FY4Rwgp4X7oIpo85wCXO9i/HHvvyVYHoIFYZFk
	 UFfbHcyA/Hy1+atRYojuEQTbX4GA9O0X8cwj42q17bLMl6r3H/nGzCBWRMndIBLwRJ
	 77oRCRWCJOa9g==
Message-ID: <755cf7c1-6bcc-45d1-afea-192d393256af@kernel.org>
Date: Fri, 19 Jun 2026 14:58:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 2/5] docs: media: add documentation for media client
 usage stats
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, Christopher Healy <healych@amazon.com>
References: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
 <20260617-v4l2-add-fdinfo-v2-2-d298e98ce06a@collabora.com>
Content-Language: en-US, nl
In-Reply-To: <20260617-v4l2-add-fdinfo-v2-2-d298e98ce06a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Detlev,

Interesting, I had never heard of fdinfo, so if nothing else, I learned something new!

On 17/06/2026 20:10, Detlev Casanova wrote:
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

stats -> statistics

But are these really statistics? Isn't it just the current status?
In many ways this feature looks to me similar to what VIDIOC_LOG_STATUS does,
except in a nicer format. When VIDIOC_LOG_STATUS was first added, fdinfo
didn't exist yet.

And I wouldn't call it 'Media client': it's specific to stateless V4L2
codec drivers.

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

I'd pick 'v4l2-driver'. Since 'media-driver' is too generic for this
since that encompasses also DVB/CEC/RC drivers.

> +
> +  String shall contain the name of the media driver.

'V4L2 stateless codec driver'

> +
> +- media-type: <valstr>

Poor name.

> +
> +  String shall identify the type of media engine exposed through this file
> +  descriptor. Standard values are ``decoder`` and ``encoder``.

I think I would use 'stateless-decoder' and 'stateless-encoder'. It's more
specific than de/encoder since that can be stateful as well.

So I am missing the big picture here: right now this patch adds support for
this for stateless codecs, but what happens in the future if this is also
added for regular video capture devices, ISPs, etc.?

The naming here matters, it has to have some sort of scheme so it can be
extended to other types of drivers. So a 'media' prefix is too generic,
and it also looks like it refers to the /dev/mediaX device.

> +
> +Utilization keys
> +----------------
> +
> +- media-engine-usage: <uint> ns

'Media Engine': very vague.

> +
> +  Time in nanoseconds that the hardware engine spent busy processing work

Cumulative since creating the file handle? Or since the last read?

> +  belonging to this file descriptor. The engine being measured is identified
> +  by the ``media-type`` key.
> +
> +  Values are not required to be constantly monotonic if it makes the driver
> +  implementation easier, but are required to catch up with the previously
> +  reported larger value within a reasonable period.

Does this make sense for codecs?

I can tell that this is heavily influenced by the drm documentation, but that
does not necessarily translate to V4L2.

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

'Main engine clock'?

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

Regards,

	Hans

