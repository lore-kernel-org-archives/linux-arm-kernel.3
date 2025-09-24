Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809AACAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 10:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSrLsyBqPp2VkZRrMVRRxN6FIFV101kCxP7Vh9vckU0=; b=1R1v7M9i6BktJm611ZT29Z5YgG
	kHBifXt4dd3pvepL6gmzYN5gRR/wi5NXAWcEpPCXgK7EFeGJQmo3P4iSVm5XtDkIYkhy8XEHyXVRH
	yxU7INyuqZS5MbgxZEabZXTIo4W0SWQneZ/MuklCynmnxPPY+1ZABNgcVAMwSQkG1hLosRF6Lkj6g
	BdZoUhoGSCbZkj52lSD9FLMJJ4fDNDkQk8AQulQOPxc++434/QzJ+iAiu3hxCsno3uzVovcVEuAq2
	xKCD/rAHJzpRG8fAh7zpdjRKoMvZnkG1OygG9A/itiA2MH+qMVtgpnqZQG+sUzDT/mIXkQAuzP3o8
	HvKA4Akw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MX6-0000000GPCd-0Vgy;
	Wed, 24 Sep 2025 10:15:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MX3-0000000GPBs-2Qoh;
	Wed, 24 Sep 2025 10:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758708927;
	bh=1uyEu6yafkIx0SXozzaxMJRC9ltSjEJEMuHsl0MpVlU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S93HjY1cAJMNbDfCnyhBybY0llsQplGyrGqfWhpQQRCAFvk9J5NX/iMbG2zVt2mqL
	 s7K6LahFrz2/SowOlGk+h05i3VtpzPIcGdypz9y/6uiDaE7b+W7r/CNZuG++4m2xjR
	 Lnzvm6aUPI539UHXr8WTczL1o5EwFB8BflEdau/FajawvUsUNLV+UhsrW0FPeYJnwv
	 sGqZq66K+GRCImEiLFECqD7x7Ng/PsO3vLiZeR7JA5LoAxMsvHnT8IS7wcMLCyMokl
	 ZNLWzoHsTugp96TAt6fesMYXhvFVKFcYszrWjbaY9r48dsDeTV79SdE09KF8uA0v/c
	 tJqHUnTPwWlfg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AFDC17E12A7;
	Wed, 24 Sep 2025 12:15:26 +0200 (CEST)
Message-ID: <6af21910-5e45-4eef-90d2-690766913bed@collabora.com>
Date: Wed, 24 Sep 2025 12:15:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: mediatek: Add binding for
 mt8189 scp
To: Huayu Zong <huayu.zong@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250924084422.4604-1-huayu.zong@mediatek.com>
 <20250924084422.4604-2-huayu.zong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250924084422.4604-2-huayu.zong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_031529_795774_3C4E8DA0 
X-CRM114-Status: GOOD (  13.42  )
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

Il 24/09/25 10:44, Huayu Zong ha scritto:
> Add the compatible for mt8189 SCP to the binding.
> 
> Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>

Please fix the commit description.

Example:

Add a new compatible for MT8189's SCP: even though this is partially
compatible with the SCP found in MT8192, the register layout has some
slight differences.

...after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogiaocchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index 179c98b33b4d..407be544b404 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -20,6 +20,7 @@ properties:
>         - mediatek,mt8186-scp
>         - mediatek,mt8188-scp
>         - mediatek,mt8188-scp-dual
> +      - mediatek,mt8189-scp
>         - mediatek,mt8192-scp
>         - mediatek,mt8195-scp
>         - mediatek,mt8195-scp-dual
> @@ -168,6 +169,7 @@ allOf:
>               - mediatek,mt8183-scp
>               - mediatek,mt8186-scp
>               - mediatek,mt8188-scp
> +            - mediatek,mt8189-scp
>       then:
>         properties:
>           reg:



