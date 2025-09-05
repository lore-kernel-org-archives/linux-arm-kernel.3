Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8905CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 19:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhqSyS5d0BdTUh/WfCzyCIZ7SPSLUHpx6FWTa5bRZ24=; b=0mGAf7mv4LdjlfvFk7M3O5zUji
	TGPidXDLQMSf59LwVNwjXQGGHc+/UT8J2Z2NTuS0AyCo0GmgR6uVb6szkQ2iC6CdI09fa5+DE2paJ
	ByjQ1qf0ta6v4t0yk9ehVL5Y3RDbZgoLCnCACEOX0oIKxcYehG04C10x3SwS//FU5eg5TJ71kgaGY
	nXfyq0YnVcFpvEmM23R8CBHeCZvMyr/WtTBD3JQSBin6VPRGZnoNBlLqeaB1E+rrSq08DGVuQuyHj
	5rBUDdBdk4I8VKT5fZOhhr0bbiQQ5sPgTQv0bcJT3r2rzKZIWTNg+9heWvyUcwT0Hv1u1YqbwFJ8S
	K9edb9VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuc5d-000000047kD-42J6;
	Fri, 05 Sep 2025 19:27:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuY9S-00000002fCu-1IYv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 15:14:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F004A152B;
	Fri,  5 Sep 2025 08:14:46 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4E9C3F6A8;
	Fri,  5 Sep 2025 08:14:53 -0700 (PDT)
Date: Fri, 5 Sep 2025 16:14:51 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel
 Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] arm64: dts: allwinner: a523: Add NPU device node
Message-ID: <20250905161451.0d9615f6@donnerap>
In-Reply-To: <20250830170901.1996227-9-wens@kernel.org>
References: <20250830170901.1996227-1-wens@kernel.org>
	<20250830170901.1996227-9-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_081458_401374_890B78F1 
X-CRM114-Status: GOOD (  23.68  )
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

On Sun, 31 Aug 2025 01:09:01 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi,

> From: Chen-Yu Tsai <wens@csie.org>
> 
> The Allwinner T527 SoC has an NPU built in. Based on identifiers found
> in the BSP, it is a Vivante IP block. After enabling it, the etnaviv
> driver reports it as a GC9000 revision 9003.
> 
> The standard bindings are used as everything matches directly. There is
> no option for DVFS at the moment. That might require some more work,
> perhaps on the efuse side to map speed bins.
> 
> It is unclear whether the NPU block is fused out at the hardware level
> or the BSP limits use of the NPU through software, as the author only
> has boards with the T527.

I happen to only have boards without the NPU, one A523, two A527s, one
T527, but the SKU without the NPU, and a H728.
So I can confirm that the clock gates and resets exist, but the whole NPU
MMIO frame behaves as read-as-zero/write ignore. At least it doesn't
crash, and the Linux driver just skips this NPU as it cannot identify it
(with all the ID registers being 0).

So I think it's fine to have this node in all the DTBs. We *could* have
something in U-Boot that probes for this RAZ/WI behaviour and slaps a
status = "disabled"; on it. In which case it might be beneficial to have a
status node in already. But I'd rather avoid the churn and reliance on
firmware, instead try to auto detect as much as possible.

> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Matches the binding and the manual:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index b6e82d53af54..1ab5b87ec78e 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -850,6 +850,18 @@ mcu_ccu: clock-controller@7102000 {
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  		};
> +
> +		npu: npu@7122000 {
> +			compatible = "vivante,gc";
> +			reg = <0x07122000 0x1000>;
> +			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&mcu_ccu CLK_BUS_MCU_NPU_ACLK>,
> +				 <&ccu CLK_NPU>,
> +				 <&mcu_ccu CLK_BUS_MCU_NPU_HCLK>;
> +			clock-names = "bus", "core", "reg";
> +			resets = <&mcu_ccu RST_BUS_MCU_NPU>;
> +			power-domains = <&ppu PD_NPU>;
> +		};
>  	};
>  
>  	thermal-zones {


