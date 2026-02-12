Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47254EB48F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 09:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NP7+ZHWsB6Psu3ILEUdw+NMZhY4b4eDcDPODDoBFXM=; b=DgzYyj6lghc436/scnKgKSKE9E
	zU0/C6OTpTkRdMttTyeRfkraToCsyge9CNAxNoM/9XWmymjVoAeCRhGfgR4hL58tGZmvbuDx5rvJi
	qyKXvg4nnmXnIwohcAZGMHiXrtH5ntK1BZwmnqTxWmjurVsaK/Let/Gl8mSgcRoui+oas2Ekivqzb
	dp3wUWs7u/ZFZB0HH0yD+ECAj749eyOYwBXt73gfth2dr3qxn2dhQNvN+RLn52YtfCi1Sse0gTb8a
	hUnZ+vGUu7oFfUi59kQi58oWUEnqXOCz8FhxLuTzwF+t/sORoSbYjo8JkAaCR4J1qwZoMCK1kTjIa
	lfC6L3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTNI-00000001rYl-32Fu;
	Thu, 12 Feb 2026 09:52:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTNF-00000001rV8-3RTn;
	Thu, 12 Feb 2026 09:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770889951;
	bh=2LumtwVT4QDDpuSP3HIIGZQ4HRZvYGsUCxRUalgpxrQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hn/4weQHNFlsTBTqG4b29/rCqcdfBAKTztHzp3egMHeHcgipblJR9dpV0RfIaBvPu
	 ZpJiecxTTfwDmZbEo/PNG9KJ85qhxxCE5kJiLLy2cAvJ3+BXGnFIf7s7whR6zhAXwg
	 HfSbOiod8Va28YnMok6ituly8w7teaNNkwqCvK9UTjkNQ2X62uQZrlAygMDcQkRfax
	 F0ZgVJvQiQ1OuLCdpPfyY6kd+gwQ9eNEoSAVEyFlZjFiJrCF+pZwIZUH3GxjK8gF5O
	 7LO1eiGlGdCcsieU1fnxuLNBnER3kVOW/Ze//gbTd/B9ispcOyMRNJ55ACFzm6/44z
	 BdXdK9vAOD7dA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A6A617E1416;
	Thu, 12 Feb 2026 10:52:30 +0100 (CET)
Message-ID: <d62466ab-92d2-4bda-baeb-36786984f59f@collabora.com>
Date: Thu, 12 Feb 2026 10:52:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: mediatek: Add reset controller constants
 for mt8167
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
 <4786b688175eed89b899bdfd7e72505cafd7c3b0.1770836190.git.l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <4786b688175eed89b899bdfd7e72505cafd7c3b0.1770836190.git.l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_015238_011092_E145F233 
X-CRM114-Status: GOOD (  23.74  )
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
> This file comes from the Lenovo Smart Clock kernel sources.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>   include/dt-bindings/reset/mt8167-resets.h | 38 +++++++++++++++++++++++

Please rename this to "mediatek,mt8167-resets.h"

>   1 file changed, 38 insertions(+)
>   create mode 100644 include/dt-bindings/reset/mt8167-resets.h
> 
> diff --git a/include/dt-bindings/reset/mt8167-resets.h b/include/dt-bindings/reset/mt8167-resets.h
> new file mode 100644
> index 000000000000..f77c2ca897cf
> --- /dev/null
> +++ b/include/dt-bindings/reset/mt8167-resets.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *

End the comment here; the extra text is redundant with the specified license
identifier anyway.

> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8167
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT8167
> +
> +/* TOPRGU resets */
> +#define MT8167_TOPRGU_DDRPHY_FLASH_RST		0 /* reset ddrphy and flash pad macro */

Please remove all of the extra comments: they're stating the obvious anyway.

> +#define MT8167_TOPRGU_AUD_PAD_RST		1 /* Write 1 to reset audio_tdm_in_pad,audio_tdm_pad,audio_fifo */
> +#define MT8167_TOPRGU_MM_RST			2 /* Write 1 to reset MMSYS */
> +#define MT8167_TOPRGU_MFG_RST			3 /* Write 1 to reset MFG */
> +#define MT8167_TOPRGU_MDSYS_RST			4 /* Write 1 to reset INFRA_AO */
> +#define MT8167_TOPRGU_CONN_RST			5 /* Write 1 to reset CONNSYS WDT reset */
> +#define MT8167_TOPRGU_PAD2CAM_DIG_MIPI_RX_RST	6 /* Write 1 to reset MM and its related pad macro(DPI,MIPI_CFG,MIPI_TX) */
> +#define MT8167_TOPRGU_DIG_MIPI_TX_RST		7 /* Write 1 to reset digi_mipi_tx */
> +#define MT8167_TOPRGU_SPI_PAD_MACRO_RST		8 /* Write 1 to reset SPI_PAD_MACRO */

You're missing reset N.9 - I'm mostly sure that 9 is

MT8167_TOPRGU_INFRA_AO_RST

> +#define MT8167_TOPRGU_APMIXED_RST		10 /* Write 1 to reset APMIXEDSYS */
> +#define MT8167_TOPRGU_VDEC_RST			11 /* Write 1 to reset VDEC module */
> +#define MT8167_TOPRGU_CONN_MCU_RST		12 /* Write 1 to reset CONNSYS */
> +#define MT8167_TOPRGU_EFUSE_RST			13 /* Write 1 to reset efuse */
> +#define MT8167_TOPRGU_PWRAP_SPICTL_RST		14 /* Write 1 to reset pwrap_spictl module */
> +#define MT8167_TOPRGU_SW_RST_NUM		15
> +
> +/* MMSYS resets */
> +#define MT8167_MMSYS_SW0_RST_B_DISP_DSI0	22

That's not ok. All of the bindings must not be hardware specific, and I know
that this "22" is bit(22) of MMSYS.

The definitions must start from 0 and must have no holes (0 1 2 4 6 7 8 is not ok,
but 0 1 2 3 4 5 is ok).
If you have the entire list and it also matches 1:1 with the HW coincidentally,
that'd be okay as well.

Since I have a hunch that you don't actually have the entire list, you should
at this point define your MT8167_SW0_RST_B_DISP_DSI0 as 0, and check the review
on your mmsys patch for more hints.

P.S.:

#define MT8167_MMSYS_SW0_RST_B_SMI_COMMON	0
#define MT8167_MMSYS_SW0_RST_B_SMI_LARB		1
#define MT8167_MMSYS_SW0_RST_B_CAM_MDP		2
#define MT8167_MMSYS_SW0_RST_B_MDP_RDMA0	3
#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ0		4
#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ1		5
#define MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0	6
#define MT8167_MMSYS_SW0_RST_B_MDP_WDMA		7
#define MT8167_MMSYS_SW0_RST_B_MDP_WROT0	8
#define MT8167_MMSYS_SW0_RST_B_DISP_DSI0	9

> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8167 */



