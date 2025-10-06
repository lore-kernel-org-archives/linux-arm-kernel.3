Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5516ECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 01:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgKsuVIAsIJFG9PsB+EryydGWLUiKyKjEHemQ+nV1kg=; b=1SE3ddbTyyirkslDLBB6C5EcBR
	UbkP3IddOGBdZjlkBAJ8DthTemuzBUXoSH0N+LbnZCq9bTva4iBklvn9IlVjs50F6an+8QwDeCSuM
	EK37D5JXpzfeHLXAwckKxBx381iaM4LOp2Q3NrDYyh0Ck+r0Dv+r0Ryu1yg/OtmIfpGR+2ylN98VA
	OxRLpg+/Us61SiEeKiuJfCPMEHYc/wdHGvgNFKCyuCSxA4tIg7ALMndFbTIlUnzveQe7qSV9vcWrv
	0LpzOHWpJVDmxU6JV8l+7aVMm4aC/TeQr7Is/pAJ8x0CFmqTNWZXGHcwms4VLW7OsoSRtfazNtW/+
	6hjs2grw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Zs7-0000000GogE-03Qg;
	Mon, 06 Oct 2025 01:18:39 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Zs4-0000000GofW-33RN;
	Mon, 06 Oct 2025 01:18:37 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F02C51741;
	Mon,  6 Oct 2025 03:17:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759713423;
	bh=2Z3QGL4wAK5QOKF4a4Gd1Zf6tzhgZNVyrlQQhXpXGKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oanwC028YZpnPsTnwkl1LQCcnvaR8MtpmUk6cIVMc6kA665gVCey2NZMxby19QMWy
	 zAFyjhFWAYeHd1rhftu7IW8AbSkPSyVRVqRGumsipm5wMMjssDv6jOhIf9gau0ml8a
	 0ScVaWyji7biGZa+E2M1dARpaXYDOONpEDjpYQUw=
Date: Mon, 6 Oct 2025 04:18:29 +0300
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
Subject: Re: [PATCH v5 8/8] media: Documentation: kapi: Add v4l2 generic ISP
 support
Message-ID: <20251006011829.GC29231@pendragon.ideasonboard.com>
References: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
 <20250915-extensible-parameters-validation-v5-8-e6db94468af3@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250915-extensible-parameters-validation-v5-8-e6db94468af3@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_181836_907476_9175A6AB 
X-CRM114-Status: GOOD (  25.42  )
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

Thank you for the patch.

On Mon, Sep 15, 2025 at 07:18:17PM +0200, Jacopo Mondi wrote:
> Add to the driver-api documentation the v4l2-isp.h types and
> helpers documentation.
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  Documentation/driver-api/media/v4l2-core.rst |  1 +
>  Documentation/driver-api/media/v4l2-isp.rst  | 37 ++++++++++++++++++++++++++++
>  MAINTAINERS                                  |  1 +
>  3 files changed, 39 insertions(+)
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

At what point we should structure the documentation. At one point :-)

> diff --git a/Documentation/driver-api/media/v4l2-isp.rst b/Documentation/driver-api/media/v4l2-isp.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..d778aa799347bfd0a95bd6887dd944ddad0fe4d1
> --- /dev/null
> +++ b/Documentation/driver-api/media/v4l2-isp.rst
> @@ -0,0 +1,37 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +V4L2 generic ISP parameters and statistics support
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +ISP configuration parameters and statistics are processed and collected by
> +drivers and exchanged with userspace through data types that usually
> +reflect the ISP peripheral registers layout.
> +
> +Each ISP driver defines its own metadata format for parameters and statistics,
> +and exposing the registers layout in the format definition, part of the Linux
> +kernel uAPI/uABI interface, makes it really hard, if not impossible, to extend
> +the format in a backward compatible way to support new hardware blocks or
> +different revisions of the same peripheral IP.
> +
> +For these reasons Video4Linux2 defines generic types for ISP configuration
> +parameters and statistics with a set of associated helpers to support drivers
> +and users using generic types.
> +
> +Generic ISP configuration parameters
> +====================================
> +
> +Drivers can use the generic and extensible configuration parameters format by
> +re-using the types defined in the include/uapi/linux/media/v4l2-isp.h uAPI
> +header file.
> +
> +The uAPI header defines generic types which the driver is expected to re-use and
> +provide definitions for the types of supported ISP blocks, their control
> +flags and the expected maximum size of a buffer of parameters.
> +
> +When a driver receives a buffer of parameters from userspace it shall validate
> +it by using the helper functions and types available in include/media/v4l2-isp.h
> +before accessing the buffer to apply the parameters to the hardware registers.
> +

Same comments are for the UAPI, I think this will need a full rewrite later.

> +Generic ISP support driver documentation
> +========================================
> +.. kernel-doc:: include/media/v4l2-isp.h
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5e0e4208ebe6c58a9ea0834e1ebb36abd2de06e1..b0c5e6c2b21a5d5ebc63d2ae8b5c1b68fa912b33 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26414,6 +26414,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
>  M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/driver-api/media/v4l2-isp.rst
>  F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
>  F:	drivers/media/v4l2-core/v4l2-isp.c
>  F:	include/media/v4l2-isp.h

-- 
Regards,

Laurent Pinchart

