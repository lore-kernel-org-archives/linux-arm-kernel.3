Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F93C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 12:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4+zpkPyRuuk/JisAPcmXSoPwN8uF6axZAzPzO0OT3k=; b=NLSzLe8/Dxyxp/tfj35BHgLQt5
	IfN95lRcEKftodw2u91wKMq9IBaipS9rJwL7SJ8bpWx/FgMukIpGq7Ab8PZyOV4V4a16ATeQl34aB
	GUvq25KfH17YCxmaX8689aNJefCGSvUel+fCNCHcv5y3RHRfTvSKjOqAkEKLcIPDQ8PvGQKJboA3M
	L+hFrQC0ptv58Q2ZjE+t7fxx0o5xCeD4keyxMCU6wOZ2+R6tek2zBA6nFSYgQMp5V3afBPY+CRzgY
	tWtIk7GRcVoc+6rcI1JLQLCM4rWN7qVCQgP4VlCb7UKIt4zPhWc3Tt8N5ylKjDKqylKaMaPDhZDZ4
	T7kxaKbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjc4-0000000CnZw-1Mbv;
	Wed, 19 Feb 2025 12:55:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjVt-0000000ClFX-3u0r;
	Wed, 19 Feb 2025 12:49:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739969356;
	bh=ZyOK9nag+8gUZ/F4eVgxxf/3BmUwS+AQI47Swx/xonk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eEZD4HgaCqIpEiiGGjAVB7dg/5/yZvma2y3+45M+1z5UcCk6/ZBRqop7gQHtrZqm0
	 Ev5GJbFPR/wyOU3Unn2sbzlGMdVbHszuF1aa6KSHAZpEnu+NITdWmBR3smM58aidCV
	 iTURTCaSl0Lbt/AKB7fJm/TK7/Js5L+0iWYutBwG3inRnizKQeaN0K6n7XzZr2PUSC
	 MqOdYF0dI5Fmb9KoFzhkb0kBdmqaU/8ZanjOk9Iep2rvDMFrQBhLdIIIsLKXO61/9i
	 0TUR4wyILZmgNNYKZPKs/u2vUnkSyUpsXZ10hg4dlZtFoAFq2OgRSrsBUAis0wfoBb
	 t8WzShqkm8Haw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6780B17E14E7;
	Wed, 19 Feb 2025 13:49:15 +0100 (CET)
Message-ID: <bb3fb8df-7a15-4732-a75f-8e2fc17c04fc@collabora.com>
Date: Wed, 19 Feb 2025 13:49:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] dt-bindings: display: mediatek: ccorr: Add support
 for MT8196
To: Jay Liu <jay.liu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250219092040.11227-1-jay.liu@mediatek.com>
 <20250219092040.11227-5-jay.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250219092040.11227-5-jay.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_044918_116742_B6820258 
X-CRM114-Status: GOOD (  13.53  )
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

Il 19/02/25 10:20, Jay Liu ha scritto:
> Add a compatible string for MediaTek MT8196 SoC
> 

Add a compatible string for the CCORR IP found in the MT8196 SoC.
Each CCORR IP of this SoC is fully compatible with the ones found in MT8192.


Please fix the commit description here, other than in dither and gamma.

After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> ---
>   .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml     | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index fca8e7bb0cbc..581003aa9b9c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -32,6 +32,7 @@ properties:
>                 - mediatek,mt8186-disp-ccorr
>                 - mediatek,mt8188-disp-ccorr
>                 - mediatek,mt8195-disp-ccorr
> +              - mediatek,mt8196-disp-ccorr
>             - const: mediatek,mt8192-disp-ccorr
>   
>     reg:



