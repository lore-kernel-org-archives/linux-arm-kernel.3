Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FD3CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 11:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WlA1OkllYtpW7fXlum03ByotMD3xXO2F5kb/Vnk4bc=; b=P1htBs0Ev4vUex5sx16outtOhY
	AGvBoyxt3AigCCts1hlikZ/LVXxGJ5OZq3wJzsCPqcwWN6tquUCu1ItDVMW65Bltiosb64Qzdav5p
	YJSYF9gdS/yylZNVZOJ8GBHWG/pnTEtLwvPS8exlVI4W2ayK3xC/AYxuxZmPuj8KE8wh3ODFYPlng
	pO1aqvY6S9xNdrlT0Mij3D6d881Ix3ISH7y/4BBTXNnwcbsQLLgWtUGVnyX0/90MB9lz+fOy+lZrK
	LDlfsn/t+5ZJZZe6DaCVb0T46zoDYusQM7pPxQEa+8bvRJBaUmnyJSt4sCxugugU7V8AnazOpozIV
	bD5N7+mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1NPC-0000000GnjR-2feY;
	Wed, 24 Sep 2025 11:11:26 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1NP8-0000000Gndh-3fTj;
	Wed, 24 Sep 2025 11:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758712280;
	bh=5GT6jnvxYjStCKgCq5+Wz35bOeICFGv9mfyP8q18sGI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FqQDe9Eo+x/xmzaI1BbvECmNJw21c6MO2jBjAvmTpblE+Q+gR1a9m8bHeSohkfPxj
	 MO41XNvHtQL2w4W11nwUdY0Nr1MJdNMeIGtrXpLKX7GHdpypxk+Ou/HFM8bHfcxxrj
	 uXhBevqAezWCIkkpqVmmMO3MjODu92EXK/HpMh2p+E2zODc79juhktSXrlDn0KXdS+
	 99EW6jPyZBRIlfG9dLatj36vySf7eRYi8Rj+9R6ci5HePQJ+4ugKXyRN7WLn4bw9YG
	 fbNlzUAHdg1+DwFRIc8uJw+GuiCaB0cgmA7v+5JbFLvUddHPegEoX6Dv6p5VxOi4kN
	 4mHxFqTQ23HSw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 25D9117E068C;
	Wed, 24 Sep 2025 13:11:19 +0200 (CEST)
Message-ID: <5fb4a548-4dc4-4964-975f-675541c4b728@collabora.com>
Date: Wed, 24 Sep 2025 13:11:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] Add thermal sensor driver support for Mediatek
 MT8196
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 matthias.bgg@gmail.com
Cc: nfraprado@collabora.com, arnd@arndb.de, colin.i.king@gmail.com,
 u.kleine-koenig@baylibre.com, andrew-ct.chen@mediatek.com,
 lala.lin@mediatek.com, bchihi@baylibre.com, frank-w@public-files.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20250804133035.309990-1-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250804133035.309990-1-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_041123_099872_D903F23B 
X-CRM114-Status: GOOD (  16.61  )
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

Il 04/08/25 15:30, Laura Nao ha scritto:
> This patch series extends the MediaTek LVTS thermal driver to support the
> MT8196 SoC.
> 
> MT8196 requires a different implementation of the lvts_temp_to_raw()
> function.
> 
> To support this, the series introduces:
> 
> - A new struct lvts_platform_ops to allow platform-specific
>    conversion logic between raw sensor values and temperature
> - A variant of the lvts_temp_to_raw() implementation
> - Platform data and controller definitions for MT8196
> 
> Link to v2: https://lore.kernel.org/all/20250730152128.311109-1-laura.nao@collabora.com/
> 
> Changes in v3:
> - Make ops in struct lvts_data a pointer to const struct lvts_platform_ops
> - Changed mediatek,mt8188-efuse const entry in eFuse binding to an enum
> with mediatek,mt8196-efuse and mediatek,mt8188-efuse, dropped mediatek,mt8196-efuse
> const entry
> 

Whole series is both

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> 
#MT8196 Chromebook

and is also

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...and besides, this got also tested on MT8188/95 in our lab (for quite a while).

Regards,
Angelo

> Laura Nao (9):
>    dt-bindings: thermal: mediatek: Add LVTS thermal controller support
>      for MT8196
>    thermal/drivers/mediatek/lvts: Make number of calibration offsets
>      configurable
>    thermal/drivers/mediatek/lvts: Guard against zero temp_factor in
>      lvts_raw_to_temp
>    thermal: mediatek: lvts: Add platform ops to support alternative
>      conversion logic
>    thermal/drivers/mediatek/lvts: Add lvts_temp_to_raw variant
>    thermal/drivers/mediatek/lvts: Add support for ATP mode
>    thermal/drivers/mediatek/lvts: Support MSR offset for 16-bit
>      calibration data
>    thermal/drivers/mediatek/lvts_thermal: Add MT8196 support
>    dt-bindings: nvmem: mediatek: efuse: Add support for MT8196
> 
>   .../bindings/nvmem/mediatek,efuse.yaml        |   4 +-
>   .../thermal/mediatek,lvts-thermal.yaml        |   2 +
>   drivers/thermal/mediatek/lvts_thermal.c       | 305 ++++++++++++++++--
>   .../thermal/mediatek,lvts-thermal.h           |  26 ++
>   4 files changed, 314 insertions(+), 23 deletions(-)
> 




