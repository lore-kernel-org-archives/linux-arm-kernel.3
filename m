Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EE5C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vh9Xz0z7OiS4ofBIj3fyQWSQjX/C6PXbtjaOP2WulQI=; b=xopNPDfJiLI1VVerWAPkxn4RwU
	hwvRL562IX4+T19WeCN4GpfIhGblWu3i+Jq1xtU3N5GzyqtE7gNMJ9kKc7U7ZanJwRju6tBuy3PDG
	7lYIKZTWwcR2noJ+kXkLMjJ0WACQgE0AZaCrDLpERZCwGtYD5v/n4qF97lCaghbPeDvs+gRFm2ISz
	/ksZOLt0IVFZP/b2iqzZtpJe35C0cdzReqFOmdlMLYTB/RSAz3WR20j5HsRE/kuPB7azRJE2Er7ZU
	WnPs4Fawz5I81flB2r7NtTOOk1axgsGyE4EwN9cEqsLlQiQX8YJtWKP6/MrrsGACsmg7uTGTQxMXo
	KIzaFtXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl91y-00000001k9Y-2vO9;
	Thu, 20 Feb 2025 16:04:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8wx-00000001iek-2nF7;
	Thu, 20 Feb 2025 15:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740067134;
	bh=Kos+DGfj4UcSE7PWFsm4JxiAjanMiFXuRS8fX8RLC40=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CZ3NeBh09m5iEN9Y83oNd0toGDYXbFuapo1ZPhFtl5wB/wFPcLsL++KIJriKxuZOB
	 0ZS2t1b5fUxJFu3tybbtxlsuWxjijHN4smfQJVgMmPBlA1Qe+AABHOTXojCJiArRbM
	 OoJE0Z2Gm0NMwnVV+OYRQbzVAIH1l+DGbrt8F+LUIwiUuw+e6ZTwRMT+IKLV2/+uQz
	 TsTrHp9ItkWV/YYR5vHFc8AdwHoFnAwGCHW4uW/CpftiwMMlt/yu1SgTNe2pVgYqyL
	 U4lnLadsLIoHD8WZn1vsF2Q9OdVY0Mmlv3ufW/QGenRes0F8qrG4MYSFpHadzbAhmS
	 1CuoUB/R7wh1A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1042917E1247;
	Thu, 20 Feb 2025 16:58:53 +0100 (CET)
Message-ID: <cb392432-e452-4460-ace6-54b3649aed52@collabora.com>
Date: Thu, 20 Feb 2025 16:58:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: mediatek: mt8395-genio-1200-evk: add
 support for TCPC port
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-usb@vger.kernel.org, Chris-qj chen <chris-qj.chen@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Yow-Shin Liou <yow-shin.liou@mediatek.com>,
 Simon Sun <simon.sun@yunjingtech.com>
References: <20250220143354.2532448-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250220143354.2532448-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_075855_996893_982F09AD 
X-CRM114-Status: GOOD (  20.97  )
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

Il 20/02/25 15:33, Macpaul Lin ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Enable USB Type-C support on MediaTek MT8395 Genio 1200 EVK by adding
> configuration for TCPC Port, USB-C connector, and related settings.
> 
> Configure dual role switch capability, set up PD (Power Delivery) profiles,
> and establish endpoints for SS (SuperSpeed) and HS (HighSpeed) USB.
> 
> Update pinctrl configurations for U3 P0 VBus default pins and set dr_mode
> to "otg" for OTG (On-The-Go) mode operation.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Yow-Shin Liou <yow-shin.liou@mediatek.com>
> Signed-off-by: Simon Sun <simon.sun@yunjingtech.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>   .../dts/mediatek/mt8395-genio-1200-evk.dts    | 72 +++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 
> Changes for v2:
>   - Drop the no need '1/2' DT Schema update patch in the 1st version.
>   - Fix indent for 'ports' node, it should under the 'connector' node.
>   - Correct the index for 'port@0' and 'port@1' node.
> 
> Changes for v3:
>   - Correct the order between new added nodes.
> 
> Changes for v4:
>   - Reorder for property 'op-sink-microwatt'.
>   - Fix indentation for 'source-pdos' and 'sink-pdos' nodes.
>   - Correct node 'pin-cmd-dat' with 'pins-vbus'.
>   - Add both Highspeed and Superspeed ports to ssusb0 port.
>   - Set 'role-switch-default-mode' = "peripheral" for ssusb0 port.
>   - Rename endpoint of USB data port to 'mtu3_hs0_role_sw' and
>     'mtu3_ss0_role_sw'.
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> index 1ef6262b65c9..ca039c8e4c71 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> @@ -330,6 +330,47 @@ mt6360_ldo7: ldo7 {
>   				regulator-always-on;
>   			};
>   		};
> +
> +		tcpc {
> +			compatible = "mediatek,mt6360-tcpc";
> +			interrupts-extended = <&pio 17 IRQ_TYPE_LEVEL_LOW>;
> +			interrupt-names = "PD_IRQB";
> +
> +			connector {
> +				compatible = "usb-c-connector";
> +				label = "USB-C";
> +				data-role = "dual";
> +				op-sink-microwatt = <10000000>;
> +				power-role = "dual";
> +				try-power-role = "sink";

Would be appreciated if you could also complete the node by adding the pd-revision
property, enabling full USBC Power Delivery for the MT6360 PMIC.

Same for the alternate modes, adding the DP alt mode is a matter of seconds... and
well, it does sound a bit weird to add alternate modes without a mux... so, in this
case you can choose either to:
  - Squash the two commits (tcpc, it5205) and do everything in one; or
  - Add the alternate mode node to the connector in the commit introducing the mux.

Either of the two options is okay for me, so you choose.

> +
> +				source-pdos = <PDO_FIXED(5000, 1000,
> +							 PDO_FIXED_DUAL_ROLE |
> +							 PDO_FIXED_DATA_SWAP)>;
> +				sink-pdos = <PDO_FIXED(5000, 2000,
> +						       PDO_FIXED_DUAL_ROLE |
> +						       PDO_FIXED_DATA_SWAP)>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						typec_con_hs: endpoint {
> +							remote-endpoint = <&mtu3_hs0_role_sw>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						typec_con_ss: endpoint {
> +							remote-endpoint = <&mtu3_ss0_role_sw>;
> +						};
> +					};
> +				};
> +			};
> +		};
>   	};
>   };
>   
> @@ -755,6 +796,13 @@ pins-reset {
>   		};
>   	};
>   
> +	u3_p0_vbus: u3-p0-vbus-default-pins {
> +		pins-vbus {
> +			pinmux = <PINMUX_GPIO63__FUNC_VBUSVALID>;
> +			input-enable;
> +		};
> +	};
> +
>   	uart0_pins: uart0-pins {
>   		pins {
>   			pinmux = <PINMUX_GPIO98__FUNC_UTXD0>,
> @@ -885,8 +933,32 @@ &ufsphy {
>   };
>   
>   &ssusb0 {
> +	dr_mode = "otg";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&u3_p0_vbus>;
> +	role-switch-default-mode = "peripheral";

There's no need for a default mode here, luckily the MediaTek MTU3 controllers
don't need that for real :-)

Drop please.

Cheers,
Angelo



