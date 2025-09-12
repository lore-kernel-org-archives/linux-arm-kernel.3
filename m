Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3891CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOw0QFKGYQA5JjMUXNCTp0NmnEXUVAXTnRMbZ7lqoJc=; b=mGVktJ5KlGv4qUom4I2LchBhxo
	tqeZyYiM8Fa/1fyUWa8IWjYGanyXjpBn50A5CVXPnSH7KOp2Crao8f49nuWvIVpWkUCWvEVzWLL6N
	kc5jfmiBPHzHjlOkPUC5bprhLqEPnZJAqg7kXCuyPBqJdwPp4lXgmnFSOj19E/K4NjsW/ZZP7q7Kg
	0fgyHjOWTzgSII1b+Hft4UzsDddW2RxlrEKxbHFFR9f65Wu+9PKSPdz3rHC7ujw9SpC7ZrcBIpsxx
	+e1L8UyE0B795I6Acgz9pZOHlGiILlez1q4ZRHTulSxVwr+iOySALsCPyr2BfTBeqH5jVxq7CxEOU
	Rf+Iahfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0se-00000008XjC-0xcg;
	Fri, 12 Sep 2025 10:19:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0sb-00000008XhH-0OoZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:19:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E3F616A3;
	Fri, 12 Sep 2025 03:19:36 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B5E53F66E;
	Fri, 12 Sep 2025 03:19:42 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:19:40 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] clk: sunxi-ng: sun55i-a523-ccu: Add missing NPU
 module clock
Message-ID: <20250912111940.61f87a3e@donnerap>
In-Reply-To: <20250911174710.3149589-4-wens@kernel.org>
References: <20250911174710.3149589-1-wens@kernel.org>
	<20250911174710.3149589-4-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_031945_252375_DDA9654A 
X-CRM114-Status: GOOD (  28.52  )
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

On Fri, 12 Sep 2025 01:47:06 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> The main clock controller on the A523/T527 has the NPU's module clock.
> It was missing from the original submission, likely because that was
> based on the A523 user manual; the A523 is marketed without the NPU.
> 
> Also, merge the private header back into the driver code itself. The
> header only contains a macro containing the total number of clocks.
> This has to be updated every time a missing clock gets added. Having
> it in a separate file doesn't help the process. Instead just drop the
> macro, and thus the header no longer has any reason to exist.
> 
> Also move the .num value to after the list of clks to make it obvious
> that it should be updated when new clks are added.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks for the change!

Cheers,
Andre

> ---
> Changes since v1:
> - Move .num to after list of clks
> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 21 ++++++++++++++++++---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.h | 14 --------------
>  2 files changed, 18 insertions(+), 17 deletions(-)
>  delete mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523.h
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> index 1a9a1cb869e2..acb532f8361b 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> @@ -11,6 +11,9 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  
> +#include <dt-bindings/clock/sun55i-a523-ccu.h>
> +#include <dt-bindings/reset/sun55i-a523-ccu.h>
> +
>  #include "../clk.h"
>  
>  #include "ccu_common.h"
> @@ -25,8 +28,6 @@
>  #include "ccu_nkmp.h"
>  #include "ccu_nm.h"
>  
> -#include "ccu-sun55i-a523.h"
> -
>  /*
>   * The 24 MHz oscillator, the root of most of the clock tree.
>   * .fw_name is the string used in the DT "clock-names" property, used to
> @@ -486,6 +487,18 @@ static SUNXI_CCU_M_HW_WITH_MUX_GATE(ve_clk, "ve", ve_parents, 0x690,
>  
>  static SUNXI_CCU_GATE_HWS(bus_ve_clk, "bus-ve", ahb_hws, 0x69c, BIT(0), 0);
>  
> +static const struct clk_hw *npu_parents[] = {
> +	&pll_periph0_480M_clk.common.hw,
> +	&pll_periph0_600M_clk.hw,
> +	&pll_periph0_800M_clk.common.hw,
> +	&pll_npu_2x_clk.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(npu_clk, "npu", npu_parents, 0x6e0,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    CLK_SET_RATE_PARENT);
> +
>  static SUNXI_CCU_GATE_HWS(bus_dma_clk, "bus-dma", ahb_hws, 0x70c, BIT(0), 0);
>  
>  static SUNXI_CCU_GATE_HWS(bus_msgbox_clk, "bus-msgbox", ahb_hws, 0x71c,
> @@ -1217,6 +1230,7 @@ static struct ccu_common *sun55i_a523_ccu_clks[] = {
>  	&bus_ce_sys_clk.common,
>  	&ve_clk.common,
>  	&bus_ve_clk.common,
> +	&npu_clk.common,
>  	&bus_dma_clk.common,
>  	&bus_msgbox_clk.common,
>  	&bus_spinlock_clk.common,
> @@ -1343,7 +1357,6 @@ static struct ccu_common *sun55i_a523_ccu_clks[] = {
>  };
>  
>  static struct clk_hw_onecell_data sun55i_a523_hw_clks = {
> -	.num	= CLK_NUMBER,
>  	.hws	= {
>  		[CLK_PLL_DDR0]		= &pll_ddr_clk.common.hw,
>  		[CLK_PLL_PERIPH0_4X]	= &pll_periph0_4x_clk.common.hw,
> @@ -1524,7 +1537,9 @@ static struct clk_hw_onecell_data sun55i_a523_hw_clks = {
>  		[CLK_FANOUT0]		= &fanout0_clk.common.hw,
>  		[CLK_FANOUT1]		= &fanout1_clk.common.hw,
>  		[CLK_FANOUT2]		= &fanout2_clk.common.hw,
> +		[CLK_NPU]		= &npu_clk.common.hw,
>  	},
> +	.num	= CLK_NPU + 1,
>  };
>  
>  static struct ccu_reset_map sun55i_a523_ccu_resets[] = {
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.h b/drivers/clk/sunxi-ng/ccu-sun55i-a523.h
> deleted file mode 100644
> index fc8dd42f1b47..000000000000
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Copyright 2024 Arm Ltd.
> - */
> -
> -#ifndef _CCU_SUN55I_A523_H
> -#define _CCU_SUN55I_A523_H
> -
> -#include <dt-bindings/clock/sun55i-a523-ccu.h>
> -#include <dt-bindings/reset/sun55i-a523-ccu.h>
> -
> -#define CLK_NUMBER	(CLK_FANOUT2 + 1)
> -
> -#endif /* _CCU_SUN55I_A523_H */


