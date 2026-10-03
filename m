Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9520FCA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 14:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCF9tetbpMfQg3fMkPRL+OgJ850OtOdqqJtsAEmAaxc=; b=qVOzmvgVOLgXpwFleydVlx2uOt
	yFBC7S6zR8fjt9/IjkK0VU0DYkXv1FbEJE1+LUuyxPQ8FfMltzFgapHshJ3GvbikrteligBdpgvOp
	xzPKT8o32YwartPB6L9Lc2MDfQhGjbIbOtm7pjGQBSVuyiigdbitEEG2I5Xf/P3YqdIGwF3+kJsUB
	K+lm0vXjyENf1NyafNWZ/rR6nJ4FZnzNWMMYRlZWzx1QaAw/JaxnGyFKUlMJ/ZsbCJNgAsRhjsvzX
	D8eATkbHyq6NSaYKEF4N6+9Qj2hdT2S8bKpUnEJdxlh2CB6wIbbr0uJZ2DT2aezM8It/mLHjrJ78c
	bG9CSy0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD0wh-0000000Ddij-0xOv;
	Sat, 03 Oct 2026 14:42:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD0wd-0000000Ddia-3Fz5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 14:42:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5859B43EEB;
	Sat,  3 Oct 2026 14:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5511F0089B;
	Sat,  3 Oct 2026 14:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791038555;
	bh=gCF9tetbpMfQg3fMkPRL+OgJ850OtOdqqJtsAEmAaxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QaH8YrQCXluDW63hTphJmUmkFE6nG5mcrDtNhv7a0JKSrCGXHTUaRfxohiLxbQyZe
	 NHMakZELalf5KQnUx1sEGf9jZDg0vClMQcVWwK3+Z0smvyE7XXYa+Iu0WtA9sc7W8O
	 48eykD6tWDOsznoQDeDakMq2YjW02eeabCvv/f19f80CbX4Q388sRs0IYR/+/ITRVz
	 n+y1ZZk0e7iyQg9UIYY4g7AP+kmifAXjFP4fCQbImCE0kr/D5O+RCSlaZ2FJf6LyOe
	 kw6gz1YcgrGBKy3UJRJEkXX/VSCRb9GdE5+4CWD+CyaW1GFBC8OFqd4vdFYep28GZz
	 VkaMGyHMODVjA==
Date: Sat, 3 Oct 2026 16:42:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, maciej.lawniczak@intel.com
Subject: Re: [PATCH 3/4] ARM: dts: aspeed: add Intel AVCRP BMC
Message-ID: <20261003-talented-perfect-rook-9ccf55@quoll>
References: <cover.1790344811.git.dawid.glazik@linux.intel.com>
 <9dadaaf04cae28e13057fa5d65023789f74483fb.1790344811.git.dawid.glazik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9dadaaf04cae28e13057fa5d65023789f74483fb.1790344811.git.dawid.glazik@linux.intel.com>
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

On Fri, Oct 02, 2026 at 06:32:44PM +0200, Dawid Glazik wrote:
> Add the initial AST2600 device tree for the Intel AVCRP BMC platform.
> 
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 321 ++++++++++++++++++
>  2 files changed, 322 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index 767f7c7652d5..ea4645ef9872 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -54,6 +54,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-ibm-rainier-4u.dtb \
>  	aspeed-bmc-ibm-sbp1.dtb \
>  	aspeed-bmc-ibm-system1.dtb \
> +	aspeed-bmc-intel-avcrp.dtb \
>  	aspeed-bmc-intel-s2600wf.dtb \
>  	aspeed-bmc-inspur-fp5280g2.dtb \
>  	aspeed-bmc-inspur-nf5280m6.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> new file mode 100644
> index 000000000000..ba0091689172
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2026 Intel Corporation
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "Intel AVCRP BMC";
> +	compatible = "intel,avcrp-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyS4,115200n8";

We moved to stdout property years ago.

Best regards,
Krzysztof


