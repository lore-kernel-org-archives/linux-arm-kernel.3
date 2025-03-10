Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72968C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6Y89EfuErd64ag/489w65VbpSAeQ7XgKk+rtrJTc2o=; b=32te51NFdzK47Fu1+XeKT2h10t
	Uo2+ZUaN8vdohSkJRYi9N+opL2R8r/fbfWyjm5IVZb1DhzzE2qVmR7e8wf8teOzIH6oJRZpvi+1MH
	o/y82cWb+HjgdCNhKrVKy2KPnuSUSm6MLUL+3I0UmCOYiWpE5Ff7VEGrAy+/s/ti3MaUguypXYq3F
	YxFl4c7xZmw1cHu4U4UNq8U2rwH2lMrXvZm131GbSfifGYsvHdGVcJ+9KGDCVIqY/bvkkQCjAsTRx
	69HWL00qs3r1PJzorNjyUEbc4/eutOWx2SlOOWO/v3smIqEulKQo+cYUSTMFVgfZJUYUL74ODDocH
	WwNsS2RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treNv-00000002yE3-2WKd;
	Mon, 10 Mar 2025 14:45:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcrx-00000002jRv-1YtK;
	Mon, 10 Mar 2025 13:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741612111;
	bh=2V13hVHvXTQg/CvSvaloH3gQXs0wrbSB+sIyuBsXghs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IheArypQWOv9UwpKrgUcsLA0s7vBqv5CjrTQWYvVaDACSjJcSVW7bOxWJJRWuNh+K
	 P8pVN2NV/ZzDfik5eC98VMBi0z9/pAVoYCsSipyoaSWI14fRFHIAcgFx9/07A9jH2f
	 ikaVTr48JHjOeEvHeYEWjriIS8PvlAMvqWegW+2YuwO2lQEzImraGGMR+xrR1U3ZbX
	 tDSpvYfMD461Pmq358tMEeUNDUiPbGuhIQY0jJSpDpJQvCAYB3sZPT5Rett2ym7MvC
	 29jSKLt//tJqG22ia6WF/qvx1lBLSabvt2VLpd5gDufDoCc4G2GrxcJHYCcPqtUzs4
	 HYeq7Ba7hvQkQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BE4517E0B56;
	Mon, 10 Mar 2025 14:08:31 +0100 (CET)
Message-ID: <0abe6c3a-cffe-4aec-a95d-ea27704729b2@collabora.com>
Date: Mon, 10 Mar 2025 14:08:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] pmdomain: mediatek: Add MT8196 power domain
To: Guangjie Song <guangjie.song@mediatek.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250307034454.12243-1-guangjie.song@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250307034454.12243-1-guangjie.song@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_060833_562282_D08A6EAC 
X-CRM114-Status: GOOD (  12.26  )
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

Il 07/03/25 04:44, Guangjie Song ha scritto:
> This series is based on linux-next, tag: next-20250306.
> 
> Changes:
> - Update mtk-scpsys driver for MT8196
> - Add MT8196 power domain support

The mtk-scpsys driver is deprecated since ... 2 years ago, and I have no idea why
MediaTek folks still use it downstream.

Please refactor this and use the mtk-pm-domains driver for any new MTCMOS
implementation.

Thanks,
Angelo

> 
> Guangjie Song (13):
>    pmdomain: mediatek: Support sram isolation
>    pmdomain: mediatek: Support sram low power
>    pmdomain: mediatek: Support power on bypass
>    pmdomain: mediatek: Support check power on/off ack
>    pmdomain: mediatek: Support voting for power domain
>    pmdomain: mediatek: Support trigger subsys save/restore regesters
>    pmdomain: mediatek: Support power domain irq safe
>    pmdomain: mediatek: Support power domain always on
>    pmdomain: mediatek: Refactor parameters of init_scp
>    pmdomain: mediatek: Support bus protect with table
>    pmdomain: mediatek: Add post init callback
>    dt-bindings: power: mediatek: Add new MT8196 power domain
>    pmdomain: mediatek: Add MT8196 power domain support
> 
>   .../mediatek,mt8196-power-controller.yaml     |   74 +
>   drivers/pmdomain/mediatek/mt8196-scpsys.h     |  114 ++
>   drivers/pmdomain/mediatek/mtk-scpsys.c        | 1276 ++++++++++++++++-
>   include/dt-bindings/power/mt8196-power.h      |   57 +
>   4 files changed, 1483 insertions(+), 38 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/power/mediatek,mt8196-power-controller.yaml
>   create mode 100644 drivers/pmdomain/mediatek/mt8196-scpsys.h
>   create mode 100644 include/dt-bindings/power/mt8196-power.h
> 




