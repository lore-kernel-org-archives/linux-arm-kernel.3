Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98088C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHeicNU1qEebF1X7wLzOEGzzgexrpimC+cuu8Qzkpaw=; b=RwsuFuFjezqH2f9tppIK/dbjEd
	+bq1Qtwx2g9nKR3sSuBrdmV6/ZVnL1sXeimsewM74QuArlPAkXaYk2jtR/RLHy88+bJNfNloSWJi1
	R/RbWwH8hDjg+TKOyHecufWFsjyQcSYxPi/jR/PzLnhQ0AXLSR2QahpgGMBrs9fTjR1xJCMSrTXFq
	UsUgQ1UASvCBvEUBWzunFjiCwaPzJAkLdPpey2CYolXmctqcpkN24epQ3eG04aLmA1Ap3yGLcKTnW
	MhlyvYVG1/8frQA2ePDGX2tkejIBrehWWqmABvUymlZmxbUG2KrC/FhcLutbVzhfxlv7ihXL9GH6d
	x1ApyHvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMkt-0000000A9Ys-2PVP;
	Wed, 11 Jun 2025 14:48:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHqG-00000009UBO-2PKp;
	Wed, 11 Jun 2025 09:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nHeicNU1qEebF1X7wLzOEGzzgexrpimC+cuu8Qzkpaw=; b=T9YWnu29IaFGXmi+3DtuetcokL
	0yzMC4se+lxtWfyQbpw2gipwgFvsye1VfNDsNMBKAZwR53M/YabU1YRwHuC7evwRjpJIpqsc0mDef
	hS4MWrrWif6ct6Xk1jBP1EDpd6jHsXusMcxmTOtS1LG6l6POLXnYptWxCniUWFrUjhn/rtAimHr8l
	jrmGr9mZ0s0xVzeomwL2D93w0e/23scjaX9/eeFnue6FbyH69cj3UXo3gkat+kpP9B+Z3DpNQuJ2h
	pD5xPDQB33/0rLr0UzLy3WczLMbjVPi+1JJ92mq+Hz8cZZ+XNkt8pMzOjXsKXdEl096HF5xpUkMqX
	b2FckI/Q==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHqE-00000002EaZ-2shq;
	Wed, 11 Jun 2025 09:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749634432;
	bh=wc/ooy51RhFVYkSFSjjYHTGOfC/0EUimTjaFo+b0Gys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jyg1Jl9gXIXL3XiwY+cRetV2WE9L4pUNAmtn5lc1h7T9Jfv7tQzpHib9cqo2BFPkb
	 go28/1uZQpHHUtG99wrMPWsoMxgMe1C+f+uZHpeE11M5eNgZa24YQFrv7iPFRgFyWT
	 3gZUU7dLs4eHKaiSyTliAmyRr4ifEYkuewdsnz2sm1Bxf9zm4O4EER1uiqSjB+nOyH
	 m4fKM81ynGkouNbtvhZczw9G91jz1eNgjsL7Qa+aDQVxAitXPLUeArtTuyz2vDYH74
	 YA41fSjJoV41l8Rym7w5l/mtkmWhc6g/Iu5RRUtqv5ywZvWacFNAzYNu+M5Yd3JpFo
	 uW1g2+nDtzZ2g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5669C17E1045;
	Wed, 11 Jun 2025 11:33:51 +0200 (CEST)
Message-ID: <a50c0a9f-1846-4542-97a0-fb9563ed3b3a@collabora.com>
Date: Wed, 11 Jun 2025 11:33:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] arm64: dts: mediatek: mt7988: add switch node
To: Frank Wunderlich <linux@fw-web.de>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-8-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250608211452.72920-8-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_103354_973105_1FA760BB 
X-CRM114-Status: GOOD (  13.96  )
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

Il 08/06/25 23:14, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add mt7988 builtin mt753x switch nodes.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - drop labels and led-function too (have to be in board)
> ---
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 153 ++++++++++++++++++++++
>   1 file changed, 153 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index ee1e01d720fe..0b35a32b9c89 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -742,6 +742,159 @@ ethsys: clock-controller@15000000 {
>   			#reset-cells = <1>;
>   		};
>   
> +		switch: switch@15020000 {
> +			compatible = "mediatek,mt7988-switch";
> +			reg = <0 0x15020000 0 0x8000>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +			interrupt-parent = <&gic>;

You don't need interrupt-parent, it's already GIC here... :-)

