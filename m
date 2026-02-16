Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F4CE7BD8A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjYVUySNIkCUQa6/MHQunH6MUAIykDWx4dsDAl1l4rA=; b=LQ/Pfk4rJ6mMLzWcx4WvErKk1Y
	+6lve4ia6Nhrk3rXqS3rAvjNQYJJwrDrdKZPXkNzV5aSjMRlDJtpLI+T/9rhjsqsKO7rfB+NBciiR
	jq8QoU34DWfihGcTUVHjk5rV/Vmjs9FhIP5x5LTBzTKEgryEFe9DpDrbke2ivfcw/robxHeLbcnbY
	YVbXks1Nzu0RdYVDQFjSUeyLap1Lj7Jk5PoYYQc4XL5NgL8njJ5NpYlHBJiCyIQt6i8LHnsXAKORc
	CMoD/TZwIyVrkO1QiaDGE3JtLsB+WHLsWPRP2PGrVw3SvMLkgEs7qY8tkSJEKQMEqUhyCljoBJXKC
	NaqfvyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwUK-00000006Q5d-1bKv;
	Mon, 16 Feb 2026 11:10:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwUG-00000006Q2e-2jnM;
	Mon, 16 Feb 2026 11:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771240194;
	bh=2BYGDpWEMxrAcG3rC9ZLo1MRGuHLmJZBmcHxB19VUMk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AoJlRGvGYPajnvB4Cm/rRq9OLoK8tHBhM2r8RanKtVnkF06QXMlYr1bkkDJIyFCkd
	 UAVbUc5Y8wfb+00JXuSviZD8B20oKyhZBY80eEYyl258CUHx7Oc023rQBxtiLChF5Z
	 SWub+ywyhX5OvZ7xlEpD0R4AAjP1xvrjjuu+A4RuurDm3yXGc/7O/7tmXVxkmzf+80
	 QCbKTC6qFIQBvOLlVyB4N93LgCtpzOd1e+fnFplGK/fHuHgGNo9XfSTLBeITkeFkBh
	 aMEBuv75GvOSEBBWna7RNhjrQxW2Y+zrjkbNHNoH6PU4a4hbxM9MO+wh5BlafRypny
	 ff45PBNGcucGw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 91B8917E1517;
	Mon, 16 Feb 2026 12:09:53 +0100 (CET)
Message-ID: <4e6b0282-acaf-4d7f-a2df-8163731569c3@collabora.com>
Date: Mon, 16 Feb 2026 12:09:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: display: mediatek: Add compatibles for
 MediaTek mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi
 <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <cover.1771144723.git.l.scorcia@gmail.com>
 <826d54c75cfd1b8e4713431a9426e89edade9eb2.1771144723.git.l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <826d54c75cfd1b8e4713431a9426e89edade9eb2.1771144723.git.l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_030956_848743_4F0A6568 
X-CRM114-Status: GOOD (  16.62  )
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

Il 15/02/26 09:53, Luca Leonardo Scorcia ha scritto:
> Add compatibles for various display-related blocks of MediaTek mt8167.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Awesome. I'd give you my R-b seal of approval, but there's a few nitpicks that
you have to address. Please check below.

> ---
>   .../devicetree/bindings/display/mediatek/mediatek,aal.yaml   | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 4 +++-
>   .../bindings/display/mediatek/mediatek,dither.yaml           | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml   | 5 ++++-
>   .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml   | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml  | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml  | 4 +++-
>   Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml  | 1 +
>   9 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index daf90ebb39bf..4bbea72b292a 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml

...snip...

> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> index 27ffbccc2a08..bcbde16648c0 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> @@ -25,11 +25,14 @@ properties:
>         - enum:
>             - mediatek,mt2701-dsi
>             - mediatek,mt7623-dsi
> -          - mediatek,mt8167-dsi
>             - mediatek,mt8173-dsi
>             - mediatek,mt8183-dsi
>             - mediatek,mt8186-dsi
>             - mediatek,mt8188-dsi
> +      - items:
> +          - enum:
> +              - mediatek,mt8167-dsi
> +          - const: mediatek,mt2701-dsi

This needs its own patch with its own commit description - as this change is not
really "normal".

You have to mention that you're removing the "mediatek,mt8167-dsi" compatible from
that list and that it is safe to do so because:
  - Bootloader doesn't rely on this single compatible; and
  - There was never any upstreamed devicetree using this single compatible; and
  - The MT8167 DSI Controller is fully compatible with the one found in MT2701.

So, please, split this one out of the entire batch.

>         - items:
>             - enum:
>                 - mediatek,mt6795-dsi
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> index 48542dc7e784..ec1054bb06d4 100644

...snip...

> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> index acdbce937b0a..c6d0bbdbe0e2 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> @@ -23,6 +23,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt7623-mipi-tx
> +              - mediatek,mt8167-mipi-tx
>             - const: mediatek,mt2701-mipi-tx
>         - items:
>             - enum:

The PHY bindings are not applied by the same maintainer as the display bindings:
please split that out in a different patch, so that each maintainer can apply
the relevant patch(es).

Besides - apart from those nits, everything in here looks great.

Cheers,
Angelo

