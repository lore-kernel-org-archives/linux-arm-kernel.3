Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715CDD12694
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 06:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/DmfUTP8ho0dkVxciIsuajpwergE/iM3cCYedUMzmw=; b=eWdUwiY+1i3SR9JHcNJhhfF/TQ
	KqDJD10+XSuVKGk6tF6mpTjfJIvBJb0vNYpIDRWS99izrwTJsmxoPQgzjYVxsV4G26TaF9pRhEEeM
	YTVkKkmYyIWWL0PNWC17WX+mwKNqFSZOFOgBy2MWfDwOVnbP3P8DXbkQvvttJVIEMb+gCCOnz8VCa
	g2dS7TF8I5M3VbLgaKvLYqD0vg0oY7ZvaRZiGwi1jYRowohFjJt0sHY5z94F49YPYOSWr6uVEwoHD
	EOFdz0UXsspjkE3M3+ukQhh1BDtB5+B8WTdTLOiAS0lmIa2G7U80L+y/LTjw5S/GypU3csOQ+9mG0
	bZ4dL8Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQglM-00000006DeK-3hRn;
	Wed, 03 Dec 2025 06:54:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQglJ-00000006DcN-40ff;
	Wed, 03 Dec 2025 06:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764744891;
	bh=+mouYnjXndDUTYks44sCmhlZvGkCia3knwRQVZGSJYw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KEcg9PoZ0HDpqkejHdDP0kopyOliYmbEtizHcEdt+0CEP48ueZjW2M9YHXVZIxwsU
	 kzt1ManaZv/ZHqyPIMvelFMWnC8lgXhmrqQDmpFX5cjOyl9PvIbM1RAMC0FiTo3wnr
	 Zaqt7eJoU4S4f+mdfmhPs/IVu0t8ELh7cdrkRJ1nHNPwRynFRZgmLynsmXZ/pFSvT0
	 IR+4WlP0kAOCVF34KY0PmpiD3MFUJ7uGKANMDGvl8z8481dlpAT7oPdQxDSrDthxls
	 owdwJCxDmq+2Z/q7n+rptFBuIwzJsn1jt+6V9tv9btnolt3D/cDX1RMKJ/2+feFUUq
	 QlBC71+kVFnNg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C78A17E0610;
	Wed,  3 Dec 2025 07:54:51 +0100 (CET)
Message-ID: <f50544e4-1038-418a-a2bb-555865642984@collabora.com>
Date: Wed, 3 Dec 2025 07:54:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: mediatek: add device tree for Tungsten
 700 board
To: Gary Bisson <bisson.gary@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
 <20251202-review-v4-4-93f5cd2a0d4a@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251202-review-v4-4-93f5cd2a0d4a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_225454_143978_D6D9A17D 
X-CRM114-Status: GOOD (  18.03  )
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

Il 02/12/25 23:08, Gary Bisson ha scritto:
> Add device tree to support Ezurio Tungsten 700 (MT8390) SMARC SOM [1] +
> Universal SMARC carrier board [2].
> It includes support for the MIPI-DSI BD070LIC3 display which uses the
> Tianma TM070JDHG30 panel + TI SN65DSI84 MIPI-DSI to LVDS bridge [3].
> 
> [1] https://www.ezurio.com/product/tungsten700-smarc
> [2] https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier
> [3] https://www.ezurio.com/product/bd070lic3-7-touchscreen-display
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> 
> ---
> Changes in v2:
> - None
> Changed in v3:
> - None
> Changed in v4:
> - None
> ---
>   arch/arm64/boot/dts/mediatek/Makefile              |  1 +
>   .../boot/dts/mediatek/mt8390-tungsten-smarc.dts    | 22 ++++++++++++++++++++++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 30d169a31b10..85f338344dd3 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -102,6 +102,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-genio-510-evk.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-tungsten-smarc.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-genio-700-evk.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-tungsten-smarc.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-kontron-3-5-sbc-i1200.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l-8-hd-panel.dtbo
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
> new file mode 100644
> index 000000000000..f1cf2821107f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Ezurio LLC
> + * Author: Gary Bisson <bisson.gary@gmail.com>
> + */
> +/dts-v1/;
> +#include "mt8188.dtsi"
> +#include "mt83x0-tungsten-smarc.dtsi"

I just noticed: please, no wildcards in names - this has to be named
mt8390-tungsten-smarc.dtsi instead.

> +
> +/ {
> +	model = "Ezurio Tungsten700 SMARC (MT8390)";
> +	compatible = "ezurio,mt8390-tungsten-smarc", "mediatek,mt8390",
> +		     "mediatek,mt8188";
> +};
> +
> +&cpu4 {
> +	cpu-supply = <&mt6359_vcore_buck_reg>;
> +};
> +
> +&cpu5 {
> +	cpu-supply = <&mt6359_vcore_buck_reg>;
> +};
> 

You could also just put the cpu4 and cpu5 supplies in the common
mt8390-tungsten-smarc.dtsi file instead.

That's based on your own preference, so..

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