> +			interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&ethwarp MT7988_ETHWARP_RST_SWITCH>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				gsw_port0: port@0 {
> +					reg = <0>;

Keep it ordered alphabetically - phy-handle (h) before phy-mode (m)

> +					phy-mode = "internal";
> +					phy-handle = <&gsw_phy0>;
> +				};
> +
> +				gsw_port1: port@1 {
> +					reg = <1>;
> +					phy-mode = "internal";
> +					phy-handle = <&gsw_phy1>;
> +				};
> +
> +				gsw_port2: port@2 {
> +					reg = <2>;
> +					phy-mode = "internal";
> +					phy-handle = <&gsw_phy2>;
> +				};
> +
> +				gsw_port3: port@3 {
> +					reg = <3>;
> +					phy-mode = "internal";
> +					phy-handle = <&gsw_phy3>;
> +				};
> +
> +				port@6 {
> +					reg = <6>;
> +					ethernet = <&gmac0>;
> +					phy-mode = "internal";
> +
> +					fixed-link {
> +						speed = <10000>;
> +						full-duplex;
> +						pause;
> +					};
> +				};
> +			};
> +
> +			mdio {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				mediatek,pio = <&pio>;
> +
> +				gsw_phy0: ethernet-phy@0 {
> +					compatible = "ethernet-phy-ieee802.3-c22";
> +					reg = <0>;
> +					interrupts = <0>;
> +					phy-mode = "internal";
> +					nvmem-cells = <&phy_calibration_p0>;
> +					nvmem-cell-names = "phy-cal-data";

phy-mode (p) after nvmem-cell-names (n) please (here and everywhere else)

> +
> +					leds {
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +
> +						gsw_phy0_led0: led@0 {
> +							reg = <0>;
> +							status = "disabled";
> +						};
> +
> +						gsw_phy0_led1: led@1 {
> +							reg = <1>;
> +							status = "disabled";
> +						};
> +					};
> +				};
> +
> +				gsw_phy1: ethernet-phy@1 {
> +					compatible = "ethernet-phy-ieee802.3-c22";
> +					reg = <1>;
> +					interrupts = <1>;
> +					phy-mode = "internal";
> +					nvmem-cells = <&phy_calibration_p1>;
> +					nvmem-cell-names = "phy-cal-data";
> +
> +					leds {
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +
> +						gsw_phy1_led0: led@0 {
> +							reg = <0>;
> +							status = "disabled";
> +						};
> +
> +						gsw_phy1_led1: led@1 {
> +							reg = <1>;
> +							status = "disabled";
> +						};
> +					};
> +				};
> +
> +				gsw_phy2: ethernet-phy@2 {
> +					compatible = "ethernet-phy-ieee802.3-c22";
> +					reg = <2>;
> +					interrupts = <2>;
> +					phy-mode = "internal";
> +					nvmem-cells = <&phy_calibration_p2>;
> +					nvmem-cell-names = "phy-cal-data";
> +
> +					leds {
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +
> +						gsw_phy2_led0: led@0 {
> +							reg = <0>;
> +							status = "disabled";
> +						};
> +
> +						gsw_phy2_led1: led@1 {
> +							reg = <1>;
> +							status = "disabled";
> +						};
> +					};
> +				};
> +
> +				gsw_phy3: ethernet-phy@3 {
> +					compatible = "ethernet-phy-ieee802.3-c22";
> +					reg = <3>;
> +					interrupts = <3>;
> +					phy-mode = "internal";
> +					nvmem-cells = <&phy_calibration_p3>;
> +					nvmem-cell-names = "phy-cal-data";
> +
> +					leds {
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +
> +						gsw_phy3_led0: led@0 {
> +							reg = <0>;
> +							status = "disabled";
> +						};
> +
> +						gsw_phy3_led1: led@1 {
> +							reg = <1>;
> +							status = "disabled";
> +						};
> +					};
> +				};
> +			};
> +		};
> +
>   		ethwarp: clock-controller@15031000 {
>   			compatible = "mediatek,mt7988-ethwarp";
>   			reg = <0 0x15031000 0 0x1000>;



