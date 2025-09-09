Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A74CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 09:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eiCNXEX7p+83v6sG1J1N5/XaUhxJJkaHS8qe/wwFBfU=; b=tjqR6Zxm0zk0cW1ZqPoKYH3Lvq
	W9wO5s0MfytFJAehTg3CF2J3s7VBLh053QJmP2XdFPGGryasxq1FjI+0AEU/ywWndw2PhWa/UmN9z
	uyK/iO7duf67jwpwANH2pccRd2j/FM21sB0VjNczeKcdwoTV2cZThV2XhKYCc7CZSvUIuIZq6Uzqy
	S62RdyB1xC90+8aKszh39Hwv+hd+tRGd9H9WEyB/qmCDpCWxx7vO5ZIg0cx4nCpvL9NQQ80CSbcS2
	6yaKU4KUdKaH43DnGVQK/sDaAduh0fuPOKdhlS10v9PD6d6Rwc/Xzpw0wf+kZrvSzJhZNzQt6O9mg
	sE4lY+9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvv6o-00000006BYI-2SmF;
	Tue, 09 Sep 2025 09:57:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtZv-00000005Wk1-1xI6;
	Tue, 09 Sep 2025 08:19:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757405990;
	bh=HVUELbkcCN9P76zTicA7v/0JvpS5yYl/jJytu3IqKGU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nfw/gdGmjD8WdJvetZCa7Vffpn6q7fwX1qeKa8BkDI4k+NJ1l84oDzlT9wsw8sLAz
	 chURDmMq/NIkvKZlPh6hhmb6bEIlWw+7t/iqpQyz8Bebt9F3uUq95x1h2xUjD7ujR6
	 yDg2eiQmM75dCpGCBmw1NWkS37pnoFrx14isPlUHfS2PlHRpU0OWuGB9XSVcIqBR07
	 Xa2M+aEdqJW3tbf577hC3X2xyYwEvNFtNg1hbjxAwZtmmM8Q2Wzi0f9J+2tFBf1S8x
	 EilPHWMrFM2063KX84yWS6AxhBhktCmhjmz38NnVV0rzbOlbovOhZtpkpFE3+6WJSd
	 LaT5fRL3/v3gA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 86B6717E1273;
	Tue,  9 Sep 2025 10:19:49 +0200 (CEST)
Message-ID: <124530e7-0b6a-488f-93f1-14505a1bfae8@collabora.com>
Date: Tue, 9 Sep 2025 10:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: mediatek: mt8370-grinn-genio-510-sbc:
 Add Grinn GenioSBC-510
To: Mateusz Koza <mateusz.koza@grinn-global.com>, robh@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 marcin.czarnecki@grinn-global.com, b.bilas@grinn-global.com, andrew@lunn.ch
References: <20250908130620.2309399-1-mateusz.koza@grinn-global.com>
 <20250908130620.2309399-4-mateusz.koza@grinn-global.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250908130620.2309399-4-mateusz.koza@grinn-global.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_011951_738883_491F5B77 
X-CRM114-Status: GOOD (  16.58  )
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

Il 08/09/25 15:05, Mateusz Koza ha scritto:
> From: Bartosz Bilas <b.bilas@grinn-global.com>
> 
> Add support for Grinn GenioSBC-510. Based on the commit introducing
> support for the Grinn GenioSBC-700, this change adds support for the
> Grinn GenioSBC-510, a single-board computer based on the MediaTek Genio
> 510 SoC.
> 
> More details about the hardware:
> - https://grinn-global.com/products/grinn-geniosom-510
> - https://grinn-global.com/products/grinn-genioboard-edge-ai-sbc
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile         |  1 +
>   .../mediatek/mt8370-grinn-genio-510-sbc.dts   | 19 +++++++++++++++++++
>   2 files changed, 20 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index b37a8c65e724..4b8ee6970f40 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -99,6 +99,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-genio-510-evk.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-grinn-genio-510-sbc.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-genio-700-evk.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-grinn-genio-700-sbc.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts b/arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts
> new file mode 100644
> index 000000000000..117ea694cda3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Grinn sp. z o.o.
> + * Author: Bartosz Bilas <bartosz.bilas@grinn-global.com>
> + */
> +/dts-v1/;
> +
> +#include "mt8370.dtsi"
> +#include "mt8390-grinn-genio-som.dtsi"
> +#include "mt8390-grinn-genio-sbc.dtsi"
> +
> +/ {
> +	model = "Grinn GenioSBC-510";
> +	compatible = "grinn,genio-510-sbc", "mediatek,mt8370", "mediatek,mt8188";

only because you have to anyway send a v5.... blank line here please

after which
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0 0x40000000 1 0x00000000>;
> +	};
> +};



