Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864FBC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 11:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMOcSA5wqcgE8nAmktqndleVw9SAFaq1v/vrcxDjvJ0=; b=mRhz/ErATDzDsINmhchaTdXC++
	tTdCvZq7C4jokksuqsUVEWwgtfy+6gdU5iYrUhmLENLRUmHMFiWpwGG96KCSTV02u5Nm+x3k6upA5
	2T4SrppmYzph/zxYYYWo2FKqePD9NsYQcmaq/I+4JeEFMZ7OCyY3djz9iymdAQRxunaCLBfFetrlF
	QOTsAxUUn3t5aa0dAnW1VQ0HYNTkd+P8SAe0aptPSuAo9j3SheSuYL5rpZG++uKoz8vJqqGYxPwtY
	x6FiHqzte/N3fm6FERb9XEh3cKe2kWdmL88n29KVjyBinEUer54xr++9nap8XEeUuZlr/IepOVaHZ
	8wOI2FZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLId-0000000Cfgp-1TPm;
	Tue, 20 May 2025 11:38:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHL83-0000000CdjL-0SjU;
	Tue, 20 May 2025 11:27:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747740445;
	bh=F8a6adaotmO9OFJk2lV6zJwLtEE1bNQqk3sdSWmUODU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P8SRquc/6RmoHWKXfMC2MT4Sn7ljY4RBbPhkcOcQhdXZGtrP8Fogm9M1uF7Q788oT
	 2ILTvSGALDAITwCMLhIiQ8UCK7Urew5Go0Ec0U+9AV4epkUXSvdAfaeke0psbGaibE
	 eb0BpNpsx3Z9UvzEU13Hx8che2VE3ZpRzEFtCjakFxVqug05oXEwY4dRyUDSPyxXg8
	 pMGmjfNS9i4Mn67v3Lzp7y1ySHoCAKKaDWnAebNRyMNnmyf8Pcn7B9vkxIapgo5tOl
	 YavD0qx5ieU9Ku39uxV/OvxJQDUkJsH3NZBXOllcNQ3Q2fkZbwoqCxinhCrBtoYjdf
	 vcRqi6I2hPm4g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D0F2217E0E89;
	Tue, 20 May 2025 13:27:23 +0200 (CEST)
Message-ID: <7a563716-a7c6-446d-b66d-bc71c6207ef6@collabora.com>
Date: Tue, 20 May 2025 13:27:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/14] arm64: dts: mediatek: mt7988: add cci node
To: Frank Wunderlich <linux@fw-web.de>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250516180147.10416-1-linux@fw-web.de>
 <20250516180147.10416-8-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250516180147.10416-8-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_042727_374378_BACAC89B 
X-CRM114-Status: GOOD (  15.51  )
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

Il 16/05/25 20:01, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add cci devicetree node for cpu frequency scaling.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 33 +++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index ab6fc09940b8..64466acb0e71 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -12,6 +12,35 @@ / {
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> +	cci: cci {
> +		compatible = "mediatek,mt8183-cci";

While you can keep the mediatek,mt8183-cci fallback, this needs its own compatible
as "mediatek,mt7988-cci", therefore, I had to drop this patch from the ones that I
picked.

Please add the new compatible both here and in the binding.

Cheers,
Angelo

> +		clocks = <&mcusys CLK_MCU_BUS_DIV_SEL>,
> +			 <&topckgen CLK_TOP_XTAL>;
> +		clock-names = "cci", "intermediate";
> +		operating-points-v2 = <&cci_opp>;
> +	};
> +
> +	cci_opp: opp-table-cci {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +		opp-480000000 {
> +			opp-hz = /bits/ 64 <480000000>;
> +			opp-microvolt = <850000>;
> +		};
> +		opp-660000000 {
> +			opp-hz = /bits/ 64 <660000000>;
> +			opp-microvolt = <850000>;
> +		};
> +		opp-900000000 {
> +			opp-hz = /bits/ 64 <900000000>;
> +			opp-microvolt = <850000>;
> +		};
> +		opp-1080000000 {
> +			opp-hz = /bits/ 64 <1080000000>;
> +			opp-microvolt = <900000>;
> +		};
> +	};
> +
>   	cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
> @@ -25,6 +54,7 @@ cpu0: cpu@0 {
>   				 <&topckgen CLK_TOP_XTAL>;
>   			clock-names = "cpu", "intermediate";
>   			operating-points-v2 = <&cluster0_opp>;
> +			mediatek,cci = <&cci>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -36,6 +66,7 @@ cpu1: cpu@1 {
>   				 <&topckgen CLK_TOP_XTAL>;
>   			clock-names = "cpu", "intermediate";
>   			operating-points-v2 = <&cluster0_opp>;
> +			mediatek,cci = <&cci>;
>   		};
>   
>   		cpu2: cpu@2 {
> @@ -47,6 +78,7 @@ cpu2: cpu@2 {
>   				 <&topckgen CLK_TOP_XTAL>;
>   			clock-names = "cpu", "intermediate";
>   			operating-points-v2 = <&cluster0_opp>;
> +			mediatek,cci = <&cci>;
>   		};
>   
>   		cpu3: cpu@3 {
> @@ -58,6 +90,7 @@ cpu3: cpu@3 {
>   				 <&topckgen CLK_TOP_XTAL>;
>   			clock-names = "cpu", "intermediate";
>   			operating-points-v2 = <&cluster0_opp>;
> +			mediatek,cci = <&cci>;
>   		};
>   
>   		cluster0_opp: opp-table-0 {



