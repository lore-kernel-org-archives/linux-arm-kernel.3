Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A82ACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7WlWuicRcAfIQmfgRoKNaYB0iwnvQ0+LRgEVHqz19N4=; b=hXH1JvqFQmCVgUAu76ucl44bxJ
	+GmB8hrogkrnysdbvIxQUw2Fz46R89sEToUc0sy7VdQMiDsn3cd2+gcMJkGe13HrtDLoBmJiHn+Zl
	5F/eHrU2cBjB5x91zyETq2MAiOaLSXe3Dmp0R5GJ29jM8Y5LxsS0oMv6XqwqJhhxyXzSwZZ7TftdR
	eEpKuTetorsMNZ1HcSpyER7coBY1Q2wtkDzY3xO2IwbG1PeRSrCtAuVXWfAuJ42FwOMv9WnxgmOfR
	jidQoAvZLnTJzplYGn/HNysc8R8q+xqJjd+bxV99RPAWax/ZyZJg6O0bpLCXDLrx/g82ttfxkBHbn
	EFzkrEeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnSQ-0000000CvzY-3QP8;
	Mon, 20 Oct 2025 10:49:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnSM-0000000CvvO-2Uvx;
	Mon, 20 Oct 2025 10:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760957376;
	bh=O6G4Lmo1b6GenJxk36NYz2xHRekTKQUPL28rSfRMHZA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y/BAatgsJOYxHtPQDNhAuyMZsml6L4Scuy5tsLzWPBGL0O2AbuYMUPHZdMYi2ZRdh
	 TgdHkABRsYrxGKJTZbHR0fEP6CQN29giQuEjtX/PULzG3t4wAzbNmTPWxSGXQkEZBy
	 xavl+K4On1fq78R+Ve8UE2wDYZGvM2ghdoB8pQubiwV1hoTlP5j2lQoDwVsERCJcZK
	 pBL8tNtvGEgYsh/2wQGa6Qls4WKWNYjggTcVvNwfQMmeaEaVOtYqJEBO4FI3B96dsA
	 e+sjzv8sj+k39UWceuZEYwZrYsJLku3oh9Jt0G1moRqN/j8XF/W7JDJ1JSc0ftCTGO
	 icfKv2NanlWYA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D27ED17E13A5;
	Mon, 20 Oct 2025 12:49:35 +0200 (CEST)
Message-ID: <698d4715-2727-4353-9abf-637bcab56494@collabora.com>
Date: Mon, 20 Oct 2025 12:49:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/13] soc: mediatek: add mmsys support for MT8189
To: Xiandong Wang <xiandong.wang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251020074211.8942-1-xiandong.wang@mediatek.com>
 <20251020074211.8942-12-xiandong.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251020074211.8942-12-xiandong.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_034938_829093_C4487FAB 
X-CRM114-Status: GOOD (  14.85  )
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

Il 20/10/25 09:40, Xiandong Wang ha scritto:
> Add driver data for MT8189 and add the routing table for each mmsys.
> 
> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
> ---
>   drivers/soc/mediatek/mt8189-mmsys.h    | 300 +++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c       |  12 +
>   include/linux/soc/mediatek/mtk-mmsys.h |   5 +
>   3 files changed, 317 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mt8189-mmsys.h
> 
> diff --git a/drivers/soc/mediatek/mt8189-mmsys.h b/drivers/soc/mediatek/mt8189-mmsys.h
> new file mode 100644
> index 000000000000..31378b6ee100
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8189-mmsys.h
> @@ -0,0 +1,300 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024 MediaTek Inc.
> + */
> +
> +#ifndef __SOC_MEDIATEK_MT8189_MMSYS_H
> +#define __SOC_MEDIATEK_MT8189_MMSYS_H
> +
> +#include <linux/soc/mediatek/mtk-mmsys.h>
> +
> +#define MT8189_MMSYS_SW0_RST_B				0x190
> +
> +#define MT8189_MMSYS_GCE_EVENT_SEL			0x308
> +#define MT8189_EVENT_GCE_EN					(BIT(0) | BIT(1))
> +
> +#define MT8189_DISP_OVL0_OUT0_MOUT_EN 0xc10
> +	#define MT8189_MOUT_DISP_OVL0_TO_DISP_RSZ0 BIT(0)

two spaces are fine instead of a tab, makes things (just a little) more readable.

#define MT8189_DISP_OVL0_OUT0_MOUT_EN				0xc10
   #define MT8189_MOUT_DISP_OVL0_TO_DISP_RSZ0			BIT(0)

> +	#define MT8189_MOUT_DISP_OVL0_TO_DISP_RDMA0 BIT(1)
> +	#define MT8189_MOUT_DISP_OVL0_TO_DISP_WDMA0 BIT(2)
> +
> +#define MT8189_DISP_OVL1_OUT0_MOUT_EN 0xc14
> +	#define MT8189_MOUT_DISP_OVL1_TO_DISP_RSZ1 BIT(0)
> +	#define MT8189_MOUT_DISP_OVL1_TO_DISP_RDMA1 BIT(1)
> +	#define MT8189_MOUT_DISP_OVL1_TO_DISP_WDMA1 BIT(2)
> +#define MT8189_DISP_OVL_OUT0_MOUT_MASK 0x7
> +

..snip..

> +
> +#define MT8189_OVL_PQ_OUT_CROSSBAR0_SEL_IN 0xc8c
> +	#define MT8189_SEL_IN_OVL_PQ_OUT_CROSSBAR0_FROM_DISP_DITER0 (0)

Parenthesis are not needed on those numbers. Please drop ( ).

> +	#define MT8189_SEL_IN_OVL_PQ_OUT_CROSSBAR0_FROM_DISP_RDMA0_RSZ0_SOUT (1)
> +	#define MT8189_SEL_IN_OVL_PQ_OUT_CROSSBAR0_FROM_DISP_OVL0_OUT0_MOUT (2)
> +	#define MT8189_SEL_IN_OVL_PQ_OUT_CROSSBAR0_FROM_DISP_DITER1 (3)
> +	#define MT8189_SEL_IN_OVL_PQ_OUT_CROSSBAR0_FROM_DISP_RDMA1_RSZ1_SOUT (4)
> +	#define MT8189_SEL_IN_OVL_PQ_OUT_CROSSBAR0_FROM_DISP_OVL1_OUT0_MOUT (5)
> +

Regards,
Angelo



