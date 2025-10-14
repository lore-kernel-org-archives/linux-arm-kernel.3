Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F777CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 08:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s31mKoZOmpTiTnFmNUndM3soOO7xuCfY8lZpxSoSblw=; b=laXUUVVl6mStwTQTO2IGGQR2mA
	Iz1b1PDd2cYKbahskao3tV3qzt8oIm4Z/gcF1tLSTv2y8/l8rNzLisVjZFeGFhQlbtvRf2jHOWxoH
	BEk7oGksx1qfFuUD1ZcLatM+HxpUAsotS+ThIaLo/SXt1q2f2N4tNwqdmzrdpWTu26DJOUDxdT01H
	STmAnU3puCX9SmbCfEyTWcmGe2qgFiSCaQco1c0+Yc0RhdJSV5WOE/ttrBpTNjnGGUAJY0cfwI1gh
	UVDgg0GJItGexjPdRVt+gwn45lzGpflf6/xY8U4eRtvncrTEhyYxBwrw4FIGU5EeMOgb7ZefJmYhq
	GOTFoiYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ao8-0000000FgJw-2yPn;
	Tue, 14 Oct 2025 08:55:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ao5-0000000FgGt-3ZOX;
	Tue, 14 Oct 2025 08:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760432092;
	bh=bepUQbrGttB/U3jbIE3oO/Sn/Mcj/LgtFELZpY005IE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WaPc2BRMFp+RTe3E+BZ3HSPzFO/30hD0z7pwsBxev4SSXiKZW3DpSWLkm2/v67GZa
	 UgX8aza9Qt1n56vlrTZGhQIsr7/+TnSiyb61TI/7xnAdbgq+ISSLDQCJMIQwpH1mBP
	 PI+O5E8HQS5aM+ggKHGSHRYqfZaxUprVkJ4uWV7G7p7ShUY1JdvVDZm6Pt67SWMXFf
	 OUcpbLYApV/84ezSRbYj8G1xd9sEKSHav0lOt9NhA6sUWIEH3egbO2vsQQHVbf7dOj
	 b6QQaXuSAzPgsfN3se6c/D1+WWGAdl2RDnnsRjT643G7lNJt+OldRGaX3g40ybb4xw
	 2F4GEtMKkFjTA==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B55B917E04DA;
	Tue, 14 Oct 2025 10:54:51 +0200 (CEST)
Message-ID: <e4672b5e-8f22-4220-b666-4aad06787c71@collabora.com>
Date: Tue, 14 Oct 2025 10:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 8/8] media: Documentation: kapi: Add v4l2 generic ISP
 support
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
 <20251014-extensible-parameters-validation-v7-8-6628bed5ca98@ideasonboard.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20251014-extensible-parameters-validation-v7-8-6628bed5ca98@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_015458_059018_151FB205 
X-CRM114-Status: GOOD (  25.89  )
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

On 10/14/25 10:01, Jacopo Mondi wrote:
> Add to the driver-api documentation the v4l2-isp.h types and
> helpers documentation.
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  Documentation/driver-api/media/v4l2-core.rst |  1 +
>  Documentation/driver-api/media/v4l2-isp.rst  | 49 ++++++++++++++++++++++++++++
>  MAINTAINERS                                  |  1 +
>  3 files changed, 51 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
> index ad987c34ad2a8460bb95e97adc4d850d624e0b81..a5f5102c64cca57b57b54ab95882b26286fb27de 100644
> --- a/Documentation/driver-api/media/v4l2-core.rst
> +++ b/Documentation/driver-api/media/v4l2-core.rst
> @@ -27,3 +27,4 @@ Video4Linux devices
>      v4l2-common
>      v4l2-tveeprom
>      v4l2-jpeg
> +    v4l2-isp
> diff --git a/Documentation/driver-api/media/v4l2-isp.rst b/Documentation/driver-api/media/v4l2-isp.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..42c2550602979609e92a09e3cd1fe3dcbafd6416
> --- /dev/null
> +++ b/Documentation/driver-api/media/v4l2-isp.rst
> @@ -0,0 +1,49 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +V4L2 generic ISP parameters and statistics support
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Design rationale
> +================
> +
> +ISP configuration parameters and statistics are processed and collected by
> +drivers and exchanged with userspace through data types that usually
> +reflect the ISP peripheral registers layout.
> +
> +Each ISP driver defines its own metadata capture format for parameters and
> +a metadata output format for statistics. The buffer layout is realized by a
> +set of C structures that reflects the registers layout. The number and types
> +of C structures is fixed by the format definition and becomes part of the Linux
> +kernel uAPI/uABI interface.
> +
> +Because of the hard requirement of backward compatibility when extending the
> +user API/ABI interface, modifying an ISP driver capture or output metadata
> +format after it has been accepted by mainline is very hard if not impossible.
> +
> +It generally happens, in facts, that after the first accepted revision of an

s/in facts/in fact

> +ISP driver the buffer layout need to be modified, either to support new hardware

s/need/needs

> +blocks, fix bugs found later on or support different revisions of the same IP.
> +
> +Each of these situation would require defining a new metadata format, making it

s/situation/situations

> +really hard to maintain and extend drivers and requiring userspace to use a
> +the correct format depending on the kernel revision in use.
> +
> +V4L2 ISP configuration parameters
> +=================================
> +
> +For these reasons, Video4Linux2 defines generic types for ISP configuration
> +parameters and statistics. Drivers are still expected to define their own
> +formats for their metadata output and capture nodes, but the buffer layout can
> +be defined using the extensible and versioned types defined by
> +include/uapi/linux/media/v4l2-isp.h.
> +
> +Drivers are expected to provide the definitions of their supported ISP blocks,
> +the control flags and the expected maximum size of a buffer.
> +
> +For driver developers a set of helper functions to assist them with validation
> +of the buffer received from userspace is available in the form of helper
> +functions in drivers/media/v4l2-core/v4l2-isp.c

"helper function" is used twice, maybe:

A set of helper functions that assist driver developers with the
validation of the buffer received from userspace is available in
drivers/media/v4l2-core/v4l2-isp.c
?

> +
> +V4L2 ISP support driver documentation
> +=====================================
> +.. kernel-doc:: include/media/v4l2-isp.h
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 59ab4a34f72c0430a8d7966942acb2242ad923ca..3cc24092995bcb01051cc301ca212c32938cf745 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26857,6 +26857,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
>  M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/driver-api/media/v4l2-isp.rst
>  F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
>  F:	drivers/media/v4l2-core/v4l2-isp.c
>  F:	include/media/v4l2-isp.h
> 

With the comments above addressed,

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Thanks and best regards,
Michael


