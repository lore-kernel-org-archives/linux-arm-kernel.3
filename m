Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DB3EB48F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 09:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EBiaFqqtww/FYmWQV8pkEg6C4Wi6iPt80LIvEdaAO4=; b=CVpGHn8XFDUNKfSzQs6D4Hfj8D
	tEY0pVYemUlmUFv1DeFZ0FhetvjZkp1f/9ERqLTh4qd15Dp1iyv4b9p/H8UniY0I+dzFqNBDmTn3B
	nYFJQeat9clscAsxAyeT7TWyVuIcZ03bqh4MNZgy4AGv6x8B4WK5anAHQAGfD9//AW3Xr4LDMjxME
	Qc2/2nPl2prqAs8IUhwcc+H+l5J3+HRGI7L7B/ZQCWF3HndVC/edhSghyg9wEg3KU+a0pxDFihT6P
	8gtnxeXTH8NmLuOyFOCdRt/N/k43bTTyqN3WqnPRDE08AcJlG7+/yno6iD72iI56ZjZr60Mfg0fJM
	SPyfdKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTNL-00000001rcg-20cx;
	Thu, 12 Feb 2026 09:52:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTNJ-00000001rXo-083k;
	Thu, 12 Feb 2026 09:52:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770889958;
	bh=FNUiiSr9MTBi4O+hJNPTKiukGQQ1+8FhXxrhgA80IAU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h1p0EAduRXkTTq9tpnphLv1eM/MTFgqJtbF10e5OyZvzP8zM9/yLGL4r57zYI21cV
	 shlPoevqFv9+fehRiVePTFEGEhanXoLOwck4jxUOj+y769TdX7wFRf+5TbKAMo/kOX
	 A6xHKcboP9Obd7kWcB86wOqTI9sDb5C1nOAJf18t60pgvGVj8y5YD6GJon4gvKrVOl
	 506b69++mZ9aGrb9yltCp6rFF2D+dImhmfTfrjvX7iYnFBiKIGCvPpPT+GgeOGTKJt
	 wwwMxdhPvIjKbbqFDjERR1tegYdVRe7Cr0kefyEx7Icto6HEebr5V8gsTkcXNg1Bca
	 7qB9F6ffz8YOw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EA8B17E110D;
	Thu, 12 Feb 2026 10:52:38 +0100 (CET)
Message-ID: <7c1fff1f-dd9d-4900-9c50-e8a34c1ed969@collabora.com>
Date: Thu, 12 Feb 2026 10:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1770836189.git.l.scorcia@gmail.com>
 <77434edba7ab5050f5c0fd03302bf9eb4b1c60ca.1770836190.git.l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <77434edba7ab5050f5c0fd03302bf9eb4b1c60ca.1770836190.git.l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_015241_224076_3D51F5DD 
X-CRM114-Status: GOOD (  14.06  )
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

Il 11/02/26 20:03, Luca Leonardo Scorcia ha scritto:
> Add support for the Top Reset Generation Unit/Watchdog Timer found on
> mt8167.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>   drivers/watchdog/mtk_wdt.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 91d110646e16..ded16173105b 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -13,6 +13,7 @@
>   #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
>   #include <dt-bindings/reset/mediatek,mt6795-resets.h>
>   #include <dt-bindings/reset/mt7986-resets.h>
> +#include <dt-bindings/reset/mt8167-resets.h>

After changing the filename of that header, you'll obviously have to change it
here and everywhere else - so with that name changed:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


>   #include <dt-bindings/reset/mt8183-resets.h>
>   #include <dt-bindings/reset/mt8186-resets.h>
>   #include <dt-bindings/reset/mt8188-resets.h>
> @@ -105,6 +106,10 @@ static const struct mtk_wdt_data mt7988_data = {
>   	.has_swsysrst_en = true,
>   };
>   
> +static const struct mtk_wdt_data mt8167_data = {
> +	.toprgu_sw_rst_num = MT8167_TOPRGU_SW_RST_NUM,
> +};
> +
>   static const struct mtk_wdt_data mt8183_data = {
>   	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
>   };
> @@ -498,6 +503,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
>   	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
>   	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
>   	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
> +	{ .compatible = "mediatek,mt8167-wdt", .data = &mt8167_data },
>   	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>   	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
>   	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },



