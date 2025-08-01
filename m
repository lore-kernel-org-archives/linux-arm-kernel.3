Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D368BC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 07:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chxY6fzxDCIjLihe5H+2JMZKdQasmeYow5oJGM0DO0k=; b=meEXJNHduIHlNVZ/eeOlYR0LM4
	8IezeZzGNISOxW04T6qNZWjFwacz6k+wOjxhNDwD7oUUUmAum7Z9XCieD+W3Yz5Sh3FSQK1iKTvfJ
	6n4qfnBqEzMf6p/MZ4P8cFEPOnr5gbBUTSk8RyG5V1KCyZ/t57iuXGaZPTQeQCjMVpuzx8saUpMDI
	NuWLq+iVvyFGmt3LkcB0e6O8YhR2460fhtb/wRhNnHtlt7lwHstiESp3VgJb9SO8J111gz4wZW3Ga
	h+tq4fm734Qnv4El5naEelzJDhMtCqwom4qNQkOiUd5U32GdzL5rxPoDA3uhU8SWbDDXDSkbv4gKi
	vvGWXYNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkbW-00000005BI5-0TlK;
	Fri, 01 Aug 2025 07:55:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkOl-00000005A9T-40TI;
	Fri, 01 Aug 2025 07:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754034109;
	bh=8GO2QlwNB/o3RC81iMx20QIWHNAykTNaGMaMqbeyk1U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R5E3/LB4VV7xmygCgusprQR3KREteK8ri1mfpXvKRyrORPH4Di2Jh0yYFoWrbNi9g
	 g9xnSL7V2ohJ5ij/Oxzxzo9dOmF+Yw41HC1cqBU17ZP596T+tPj/5TiJXySQVjJfVj
	 VAFB1kQKRmAzDPlcRY336dJ0b8Et60sobK3RqV8fvnVs9pOk4C6iaeHWDpv9K4o34F
	 t3uE1aT+n4HN7nEaPC8DhXmt5TV8ytLpj1/Ber1Dtt98FTfVC6ZOGw1N3bNDiLUszH
	 OdlD50AAzDMtJqmfQoYTnwuOTZb5ZxNXzn2NWcd7GWwaWSZwANDzzM6vdJI31HbP0J
	 XAu7E0dMFA9Hg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 047EF17E0202;
	Fri,  1 Aug 2025 09:41:48 +0200 (CEST)
Message-ID: <e2e2141e-1e58-492e-b151-951eff13dc93@collabora.com>
Date: Fri, 1 Aug 2025 09:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: mediatek : add binding for pwrap,spmi
To: "niklaus.liu" <niklaus.liu@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250801070913.3109-1-niklaus.liu@mediatek.com>
 <20250801070913.3109-2-niklaus.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801070913.3109-2-niklaus.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_004152_179856_31B94CDE 
X-CRM114-Status: GOOD (  16.16  )
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

Il 01/08/25 08:39, niklaus.liu ha scritto:
> Add pwrap,spmi compatible for mt8189  to the binding.

The changes look good, but you have to split the commit in two; one for adding the
compatible to mediatek,pwrap.yaml and one for adding it to the other.

Besides, please check the git log for both yaml files and:
  1. Use the same prefixes that you find in there for your new commit titles;
  2. Add a commit description that describes your change, e.g.:
     "Add a new compatible string for MT8189; this SoC's {spmi, pwrap} IP is fully
      compatible with the one found in the MT8195 SoC."

Regards,
Angelo

> 
> Signed-off-by: niklaus.liu <niklaus.liu@mediatek.com>
> ---
>   .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml         | 1 +
>   Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml    | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> index 4737e5f45d54..c93cea9f203c 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> @@ -52,6 +52,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt8188-pwrap
> +              - mediatek,mt8189-pwrap
>             - const: mediatek,mt8195-pwrap
>             - const: syscon
>   
> diff --git a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> index 7f0be0ac644a..dc61d88008a9 100644
> --- a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> +++ b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> @@ -26,6 +26,7 @@ properties:
>             - enum:
>                 - mediatek,mt8186-spmi
>                 - mediatek,mt8188-spmi
> +              - mediatek,mt8189-spmi
>             - const: mediatek,mt8195-spmi
>   
>     reg:




