Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B4AC87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 08:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BsM+FEMzosgLh35P0InUz5dL8znW3eCVJuYhjaw3gs=; b=rC1j8oyE5u73i68IOxxGYRqRf7
	rZCpOJLiOEcLRCsx5zVvz3beOXqOj6yD0w+LaJNhVYYUR+KR6V7ObMZGReiYc+RbeVuu7HpJrj61Y
	Jn4jarz5e9ENs3GDulqAmVpAYbnlRiy3wQFBJKcDoy7kV8fToZ2zUTja7ND6BFHjIZ5yglBQixuxp
	v4pSgkaWWSsis0kJ3qukZTj3AFKASPWLBXzTkwuWEjI/NYfQ22xyDUiPvLK45NGpiyMvKGbepe0OW
	1/H5h2BkQFZqp3ivJX4Y0L8Leu0UnCruGT8ED3sTc//k6A7dDfPF0bM42X8bRpaDSSKMI0VVyO7Q2
	y3R9eTbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqsp-00000009zXl-13bJ;
	Mon, 04 Aug 2025 08:49:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqXZ-00000009wbI-0WJa;
	Mon, 04 Aug 2025 08:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754296047;
	bh=WBkM16+jIJE2ThEr1976D3BhzdAkH74SvuKumd7owH4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VOlqozXGjYZdW/D8GSK4R8eucLjxxlvsVD5QlkUk2b+xl+UZvv3RMyzbpNdCSuoxm
	 7JJQlhLFafz8NjtlbbWQueaL91M8KFeeTfTW/sFhdzFMHay523qLuITYUhZljdR3xy
	 zzvrd+e+19SAOIoO9727ICqwZhUUeaOj3pjBgCWGdqxng6KABWIVNWzLmHCLtOnuvN
	 WOTvvVgIOKl9ZOQ0ehRhKBNvG6RdUp9Lzlr/GEn+ghgw2lvouKlxa0gL4XC4xXonrR
	 Q1NiNsMPrR6OX7O6nd7b1w3rSiDbBgMszEfH8g2uG5hZoObfRnFjgJhtDapNpyJwiq
	 gpjufi90fcsOg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B0ABE17E017D;
	Mon,  4 Aug 2025 10:27:26 +0200 (CEST)
Message-ID: <7aececf2-438a-4dbc-90e6-fd457a12ace6@collabora.com>
Date: Mon, 4 Aug 2025 10:27:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: mediatek: Add binding for
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
References: <20250729023125.9036-1-huayu.zong@mediatek.com>
 <20250729023125.9036-2-huayu.zong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250729023125.9036-2-huayu.zong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_012729_344169_F493FF1A 
X-CRM114-Status: GOOD (  12.73  )
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

Il 29/07/25 04:31, Huayu Zong ha scritto:
> Add the compatible for mt8189 SCP to the binding.
> 
> Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>

Is MT8189's SCP really single-core?

All of the new SoCs have two SCP cores - it's a bit strange to see that 8189 has
only one... hence, please triple check and confirm.

Cheers,
Angelo

> ---
>   Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index adc6b3f36fde..88e240430f3f 100644
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




