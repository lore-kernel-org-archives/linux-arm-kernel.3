Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997D4C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 14:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2BTZ0tUMhrsNFbRBCROcMUWeNzUoLgK6QorhO1jBgc=; b=i3Unk9/Rno/TYPeh3TA7iN97mT
	QA3AZdUhFqzxmOIIKH5P0DWtZdECwv6tyzYzE+I6oudwVMtDnZW9S44NVPMLEUiJ65Mzagyeh/acm
	LBdBp4REi8581+u2NYYh/+vWQ2HCvjN5q4Nzdc/NUYYb+YTHFxkJ7q3hPNapLlXjWWqwSWjH3m8ee
	ejd0GqPdqAUOlijX9V/PqghrMx1QeZaKuTu0wj9WbM/h7fCybbPOJOqpWTCH5gewb6UipJyybfvPi
	NWgK/2dyQJh4BQII/C+pLNhtDBKVfdiRCuDTd2PfDiTF8YRSqj2H5tCGgxo2HuRxEh17KyZarUfA+
	r5YifC4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgNB-00000003XJw-2oTO;
	Wed, 05 Feb 2025 14:27:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgHq-00000003WTa-3GWV;
	Wed, 05 Feb 2025 14:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738765313;
	bh=z0M37Un37v7BlWtwhXK1hMOgrK3Tz5Hy3QZhsWCWf8k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JgWSBhaNwYd+rmgrMMhz3j5LxuATWvAV9siB8Z/XVPaCV0iN5IudTBqmuVBvJrMGp
	 feEAejK2BVgR5GJYK8A6y34zmtI24Qr3Du+YXC6LUo3H9DneuBRMIbSefy+qVE65Pe
	 959wjmjuHjiFg9Q/NZ5tn2CJbR63fa5U65N7CYpWVYmck7mMWvwZz8XhF7TuyDzHLD
	 tvCYjIlHDTEJzluVaP+WF/n5MMhY3rSKV9Hm4n+YR8uppggPPrClbB6FmJn+fqA4TN
	 vkCTnJ4K/8q845/fPaG+rmeaFu1HQDg+0Y5MM8lWqOqIiigq5Sdi84MJ5jfgieUxHK
	 KSYrXyYFA2IJw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8EE3D17E153B;
	Wed,  5 Feb 2025 15:21:52 +0100 (CET)
Message-ID: <24ba88e1-2db5-4058-982a-6c30d8242962@collabora.com>
Date: Wed, 5 Feb 2025 15:21:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: mediatek: add device-tree for Genio
 510 EVK board
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250115-dts_mt8370-genio-510-v2-0-fc9b01d08834@collabora.com>
 <20250115-dts_mt8370-genio-510-v2-4-fc9b01d08834@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250115-dts_mt8370-genio-510-v2-4-fc9b01d08834@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_062154_989891_65268272 
X-CRM114-Status: GOOD (  18.56  )
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

Il 15/01/25 11:29, Louis-Alexis Eyraud ha scritto:
> This commit adds a basic device-tree (mt8370-genio-510-evk.dts) in

Same comment as with the other patches. "This commit" -> no.

Please fix the commit description, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> order to be able to boot the Genio 510 EVK board, based on MediaTek
> MT8370 SoC. As being very close to the Genio 700 EVK board, the dts
> includes mt8390-genio-common.dtsi file to use common definitions.
> 
> The Genio 510 EVK has following features:
> - MT8370 SoC
> - MT6365 PMIC
> - MT6319 Buck IC
> - 4GB LPDDR4X
> - 64GB eMMC 5.1
> - 12V DC Jack
> - Micro SD card slot
> - Push Button x 4 (Power, Reset, Download and Home Key)
> - LED x 4 (Power, Reset, System on and Charging Status)
> - USB Device Port x 1 (Micro USB Connector)
> - USB Host Port x 1 (Type-C USB Connector)
> - 3.5mm Earphone Jack x 1 (with Microphone Input)
> - 3.5mm Line Out Audio Jack x 1
> - Analog Microphone x 1
> - Digital Microphone x 2
> - Gigabit Ethernet with RJ45 connector
> - HDMI 2.0 TX port with Type A HDMI connector
> - eDP port
> - 3x UART with serial-to-usb converters and micro USB connectors
> - M.2 Slot x 2
> - I2C Capacitive Touch Pad
> - 4-Lane DSI x 2
> - 4-Data Lane CSI x 2
> - I2S Pin header
> - 40-Pin 2.54mm Pin Header x 1
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile                 |  1 +
>   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dts | 19 +++++++++++++++++++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index b763b73788a45af0a4ea773d308734fa128272f8..ae1147eca9a915f117487101e2ad4acead97adfe 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -95,6 +95,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r3.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-genio-510-evk.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-genio-700-evk.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-kontron-3-5-sbc-i1200.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dts b/arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..71a8cbed1df6a1d976e7dc8ccafac3c21b04614b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dts
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 Collabora Ltd.
> + * Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> + */
> +/dts-v1/;
> +
> +#include "mt8370.dtsi"
> +#include "mt8390-genio-common.dtsi"
> +
> +/ {
> +	model = "MediaTek Genio-510 EVK";
> +	compatible = "mediatek,mt8370-evk", "mediatek,mt8370", "mediatek,mt8188";
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0 0x40000000 0x1 0x00000000>;
> +	};
> +};
> 




