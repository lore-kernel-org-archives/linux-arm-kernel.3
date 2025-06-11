Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5B3C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 09:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBtgMGvbT5+A2Zrno825asKsp/MTUf+mDV3vojIadYo=; b=brYBo8a64AbS9XYcLYNvy9XHnJ
	KgRXxmTcMg2aNMObAoKzDz2QPjIZ7Doxrai8s8P4keOZ0WBHxJOKEzKJSfJzrrLQRUPjiUnpP0o6N
	WsoK2GQqQt4JQ8eLHp9c6V+gWjULxtUrbNLXUja6KJSHZSga+Fzs6uoX47zM8LGS3YyiUqpMYYkWp
	Js+86RfJd4os01MBrKiMWX8yWLmbJknd9dUc+QmL1QczrBdBLwDgME74QYYBYD5LZvpliWbhLPv6a
	4vAR5j/0t142OzuSi+9iZSMGvbEyy4ZCE4D+RJEWTYjerIu86gU+Rnpp6WfOmeWoXe/HqhQO/4Ge7
	Qm0tcGBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHy5-00000009Vgh-3b0U;
	Wed, 11 Jun 2025 09:42:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHq4-00000009U92-0TK3;
	Wed, 11 Jun 2025 09:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aBtgMGvbT5+A2Zrno825asKsp/MTUf+mDV3vojIadYo=; b=Lfa/ZiyaFewLbzBvBbQmEFGe1f
	syjWUfhLmPSoNeLbN5s7W5x+su24kQVDRyL2EFRs/FwSescOFnDnhVnCK+772LgxUd2M8zvPLhhxx
	cfL1oSD5gLaN6euuJQUFcE54FESKx3NxjYPCEPQNru21sgmWT3TDJ1WeIOtgueKMcmo+dUmubxwBC
	GsX4BdbaH2CBXiBlhmmMfgRxc/FxZ/ULLj/HCVIMF0MnwFJNwslS1SBB9/Tk4wn2GkXYuk2dfzplg
	7qvCJTLI8C7MXDYajaF8Ti/A5h+JV6AQ/1K4OkL7LAYsVRFuAIY9duMobf7+0MDk6Lz7veSXHzD33
	InmM0Irw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHq2-00000002EXh-0xCA;
	Wed, 11 Jun 2025 09:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749634420;
	bh=iZRMsUTO/sHIde2R5o95I83Ls9f+Je5NTObQ20FW4lg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YQtxycrvDTsiKzL6sOJuBJftKXuuNSx7cBuTXaWybtsB+6/efYFAxBpfiLnfKoB5u
	 Yk4l59hj8HierCGRy9+ZGpL7x8y3PQfJul+YKaKWI2M9JVsqQLXj4/iPa9bx5fxfYf
	 zltbemEGEGA3shlWIa2Il34qSakPX2wAKqjwfY2f1FeoBaiCWJvUYWuLaYCLf/I/zQ
	 8mwljBUil21GgLqzES7Gx/gsWTK+KY7SjTvIbZYYDKeoRjfmIXvOP8YBUs45gRw4ty
	 gK1qYTvhI+n6i6/gO58rbXYFAeakLTXta3upJ0T7gpdesiLhHiZn4/Dhk6oo4frFbh
	 tggdFCeKYgDUA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6FDE417E101A;
	Wed, 11 Jun 2025 11:33:38 +0200 (CEST)
Message-ID: <37c7ac6c-a5ea-45cc-8ded-9d9bb22d092e@collabora.com>
Date: Wed, 11 Jun 2025 11:33:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/13] arm64: dts: mediatek: mt7988a-bpi-r4: add sfp
 cages and link to gmac
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
 <20250608211452.72920-13-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250608211452.72920-13-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_103342_438179_C2950AAE 
X-CRM114-Status: GOOD (  16.97  )
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
> Add SFP cages to Bananapi-R4 board. The 2.5g phy variant only contains the
> wan-SFP, so add this to common dtsi and the lan-sfp only to the dual-SFP
> variant.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v3:
> - enable mac with 2.5g phy on r4 phy variant because driver is now mainline
> ---
>   .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts   | 12 ++++++++++++
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts   | 18 ++++++++++++++++++
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi  | 18 ++++++++++++++++++
>   3 files changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
> index 53de9c113f60..e63e17ae35a0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
> @@ -9,3 +9,15 @@ / {
>   	model = "Banana Pi BPI-R4 (1x SFP+, 1x 2.5GbE)";
>   	chassis-type = "embedded";
>   };
> +
> +&gmac1 {

phy = ...
phy-c..onnection-type
phy-m...ode

> +	phy-mode = "internal";
> +	phy-connection-type = "internal";
> +	phy = <&int_2p5g_phy>;
> +	status = "okay";
> +};
> +
> +&int_2p5g_phy {
> +	pinctrl-names = "i2p5gbe-led";
> +	pinctrl-0 = <&i2p5gbe_led0_pins>;

pinctrl-names
pinctrl-0

> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
> index 36bd1ef2efab..3136dc4ba4cc 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
> @@ -8,6 +8,24 @@ / {
>   	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
>   	model = "Banana Pi BPI-R4 (2x SFP+)";
>   	chassis-type = "embedded";
> +
> +	/* SFP2 cage (LAN) */
> +	sfp2: sfp2 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&i2c_sfp2>;

maximum-power-milliwatt here
(blank line)
...then gpios

> +		los-gpios = <&pio 2 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpios = <&pio 83 GPIO_ACTIVE_LOW>;

(r)ate-select0-gpios before (t)x-disable....

> +		tx-disable-gpios = <&pio 0 GPIO_ACTIVE_HIGH>;
> +		tx-fault-gpios = <&pio 1 GPIO_ACTIVE_HIGH>;
> +		rate-select0-gpios = <&pio 3 GPIO_ACTIVE_LOW>;
> +		maximum-power-milliwatt = <3000>;
> +	};
> +};
> +
> +&gmac1 {
managed
phy-mode
sfp

> +	sfp = <&sfp2>;
> +	managed = "in-band-status";
> +	phy-mode = "usxgmii";
>   };
>   
>   &pca9545 {
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> index 20073eb4d1bd..d8b9cd794ee3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> @@ -63,6 +63,18 @@ reg_3p3v: regulator-3p3v {
>   		regulator-boot-on;
>   		regulator-always-on;
>   	};
> +
> +	/* SFP1 cage (WAN) */
> +	sfp1: sfp1 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&i2c_sfp1>;

(same comments from sfp2)

> +		los-gpios = <&pio 54 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpios = <&pio 82 GPIO_ACTIVE_LOW>;
> +		tx-disable-gpios = <&pio 70 GPIO_ACTIVE_HIGH>;
> +		tx-fault-gpios = <&pio 69 GPIO_ACTIVE_HIGH>;
> +		rate-select0-gpios = <&pio 21 GPIO_ACTIVE_LOW>;
> +		maximum-power-milliwatt = <3000>;
> +	};
>   };
>   
>   &cci {
> @@ -133,6 +145,12 @@ map-cpu-active-low {
>   	};
>   };
>   
> +&gmac2 {

(same comments from gmac1)

> +	sfp = <&sfp1>;
> +	managed = "in-band-status";
> +	phy-mode = "usxgmii";
> +};
> +
>   &i2c0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&i2c0_pins>;


Cheers,
Angelo

