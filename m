Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDB0C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bFIvn0AOp5c8gwMFD2PXnKOyCi3n55NPPZQb2bvlME=; b=nBvc0u2dubSv+YjXKWg+I4jDGH
	QIutTuDropOlHpTY5DUf5trajwAwNl+NvIt5ImtLGFVfX1hkgFi3shkT5tGcofjJBzlBtP4TPq1ZT
	QWxeV1lvm+bMbXM1oJTlIA+7vFicnOCP/Y3fU0Mw7nB4OxnNiGTmp08XWSEPOU2LW5CoaTAfKUgVD
	1jpcDH9UwDCBB56iufS5hYZBXf1oKS6ZnP8ET4BocdcKkQ8KWyG3VFpYda/zI0trWGTOOzLcgXuGp
	iUfVLypilRVdvcO5vq+YTbiZtlfwR6DKv3XWXsZ6lk6/1VRj/dyo9YnM/lL9ApH9Z2WvB0uJZJtxm
	30xTNoyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3q9C-00000008GTl-1KQn;
	Tue, 08 Sep 2026 07:21:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3q9A-00000008GTE-2qi1;
	Tue, 08 Sep 2026 07:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788852094;
	bh=Ejj9lDKow6BoDPwaeCRKyoIRIyv7qHMru8OuXaf1m6E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mdKc3LSueEuRSSZnCyELhmEbWDjgCFtdahz02KU9TcdVWJBXHecEy0QoyzFHwvn6M
	 IT6JwQUuvTtQqAkm8auFqKTIld23QnX6J8p+ocgo/6h/zxNH2w1IQ5le1mA5riD75b
	 E1lBxGbWv8VUxVkRay+M8esCeGf/Hm+ET3M4B4jMPbwQBPJ8pHoqef/sjiiUbnA/0t
	 qvKMCuOSae7YPIRh4EskGoRGCX5f9D9I+qhP030SeA/LedoTuYo0Yyd9MTS/SYE26b
	 H0RUBw9nUEkC4kWdX7l0fvEQdNdOtuH6dP+wOogVzJQcN7Fl+wgNtANTXR3V08yt6D
	 Vz1hB6SH7/gNA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 344C617E06DB;
	Tue, 08 Sep 2026 09:21:34 +0200 (CEST)
Message-ID: <6b22a762-106c-4a22-aa72-30495ab95852@collabora.com>
Date: Tue, 8 Sep 2026 09:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] dt-bindings: watchdog: Add compatible for MediaTek
 mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260819101853.44681-1-l.scorcia@gmail.com>
 <20260819101853.44681-5-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260819101853.44681-5-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_002136_892655_D01CC0F1 
X-CRM114-Status: GOOD (  16.45  )
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

On 8/19/26 12:16, Luca Leonardo Scorcia wrote:
> Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
> which in turn falls back on mt6589-wdt. However according to the data
> sheet mt8167 toprgu is not actually compatible with mt6589: the latter
> has 12 contiguous toprgu reset bits while the former has 14 non-contiguous
> toprgu reset bits.
> 
> Update the mtk-wdt binding to add a dedicated compatible for mt8167 and
> add the IDs that can be used in device trees to identify toprgu and mmsys
> subsystem resets.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>   .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
>   .../dt-bindings/reset/mediatek,mt8167-mmsys.h | 35 +++++++++++++++++++
>   .../dt-bindings/reset/mediatek,mt8167-wdt.h   | 21 +++++++++++
>   3 files changed, 57 insertions(+)
>   create mode 100644 include/dt-bindings/reset/mediatek,mt8167-mmsys.h
>   create mode 100644 include/dt-bindings/reset/mediatek,mt8167-wdt.h
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index 953629cb9558..f514be8a5851 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -26,6 +26,7 @@ properties:
>             - mediatek,mt6795-wdt
>             - mediatek,mt7986-wdt
>             - mediatek,mt7988-wdt
> +          - mediatek,mt8167-wdt
>             - mediatek,mt8183-wdt
>             - mediatek,mt8186-wdt
>             - mediatek,mt8188-wdt
> diff --git a/include/dt-bindings/reset/mediatek,mt8167-mmsys.h b/include/dt-bindings/reset/mediatek,mt8167-mmsys.h
> new file mode 100644
> index 000000000000..b21f67b3b55c
> --- /dev/null
> +++ b/include/dt-bindings/reset/mediatek,mt8167-mmsys.h

