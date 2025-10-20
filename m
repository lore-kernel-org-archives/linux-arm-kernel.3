Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86964CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/f5THsVNT2n6+wuFClk7UP7tP672TSKVcPb7xVt1qA=; b=pSQ2g7UydrupDKPhSdVOygfFuK
	pbz/ugNfTWpxWwvEI2JkWVLiwCHi7ES8VrAKB/R1J7Cm5Oq0RfnFX8qf2F/C09RHq2Zpj8qlVpFrs
	Jhsy4d3dl63s5T5tH6muB2O9Jqlb9Cs3xRFQaywb01zfoRp+l+XR6jVCiT51X8Iyv3w5TgYmErts3
	xPKxf6obWYLp5bWU0PjVVqg+lDNWwIBjuxbqbRN+bGmoFSmtpVrk709S4h/Y6Zz+PZmuKz/Q/GuC/
	8quq2lQHgCyfDk9pthIROPt2Ekgg2vmRbJawlAm88lh44v46zrPx9+epVt/mTwx+Ol6Cg3sIY42ut
	7gWfq2MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmT7-0000000CeIm-2Dlt;
	Mon, 20 Oct 2025 09:46:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmT4-0000000CeFz-3H8V;
	Mon, 20 Oct 2025 09:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760953574;
	bh=jImzS7kzdcSLp9Jf+2/whVppszQvlgg1u1y3EIe5sjQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V0pFhusgmorb/EI/Ff3qSALsH+A4wCvTsjbW4TxYmOYLbRf1iQLt0+7ZcKSynNJNr
	 VSKmlM7OTEBSWmkM3ZOy5inFxIhvkWlrHbcTVa2Q3E7RrKCn2TaDnw8aWBuQlzdevt
	 aszck1+q3M1v6YhWjGTclgROU1xcZsKybjEMFXp8cZ5/AkveIbIm4iHorglYqYN7sR
	 MEt8DkpKHFowsspj6uIBFP3DM7IcxElvUgz+gwCg3g4LynJa5MV1lQKIbreLhIID4+
	 awTbLhAerc2fOavsIGw5vKeLlaySd010Ptc2Ve0u1gNdtyv5ppLzRZOatOU1fL5HnU
	 IzBiyEfDm1QwQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFF3F17E0DB7;
	Mon, 20 Oct 2025 11:46:13 +0200 (CEST)
Message-ID: <4ed4e704-ba0d-4d72-bbb1-0bcbfba2dc11@collabora.com>
Date: Mon, 20 Oct 2025 11:46:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/20] arm64: dts: mediatek: Add GCE header for MT8196
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
 <20251017065028.1676930-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_024618_979288_C5AA07EE 
X-CRM114-Status: GOOD (  20.44  )
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

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> Add GCE header define for GCE Thread Priority and GCE Event IDs
> that used in the MT8196 dtsi.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8196-gce.h | 612 ++++++++++++++++++++++
>   1 file changed, 612 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-gce.h
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8196-gce.h b/arch/arm64/boot/dts/mediatek/mt8196-gce.h
> new file mode 100644
> index 000000000000..457dc73aeed3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8196-gce.h
> @@ -0,0 +1,612 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + *
> + */
> +
> +#ifndef __DTS_GCE_MT8196_H
> +#define __DTS_GCE_MT8196_H
> +
> +/* GCE Thread Priority
> + * The GCE core has multiple GCE threads, each of which can independently
> + * execute its own sequence of instructions.
> + * However, the GCE threads on the same core cannot run in parallel.
> + * Different GCE threads can determine thread priority based on the scenario,
> + * thereby serving different user needs.
> + *
> + * Low priority thread is executed when no high priority thread is active.
> + * Same priority thread is scheduled by round robin.
> + */
> +#define CMDQ_THR_PRIO_LOWEST	0
> +#define CMDQ_THR_PRIO_1		1
> +#define CMDQ_THR_PRIO_2		2
> +#define CMDQ_THR_PRIO_3		3
> +#define CMDQ_THR_PRIO_4		4
> +#define CMDQ_THR_PRIO_5		5
> +#define CMDQ_THR_PRIO_6		6
> +#define CMDQ_THR_PRIO_HIGHEST	7
> +
> +/*
> + * GCE0 Hardware Event IDs
> + * Different SoCs will have varying numbers of hardware event signals,
> + * which are sent from the corresponding hardware to the GCE.
> + * Each hardware event signal corresponds to an event ID in the GCE.
> + * The CMDQ driver can use the following event ID definitions to allow
> + * the client driver to use wait and clear APIs provided by CMDQ, enabling
> + * the GCE to execute operations in the instructions for that event ID.
> + *
> + * The event IDs of GCE0 are mainly used by display hardware.

..snip..

> +/* CMDQ_EVENT_MML1_FRAME_DONE_SEL0 ~ 15: 284 ~ 299 */
> +#define CMDQ_EVENT_MML1_FRAME_DONE_SEL(n)					(284 + (n))
> +/* CMDQ_EVENT_MML1_REG_UPDATE_DONE_ENG_EVENT0 ~ 15: 300 ~ 315 */
> +#define CMDQ_EVENT_MML1_REG_UPDATE_DONE_ENG_EVENT0				(300 + (n))
                                                     ^^^^^
There's a typo here                                  (n)

Please fix, after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


