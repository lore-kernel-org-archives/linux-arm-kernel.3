Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA149105A595
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 12:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6OV6/7musXxeaE+YI/UTtQtxVXYnl5U80un6cKHwT8=; b=yLulBt3Fk1vF6La2UNuqasdPHg
	53gHXbro3xQi022yOmsz4CDnn7xzOi59geZG1k/f8Lm6x9JoVGWgXXNB//xi54c9nWXGXFnGGmP5w
	BGLWBBKuHhxKmOFB/MwFV2FMok6HPt5pARlKBnzUqwu6eXurrnT97hRlKT4zhgJcLRWg61k5goRqQ
	riy6hbDrRBBp/T0JZ2p+p+cGY2ITpsay/i2up6+fFM/esXfDesUU3Cn89KSrljiuDD0ELrChxx59S
	AkXbPQH3lAUJ3Vrr2wDgTTThVxoUlVl0wirw6fkZNbnddpdU38c3Qr8JYzoi4mRSJ4zZXcITUu9Hi
	UTBJz6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fCN-0000000E2lX-01mK;
	Thu, 12 Mar 2026 12:31:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fCI-0000000E2kj-1oJJ;
	Thu, 12 Mar 2026 12:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773318683;
	bh=gDX4Ye1h2qpbq7w/g5XbwbOmEL2tD+9twVkJmshODY0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mmxw8NDPSOhoemTb2DqKWY7cl1FxbNTWVmoo175N7a5yfZeQSUQZyyaGvF/Y7JyHj
	 ChzA6xpuCPT+7q3rugMXstQAkpehoN0MLJCikjd0vgrpVLZHa8cFD6O5J+DYiVRHhD
	 1XGMz/rctdtd6KpvfcIeGam2J2Q0tDrCwJAduRJls3RT80A6Z7Lv+N/3wYRjjQtoo3
	 sITY4vdxs+mzPHLNPEvNeVpBYXWWzzVA0SHTMJ0RBGC5muMA1ZLdJrJHXtuE1ckrBy
	 9GOT81h0CoJmWztpH+udqqCAwogmwCmy4KeN91DxzMqhbOsCF68K+/Aql7D+t37IH/
	 px8b5q0ii8OIw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 35B1017E0E6C;
	Thu, 12 Mar 2026 13:31:22 +0100 (CET)
Message-ID: <cbe7771d-9da3-444b-98fd-61c6ef504c91@collabora.com>
Date: Thu, 12 Mar 2026 13:31:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] pinctrl: mediatek: Fix gpio-ranges and include guard
 issues
To: Akari Tsuyukusa <akkun11.open@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 sean.wang@kernel.org, linusw@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, hui.liu@mediatek.com, nfraprado@collabora.com,
 linus.walleij@linaro.org, mars.cheng@mediatek.com, andy.teng@mediatek.com,
 hanks.chen@mediatek.com, sam.shih@mediatek.com, rafal@milecki.pl,
 ben.ho@mediatek.com, erin.lo@mediatek.com, zhiyong.tao@mediatek.com,
 Jason-ch.Chen@mediatek.com, amergnat@baylibre.com, seiya.wang@mediatek.com,
 tinghan.shen@mediatek.com
References: <20260312041533.187553-1-akkun11.open@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_053128_699814_7924DCC0 
X-CRM114-Status: GOOD (  21.48  )
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

Il 12/03/26 05:15, Akari Tsuyukusa ha scritto:
> While looking at MediaTek's Pinctrl driver and device tree, I discovered
> that on some SoCs, the gpio-ranges count was a little less than the pins
> defined. This means that the last pin will no longer be available.
> 
> And fixing this issue, I also discovered that the #endif comment in the
> include guard for some header files was different from the macro name at
> the beginning. These issues do not affect the compiled kernel, but they
> affect the readability and consistency of the code.
> 
> This series addresses the cases that can be confirmed correct without
> requiring datasheet verification:
> 
> - mt6795 : gpio-ranges 196 -> 197
> - mt7981b: gpio-ranges 56 -> 57
> - mt7986a: gpio-ranges 100 -> 101
> - mt6779 : include guard #endif comment fix
> - mt8188 : include guard #endif comment fix (two files)
> 
> The following additional issues were identified during this investigation
> but are not included in this series as they require further analysis
> or datasheet confirmation:
> 
> MT6779: gpio-ranges = <&pio 0 0 210>;
>      This matches the number of pins, but GPIO203 to 209 don't have
>      GPIO function, and the driver also has no control over those pins.
>      Probably needs to be fixed to "gpio-ranges = <&pio 0 0 203>;"
> 
> MT8183: gpio-ranges = <&pio 0 0 192>;
>      This seems correct because it matches "pinctrl-mtk-mt8183.h".
>      But, mode/dir/di/do are defined from pin 0 to 192.
>      "pinctrl-mt8183.c" looks wrong.
> 
> MT8188: gpio-ranges = <&pio 0 0 176>;
>      According to "pinctrl-mtk-mt8188.h", GPIO0 to 176 have GPIO function,
>      and GPIO177 to 189 are EINT only pin, but mode/dir/di/do are defined
>      from pin 0 to 177. "pinctrl-mt8188.c" is likely to be wrong.
>      At least "176" is wrong, probably "gpio-ranges = <&pio 0 0 177>;"
> 
> MT8192: gpio-ranges = <&pio 0 0 220>;
>      "pinctrl-mtk-mt8192.h" defines GPIO0 to 227 which have GPIO function,
>      but mode/dir/di/do are defined from pin 0 to 228.
>      "pinctrl-mt8192.c" looks wrong.
>      Also, probably "gpio-ranges = <&pio 0 0 229>;"
> 
> MT8195: gpio-ranges = <&pio 0 0 144>;
>      Like MT8188, GPIO144 to 164 don't have GPIO function,
>      but mode/dir/di/do are defined from pin 0 to pin 144.
>      "pinctrl-mt8195.c" is likely to be wrong.
> 

The whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> Akari Tsuyukusa (6):
>    arm64: dts: mediatek: mt6795: Fix gpio-ranges pin count
>    arm64: dts: mediatek: mt7981b: Fix gpio-ranges pin count
>    arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count
>    pinctrl: mediatek: mt6779: Fix include guard comment in the header
>    pinctrl: mediatek: mt8188: Fix include guard comment in the header
>    dt-bindings: pinctrl: mediatek: mt8188: Fix include guard comment
> 
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi              | 2 +-
>   arch/arm64/boot/dts/mediatek/mt7981b.dtsi             | 2 +-
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi             | 2 +-
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h         | 2 +-
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h         | 2 +-
>   include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h | 2 +-
>   6 files changed, 6 insertions(+), 6 deletions(-)
> 


