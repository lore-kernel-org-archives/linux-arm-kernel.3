Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA00D6ACD4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 13:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPekYE1pPkncuBt1h+nYrXvfslUtom7GbUmJwzQREOU=; b=WbiFPEeuV1pyxt8TOurWkCOUMn
	n0AcKnVWP2NejCwWI0EO9n62RhEoYIHVY6XtnTS+qcFbmYL0QpwEWRs/IDZOw94mTz1975R8R+0cD
	ZvHZY8wXOBTtAzw+K9bRw7+jmzfYBmRID7EuCJ337s4gPjZrfSclAkHqzwdW46xbXTJC5EYfx73bF
	0jaCTY7cmVFjCbmOaD9luzx5UJpptjArnJaoIciKyhgKs03wI+QDXUoy+9hDF5ytZim5Jp9F2K0hQ
	23x3NAY1dWky8sjPOO4A7uf4p7e9MPjZ+J7OW9aIjr+K6p+aG2gZTmWwheXN9shDRJXnha6252bxL
	wxHpMqEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIGc-0000000DGH3-32rk;
	Wed, 27 Nov 2024 13:39:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIBv-0000000DFNZ-2w83;
	Wed, 27 Nov 2024 13:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732714490;
	bh=T3PqAZ1gv2KDsHreRq8BGjwnMaVHeqx9vPlukKqRFu8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bS9JR0IJQiyd1jIu3rf3OiTJt5mRv9NpWUTkJPT00SuCJV7IiSKeIZRU0DLxH5923
	 QgLLy6xzB1/8l4spxihGoLch5OVoxQ8nWXskcweSkqTOaNuzhHrup3bz3Wjenpwja9
	 aeCVXi+q8YvaE/0ZwPes+C8G3zQxOMOlO9+MGk4WpaJKt23JUfhRqhOWim7fMR0ff7
	 fP37a6S6Bt6zzpcowK5hj3uwFVIVc+5s6+jXBvu9i1cnoflWGDK81CFgBeBtxXJJ3W
	 UrZKMNuo3rBesXcDWU5DTDnsrW43zRj917jbb/avJ+gOFWvLPFHIyKSyPzLqiCs6cG
	 d05uFtampZ8mg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B80C317E374E;
	Wed, 27 Nov 2024 14:34:49 +0100 (CET)
Message-ID: <6725747d-2db4-4f80-be25-4b314e59ab9a@collabora.com>
Date: Wed, 27 Nov 2024 14:34:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 10/14] arm64: dts: mediatek: mt7988: add lvts node
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241029103937.45852-1-linux@fw-web.de>
 <20241029103937.45852-11-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241029103937.45852-11-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_053451_909100_670935CC 
X-CRM114-Status: GOOD (  12.92  )
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

Il 29/10/24 11:39, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add Low Voltage Thermal Sensor (LVTS) node for mt7988 SoC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Please add the lvts_calibration nvmem entry in this commit instead.

Cheers,
Angelo

> ---
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index ed8ce1e6f68b..de9a9ff2edd8 100644
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
> @@ -103,6 +104,7 @@ infracfg: clock-controller@10001000 {
>   			compatible = "mediatek,mt7988-infracfg", "syscon";
>   			reg = <0 0x10001000 0 0x1000>;
>   			#clock-cells = <1>;
> +			#reset-cells = <1>;
>   		};
>   
>   		topckgen: clock-controller@1001b000 {
> @@ -268,6 +270,17 @@ i2c2: i2c@11005000 {
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
>   		ssusb0: usb@11190000 {
>   			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
>   			reg = <0 0x11190000 0 0x2e00>,


