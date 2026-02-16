Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD28E7BD8A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGh5s0g/gXfsFp+8n/dXeKVwQ2ksM3C20e8GNz6qwOM=; b=3Vufpg9rKe2urPl9Gg9ZaLQc6w
	TCm9Aho93ZuuGvG3C+eYGccmh1cxnpisQkCiKIXq7pltlhu4s6/mO8DqBwJ6siQA3vdnfAWjUYQPz
	KcMAXNvNFUn7TY7BG7jm6NV+12/t5xwh6TOew6Ypm+cShJBItz9cezpxjitwTyjvL/GMvs6qaaSaM
	JpoBcgLb7y1kX/L2jPX6X94SPc31RZ+yBw+gKBm+XbkEbpF2L+G7QRl/X5aoNYH13FV7EMCxB2xze
	wGeREe7AYlrOGZqiOdV3rqwC9tK1yaky9n0AZiZ5g8muRfd+xF2R6S/1lNWSjPL7Z4+10Qmc0qktB
	pTgxw7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwUU-00000006QEe-446T;
	Mon, 16 Feb 2026 11:10:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwUP-00000006Q8Y-0BGY;
	Mon, 16 Feb 2026 11:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771240202;
	bh=IntVyqmcKxwafdHrksd0syn7OEBN/YV17IIzQF/SDJU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cScbLoDsYQ16Gwar4SVipw6ik0PXKTC4YzaM2tjFrkkO9ugwNyYHt0Z/yNcPdyqRP
	 BIc8iw3yvxQDe5be6Z1Y8ITFWYqSnPtOoxQxAE6jMtoe2VgxNbUiWObWa87ekYSTdB
	 25Cd0d+q2IdQF2GcBX+et365e3PcENQUpBB0K0fhvEe4fR1DKMGr60mn/7Tp8FH1XJ
	 clUUkQeEFV7yu4vd/cyD+vajyz5paKptYFc+AKbBrij1lesbMKZR2jKCCgsw+EOS29
	 FoiEW+4gs/tKdNJHVI/xjO2KDNr741Q+oG6gtql5TQSjHirxU+yoYt5fnYmwBtIjmw
	 oEBWT5ZKruE7Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C89F017E1517;
	Mon, 16 Feb 2026 12:10:01 +0100 (CET)
Message-ID: <5718e8aa-a9a0-41d4-af15-37441909efc2@collabora.com>
Date: Mon, 16 Feb 2026 12:10:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: mt8167: Add DRM nodes
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi
 <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <cover.1771144723.git.l.scorcia@gmail.com>
 <efed7184f27f7f85e9b811070a072b81e134e57e.1771144723.git.l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <efed7184f27f7f85e9b811070a072b81e134e57e.1771144723.git.l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_031005_304710_AC0588B5 
X-CRM114-Status: GOOD (  17.43  )
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

