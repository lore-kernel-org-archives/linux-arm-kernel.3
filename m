Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7C1CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 10:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPUGAfF8P3SzKOyM1xk5ROJj3jrmeUHaY4OoMigdJ9c=; b=RzoG7sBsbsy5dAeubzHCP8TEIv
	ksJM3KEcc+KA2MOO8TwEOotR1lr5wMA8j0uk33gjCzrxQrpqwTvAtZW6gvZjy4b/xk/SQ76DhBZ7x
	IUZFEXImcPfry3Nu1v3BmQ4cEUSaoAX0Sag85b9Llls/lQ1j57HYSnhZMBTTNB/wNGR/fe3VXwEJh
	v0CuzWUBMQitXJiz5gsxif/51lA52AyPqZfrOWuZUETyzHTrN4oKGbw0/wXLYVO1VzMQmDHWYizRh
	PFStUheHQ7or73rEYzQh5L4CYBZIa0cp75h8TSScAeRI/iU34PstUPME+gwfDwg+tccM9b4GRCR2v
	PjbhVbJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKSn-0000000Dezg-2anf;
	Mon, 27 Oct 2025 10:28:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKSk-0000000DezF-30BJ;
	Mon, 27 Oct 2025 10:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761560908;
	bh=80A5WGzXwOBAEhYFN6darwmjlsAVc8wuGY5F609g7q4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aZZlNJof71hPdQNaI1GKLmACWl8FA8kgZfqROQqPUpXu5eCCn03YIcePo/4oBB11c
	 KEsELY43p8d+Mz1tsz3cz/j9v7oxNWFx3c8nUCIaI/VG6iMJ3ieBTIKP0caEr5vrk9
	 +MQ2ccGqkOsBl6uNiB5ZOHvCTAB90Cmhc9DI/4A1cmmbatp3OOGisVd8orYyw9CmM+
	 dMSdbEUqPES4LhcGhTtXGhnxbQH7bOE6twHtMiBXEKk8sJm2BVDNDcZbaN5rvRF6gK
	 63L5ATtY1XTYWJ+2S3eYOsM4uklK/tg9pc5PE0a/SiHaFoAJXTQJh9ILrL1ToS5Sqa
	 CUKaHUhlUsksQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8333617E10F4;
	Mon, 27 Oct 2025 11:28:27 +0100 (CET)
Message-ID: <dc619e4b-78fc-4306-8aa0-83d8d87a11cf@collabora.com>
Date: Mon, 27 Oct 2025 11:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 0/9] Add thermal sensor driver support for
 Mediatek MT8196
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
References: <20251016142158.740242-1-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251016142158.740242-1-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_032830_907929_12009218 
X-CRM114-Status: GOOD (  15.57  )
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

Il 16/10/25 16:21, Laura Nao ha scritto:
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

I think this series is ready to be picked.

Please don't let this slip through the cracks.

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


