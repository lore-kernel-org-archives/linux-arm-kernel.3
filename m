Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F71AC982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFVfo1v7jirkWu6+NQc0qUUrdWWw/JuSYHwIAeqYUag=; b=tzxYbvJ5LeeSQV+qdwqGWFgFh/
	dz0wvJHUTHysjpw1zun0Ug5fLO5JYKdxZQXP0m+myYUKJtWI6Ja5AIo86xMTC/7SI9kL80gva07Be
	trip6MLubtD/n4PAEu0WMKqLZoibcCLsTs7d4sKmTt9FRv2UIUgodo9hx+HcxhbunCfzA9APe/WXd
	vpPS4PCSIjYYTjcX3Y+Os33a5zxBkrchCRdELWoMWuh393dmoBVf6CwUCVG4ZmGde1j44qxqQvtvA
	0gmqa03ZcX3lTprWgcX8DqTsAhbGOSKZgg8YvafFk+GHTI9BAuBQJpGTsWH6sD/PrlFYod4nSwVA8
	NPLBm8zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ywI-00000005EFb-0du3;
	Tue, 22 Sep 2026 11:45:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yvu-00000005DyP-0Mh2;
	Tue, 22 Sep 2026 11:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OFVfo1v7jirkWu6+NQc0qUUrdWWw/JuSYHwIAeqYUag=; b=laOLxDGTq6M+SNomLPc6ccTvev
	z2vVtnAG8FuUuuGCP5fus+EnHnHgknQ6ffJiWM0z5dwK4GZz9nHCOLSQMTHKKHvwKtVC7AB25gCLd
	CsyOHB7wOpNZeAcMHO2ByG4rkM9UJKJ4QecxwN6BuPnwC9LEJm1AUAMMTuG9tpCpQ83VRQGj5uZqG
	Ktl+yjJV5MTKS4rX6oJqUrmDB3cgih4yARZmUpMDbUwiGL38ubOiubKK4gjYoxm5XopI2Tdq4ZOck
	eHKcBFjL1ivU8rzdkApAtBAIh3N/BQXB7EUHuyovMS7ZgMEgezGvMw7iqdMYsI5+SAwi7mmf6d3DT
	LCy4G+PQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8yvr-0000000DVTp-0DnC;
	Tue, 22 Sep 2026 11:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077505;
	bh=nVhD/4MjWM8j1FzDpqCVCao9PsGmI7N0h8F75GJSEFc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dprtpitr3AspMjmZsaSSq3vHtti7lA6slpnG0Pc2C8+HOHgqCUWk0skdav6PhFB3c
	 08PoBlmiat1O2ZJ2YfvYw4XQ19XeI41WwppXg74bNUjP5mfxsW+RoqG9GdFyWyf8MW
	 S6FyR86vOSDVdmYGrvgQcDvfFXGP5nIpH37szugpoBBYsbjiDt3wFaDfLFaywNxFN3
	 Rrcf+TaCJzEk6YPK4txB8oO7n2Eq61nbFQpWG+fOmVHfkDFmeciSxYuIDnbD4XziY6
	 +W1DUF6AouXIBaxjHtTyZo2vfRtlAhp3s/vTpdd/PPstwz1+9kJwKAgf4ju8hdWMWg
	 WyPApt70ss/ow==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2985C17E03B6;
	Tue, 22 Sep 2026 13:45:05 +0200 (CEST)
Message-ID: <bef176a0-7b13-4753-9d9c-494a0bf04cea@collabora.com>
Date: Tue, 22 Sep 2026 13:45:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: iommu: Describe MT8195 infra IRQs
To: "Rob Herring (Arm)" <robh@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260921232716.3134140-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260921232716.3134140-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_124507_297837_B96D99A2 
X-CRM114-Status: GOOD (  13.22  )
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

On 9/22/26 01:27, Rob Herring (Arm) wrote:
> The MT8195 infra IOMMU has one fault interrupt per IOMMU bank. Require
> the five bank interrupts, named bank0 through bank4, for this
> compatible. Keep other MediaTek IOMMUs limited to one unnamed interrupt.
> 

Why are you introducing interrupt-names, and why would that be a required property?

I disagree - interrupt names are not necessary here.

Cheers,
Angelo

> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   .../bindings/iommu/mediatek,iommu.yaml        | 30 ++++++++++++++++++-
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  2 ++
>   2 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index 79c573c47b08..4dc5621c17e1 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -100,7 +100,11 @@ properties:
>       maxItems: 1
>   
>     interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 5
> +
> +  interrupt-names:
> +    description: Names of IOMMU banks providing fault interrupts.
>   
>     clocks:
>       items:
> @@ -155,6 +159,30 @@ required:
>     - '#iommu-cells'
>   
>   allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8195-iommu-infra
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 5
> +        interrupt-names:
> +          items:
> +            - const: bank0
> +            - const: bank1
> +            - const: bank2
> +            - const: bank3
> +            - const: bank4
> +      required:
> +        - interrupt-names
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +        interrupt-names: false
> +
>     - if:
>         properties:
>           compatible:
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 9aaf8b6edcb5..3e46ffaa44c6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -937,6 +937,8 @@ iommu_infra: infra-iommu@10315000 {
>   				     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH 0>,
>   				     <GIC_SPI 798 IRQ_TYPE_LEVEL_HIGH 0>,
>   				     <GIC_SPI 799 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names = "bank0", "bank1", "bank2", "bank3",
> +					  "bank4";
>   			#iommu-cells = <1>;
>   		};
>   


