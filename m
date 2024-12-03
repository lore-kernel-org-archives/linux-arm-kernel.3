Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1853FE6C61A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQiJhf55z316G3m6XKCbzK1OOXPyTbyAE9tKFZU0dM8=; b=1dboyPCYxfAKQx0rZhXhzCzcdb
	9YI4RmiojIxY+e6HTLa00NhPh5UB6QVk9auZTtGmEm2HwH+UXInjHrwwd2b9wVngkwEJhQ6E1hPQO
	tfcykwey1JcXNw2W3CtV6WE3yqKxtej3knk8a78ulC9WF0tpnuOvz2jNvUgaiRXw6CVxc4q9RZmZQ
	miS8PtSVUc4T5vsRsTcqsG6cnuV/QjveBrSD88OPtH9uIACkMrhwGhliD6rcrt4umlCN949rlMeLk
	4fNM6wr9NAR2m6UC1U5wSVp35nm5Lw7uMYnaU1thxtNZF1tiJYxV2yjc30xbKGrdDRzrCdy7I2nwx
	/slykuYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOwW-00000008p28-2J5m;
	Tue, 03 Dec 2024 09:11:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOuO-00000008oVV-16UJ;
	Tue, 03 Dec 2024 09:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733216965;
	bh=4wHuBLrcnDcfK8k1xUlCGXFlvPL57xKxmHh+JQRhPao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lV97jLpElDVc+Sq5P8OKNe7kvIO4veToTfLY1Yoq6l8uhousvMxrW76D5Oj9MTx45
	 +D3sQrRRw9eWq+Tw3xtqNlKvU6eTR1dFACB9NBcc4eTa2WRCCKeKxAUzMv7GWJj6IP
	 SzNVp0X33F5kn0oDlNj1846wn4tdANTUJC0i1HxXcMU8qougkPw7aojcs/lbyf86mU
	 JAsaafxOr2+Ih3CS63b6aK+aIkvLvA02/ZnCXITf/3KgcKbDzcIE51Db25uNE613WV
	 T0fTjGk+s9kwUdVSJgBfpNjjbqsMzXH5kgHIGHhyz2yn7g9PdA+a9pn6CirHhApd7P
	 Zp8QXYUOJGIKA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D260E17E14D7;
	Tue,  3 Dec 2024 10:09:24 +0100 (CET)
Message-ID: <9f55bfdb-d4c5-48d2-8a6b-fee5dc147d94@collabora.com>
Date: Tue, 3 Dec 2024 10:09:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: mediatek: Add MT8186 Chinchou
 Chromebooks
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, wenst@chromium.org, hsinyi@chromium.org,
 sean.wang@mediatek.com, dianders@google.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20241202032035.29045-3-xiazhengqiao@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202032035.29045-3-xiazhengqiao@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_010928_479801_3B27139E 
X-CRM114-Status: GOOD (  15.82  )
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

Il 02/12/24 04:20, Zhengqiao Xia ha scritto:
> MT8186 chinchou, known as ASUS Chromebook CZ12 Flip (CZ1204F)
> and CZ12(CZ1204C), is a MT8186 based laptop.
> It is based on the "corsola" design.It includes chinchou and chinchou360,
> including LTE, stylus, touchscreen combinations.
> 
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile         |   3 +
>   .../mediatek/mt8186-corsola-chinchou-sku0.dts |  18 +
>   .../mediatek/mt8186-corsola-chinchou-sku1.dts |  35 ++
>   .../mt8186-corsola-chinchou-sku16.dts         |  29 ++
>   .../dts/mediatek/mt8186-corsola-chinchou.dtsi | 321 ++++++++++++++++++
>   5 files changed, 406 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 8fd7b2bb7a15..0db7770e8907 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -55,6 +55,9 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku32.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-chinchou-sku0.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-chinchou-sku1.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-chinchou-sku16.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393216.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393217.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393218.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
> new file mode 100644
> index 000000000000..5d012bc4ff0d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2024 Google LLC
> + */
> +
> +/dts-v1/;
> +#include "mt8186-corsola-chinchou.dtsi"
> +
> +/ {
> +	model = "Google chinchou CZ1104CM2A/CZ1204CM2A";
> +	compatible = "google,chinchou-sku0", "google,chinchou-sku2",
> +			"google,chinchou-sku4", "google,chinchou-sku5",
> +			"google,chinchou", "mediatek,mt8186";
> +};
> +
> +&gpio_keys {
> +	status = "disabled";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
> new file mode 100644
> index 000000000000..c18f473f6a0f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2024 Google LLC
> + */
> +
> +/dts-v1/;
> +#include "mt8186-corsola-chinchou.dtsi"
> +
> +/ {
> +	model = "Google chinchou CZ1104FM2A/CZ1204FM2A/CZ1104CM2A/CZ1204CM2A";
> +	compatible = "google,chinchou-sku1", "google,chinchou-sku17",

As pointed out in the binding review, please move SKU17 after 7, before 20.

> +			"google,chinchou-sku3", "google,chinchou-sku6",
> +			"google,chinchou-sku7", "google,chinchou-sku20",
> +			"google,chinchou-sku22", "google,chinchou-sku23",
> +			"google,chinchou", "mediatek,mt8186";
> +};
> +

..snip..

> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
> new file mode 100644
> index 000000000000..c3835c7c4444
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
> @@ -0,0 +1,321 @@

..snip..

> +
> +&mmc1_pins_default {
> +	pins-clk {
> +		drive-strength = <MTK_DRIVE_8mA>;

Please do not use the MTK_DRIVE_xxx definitions.

This is just `drive-strength = <8>;`

> +	};
> +
> +	pins-cmd-dat {
> +		drive-strength = <MTK_DRIVE_8mA>;
> +	};
> +};
> +
> +&mmc1_pins_uhs {
> +	pins-clk {
> +		drive-strength = <MTK_DRIVE_8mA>;
> +	};
> +
> +	pins-cmd-dat {
> +		drive-strength = <MTK_DRIVE_8mA>;
> +	};
> +};
> +
Everything else looks good.

Cheers,
Angelo

