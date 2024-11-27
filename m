Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545F3D6ACCE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 13:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXT2tkkx4BUKb3eN00sCNLHMoCDbi3gd/mLa/f0M1UY=; b=z1sxjMrLE3RTGzCiIm3chWt4EU
	L575ak4vMvvTfb+BIOAiuz/0owr21Ik82ADBEbV5OQjzIx0v/G/yrboyl22ANr2L/FSUQjZ3L04RG
	KuuCeI73AfmDWegl47MjoJoyrwbsq+SX/DzkIDqoUW0HYRiEK5piVfvXe/BZx7wXLfIezCt1Ud486
	pl+hVTY6pQPSqNnQlwvaV6cW+wtQaIPZCsc4lpOOzCqXlu98lBL1skxniV5YyWwjz6IkauyVojRR8
	agRB4ux3wvEXs88y2yycROetbbhUsq74JBAibMYx3h66vKWgygZpv+IXFJKyiG5iEMZV0AEGuda5k
	7AXUkFsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIFg-0000000DG7n-3O5Q;
	Wed, 27 Nov 2024 13:38:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIBu-0000000DFN1-3XMx;
	Wed, 27 Nov 2024 13:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732714489;
	bh=0DzS/hvPSQk+b4l5NxoXfskV324Gt7SiupY5t/eSfvA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cnm7vLuEBZFdHgwxtj6D+qc4jelg37ktPyxqpJ1rDcqdT3g55CP+Y1biMLEekWwzJ
	 uqmyOaEgiSm/JCqIcKDa585u5aEUHoU+iDgGTHGCIGs0vGg5FTqSLMPzvKEgyqxJ5B
	 ce67AmuqSqc+/YqzsGmdlHa/MYcQyyEuor9WKUWKW3T/hYEmPX+c/MYKPnTboxsHDy
	 0R5JbYa6RHyXu9CH7QpKf0Fwte1DRputK60swXDJhXhs8I3gwH9oANCRGpzKIRtUZN
	 XnsfQlwHLnJHXL2spxqV/wDX0X82fLAF7yQmKyIOZg3JX5cVMKNAPgYoImA3j3LWTg
	 asephOtb7jp4Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E14E217E374C;
	Wed, 27 Nov 2024 14:34:48 +0100 (CET)
Message-ID: <adda796e-e03f-40f3-aefa-5fa8a9092844@collabora.com>
Date: Wed, 27 Nov 2024 14:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 11/14] arm64: dts: mediatek: mt7988: add thermal-zone
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241029103937.45852-1-linux@fw-web.de>
 <20241029103937.45852-12-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241029103937.45852-12-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_053451_060302_00473036 
X-CRM114-Status: GOOD (  14.24  )
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
> Add basic thermal-zone node.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 39 +++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index de9a9ff2edd8..a3a7deda35a5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -379,6 +379,45 @@ clock-controller@15031000 {
>   		};
>   	};
>   
> +	thermal-zones {
> +		cpu_thermal: cpu-thermal {
> +			polling-delay-passive = <1000>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&lvts 0>;
> +			trips {
> +				cpu_trip_crit: crit {
> +					temperature = <125000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};

No, please just add "crit" - as that is the one that is used to not let the
SoC to reach Tj.

All of the others are board specific, so the trips down there (hot->low) are
to be added to your board dts instead.

Cheers,
Angelo

> +
> +				cpu_trip_hot: hot {
> +					temperature = <120000>;
> +					hysteresis = <2000>;
> +					type = "hot";
> +				};
> +
> +				cpu_trip_active_high: active-high {
> +					temperature = <115000>;
> +					hysteresis = <2000>;
> +					type = "active";
> +				};
> +
> +				cpu_trip_active_med: active-med {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "active";
> +				};
> +
> +				cpu_trip_active_low: active-low {
> +					temperature = <40000>;
> +					hysteresis = <2000>;
> +					type = "active";
> +				};
> +			};
> +		};
> +	};
> +
>   	timer {
>   		compatible = "arm,armv8-timer";
>   		interrupt-parent = <&gic>;



