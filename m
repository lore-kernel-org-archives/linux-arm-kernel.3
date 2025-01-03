Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A892E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 07:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8zGTejCVFN/h5rd+WcbNTfvLqBVkaqHH+kc3UjqOIk=; b=NYwjRTMCIbyeUVPGENltWcgz6/
	7SZ6UXvdHfKaz2REHFDE/DUbQ8oMo0I4K1FLJTUL2ZYDeiRMTAO4BaoXjTG3PYztg7XgErzaFg+7z
	WNARh+Tejc0AkFihh2VeezrQLKMV25+ZVqyYHTWxVZmXE+f2eV26SCBNUsMASX8YZOzv24iVkx3PX
	lmZd7bkyKQakUnFVwlQaiTTKAx9eoArBNGJaCMqyJhsQLz8foCzO8B5BP47WoLiHu+DiAzaptXCFX
	bECYyv/Z2feGd1fX1vOIsZ4TPjMzBARqrBtefCgCgtrkO0N/XV8GvinHOOHzrDUv+LJxVTkrnn5yX
	Aco44Ijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTcXZ-0000000CPXX-2v8w;
	Fri, 03 Jan 2025 07:56:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTcWN-0000000CPMr-3A0O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 07:55:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DE2D4A403D4;
	Fri,  3 Jan 2025 07:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8E1C4CECE;
	Fri,  3 Jan 2025 07:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735890902;
	bh=NpIXwBPwb7jLEDHahiTfDLx71UgAQTQ6tNt8p6O4N90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sXtlddqV04A8wbpFyqMt4deIAwjERAkhFOtaaWQScBvLpMUi9P1wofOj3YALdXBay
	 ouIiN0gYu65vlY2S1YHIJbCJsx0fsW+LjRC9l8bLIScZwz7HWlP150TsMWvgPLqcLk
	 O1RSfstE8ufNczxt8jeBQygp5qm5AWS1QCBBl8x/vh+N/xiHmlBFj8aey3w/lPHqZu
	 0lLoCa5ePzp7/p+FgNVfxgWBtj3DRPj7X8EjP2UPXI+pB0/i0xikGBeVqxRIRcVhVW
	 R+Fhcyp/14TwPgSKRdyo+atKBbl5Sfw/AnsWsDVtP5pg9/sZiHgvTtai3f9tximEeI
	 9QgB/XG/HscwQ==
Date: Fri, 3 Jan 2025 08:54:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 3/4] arm64: dts: morello: Add support for soc dts
Message-ID: <syspr5f42jceogrnwngwndfuc25uqhxxxlzpfxs7c4k4jactnz@ipwrsxsxrwha>
References: <20250102155416.13159-1-vincenzo.frascino@arm.com>
 <20250102155416.13159-4-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250102155416.13159-4-vincenzo.frascino@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_235503_860467_9BA9E9DE 
X-CRM114-Status: GOOD (  19.94  )
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

On Thu, Jan 02, 2025 at 03:54:15PM +0000, Vincenzo Frascino wrote:
> The Morello architecture is an experimental extension to Armv8.2-A,
> which extends the AArch64 state with the principles proposed in
> version 7 of the Capability Hardware Enhanced RISC Instructions
> (CHERI) ISA.
> 
> Introduce Morello SoC dts.
> 
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---
>  arch/arm64/boot/dts/arm/Makefile        |  1 +
>  arch/arm64/boot/dts/arm/morello-sdp.dts | 55 +++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/arm/morello-sdp.dts
> 
> diff --git a/arch/arm64/boot/dts/arm/Makefile b/arch/arm64/boot/dts/arm/Makefile
> index d908e96d7ddc..869667bef7c0 100644
> --- a/arch/arm64/boot/dts/arm/Makefile
> +++ b/arch/arm64/boot/dts/arm/Makefile
> @@ -7,3 +7,4 @@ dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb
>  dtb-$(CONFIG_ARCH_VEXPRESS) += vexpress-v2f-1xv7-ca53x2.dtb
>  dtb-$(CONFIG_ARCH_VEXPRESS) += fvp-base-revc.dtb
>  dtb-$(CONFIG_ARCH_VEXPRESS) += corstone1000-fvp.dtb corstone1000-mps3.dtb
> +dtb-$(CONFIG_ARCH_VEXPRESS) += morello-sdp.dtb
> diff --git a/arch/arm64/boot/dts/arm/morello-sdp.dts b/arch/arm64/boot/dts/arm/morello-sdp.dts
> new file mode 100644
> index 000000000000..68926f511362
> --- /dev/null
> +++ b/arch/arm64/boot/dts/arm/morello-sdp.dts
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2021-2024, Arm Limited. All rights reserved.
> +
> + */
> +
> +/dts-v1/;
> +#include "morello.dtsi"
> +
> +/ {
> +	model = "Arm Morello System Development Platform";
> +	compatible = "arm,morello-sdp", "arm,morello";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&gic {
> +	reg = <0x0 0x30000000 0 0x10000>,	/* GICD */
> +	      <0x0 0x300c0000 0 0x80000>;	/* GICR */

This coding choice is very confusing, really the first code like this in
the kernel.  Deserves comments explaining why this is different than
everything else (or just fix it).

Best regards,
Krzysztof