Il 15/02/26 09:53, Luca Leonardo Scorcia ha scritto:
> Add all the DRM nodes required to get DSI to work on MT8167 SoC.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8167.dtsi | 386 +++++++++++++++++++++++
>   1 file changed, 386 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> index 27cf32d7ae35..c6306234e592 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> @@ -16,6 +16,20 @@
>   / {
>   	compatible = "mediatek,mt8167";
>   
> +	aliases {
> +		aal0 = &aal;
> +		ccorr0 = &ccorr;
> +		color0 = &color;
> +		dither0 = &dither;
> +		dsi0 = &dsi;
> +		gamma0 = &gamma;
> +		ovl0 = &ovl0;
> +		pwm0 = &disp_pwm;
> +		rdma0 = &rdma0;
> +		rdma1 = &rdma1;
> +		wdma0 = &wdma;
> +	};
> +
>   	soc {
>   		topckgen: topckgen@10000000 {
>   			compatible = "mediatek,mt8167-topckgen", "syscon";
> @@ -120,10 +134,371 @@ iommu: m4u@10203000 {
>   			#iommu-cells = <1>;
>   		};
>   
> +		disp_pwm: pwm@1100f000 {
> +			compatible = "mediatek,mt8167-disp-pwm",
> +				     "mediatek,mt8173-disp-pwm";

The compatible strings fit in a single line. Up to 100 columns it's fine: for every
node additions that you're doing, please use a single line wherever you can.

> +			reg = <0 0x1100f000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_DISP_PWM_26M>,
> +				 <&mmsys CLK_MM_DISP_PWM_MM>;
> +			clock-names = "main",
> +				      "mm";

That also includes clock-names and, where possible, also clocks and anything
else really.

> +			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
> +			#pwm-cells = <2>;
> +			status = "disabled";
> +		};
> +
>   		mmsys: syscon@14000000 {
>   			compatible = "mediatek,mt8167-mmsys", "syscon";
>   			reg = <0 0x14000000 0 0x1000>;
> +			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
>   			#clock-cells = <1>;
> +
> +			port {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				mmsys_main: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&ovl0_in>;
> +				};
> +
> +				mmsys_ext: endpoint@1 {
> +					reg = <1>;
> +					remote-endpoint = <&rdma1_in>;
> +				};

Nice! Thanks for expressing those connections with an OF Graph. That makes things
simpler for other devices based on the same SoC.

> +			};
> +		};
> +
> +		ovl0: ovl0@14007000 {
> +			compatible = "mediatek,mt8167-disp-ovl";
> +			reg = <0 0x14007000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_DISP_OVL0>;
> +			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_LOW>;
> +			iommus = <&iommu M4U_PORT_DISP_OVL0>;
> +			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0>;

For OVL, RDMA, COLOR, CCORR, and others, you have only one endpoint.

Since there is only one, you can compress the nodes and avoid the text bloat
(and please do), by declaring the nodes like:

			ports {
				#address-cells = <1>;
				#size-cells = <0>;

				port@0 {
					reg = <0>;
					ovl0_in: endpoint {
						remote-endpoint = <&mmsys_main>;
					};
				};

				port@1 {
					reg = <1>;
					ovl0_out: endpoint {
						remote-endpoint = <&color_in>;
					};
				};
			};

Please do this for all nodes where you have only a single endpoint (so, for
everything but mmsys).


> +					ovl0_in: endpoint@0 {
> +						reg = <0>;
> +						remote-endpoint = <&mmsys_main>;
> +					};
> +				};
> +
> +				port@1 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <1>;
> +					ovl0_out: endpoint@0 {
> +						reg = <0>;
> +						remote-endpoint = <&color_in>;
> +					};
> +				};
> +			};
> +		};

...snip...

> +
> +		dsi: dsi@14012000 {
> +			compatible = "mediatek,mt8167-dsi",
> +				     "mediatek,mt2701-dsi";
> +			reg = <0 0x14012000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_DSI_ENGINE>,
> +				 <&mmsys CLK_MM_DSI_DIGITAL>,
> +				 <&mipi_tx>;
> +			clock-names = "engine", "digital", "hs";
> +			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_LOW>;
> +			phys = <&mipi_tx>;
> +			phy-names = "dphy";
> +			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
> +			status = "disabled";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;

..snip..

> +
> +				port@1 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <1>;
> +					dsi_out: endpoint@0 {
> +						reg = <0>;
> +					};
> +				};

That's shorter, and simpler:
				port@1 {
					reg = <1>;
					dsi_out: endpoint { };
				};

> +			};
> +		};
> +
> +		mutex: mutex@14015000 {
> +			compatible = "mediatek,mt8167-disp-mutex";
> +			reg = <0 0x14015000 0 0x1000>;
> +			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
>   		};
>   
>   		larb0: larb@14016000 {
> @@ -145,6 +520,17 @@ smi_common: smi@14017000 {
>   			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
>   		};
>   
> +		mipi_tx: dsi-phy@14018000 {
> +			compatible = "mediatek,mt8167-mipi-tx",
> +				     "mediatek,mt2701-mipi-tx";

Fits in a single line :-)

> +			reg = <0 0x14018000 0 0x90>;
> +			clocks = <&topckgen CLK_TOP_MIPI_26M_DBG>;
> +			clock-output-names = "mipi_tx0_pll";
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>   		imgsys: syscon@15000000 {
>   			compatible = "mediatek,mt8167-imgsys", "syscon";
>   			reg = <0 0x15000000 0 0x1000>;
Nice job, btw.

Cheers,
Angelo


