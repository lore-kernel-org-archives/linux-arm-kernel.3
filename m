Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE23E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 09:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tiki/a7Tf9A32a9tWNYtLDTCCDfJ/09Cxf9wEvpUnp0=; b=zvX3SpIsaDWycEpFQmSQHIxp6D
	iYajkpJBBNO0QB/e2TdAi3tJd1hKCJLvVmL2289BUPOX4Dvc0VG472sK+zWOazbjMZ3J6S71kr8C2
	a+UPQV2FVBFVWLMB+QwBIB8N440EzTt6nTh19H14SefGMTY+Wk5FKfRE/zoVtnD8QYTemZwhjkKiH
	zTqO3yUhr+wIUL1q1KDyh6HiHfluram/hMWnRPGcZC5HsmChMU2BoJcP3I6jGs+U1mnZ33lbaZ6Rq
	9WUe+ebOUIUnFq92RCpEjjALbRL+ecfqiTJDXYXEOZF6ksYJ2Iw4s2CN1od+6ZoTlFS1zfNjxH1DE
	eRzYQnIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJBV-0000000ES5W-15JR;
	Wed, 11 Dec 2024 09:39:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJAR-0000000ERsE-0njs;
	Wed, 11 Dec 2024 09:38:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13948A41F64;
	Wed, 11 Dec 2024 09:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB2DC4CED2;
	Wed, 11 Dec 2024 09:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733909882;
	bh=li9KvKGtNQTPrbwV+H5ciVeIkjmU6ah0biDJSzitd/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iOzmD3S/eOYo8FLhlYnpQeZjivgLR7HiWsFljppsTK5VgfMafgHqzyoWTRnx9mVfr
	 93CKNJO/xsBmRo7uVSqUaG4p4fyjSTetoZEfVHVm67VeXGrYX2qU7u3mkGVp8qnDwx
	 jGnRexDibe3drsLRV9Bj2W/NlZEBxonLAYScvELFvdN1715df3vpyFo1ylIIgUekA5
	 466/I8Kh4FiYW9BplTIEFJBOwk4yLnBDO59fx6ALP/Pz1avPCRaImUfWvom6AksLYQ
	 iiaWZqo3jp0n0xFadcFCftL5wYu0YZpZEXJPzHWAVQD2d9ui5TDrJSmiPbxX+Gnlw6
	 MVzC/HVF1XWDA==
Date: Wed, 11 Dec 2024 10:37:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, 
	Xavier Chang <xavier.chang@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/8] dt-bindings: mailbox: mediatek: Add GCE header
 file for MT8196
Message-ID: <ozifi65uycmxc5hqeu4onbths5u7dg532iufjxplsjw4jjmhf6@6bdsaabd7hl7>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
 <20241211032256.28494-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211032256.28494-2-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_013803_370586_A751647D 
X-CRM114-Status: GOOD (  17.55  )
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

On Wed, Dec 11, 2024 at 11:22:49AM +0800, Jason-JH.Lin wrote:
> Add the Global Command Engine (GCE) header file to define the GCE
> thread priority, GCE subsys ID and GCE events for MT8196.

This we see from the diff. What we do not see is why priority is a
binding. Looking briefly at existing code: it is not a binding, there is
no driver user.

> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  .../dt-bindings/mailbox/mediatek,mt8196-gce.h | 1439 +++++++++++++++++
>  1 file changed, 1439 insertions(+)
>  create mode 100644 include/dt-bindings/mailbox/mediatek,mt8196-gce.h
> 
> diff --git a/include/dt-bindings/mailbox/mediatek,mt8196-gce.h b/include/dt-bindings/mailbox/mediatek,mt8196-gce.h
> new file mode 100644
> index 000000000000..860d69100157
> --- /dev/null
> +++ b/include/dt-bindings/mailbox/mediatek,mt8196-gce.h
> @@ -0,0 +1,1439 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (c) 2024 MediaTek Inc.
> + *
> + */
> +
> +#ifndef _DT_BINDINGS_GCE_MT8196_H
> +#define _DT_BINDINGS_GCE_MT8196_H
> +
> +/* GCE thread priority */
> +#define CMDQ_THR_PRIO_LOWEST	0
> +#define CMDQ_THR_PRIO_1		1
> +#define CMDQ_THR_PRIO_2		2
> +#define CMDQ_THR_PRIO_3		3
> +#define CMDQ_THR_PRIO_4		4
> +#define CMDQ_THR_PRIO_5		5
> +#define CMDQ_THR_PRIO_6		6
> +#define CMDQ_THR_PRIO_HIGHEST	7
> +
> +/* GCE subsys table */
> +#define SUBSYS_1300XXXX		0
> +#define SUBSYS_1400XXXX		1
> +#define SUBSYS_1401XXXX		2
> +#define SUBSYS_1402XXXX		3
> +#define SUBSYS_1502XXXX		4
> +#define SUBSYS_1880XXXX		5
> +#define SUBSYS_1881XXXX		6
> +#define SUBSYS_1882XXXX		7
> +#define SUBSYS_1883XXXX		8
> +#define SUBSYS_1884XXXX		9
> +#define SUBSYS_1000XXXX		10
> +#define SUBSYS_1001XXXX		11
> +#define SUBSYS_1002XXXX		12
> +#define SUBSYS_1003XXXX		13
> +#define SUBSYS_1004XXXX		14
> +#define SUBSYS_1005XXXX		15
> +#define SUBSYS_1020XXXX		16
> +#define SUBSYS_1028XXXX		17
> +#define SUBSYS_1700XXXX		18
> +#define SUBSYS_1701XXXX		19
> +#define SUBSYS_1702XXXX		20
> +#define SUBSYS_1703XXXX		21
> +#define SUBSYS_1800XXXX		22
> +#define SUBSYS_1801XXXX		23
> +#define SUBSYS_1802XXXX		24
> +#define SUBSYS_1804XXXX		25
> +#define SUBSYS_1805XXXX		26
> +#define SUBSYS_1808XXXX		27
> +#define SUBSYS_180aXXXX		28
> +#define SUBSYS_180bXXXX		29
> +#define SUBSYS_NO_SUPPORT	99
> +
> +/*
> + * GCE General Purpose Register (GPR) support
> + * Leave note for scenario usage here
> + */
> +/* GCE: write mask */

That's a definite no-go. Register masks are not bindings.

> +#define GCE_GPR_R00		0x0
> +#define GCE_GPR_R01		0x1

Best regards,
Krzysztof


