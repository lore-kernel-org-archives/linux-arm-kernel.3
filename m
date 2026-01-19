Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023A5CCF2F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mBszyLn2ht/oLiOOogAPsRbSUqRC6R3KHM5AjbBrrw=; b=yRD8cM1UCydnuoBCmouXJZ4M9c
	nLB3rKTJmCZ1cj0e3ooDjt1MSUo8bL7xFZCErLgRpgrAwK1zjK3MLivrtBxOPgMtanIJyMs7RI3Wt
	0HHltb62XADMVPzMx3JAqVaVrY1K7PbO7dxsAvLplgQBBT7EjcunptbCnGbB7XTHuBXJbugyhzXMZ
	w+1mqVYmbX8CkihgOdnPbBiwHSrN6179bjcP4lKJPMQ1kW81ML1r0cma26Fz1si1GrTrD26I7iuVp
	77sdaCUX1TprSMI8FVGDpABFcSalH3tlg5Zx6RJBCN+qCupfL+hqPMegx9Evri9vJRysU4WWWjScm
	8mugZnZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho2F-00000001x2c-1YM5;
	Mon, 19 Jan 2026 12:07:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho29-00000001wz5-2YqL;
	Mon, 19 Jan 2026 12:07:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768824418;
	bh=smVe+F+p92Be8MNVffomnHhZ2pZhHkzY+FZJ7CSclQg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CV6DrZSqcyK5ZOXYaeoQ85nbfdM5QNTKFFe1B2KXkwrbpd1uUI5xj3MY8l92dPpJ/
	 u5DumxeRFkwLCBpI2VQav5oJ1tzrg6uxE0E6X/pRUGJKSYwSH+De5OGcsy+N4oXUfP
	 xKvfudI8qG0tPcmrH0hLtFDsZCbFQgA0n7DY8mayhXeurlFB+Z2Uy4B38HoVmW4sy8
	 TWhr5B3lf619G17o2buhd+X/p8tBcu7jrhoWxGSQs2ML48m4vl3WsydNUhwtUYLMx2
	 8CuQryJ7ZEE1nOOeqI4D0K8DIkvn2HXl+yvCGTjXsXpK1S9Wt8n26FGMyBYIS2ViMr
	 RE+M1dURETQ8Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D8EFF17E0117;
	Mon, 19 Jan 2026 13:06:57 +0100 (CET)
Message-ID: <382ef406-6abf-4d6f-9f0c-42b0bbbd6918@collabora.com>
Date: Mon, 19 Jan 2026 13:06:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] Add thermal sensor driver support for Mediatek
 MT8196
To: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, matthias.bgg@gmail.com
Cc: nfraprado@collabora.com, arnd@arndb.de, colin.i.king@gmail.com,
 u.kleine-koenig@baylibre.com, andrew-ct.chen@mediatek.com,
 lala.lin@mediatek.com, bchihi@baylibre.com, frank-w@public-files.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, fshao@chromium.org, Laura Nao <laura.nao@collabora.com>
References: <20251125-mt8196-lvts-v4-v5-0-6db7eb903fb7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251125-mt8196-lvts-v4-v5-0-6db7eb903fb7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_040703_321631_84F6F8FE 
X-CRM114-Status: GOOD (  17.29  )
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

Il 25/11/25 17:16, Laura Nao ha scritto:
> This patch series extends the MediaTek LVTS thermal driver to support the
> MT8196 SoC.
> 

This series has been there on the lists for *5 months* now, and it still
applies as-is.

Can we *please* get this picked?

Thanks,
Angelo

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
> Link to v4: https://lore.kernel.org/r/20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com
> 
> Changes in v5:
> - Dropped patch 3
> - Added LVTS_NUM_CAL_OFFSETS_MT7988/LVTS_NUM_CAL_OFFSETS_MT8196 defines
> - Moved code that assembles calibration bytes from the efuse data into
>    a dedicated lvts_decode_sensor_calibration() helper
> - Fixed prefix in patch 4 commit message
> - Dropped R-b/T-b tags on patch 2
> 
> ---
> Laura Nao (8):
>        dt-bindings: thermal: mediatek: Add LVTS thermal controller support for MT8196
>        thermal/drivers/mediatek/lvts: Make number of calibration offsets configurable
>        thermal/drivers/mediatek/lvts: Add platform ops to support alternative conversion logic
>        thermal/drivers/mediatek/lvts: Add lvts_temp_to_raw variant
>        thermal/drivers/mediatek/lvts: Add support for ATP mode
>        thermal/drivers/mediatek/lvts: Support MSR offset for 16-bit calibration data
>        thermal/drivers/mediatek/lvts_thermal: Add MT8196 support
>        dt-bindings: nvmem: mediatek: efuse: Add support for MT8196
> 
>   .../devicetree/bindings/nvmem/mediatek,efuse.yaml  |   1 +
>   .../bindings/thermal/mediatek,lvts-thermal.yaml    |   2 +
>   drivers/thermal/mediatek/lvts_thermal.c            | 326 +++++++++++++++++++--
>   .../dt-bindings/thermal/mediatek,lvts-thermal.h    |  26 ++
>   4 files changed, 333 insertions(+), 22 deletions(-)
> ---
> base-commit: abadc219d77ce0e61fcac0147cc6cc69164af43e
> change-id: 20251121-mt8196-lvts-v4-a61fb5c27216
> 
> Best regards,


