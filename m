Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBC6C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKtkXxdK00cnxkq7MQI5trdttRJ3bUYUMh4iv12LSy4=; b=ATiod0pnsTCf6xS80bTDwtJ/Jn
	SNZ0X2BBknxJ7EHkrVeaOkygPjP1rItt7Lz3onwTxzUF2PnxE+T/hnO0aJ5jR7tN29ltojMpSCpcd
	TAaCyCK/e9FHsFjW4WAePhx3iO2dKjcERLRotNptibHiIdQLoFMzSODVpFLB+LDahci/nQj+yRgQe
	eEr0yzY+reJR+zAnfeOAtB1ElNyoiK2/ljhzcyVChtYi5iJyt30qH9pmfkp6RkEg/pwFVpjqFafCe
	p8QMKDe6rwOBVwUAWtzdtTqJTv82on4A45WUESkjj9eqfs9oRQFddjf+bKm0dN7p0MqCV9auVVd2g
	JUtEvyqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b6X-0000000Dt6K-0fcI;
	Thu, 10 Sep 2026 09:30:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b6U-0000000Dt4y-2wRi;
	Thu, 10 Sep 2026 09:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789032596;
	bh=PxNDq22XRY/9sOBL+lIvZftpirBYfi49pQHJ6/5vZkM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=he5UQnzyzLfjpkkTzW8DYrBg9CN7DQBn792CoyEbx4M4X5P23fXdNsjhsYSW3v4ms
	 QAxfOWoopMwPw4GavGwmDRBsc4FDzRmWbKGEKMHEuX12vYXcCXz5eSsVvl+GN2HOV7
	 c1WD7C3h1tXuZf21Z0orFBDXpvH3k3WvTz6YbKXpTmDm+9ulrE4OCMYh6fjqUG3e7v
	 FqLKcsel0gw/rwCsJrqlE9jqU3Vy4fyuTyKaYkynoiQfxUemp+nbdkGXAtMqVoadEq
	 Ls5Q+4DmfTsouRi+u/XaAZP2yxxUKfIqWhZmrP4vXNlJm3PzlzDhHnjranXdxNATA+
	 B5z946qCc5t3w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD11517E0945;
	Thu, 10 Sep 2026 11:29:55 +0200 (CEST)
Message-ID: <ab00e8c8-cbc2-4fe1-8900-f169aeab5a98@collabora.com>
Date: Thu, 10 Sep 2026 11:29:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] ARM: dts: mediatek: Add basic support for Amazon
 ford board
To: zkh@mailbox.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, zkh1@proton.me
References: <20260909-mt8127-amazon-ford-basic-v4-0-e9af5c420ab1@mailbox.org>
 <20260909-mt8127-amazon-ford-basic-v4-4-e9af5c420ab1@mailbox.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260909-mt8127-amazon-ford-basic-v4-4-e9af5c420ab1@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_022958_894207_907CBBCB 
X-CRM114-Status: GOOD (  16.76  )
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

On 9/9/26 21:38, Zakariya Hadrami via B4 Relay wrote:
> From: Zakariya Hadrami <zkh@mailbox.org>
> 
> This tablet uses a MediaTek MT8127 system-on-chip with 1GB of RAM.
> It can currently boot into initramfs with a working UART and
> Simple Framebuffer using already initialized panel by the bootloader.
> 
> Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>
> ---
>   arch/arm/boot/dts/mediatek/Makefile               |  1 +
>   arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts | 54 +++++++++++++++++++++++
>   2 files changed, 55 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/mediatek/Makefile b/arch/arm/boot/dts/mediatek/Makefile
> index 37c4cded0eae..a610bc75c7d9 100644
> --- a/arch/arm/boot/dts/mediatek/Makefile
> +++ b/arch/arm/boot/dts/mediatek/Makefile
> @@ -14,5 +14,6 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
>   	mt7623n-rfb-emmc.dtb \
>   	mt7623n-bananapi-bpi-r2.dtb \
>   	mt7629-rfb.dtb \
> +	mt8127-amazon-ford.dtb \
>   	mt8127-moose.dtb \
>   	mt8135-evbp1.dtb
> diff --git a/arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts b/arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts
> new file mode 100644
> index 000000000000..8edad5482de2
> --- /dev/null
> +++ b/arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/dts-v1/;
> +#include "mt8127.dtsi"
> +
> +/ {
> +	model = "MediaTek MT8127 Amazon Ford";

Please be friendlier with whoever reads this model string :-)

	model = "Amazon Fire 7 2015 (Ford)";

that's better, isn't it?

After applying the proposed change,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> +	compatible = "amazon,ford", "mediatek,mt8127";
> +	chassis-type = "tablet";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		stdout-path = "serial0:921600n8";
> +
> +		framebuffer0: framebuffer@b7a00000 {
> +			compatible = "simple-framebuffer";
> +			memory-region = <&framebuffer_reserved>;
> +			width = <1024>;
> +			height = <600>;
> +			stride = <(1024 * 2)>;
> +			format = "r5g6b5";
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0 0x80000000 0 0x40000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer_reserved: framebuffer@b7a00000 {
> +			reg = <0 0xb7a00000 0 0x1000000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&watchdog {
> +	status = "okay";
> +};
> 

