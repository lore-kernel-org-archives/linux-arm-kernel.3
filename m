Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C6ECED25D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 09:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEvi4irZMh7BdHer+Uvyk++950Iay/jYYvaZ8oyV+RU=; b=GTNoUMpwT9JDJjxVMMBFqHW3gj
	ovr7lhz3SYLZFmZEwMtVMGR1FX7jCRhp4ao/vdgnbMyPZB6mI62QOECsIVrsfLJAGzIxcgYBNmmC9
	CXhy+ok7ynVuGzo/11RJ+MVaMHDywjcnQDYarxRwvlAzI0Q7YjXXsjiRc+hlXPKjU2Z6cgyG6OEME
	zsk+j0wH+SK30ucXtU273TMWejuOAJnePKm56zeJSS/aoCi2D+ri8nVRlkU63PTSmM2ghMMXV6ohu
	4Ptj4cQTJnH78PSsHFp0xk8YzR1sOYoq7xKDpdUd3QWDfAdQxlkSQRBqgFmBVFGS0E/qVH2BGCXTI
	6Gg+CI8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLI8A-00000000AYs-36It;
	Tue, 18 Nov 2025 09:36:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLI82-00000000AWp-0IN8;
	Tue, 18 Nov 2025 09:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763458558;
	bh=lc+F7Hvm4Wkoib4H4TPx44xrDSu+c+Or4u0b8i2ExqY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=abpeeBX5ma5aNdtFhHGu9AzS493vi0e4XM1spxySUlsVe5nwe7+WbNX+Xq8nqD0Yj
	 3vdT0FZO4PXWxujnPC6odJqzo0W4USP2128oSUSk8aWBzUYWv1AxEtdWSZbx+v/avP
	 aP3OK8P1Y1dsOZVVPhxe6rnUnx8pmx1wA3kLxWRN4Bdyj439aYuHgcSQTBgYfa7EX/
	 ORLqelFB0L+EQ4phMkq4SWaymKrQ/YXeUXRmBmU27a0vZDSpsJMlawtuCkO5180kHj
	 c1zFaATVr8gX+SvzLqbnR6D8tE0KX1G700rnr+jzJRzweQeTtWVFFKMcJP25MH8TuF
	 pLxfmEqp5LhLw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B361F17E0342;
	Tue, 18 Nov 2025 10:35:57 +0100 (CET)
Message-ID: <679c1f30-7c62-484e-b4e5-7351a23f15e5@collabora.com>
Date: Tue, 18 Nov 2025 10:35:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: Apply all DT overlays at build time
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20251117211306.725678-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251117211306.725678-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_013603_776716_4E0C3E94 
X-CRM114-Status: GOOD (  18.35  )
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

Il 17/11/25 22:13, Rob Herring (Arm) ha scritto:
> It's a requirement that DT overlays be applied at build time in order to
> validate them as overlays are not validated on their own.
> 
> Add targets for all the Mediatek overlays.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> This will soon be a warning[1].
> 
> Note that if it is desired that the combined .dtb is not installed, then
> the combined .dtb should be added to 'dtb-' variable instead.
> 

Uhm, sorry, can't we do something such that we don't generate a DTB with a
preapplied overlay?

Even something like generating those and deleting before build finalization
could work, I guess, though that'd be hacky maybe.

I don't know if this is the case, but I'm worried that various people have
scripts to copy DTBs somewhere (in some partition) or embed those in images,
and if they get the preapplied overlay dtbs in the same place, havoc could
happen as the bootloaders might be selecting wrong dtbs (as a plus, there is
no dtbo that varies machine compatible strings, rightfully).

Cheers,
Angelo

> [1] https://lore.kernel.org/all/20251114222759.4181152-1-robh@kernel.org/
> ---
>   arch/arm64/boot/dts/mediatek/Makefile | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index a4df4c21399e..4e92bd9f0e53 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -15,16 +15,30 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-acelink-ew-7886cax.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-mini.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
> +mt7986a-bananapi-bpi-r3-emmc-dtbs := mt7986a-bananapi-bpi-r3.dtb mt7986a-bananapi-bpi-r3-emmc.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
> +mt7986a-bananapi-bpi-r3-nand-dtbs := mt7986a-bananapi-bpi-r3.dtb mt7986a-bananapi-bpi-r3-nand.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
> +mt7986a-bananapi-bpi-r3-nor-dtbs := mt7986a-bananapi-bpi-r3.dtb mt7986a-bananapi-bpi-r3-nor.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sata.dtbo
> +mt7986a-bananapi-bpi-r3-sata-dtbs := mt7986a-bananapi-bpi-r3.dtb mt7986a-bananapi-bpi-r3-sata.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sata.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtbo
> +mt7986a-bananapi-bpi-r3-sd-dtbs := mt7986a-bananapi-bpi-r3.dtb mt7986a-bananapi-bpi-r3-sd.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-2g5.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-emmc.dtbo
> +mt7988a-bananapi-bpi-r4-emmc-dtbs := mt7988a-bananapi-bpi-r4.dtb mt7988a-bananapi-bpi-r4-emmc.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-emmc.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-sd.dtbo
> +mt7988a-bananapi-bpi-r4-sd-dtbs := mt7988a-bananapi-bpi-r4.dtb mt7988a-bananapi-bpi-r4-sd.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-sd.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
> @@ -104,6 +118,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-genio-700-evk.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-kontron-3-5-sbc-i1200.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l-8-hd-panel.dtbo
> +mt8395-radxa-nio-12l-8-hd-panel-dtbs := mt8395-radxa-nio-12l.dtb mt8395-radxa-nio-12l-8-hd-panel.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l-8-hd-panel.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
>   
>   # Device tree overlays support



