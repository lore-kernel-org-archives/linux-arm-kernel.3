Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288AED7833F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCunVkGnSTI31S803My8tvIxEPhX4zlUciElROu8M7g=; b=C8FRyZ9NknRxsGZtQh2A0OL67s
	h/Vdd2YW1qa1YyQcBPDD7wSqddlAUoFUgpPgSZvQ+JkpvGFb6W2ra7BogtVHGw/CUIYNW67N5ZN3G
	3LosjBMJSGkkW5w6a68iHp0hPZumpVK3ea/j4nRNWVU59VoXDA+VwZpFVR3G6TY+EH9MXsDQmtB0+
	WZCyx+HRbrxkhQgm6AvNHZPDNeWqiP9UY1RuJlEuINUfBrrza86lKjW5RSo4CfmszU5hkhvzOCfCl
	Nw/d089GaEvliQ3og1RLs4q8F7O7qAA9V/ownObfjTs1fr6aVhr36LoC4Jg+/0cPUlA0ZoR15gP7e
	Lk+OMYTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPh5-000000090AE-0tbo;
	Tue, 03 Dec 2024 09:59:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPOq-00000008w4i-29Rr;
	Tue, 03 Dec 2024 09:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733218855;
	bh=5ZyzNz0Sm72FrIcgVg1yVZzQ3dql7Zb+xQ3cpLxHlmw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KdaG89f/LuAnqDL4HVE+B6vJoIfLwKvzcCgitdsS3+WHMcm2brwUit+Zffjesr+5y
	 OjpU0Sv4rChCUA8mWUFwy+fAC1Px9wQLXki3hkKo/ZczvorUu87L6NPkGwhbCYzoxk
	 SIjfrxQX/ZLKd8VZLSCgYO5/vtnjl96la66EF0BEx87yLXzyXaUkC7Ww9A9nFlTd9n
	 VqO8Aj6FZ/JL/1y63TJO5M9ZKAvULWpu2Y1z1a9pbXE640o5lp2Pok469RpOLvfhND
	 3almUWDDxSb8mtnv6QPqcot1WMH9mRQ61lRO496fceZHh7IfC8QxAwMIFlbs/OTax9
	 XiPI7CaSxIJvQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF94E17E35E0;
	Tue,  3 Dec 2024 10:40:54 +0100 (CET)
Message-ID: <016b77dc-2d33-4639-b241-2574ad877971@collabora.com>
Date: Tue, 3 Dec 2024 10:40:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/18] arm64: dts: mediatek: mt7988: add fixed
 regulators for 1v8 and 3v3
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-4-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202122602.30734-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_014056_701723_1FAB7C69 
X-CRM114-Status: GOOD (  15.77  )
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
> Add regulator nodes used for mmc to Bananapi R4 board.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

If you're adding the eMMC regulators, I assume that there's an eMMC, or that even
if there's no device in some version of the board, these two regulators are always
assigned to the eMMC device - right?

You should, at this point, do exactly that: you can leave the mmc0 disabled and
only enable it in a DTBO.

&mmc0 {
	/* eMMC gets enabled by DTBO if present */
	vmmc-supply = <&reg_3p3v>;
	vqmmc-supply = <&reg_1p8v>;
};

Cheers,
Angelo

> ---
> v2:
> - move mmc regulators to board dts of bpi-r4
> ---
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts   | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
> index d914eae2b524..df53512c6890 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
> @@ -8,6 +8,24 @@ / {
>   	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
>   	model = "Banana Pi BPI-R4";
>   	chassis-type = "embedded";
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-1.8V";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-3.3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
>   };
>   
>   &pio {