The MMSYS resets don't belong to this commit: please split, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
> +#ifndef _DT_BINDINGS_RESET_MEDIATEK_MT8167_MMSYS_H_
> +#define _DT_BINDINGS_RESET_MEDIATEK_MT8167_MMSYS_H_
> +
> +/* MMSYS reset IDs */
> +#define MT8167_MMSYS_SW0_RST_B_SMI_COMMON	0
> +#define MT8167_MMSYS_SW0_RST_B_SMI_LARB0	1
> +#define MT8167_MMSYS_SW0_RST_B_CAM_MDP		2
> +#define MT8167_MMSYS_SW0_RST_B_MDP_RDMA0	3
> +#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ0		4
> +#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ1		5
> +#define MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0	6
> +#define MT8167_MMSYS_SW0_RST_B_MDP_WDMA		7
> +#define MT8167_MMSYS_SW0_RST_B_MDP_WROT0	8
> +#define MT8167_MMSYS_SW0_RST_B_FAKE_ENG		9
> +#define MT8167_MMSYS_SW0_RST_B_MUTEX		10
> +#define MT8167_MMSYS_SW0_RST_B_DISP_OVL0	11
> +#define MT8167_MMSYS_SW0_RST_B_DISP_RDMA0	12
> +#define MT8167_MMSYS_SW0_RST_B_DISP_RDMA1	13
> +#define MT8167_MMSYS_SW0_RST_B_DISP_WDMA0	14
> +#define MT8167_MMSYS_SW0_RST_B_DISP_COLOR	15
> +#define MT8167_MMSYS_SW0_RST_B_DISP_CCORR	16
> +#define MT8167_MMSYS_SW0_RST_B_DISP_AAL		17
> +#define MT8167_MMSYS_SW0_RST_B_DISP_GAMMA	18
> +#define MT8167_MMSYS_SW0_RST_B_DISP_DITHER	19
> +#define MT8167_MMSYS_SW0_RST_B_DISP_UFOE	20
> +#define MT8167_MMSYS_SW0_RST_B_DISP_PWM		21
> +#define MT8167_MMSYS_SW0_RST_B_DSI0		22
> +#define MT8167_MMSYS_SW0_RST_B_DPI0		23
> +#define MT8167_MMSYS_SW0_RST_B_MIPI_TX_CONFIG	24
> +#define MT8167_MMSYS_SW1_RST_B_LVDS_ENCODER	25
> +#define MT8167_MMSYS_SW1_RST_B_DPI1		26
> +#define MT8167_MMSYS_SW1_RST_B_HDMI		27
> +
> +#endif  /* _DT_BINDINGS_RESET_MEDIATEK_MT8167_MMSYS_H_ */
> diff --git a/include/dt-bindings/reset/mediatek,mt8167-wdt.h b/include/dt-bindings/reset/mediatek,mt8167-wdt.h
> new file mode 100644
> index 000000000000..1a24bfe079ca
> --- /dev/null
> +++ b/include/dt-bindings/reset/mediatek,mt8167-wdt.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
> +#ifndef _DT_BINDINGS_RESET_MEDIATEK_MT8167_WDT_H_
> +#define _DT_BINDINGS_RESET_MEDIATEK_MT8167_WDT_H_
> +
> +/* TOPRGU reset IDs */
> +#define MT8167_TOPRGU_DDRPHY_FLASH_RST		0
> +#define MT8167_TOPRGU_AUD_PAD_RST		1
> +#define MT8167_TOPRGU_MM_RST			2
> +#define MT8167_TOPRGU_MFG_RST			3
> +#define MT8167_TOPRGU_MDSYS_RST			4
> +#define MT8167_TOPRGU_CONN_RST			5
> +#define MT8167_TOPRGU_PAD2CAM_DIG_MIPI_RX_RST	6
> +#define MT8167_TOPRGU_DIG_MIPI_TX_RST		7
> +#define MT8167_TOPRGU_SPI_PAD_MACRO_RST		8
> +#define MT8167_TOPRGU_APMIXED_RST		9
> +#define MT8167_TOPRGU_VDEC_RST			10
> +#define MT8167_TOPRGU_CONN_MCU_RST		11
> +#define MT8167_TOPRGU_EFUSE_RST			12
> +#define MT8167_TOPRGU_PWRAP_SPICTL_RST		13
> +
> +#endif  /* _DT_BINDINGS_RESET_MEDIATEK_MT8167_WDT_H_ */


