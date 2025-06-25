Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13F5C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 21:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJ6+ws8iYsoAo+/f7/kzG74KYl+qg22HEqZKduhQRd4=; b=LLFQQZb6tY2lB6cdm2WocSASfw
	NkopZbnM1Sir+3gPMpAstaPOrrjm5uWOULav5zXRMVgaXENzDAxziM3gC0KrsaM96MBK6stNQhC8E
	M/dUqE9I20GuNvjYDi1iQlpW6qte1zaT07ysCNS9nSYxquC+SQ1kEX/5TgHktD7te7n8vOB7+ag5W
	WoIJPJYyhq1bds7K0tPGnhS/jy+fH74tG1yOgtEubqQXsWk+AGaTaGY25CBiiJaP85W2YnJ/q9zAE
	R1kzgECFyxK5+aKKxJwtbh8zyHy24KfDNVBlCbHlISHrRHYd/PSkQKbjeQTjsW5N3Pluw/wZRC72j
	bj1bTzIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUY7U-0000000A1FT-272p;
	Wed, 25 Jun 2025 21:57:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXUF-00000009x1p-24Xa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 21:16:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A18F615F0;
	Wed, 25 Jun 2025 21:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A947C4CEEA;
	Wed, 25 Jun 2025 21:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750886214;
	bh=4prugb93ZC+OeAoNZx1cEeiLG8KuCXkhRSGGMhghjJA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QPWmotoN6Pr3ty6QhJmEQgUMG5YfGeAEEOQn7LC7Z7cZDOKx91RJlaLsvaPGR0rXv
	 IC60ujHJyn7RboNytYtA1jiZNinAFcw6L8FJBst5hFcJFmLamq3mdJKTHR9/7Y42cC
	 pWJwSiR1PbEkdqKtcy85s1MqZc/X4XuWlxiSiXDEvhJTLhUREsrDnhNsFkdvXP04GJ
	 aTaL3+VOuBZyIH6fypOyWoYPbaRlgtfJ0xFnKp+Eshkgy3pNnYxTl77CkM3M5npCYI
	 sePXc+qVfF6lFbJIQwnah57Pq1pjnvUryjvjZqnXYe9jk338LFpejeTYzlvkrKZd1C
	 Z9QhLgBPnhu+A==
Date: Wed, 25 Jun 2025 16:16:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Rafal Milecki <zajec5@gmail.com>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Stefan Wahren <wahrenst@gmx.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Hauke Mehrtens <hauke@hauke-m.de>, linux-arm-kernel@lists.infradead.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
To: Taishi Shimizu <s.taishi14142@gmail.com>
In-Reply-To: <20250625154315.114139-1-s.taishi14142@gmail.com>
References: <20250625154315.114139-1-s.taishi14142@gmail.com>
Message-Id: <175088617875.2239084.4449036167098088262.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: bcm: Add support for Buffalo
 WXR-1750DHP
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


On Thu, 26 Jun 2025 00:43:14 +0900, Taishi Shimizu wrote:
> Add Buffalo WXR-1750DHP under BCM4708 based boards.
> 
> Signed-off-by: Taishi Shimizu <s.taishi14142@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250625 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/broadcom/' for 20250625154315.114139-1-s.taishi14142@gmail.com:

arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: /axi@18000000: failed to match any schema with compatible: ['brcm,bus-axi']
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: pcie@12000: 'device_type' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: pcie@12000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: pcie@13000: 'device_type' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: pcie@13000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: pcie@14000: 'device_type' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: pcie@14000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
	'fixed-link' is a required property
	'phy-handle' is a required property
	'managed' is a required property
	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@7: 'phy-mode' is a required property
	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@7: 'oneOf' conditional failed, one must be fixed:
	'fixed-link' is a required property
	'phy-handle' is a required property
	'managed' is a required property
	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@8: 'phy-mode' is a required property
	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#






