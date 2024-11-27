Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48AFD6ACD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 13:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxQM3gPk8dlzkOuIwFl4oSdenLm8M8U/4GLzdX6iLqo=; b=IDXTjFxCyPp4SsCe2wYfZTXthk
	xmz4AT+c541lezAGMR3LVZCPm7U8VOc+SQtvEw7ei9hJFJq5dad1+TYqjONlr8H+6I8IjgwNYcxXp
	7xgn0xiekFy+FJ6j2MoapgPAhyTIIOtiD8cKirWc866sDl5NMP4ScCCUPxqZpbL9xlOY+ILAzOR1V
	l7ondJC/ERTXWg9QTem1MknGQ5024Bjwrf8jlAnxV2seNH8DBzC922/lj1X4wQkh6Bqp/GPC+5p28
	LyD4CiGb7frgRbwNiIpy22ZlhPTx0VHP+jhHvQRujdDgXNgVKvLJ+Me/quZlHuBfBgRJAdWe6jlOy
	v3yghgLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIHY-0000000DGX8-3r9h;
	Wed, 27 Nov 2024 13:40:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIBw-0000000DFOF-44i9;
	Wed, 27 Nov 2024 13:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732714491;
	bh=sdoa3Ne+JZfyGrUUlsVEBdOsjkPTBJLSWaehMxJ0ACA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=InYNZXhiFkr6p53KM3FGah8zfTBO12oNo7UbkyufiWo6tUA/4c3cUHeYWbUGdcKcf
	 HObY80/yOF2SKr2k6Yzt4cpyyypJPogjOtyeyZAvTxcxTVKlEagVmDtFd9ZzgM+Ms0
	 E6CpSgPX+PNZxp+X2/PlkLFEpreTIxZxgaUTDpCNhHhq28FxSi068upZUAA4XD6+cW
	 yPBPMXBVGS0TDkhRyryKcTA+e9FzON5wcaLqT2RL2qdvTzpWaSeHNKUk1RZMvwRwt6
	 6j5Px9fqg/w3UzRPSjObcQYkXjtZOcBNwub/NVSy1KRQYPEk+7GspJBHwAOuxTyT/J
	 SKNe/ayVGOz0A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BEB117E3700;
	Wed, 27 Nov 2024 14:34:51 +0100 (CET)
Message-ID: <28d06e3d-f589-4da8-a7d2-5c0bf263d2e5@collabora.com>
Date: Wed, 27 Nov 2024 14:34:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 08/14] arm64: dts: mediatek: mt7988: add fixed regulators
 for 1v8 and 3v3
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241029103937.45852-1-linux@fw-web.de>
 <20241029103937.45852-9-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241029103937.45852-9-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_053453_154760_4D62037F 
X-CRM114-Status: GOOD (  12.50  )
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
> Add regulator nodes used for mmc.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

That's a board specific thing, not a SoC one; please add it to your board dts
instead.

Cheers,
Angelo

> ---
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index 639c307b9984..7371cd80a4ff 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -62,6 +62,24 @@ psci {
>   		method = "smc";
>   	};
>   
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
> +
>   	soc {
>   		compatible = "simple-bus";
>   		ranges;


