Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D687CE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 11:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0OVdlNEOZtn82PTSzwnBPOB1tH/BvlkhcAFa74Apks=; b=AXeHyqM/nEx7GWqFiHq6HTNdA6
	HwZmT98+NJ3Tl5JYMUamInpTh1ISk3CyL7r7qWclT06sSJG4Yss7IziBoPQhvrREUmRllVLg1Suw1
	OR5nYd8wFkwCb5+BJUvOyccx00tAGGAgOS/ujhp6blW2RYCTYtPJ9XWw5KXlnAABdFqfWIYUDDxuV
	1V4jhhhtSRJ3uq1SRplg81PC606EVpCVt6VUJvJ/5wxY7ErD3/eeKmIb8ZTr5ptRq4GY+lFlHSsbN
	xAH0X/zJ3j8n5o9wswtsYYeLPkTfbFKW7tXf1+J3wxkQ6vbvu1nSBjI1LfSpUE+RY2clsSyebOh+V
	cURnM42w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEQp-00000001cpx-3hsI;
	Thu, 19 Dec 2024 11:11:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEPj-00000001ch6-3S4v;
	Thu, 19 Dec 2024 11:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734606593;
	bh=0arSN+ejbNxnapjrbQiLEUStjChiAuTl6JrFXXXpcUU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=buLi9nq+OCoBZJowmY4W6AkR4JdD7GxHQq9GckVJ1VY7AI8sqCxrep0EAQVb5Z8+v
	 Qjm9TTQ9SKdSa+U+9sa0xGE2i6CZoUpmekIPB6enfigGV8lWInx4lGOFZOfpQ6nwLf
	 lL+QPqXW9aEI4gFDcrBoSd4BPxMJVi9PGzp8ma3lA7ZKpMIvVwSVGCdPoHnkF2RSVV
	 FuSEj0nYHniVGvJRmWcn0Zsu/zy86tlTbiRV+OS0kQwd0S+S5wjTkelv28O4U/MKoU
	 gH6Wj3DjLwNhzjlI3PiNXXcfV4eN1qLcW4YXze3bWRcCEkK/5g2dY4/B0PTQeC6pBB
	 TMZEB6aUzpH9g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CED7717E3615;
	Thu, 19 Dec 2024 12:09:52 +0100 (CET)
Message-ID: <6f92c81f-84d0-4306-96d2-1cfc2ddb72e0@collabora.com>
Date: Thu, 19 Dec 2024 12:09:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: mediatek: ovl: Modify rules
 for MT8195/MT8188
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fei Shao <fshao@chromium.org>, Pin-yen Lin <treapking@chromium.org>
References: <20241213095044.23757-1-jason-jh.lin@mediatek.com>
 <20241213095044.23757-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241213095044.23757-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_030956_038834_BE4E2F53 
X-CRM114-Status: GOOD (  13.80  )
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

Il 13/12/24 10:50, Jason-JH.Lin ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> Modify rules for both MT8195 and MT8188.
> Hardware capabilities include color formats and AFBC are
> changed since MT8195, stop using the settings of MT8183.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   .../bindings/display/mediatek/mediatek,ovl.yaml          | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> index 9ea796a033b2..8ca8e5966b9a 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> @@ -26,6 +26,7 @@ properties:
>             - mediatek,mt8173-disp-ovl
>             - mediatek,mt8183-disp-ovl
>             - mediatek,mt8192-disp-ovl
> +          - mediatek,mt8195-disp-ovl
>             - mediatek,mt8195-mdp3-ovl
>         - items:
>             - enum:
> @@ -36,16 +37,14 @@ properties:
>             - enum:
>                 - mediatek,mt6795-disp-ovl
>             - const: mediatek,mt8173-disp-ovl
> -      - items:
> -          - enum:
> -              - mediatek,mt8188-disp-ovl
> -              - mediatek,mt8195-disp-ovl
> -          - const: mediatek,mt8183-disp-ovl
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-ovl
>                 - mediatek,mt8365-disp-ovl
>             - const: mediatek,mt8192-disp-ovl
> +      - items:
> +          - const: mediatek,mt8188-disp-ovl
> +          - const: mediatek,mt8195-disp-ovl
>   
>     reg:
>       maxItems: 1


Jason, while doing MDP3 bindings for MT8188, I noticed that the binding for OVL is
missing; can you please add a commit on top of this series adding the following
snippet?

       - items:
           - const: mediatek,mt8188-mdp3-ovl
           - const: mediatek,mt8195-mdp3-ovl

...with a suggested-by tag it's going to be fine :-)

P.S.: Please refer to 
https://lore.kernel.org/r/20241218105320.38980-1-angelogioacchino.delregno@collabora.com

Thanks,
Angelo

