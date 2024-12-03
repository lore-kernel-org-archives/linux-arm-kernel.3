Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418B5D4979A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SCTthLs9ZOeRkaJN/2SIh8CJJnLc/lq8qZYXKpyK/Q=; b=059nLqu75DoNsNQBTymSMprMgR
	gjZlwatPv1WTKONSe6ewmE08vzueLscu9vWi6ISzwk4jeuOJJ171pCn1N+9kO7r3WMmzt/0h0fFFO
	tAjDbueD47eEgRjIWGh5B17H1auE5FTSq+HiHi+Q5AcqV9X0B2j0cOhzm8GFFXE2QAaxOB1a5XPbb
	4D5DebpkLiQfWlGjYvGL9dcRlgStdy1kgcivuJiZOfQ3Xi7ViwV/iSpQotAHqbVx6KY9Oyj/l9Hzt
	d2/SL0SWeS7PoOpJdgteNnrh3r3i3rtpp12WcZ3PGvzoBliQEtEMUZ/QKtiJLiPTvzsTDQIee1DkL
	+AvUm3yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPeA-00000008zeF-42qG;
	Tue, 03 Dec 2024 09:56:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPOl-00000008w2D-3cr3;
	Tue, 03 Dec 2024 09:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733218850;
	bh=bKDW6ggnTKm/6VAGSsVo0gDuMyIV040k1eYen7uZqfs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NLFW4mjK2zA+akjAzh7lncPcvHiA6Cj2D+A+iwwFmPWFlc3IUHNYtFOL5D9scbgKN
	 QA+gWoCzv9AusbdrCxJ4+gBwtfs15bJC/47dFfHCmy/LOQpLAftujjy5pX3a9IWS+G
	 FD/LYYmQZd02PoxnbAYQOomeHPwsz4OBg/vAWM971AWNgid6recpnIfZIVX7COFPAm
	 CoRQSKVPEtEBOHzkD/o6gtL8yHGGrCn/KlHnYVk1oqxIS1c+fCgffoZ9uph67o6EH7
	 Wuzkmt/ydSIRmGB2t6SGCro4YM1Ze5ofcdXSvdWrV0Fp52tBUBJHFI59NGcc/FK4aJ
	 1B2M+x6BRs7kw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 23BC917E35EA;
	Tue,  3 Dec 2024 10:40:50 +0100 (CET)
Message-ID: <aade3f32-b0c5-4f36-b3e4-f2ff077110e2@collabora.com>
Date: Tue, 3 Dec 2024 10:40:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/18] arm64: dts: mediatek: mt7988: add lvts node
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-5-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202122602.30734-5-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_014052_078268_F5218B47 
X-CRM114-Status: GOOD (  15.79  )
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

Il 02/12/24 13:25, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add Low Voltage Thermal Sensor (LVTS) node for mt7988 SoC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> changes:
> 
> v2:
> squash
> - "arm64: dts: mediatek: mt7988: add label for efuse"
> - "arm64: dts: mediatek: mt7988: extend efuse node" (drop other efuse subnodes)
> ---
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index 5e40446cb7b3..f7748a840297 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -4,6 +4,7 @@
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/pinctrl/mt65xx.h>
> +#include <dt-bindings/reset/mediatek,mt7988-resets.h>
>   
>   / {
>   	compatible = "mediatek,mt7988a";
> @@ -85,6 +86,7 @@ infracfg: clock-controller@10001000 {
>   			compatible = "mediatek,mt7988-infracfg", "syscon";
>   			reg = <0 0x10001000 0 0x1000>;
>   			#clock-cells = <1>;
> +			#reset-cells = <1>;
>   		};
>   
>   		topckgen: clock-controller@1001b000 {
> @@ -250,6 +252,17 @@ i2c@11005000 {
>   			status = "disabled";
>   		};
>   
> +		lvts: lvts@1100a000 {
> +			compatible = "mediatek,mt7988-lvts-ap";
> +			#thermal-sensor-cells = <1>;
> +			reg = <0 0x1100a000 0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_26M_THERM_SYSTEM>;
> +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&infracfg MT7988_INFRA_RST1_THERM_CTRL_SWRST>;
> +			nvmem-cells = <&lvts_calibration>;
> +			nvmem-cell-names = "lvts-calib-data-1";
> +		};
> +
>   		usb@11190000 {
>   			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
>   			reg = <0 0x11190000 0 0x2e00>,
> @@ -307,11 +320,15 @@ clock-controller@11f40000 {
>   			#clock-cells = <1>;
>   		};
>   
> -		efuse@11f50000 {
> +		efuse: efuse@11f50000 {

Okay but why are you adding the efuse handle name to this node?
You're not using it anywhere as far as I can see.

Please drop this change - after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>   			compatible = "mediatek,mt7988-efuse", "mediatek,efuse";
>   			reg = <0 0x11f50000 0 0x1000>;
>   			#address-cells = <1>;
>   			#size-cells = <1>;
> +
> +			lvts_calibration: calib@918 {
> +				reg = <0x918 0x28>;
> +			};
>   		};
>   
>   		clock-controller@15000000 {


