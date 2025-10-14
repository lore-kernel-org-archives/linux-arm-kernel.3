Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11971CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 09:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Clbw3Tdfs8EB5TReAGk8407FmZrIj8IVdnRAhUi8C8o=; b=n2wf3TNJWvQkqGHFH9l3uyujEj
	pBG6Xuff2em7RCllLKdpqxCKjVcFUZVHRmFdycmwAh2X8LL2U+3qbjQscgmN8gVjmVW8eoM0NeOc5
	TJN188eu4Iwy9pbbMUycbUbufe8nCAJxmMQnXyRk/rdRp6zv9vPlc+/sRCH/hMFGWE/V3d+LpGrsF
	HN5PEL3fCvM3hNw2kvX0awBUldahAyA9vBkQ+aHICXh9KeMhQUTpuzG1x6a6KOhHRqtwp/Hgx96oJ
	xb1Y7kpLlZN23ocDToz5G/0c7ObXqV60db/B0kMfOg/8HjV7cHehBZg92/le9UPaWs7AcEh4PeO+P
	9xXF5ozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bFn-0000000FkBn-28Au;
	Tue, 14 Oct 2025 09:23:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bFk-0000000FkBJ-39gP;
	Tue, 14 Oct 2025 09:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760433810;
	bh=c4Ter1k+l2031VS1wEDhFTTsF7XzTSEc5HpxZV87q0Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hDc+EcM3MZWzV7bN9i3J9KDBnRw/5tWRtouPjs4rbezEI/f0qExavMyLOORUx9iob
	 McMkjjWVowAuIGZRYz6OaRIhLDHfKilGEcJxid9LlNZFbx4cgLBCQmQNAQFJ+2iXDg
	 l65D0PJ0gY2W9uYlnnudhHC8joSKi8BDFKNR+PTI5p9/ppNIsJcf23QMTxorYhpVwp
	 pdwg2mrnoTrNX08j5wQbb1CVBlLsllIGAlBMxSRYZOuwxDsaNHDoA4EqaXceFQE+5x
	 y8ou4ISkjpeZ1c/4n5LMMewvV/r75XvSACqMwnvDViKnG5Bct2JQQQcByG9Qlm041u
	 OqQJWNecIHcFg==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B52E317E1283;
	Tue, 14 Oct 2025 11:23:29 +0200 (CEST)
Message-ID: <e82e7c1d-b4ac-49a0-9b76-d101395c7040@collabora.com>
Date: Tue, 14 Oct 2025 11:23:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/8] media: Documentation: uapi: Add V4L2 ISP
 documentation
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
 <20251014-extensible-parameters-validation-v7-4-6628bed5ca98@ideasonboard.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20251014-extensible-parameters-validation-v7-4-6628bed5ca98@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_022333_110032_B17DE0FA 
X-CRM114-Status: GOOD (  27.94  )
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

Hi Jacopo,

Thanks for your efforts!

On 10/14/25 10:00, Jacopo Mondi wrote:
> [...]
> +
> +The uAPI/ABI problem
> +--------------------
> +
> +By upstreaming the metadata formats that describe the parameters and statistics
> +buffers layout, driver developers make them part of the Linux kernel ABI. As it
> +sometimes happens for most peripherals in Linux, ISP drivers development is
> +often an iterative process, where sometimes not all the hardware features are
> +supported in the first version that lands in the kernel, and some parts of the
> +interface have to later be modified for bug-fixes or improvements.

Suggestion:

As for most peripherals, ISP driver development in Linux is often an
iterative process, in which not all of the hardware features are
supported in the first version. The support for them and/or bug fixes
may land in the kernel at a later stage.

> +
> +If any later bug-fix/improvement requires changes to the metadata formats,

s/bug-fix/bug fix

> +this is considered an ABI-breakage that is strictly forbidden by the Linux

s/ABI-breakage/ABI breakage

> +kernel policies. For this reason, any change in the ISP parameters and
> +statistics buffer layout would require defining a new metadata format.
> +
> +For these reasons Video4Linux2 has introduced support for generic ISP parameters
> +and statistics data types, designed with the goal of being:
> +
> +- Extensible: new features can be added later on without breaking the existing
> +  interface
> +- Versioned: different versions of the format can be defined without
> +  breaking the existing interface
> +
> +ISP configuration
> +=================
> +
> +Before the introduction of generic formats
> +------------------------------------------
> +
> +Metadata cature formats that describe ISP configuration parameters were most

s/cature/capture

s/most the time/"most of the time" or "typically" or "usually" or
"normally"?

> +the time realized by defining C structures that reflect the ISP registers layout
> +and gets populated by userspace before queueing the buffer to the ISP. Each

s/gets/get

> +C structure usually corresponds to one ISP *processing block*, with each block
> +implementing one of the ISP supported features.
> +
> +The number of supported ISP blocks, the layout of their configuration data are
> +fixed by the format definition, incurring the in the above described uAPI/uABI
> +problems.

incurring the described uAPI/ABI problems described above.

> +
> +Generic ISP parameters
> +----------------------
> +
> +The generic ISP configuration parameters format is realized by a defining a
> +single C structure that contains an header, followed by a binary buffer where

s/an header/a header

> +userspace programs a variable number of ISP configuration data block, one for
> +each supported ISP feature.
> +
> +The :c:type:`v4l2_isp_params_buffer` structure defines the parameters buffer
> +header which is followed by a binary buffer of ISP configuration parameters.
> +Userspace shall correctly populate the buffer header with the versioning
> +information and with the size (in bytes) of the binary data buffer where it will
> +store the ISP blocks configuration.
> +
> +Each *ISP configuration block* is preceded by an header implemented by the
> +:c:type:`v4l2_isp_params_block_header` structure, followed by the configuration
> +parameters for that specific block, defined by the ISP driver specific data
> +types.
> +
> +Userspace applications are responsible for correctly populating each block's
> +header fields (type, flags and size) and the block-specific parameters.
> +
> +ISP Block enabling, disabling and configuration
> +-----------------------------------------------
> +
> +When userspace wants to configure and enable an ISP block it shall fully
> +populate the block configuration and set the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
> +bit in the block header's `flags` field.
> +
> +When userspace simply wants to disable an ISP block the
> +V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bit should be set in block header's `flags`
> +field. Drivers accept a configuration parameters block with no additional
> +data after the header in this case.
> +
> +If the configuration of an already active ISP block has to be updated,
> +userspace shall fully populate the ISP block parameters and omit setting the
> +V4L2_ISP_PARAMS_FL_BLOCK_ENABLE and V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bits in the
> +header's `flags` field.
> +
> +Setting both the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE and
> +V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bits in the flags field is not allowed and not
> +accepted.
> +
> +Any further extension to the parameters layout that happens after the ISP driver
> +has been merged in Linux can be implemented by adding new blocks definition
> +without invalidating the existing ones.
> +
> +ISP statistics
> +==============
> +
> +Support for generic statistics format is not yet implemented in Video4Linux2.
> +
> +V4L2 ISP uAPI data types
> +========================
> +
> +.. kernel-doc:: include/uapi/linux/media/v4l2-isp.h
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e9ac834d212f88222437e8d806800b2516d44f01..340353334299cd5eebf1f72132b7e91b6f5fdbfe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26857,6 +26857,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
>  M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
>  F:	include/uapi/linux/media/v4l2-isp.h
>  
>  VF610 NAND DRIVER
> 


With the comments above addressed,

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Thanks and best regards,
Michael


