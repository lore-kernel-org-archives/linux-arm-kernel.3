Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E335C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2ShFLz2yJCKPxXXZobT4YdME5qB9wl46Ue1Mjyxi/g=; b=pYoQ3LH7zDfAPySBqf6Qwn1+lW
	cyCgqF86C4blk9X/Nu0J29GOApetOOpiM2BqDBHIol4ZdM0hlGfqxp75RaFzfCx0xeR9L1OaEhml6
	7O7LrhSdDvXu7ZAnGpR8C0maoBNDYpufc0vQtdikqVeRILrwIlsb0qduHssBx1Fkk3DDqion473qV
	KHw5uZwX7y1qy/K5hFS9o3SMCgLwxGYIjtjLmxwsdK6VaTX/7FoOx10Da25ByDXKtNahhniJfXwSk
	K4rp/TxmpwWT6oK1PVwMrmfLPW7leoeQ3LgjzMYsmVrYdZixR958x9fqmeGDEvrTXKZMCo4Sa1PA3
	f+dDebvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Eom-0000000BKJA-2rBJ;
	Wed, 09 Sep 2026 09:42:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Eoj-0000000BKIc-1YNJ;
	Wed, 09 Sep 2026 09:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788946927;
	bh=RlquV2qEWjV+inAs1mB0hDuB0wfVFPu3WzBSbEbDSP4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jnOJ3Xo9TUxGgqRwcdLIyZ6ln+F4/SN/xIoK8efS/zB+lcAcCqY7BxfY1ew6r7Vrr
	 ytlTtrzrTIE8NHHm3tAX5uIgvBthOQH548iAjYlDTY91jX3yZUGy7a5v7a8zDOHWNF
	 l2TUceV4RBarZ8UXG0Vo5TGYK/eMqMjddCkJCnL1Dw1YSsNuNdjC8W4we2647Zm0+E
	 N7TeOVKYM6y1uh28q5D+K7tdzapc84R/cDJEJoPMgFQAYFiixA+/0yHl5kp4FlXj7D
	 heJQ+K7sQYxq0+1Hdksa5YduKxqEMnA5JfIDi3cH5+m/2WqCmcBRVxwiPV3J16JfO2
	 AX43Jork0HVYQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8998C17E0260;
	Wed, 09 Sep 2026 11:42:06 +0200 (CEST)
Message-ID: <f57e326d-50f1-4ca3-a61d-d7de4723f7cf@collabora.com>
Date: Wed, 9 Sep 2026 11:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] Add support for mt8167 toprgu and mmsys resets
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260908174259.9009-1-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_024209_600845_EC0000FC 
X-CRM114-Status: GOOD (  24.69  )
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

On 9/8/26 19:38, Luca Leonardo Scorcia wrote:
> Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
> which in turn falls back on mt6589-wdt, which does not support toprgu
> resets yet. In the first two patches we add support for the 12 mt6589
> toprgu resets.
> 
> However, according to its data sheet, mt8167 has 14 sw resets instead of
> 12, and its reset bits are non-contiguous. This is currently unsupported
> by the mtk-wdt driver and it caused confusion between reset IDs and reset
> bits in other mtk SoCs device tree includes.
> 
> Therefore we introduce a dedicated mediatek,mt8167-wdt compatible for the
> watchdog driver that describes correctly this SoC's resets. Since its
> reset bits are non-contiguous, we add support for a watchdog reset table
> to accommodate the distinction between device tree reset IDs and the
> actual bits in the registers. Code is inspired by the reset table
> currently implemented in the mmsys driver. There should be no effect
> on existing sequential wdt resets.
> 
> In the last three patches we describe the mmsys reset table for the SoC.
> According to the datasheet there are 28 mmsys reset bits divided across
> two adjacent registers.
> 
> The series has been tested on a Sony PlayStation Classic Mini, on a Xiaomi
> Mi Smart Clock and on a Lenovo Smart Clock 2.
> 

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> Changes in v5:
> - Dropped the binding header for mt6589 reset IDs;
> - Moved the definition of the number of resets for mt6589 inside
>    mtk-wdt driver;
> - Separated the mmsys related changes to the last three commits.
> 
> Changes in v4 [4]:
> - Squashed the reset IDs includes together with the bindings change;
> - Added support for a reset table to the mtk-wdt driver. This allows us
>    to decouple reset IDs from device trees from reset bits and lets us
>    describe correctly the non-contiguous reset bits of mt8167;
> - Improved explanations in commit messages.
> 
> Changes in v3 [3]:
> - Improved explanations in the commit messages;
> - Added the #reset-cells property to mt6589 watchdog node;
> - Included the mediatek,mt6589-resets.h file in mt6589.dtsi;
> - Included the mediatek,mt8167-resets.h file in mt8167.dtsi;
> - Moved the mmsys reset table from the mt8167-mmsys.h header file to
>    the mmsys driver implementation.
> 
> Changes in v2 [2]:
> - Sashiko pointed out correctly a missing entry in the mmsys reset table
>    in the last patch.
> 
> Initial version: [1]
> 
> [1] https://lore.kernel.org/linux-mediatek/20260717151134.678839-1-l.scorcia@gmail.com/
> [2] https://lore.kernel.org/linux-mediatek/20260717163959.714561-1-l.scorcia@gmail.com/
> [3] https://lore.kernel.org/linux-mediatek/20260809160643.33991-1-l.scorcia@gmail.com/
> [4] https://lore.kernel.org/linux-mediatek/20260819101853.44681-1-l.scorcia@gmail.com/
> 
> Luca Leonardo Scorcia (8):
>    watchdog: mediatek: Add wdt/toprgu resets for mt6589
>    arm: dts: mediatek: mt6589: Enable toprgu reset controller
>    dt-bindings: watchdog: Add compatible for MediaTek mt8167
>    watchdog: mediatek: Add support for mt8167 toprgu/watchdog
>    arm64: dts: mt8167: Properly describe the SoC watchdog resets
>    dt-bindings: reset: Add mmsys reset ids for mt8167
>    soc: mediatek: mtk-mmsys: Add resets for mt8167
>    arm64: dts: mt8167: Add support for mmsys resets
> 
>   .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
>   arch/arm/boot/dts/mediatek/mt6589.dtsi        |  1 +
>   arch/arm64/boot/dts/mediatek/mt8167.dtsi      |  9 ++++
>   drivers/soc/mediatek/mt8167-mmsys.h           |  3 ++
>   drivers/soc/mediatek/mtk-mmsys.c              | 38 +++++++++++++
>   drivers/watchdog/mtk_wdt.c                    | 54 +++++++++++++++++--
>   .../dt-bindings/reset/mediatek,mt8167-mmsys.h | 35 ++++++++++++
>   .../dt-bindings/reset/mediatek,mt8167-wdt.h   | 21 ++++++++
>   8 files changed, 157 insertions(+), 5 deletions(-)
>   create mode 100644 include/dt-bindings/reset/mediatek,mt8167-mmsys.h
>   create mode 100644 include/dt-bindings/reset/mediatek,mt8167-wdt.h
> 

