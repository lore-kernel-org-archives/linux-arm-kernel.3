Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F5BC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIGOwDbCI2U0TeB/QLIQLHc5SSexLxiGmgyzJQ3BXoI=; b=sfGsMLR634+ql+6DRmdYHk5CI5
	/vulm0xQLRM8gY8g6DLqCy49gYmVoYopteMEqr2+ELROshodpFgFAdL/blX5a1/9lklv2gjxwx6sR
	rFbSP/dI1C4i++PDmKlV45YROLVtNHAlMFRTethmgnqk4SUUPMX1m+KkjiRxRo9Tzw7FfjRtilGr0
	+zrfbAczg/U5AftT+jtqbDjVDkxoqSgTDCRDQeVQQV0BGAOeBv5q2xWgN22wOL9iaLNkjszgJBiQU
	Z1ef7Hck+ofR6rzetmXN7/+Gl/Wj+zvQ3AoSJ21DgGpuAbziHW31tyeH+/BrGWfIkKLT6F9xJFXPc
	oAekRwzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcnW-0000000EixI-3N7h;
	Mon, 24 Feb 2025 18:03:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcks-0000000EiYa-1P3S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:00:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF246152B;
	Mon, 24 Feb 2025 10:00:47 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46D223F5A1;
	Mon, 24 Feb 2025 10:00:29 -0800 (PST)
Date: Mon, 24 Feb 2025 18:00:25 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Chris Morgan <macroalpha82@gmail.com>, Hironori KIKUCHI
 <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] arm64: dts: allwinner: h616: add display engine,
 bus and mixer nodes
Message-ID: <20250224180025.4eb33c3f@donnerap.manchester.arm.com>
In-Reply-To: <20250216092827.15444-3-ryan@testtoast.com>
References: <20250216092827.15444-1-ryan@testtoast.com>
	<20250216092827.15444-3-ryan@testtoast.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_100034_468256_C43112FA 
X-CRM114-Status: GOOD (  24.34  )
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

On Sun, 16 Feb 2025 22:27:09 +1300
Ryan Walklin <ryan@testtoast.com> wrote:

Hi,

> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> The Allwinner H616 and variants (H618, H700 and T507) have a new display
> engine variant (DE33). Support has been added to the existing DE2/DE3
> sun4i driver in a previous patch series (x). The variant is selected via
> the appropriate mixer device tree compatible string.
> 
> Add the respective device-tree nodes for the DE, bus, clock and mixer to
> the H616 DTSI, and the matching SRAM section for the DE.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> index cdce3dcb8ec02..ab8b70ce7df89 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -94,6 +94,12 @@ l2_cache: l2-cache {
>  		};
>  	};
>  
> +	de: display-engine {
> +		compatible = "allwinner,sun50i-h6-display-engine";

That should either be sun50i-h616-display-engine, or it should use a
fallback. IIUC this "device" is just something more or less artificial
that ties things together? I don't see any differences between the
latest SoCs in the driver, but still we seem to use a separate compatible
for every SoC there, which I guess is intentional?

> +		allwinner,pipelines = <&mixer0>;
> +		status = "disabled";
> +	};
> +
>  	reserved-memory {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -150,6 +156,51 @@ soc {
>  		#size-cells = <1>;
>  		ranges = <0x0 0x0 0x0 0x40000000>;
>  
> +		bus: bus@1000000 {
> +			compatible = "allwinner,sun50i-h616-de33",
> +				     "allwinner,sun50i-a64-de2";
> +			reg = <0x1000000 0x400000>;
> +			allwinner,sram = <&de3_sram 1>;

Should this label be de33_sram?

> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0x1000000 0x400000>;
> +
> +			display_clocks: clock@8000 {
> +				compatible = "allwinner,sun50i-h616-de33-clk";
> +				reg = <0x8000 0x100>;
> +				clocks = <&ccu CLK_DE>, <&ccu CLK_BUS_DE>;
> +				clock-names = "mod", "bus";
> +				resets = <&ccu RST_BUS_DE>;
> +				#clock-cells = <1>;
> +				#reset-cells = <1>;
> +			};
> +
> +			mixer0: mixer@100000 {
> +				compatible = "allwinner,sun50i-h616-de33-mixer-0";
> +				reg = <0x100000 0x100000>,
> +				      <0x8100 0x40>,
> +				      <0x280000 0x20000>;

As mentioned in the binding patch, I think having reg-names here would
help to make it clearer what those regions are for.

> +				clocks = <&display_clocks CLK_BUS_MIXER0>,
> +					 <&display_clocks CLK_MIXER0>;
> +				clock-names = "bus", "mod";
> +				resets = <&display_clocks RST_MIXER0>;
> +				iommus = <&iommu 0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					mixer0_out: port@1 {
> +						reg = <1>;
> +
> +						mixer0_out_tcon_top_mixer0: endpoint {
> +							remote-endpoint = <&tcon_top_mixer0_in_mixer0>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +
>  		crypto: crypto@1904000 {
>  			compatible = "allwinner,sun50i-h616-crypto";
>  			reg = <0x01904000 0x800>;
> @@ -173,6 +224,11 @@ sram_c: sram@28000 {
>  				#address-cells = <1>;
>  				#size-cells = <1>;
>  				ranges = <0 0x00028000 0x30000>;
> +
> +				de3_sram: sram-section@0 {

de33_sram?

> +					compatible = "allwinner,sun50i-a64-sram-c";

I think we need a new compatible, with the A64 as a fallback. The H6 seems
to do this as well.

Cheers,
Andre

> +					reg = <0x0000 0x1e000>;
> +				};
>  			};
>  		};
>  


