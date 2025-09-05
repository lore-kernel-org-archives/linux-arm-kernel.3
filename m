Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3EDCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 19:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yogPM0+XlabCLBj2fzpggTcI63m8kKXoKpPPN/WcHBQ=; b=EsGvACcaDOU822rHLNq0JAlWhO
	FxC51RSf5gv71MkgzXx4Bvm1iUU5Do5IVNfGaR6JpxREqUrjZ3PP6J1MraIT1+JntlIwzf6LGTuVg
	QZE3oC37OWBgSlHcgJc2IZxygRIzUIy9Of9K9Nma8GdPJeeKnvMgBcAhIvQPM5DpoXeQlJ9S/DacD
	QKPF133XynAP1TPiSmiIsUlVi7OK47TIv85TXZpBsMUyUL+i9ntqqWVJqhLyGddnFMuPSjVBc/Zm2
	U+/bKxic+vVoeyi98LfTXzym0cyi+7Hw+jgaew+gzMKor3XUPRK4Qj8iYY8vr7Rq60rvnbWNTzQex
	mUUN+xVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuc5a-000000047gT-3va4;
	Fri, 05 Sep 2025 19:27:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuY9I-00000002fBN-2TUM
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 05 Sep 2025 15:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yogPM0+XlabCLBj2fzpggTcI63m8kKXoKpPPN/WcHBQ=; b=D235g/D6nuP2gsguPIPRQWGox2
	CTUjia/4Ap5s4sdNb9zCzQcJWHctr0v1WIr+m665W3JPYbelB+qj9sgBDSv6T3b80lVF28wiJ8jjP
	b3ZNW54TaHf33nqZurbHWfb/Jz0YYZ24+HazdIoQSX1u8nVQvOVjdqdte7PIOBy+5tgEyiWerv26r
	OqQDeSg+WLUOF7+tbGdNJ8ODkyYXNNZF6Bc7s6nh3sCP+Z9MHn2VnPrnE+nKPtkxEmxXeJ22IJcop
	JUQZZBiFB4nU4jcLqIDmeu6xzxR4XRM4TIukejqv7D7JjSB2TBSSAW+7wm58OCX/ehFUEKzNXwp/a
	6d/pz6Lw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuY9E-00000004dop-2uP9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 15:14:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72134152B;
	Fri,  5 Sep 2025 08:14:33 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAEA23F6A8;
	Fri,  5 Sep 2025 08:14:39 -0700 (PDT)
Date: Fri, 5 Sep 2025 16:14:37 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel
 Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] arm64: dts: allwinner: a523: Add MCU PRCM CCU node
Message-ID: <20250905161437.1a164745@donnerap>
In-Reply-To: <20250830170901.1996227-8-wens@kernel.org>
References: <20250830170901.1996227-1-wens@kernel.org>
	<20250830170901.1996227-8-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_161444_987972_5C7A6DE1 
X-CRM114-Status: GOOD (  19.24  )
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

On Sun, 31 Aug 2025 01:09:00 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> Add a device node for the third supported clock controller found in the
> A523 / T527 SoCs. This controller has clocks and resets for the RISC-V
> MCU, and others peripherals possibly meant to operate in low power mode
> driven by the MCU, such as audio interfaces, an audio DSP, and the NPU.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index 79bd9ce08c7c..b6e82d53af54 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -4,8 +4,10 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/sun6i-rtc.h>
>  #include <dt-bindings/clock/sun55i-a523-ccu.h>
> +#include <dt-bindings/clock/sun55i-a523-mcu-ccu.h>
>  #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
>  #include <dt-bindings/reset/sun55i-a523-ccu.h>
> +#include <dt-bindings/reset/sun55i-a523-mcu-ccu.h>
>  #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
>  #include <dt-bindings/power/allwinner,sun55i-a523-ppu.h>
>  #include <dt-bindings/power/allwinner,sun55i-a523-pck-600.h>
> @@ -825,6 +827,29 @@ rtc: rtc@7090000 {
>  			clock-names = "bus", "hosc", "ahb";
>  			#clock-cells = <1>;
>  		};
> +
> +		mcu_ccu: clock-controller@7102000 {
> +			compatible = "allwinner,sun55i-a523-mcu-ccu";
> +			reg = <0x7102000 0x164>;

There is a register at 0x164, and even though the Linux driver doesn't use
it, we should let the region cover it. Maybe even going to 0x200?

The clock names match up with those .fw_name used in the driver, so with
the region size fixed:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> +			clocks = <&osc24M>,
> +				 <&rtc CLK_OSC32K>,
> +				 <&rtc CLK_IOSC>,
> +				 <&ccu CLK_PLL_AUDIO0_4X>,
> +				 <&ccu CLK_PLL_PERIPH0_300M>,
> +				 <&ccu CLK_DSP>,
> +				 <&r_ccu CLK_R_AHB>,
> +				 <&ccu CLK_MBUS>;
> +			clock-names = "hosc",
> +				      "losc",
> +				      "iosc",
> +				      "pll-audio0-4x",
> +				      "pll-periph0-300m",
> +				      "dsp",
> +				      "r-ahb",
> +				      "mbus";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
>  	};
>  
>  	thermal-zones {


