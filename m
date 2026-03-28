Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21FA10F3DCE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 14:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yY5dYo2jKiOB9YseIxr9xpLDejiQQKTxyOOnSQ1Iles=; b=l31krZNFYIdoP5nSUVANJ6iUhb
	ohUq2wmoUpO96SzOmHydh+mBjfEQsEkdt33RX9T1oOhyEvQl/fLv+kC3tefRfF7zhxBVpO6Gh57n9
	Arsm5S4twFdLKyyDbr3N+o5LFgzYkRZqDyilDPAut9tDhKjxY7qIRO95IJwduOIENhVQrLyz20Eyk
	rReqVIUdmYEgnZQLUjkbcuT/OygcF8TbhI3qi2MEgGrt1E1fuOIwa2bCNYK6ic25Df6RHPKVyLDt4
	yfkDoHPeh+n9CBmk4y8IOhN3Xb2tJbXWIreTpoMl4FgT4011m3fi4/lmAoT2NFajwfzlqmM53qL/b
	3Zjona0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6UGQ-000000090Qf-135t;
	Sat, 28 Mar 2026 14:03:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6UGN-000000090QL-3jGH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 14:03:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B315C40471;
	Sat, 28 Mar 2026 14:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD1CC4CEF7;
	Sat, 28 Mar 2026 14:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774706622;
	bh=LP2OMDqjdBj9ybs8hsbQu15Xbc2oFeNlIx4PTLnzC/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cYI0PYmyurfc1IJg+PeyuF772oAYK0fPF0HmzDyDN4ccKpQfdc/jaJsiGLRWZVvwp
	 3EFf5kasIic9ndyGhY4NkNuyM0/XC3QxgMO9BxSugLSndUeUVIeDZeqP+flBqp8hh5
	 SiG7fYol9UXCF//oZwuK00xIA/nuTDJl/SMFqhR3o2vAQurUcagZ1ZNNC6KmKyvBxM
	 xI6cUzbaKs5zhKtOAFbpkAz0I8DfeTMOmpVgt/uLn2KjwQ9TntUDlkDFF/XbBRsNT0
	 XfIUlYrWBVSzFvVMgXIf6LnQrueurRVMOtChXezhUzSFDYrUThWrRlAk6mKvLWTVNy
	 RrrCGv8jVrtYA==
Date: Sat, 28 Mar 2026 15:03:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: nick.hawkins@hpe.com
Cc: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: hpe: Add HPE GSC SoC and DL340 Gen12
 board DTS
Message-ID: <20260328-translucent-scarlet-skunk-0e09cb@quoll>
References: <20260327174445.3275835-1-nick.hawkins@hpe.com>
 <20260327174445.3275835-4-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260327174445.3275835-4-nick.hawkins@hpe.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_070343_966081_05CF1D39 
X-CRM114-Status: GOOD (  17.37  )
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

On Fri, Mar 27, 2026 at 12:44:45PM -0500, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Add SoC-level DTSI for the HPE GSC ARM64 BMC SoC, covering the CPU
> cluster, GIC v3 interrupt controller, ARM64 generic timer, and console
> UART.
> 
> Add the board-level DTS for the HPE DL340 Gen12, which includes
> gsc.dtsi and adds memory and chosen nodes.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---

You miss fourth commit adding it to defconfig.

>  arch/arm64/boot/dts/hpe/Makefile           |   2 +
>  arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts |  18 ++++
>  arch/arm64/boot/dts/hpe/gsc.dtsi           | 104 +++++++++++++++++++++
>  3 files changed, 124 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/hpe/Makefile
>  create mode 100644 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
>  create mode 100644 arch/arm64/boot/dts/hpe/gsc.dtsi
> 
> diff --git a/arch/arm64/boot/dts/hpe/Makefile b/arch/arm64/boot/dts/hpe/Makefile
> new file mode 100644
> index 000000000000..6b547b8a8154
> --- /dev/null
> +++ b/arch/arm64/boot/dts/hpe/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +dtb-$(CONFIG_ARCH_HPE) += gsc-dl340gen12.dtb
> diff --git a/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts b/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
> new file mode 100644
> index 000000000000..42cfeac99029
> --- /dev/null
> +++ b/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0-only

Keep consistent SPDX, so I guess "GPL-2.0" here.

> +/dts-v1/;
> +
> +#include "gsc.dtsi"
> +
> +/ {
> +	compatible = "hpe,gsc-dl340gen12", "hpe,gsc";
> +	model = "HPE ProLiant DL340 Gen12";
> +
> +	chosen {
> +		stdout-path = &uartc;
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x00000000 0x40000000>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/hpe/gsc.dtsi b/arch/arm64/boot/dts/hpe/gsc.dtsi
> new file mode 100644
> index 000000000000..087688b089e9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/hpe/gsc.dtsi
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree file for HPE GSC
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0xa0008048>;
> +		};
> +
> +		cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <1>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0xa0008048>;
> +		};
> +	};
> +
> +	osc: clock-33333333 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-output-names = "osc";
> +		clock-frequency = <33333333>;
> +	};
> +
> +	timer {

Same comment as last time. I see you ignored few more comments and never
responded to them, so I finish the review here.

Best regards,
Krzysztof


