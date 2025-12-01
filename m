Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BF6D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 12:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsrxRh3Ib4VdO7ZS7W+rdv/cLZhsGNkiOe1MF0pt/Lw=; b=if8Ir60l1oIq9DAmnH4yhTSJ4Q
	4O51gs1bbNIp1xn6ArAkvf75LxCrniqIafmacww3/vDV4C7TD43cV3B6LllF7jh4tpEYtkbwH0G09
	JJYybf1Q+Vmc61E9XD79fPWxN8jsniwu+JFlgBg5ZnnaSlaHR3YTj1ytHZqcsmqJpOEQ/MB5+OhRu
	pD0I7PnpTRMtQ/3NY8nh54+r7U5fMX2LOFC8Oz3f9Q3jmNRYuPSkp9dNE3C/4FmhQD7jKRnB4nij0
	cf00SCpMHRoRWi41UySCyZUZEc19obYmxnJ0N/UpSdFcZHsn2UTxGZ3mGUvjZTLuICJ3ieNknAV7+
	0skU/Q/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2zg-00000003YMT-3TrF;
	Mon, 01 Dec 2025 12:27:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2zf-00000003YMB-2Bri
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 12:27:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F00E560188;
	Mon,  1 Dec 2025 12:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED58C4CEF1;
	Mon,  1 Dec 2025 12:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764592022;
	bh=1QL/C5xKg2c9Q8Vv8Nax+tL1wCBHG41SGf+nI8jBEfs=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=sf2WBD4VBqUk697ARUWai3jFkhmSF8H5iO6mut0rBUU+xHavfTu46gWSQyaOa59CX
	 dmjYnMw+D1J2l/twVGROo7cixoGNHCEnH87vsCM4QT5lmMdWPPkHn3EOhE30iBVlHL
	 QDlLdAtZGEIyBMOy8D0UjXOOWq9mPzJW5x+Y5qN25e9PDJL6rRhsjObGv2qtU/gBvT
	 RBzXzq6gV2wrs7QS3WxM5bIkL/QiIXD6icnnIxkuzOWvCuIf+lzqiiM00/1EPENSOR
	 tdNoR8CVw6elvYEQMF+O++BdwjD0/XJfaFpLLDjBJF0BVle8F4Wt0yjHTq48BnbPEQ
	 y7/xCRaN6traA==
From: Rob Herring <robh@kernel.org>
Date: Mon, 01 Dec 2025 06:27:01 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, 
 nicolas.ferre@microchip.com, linux-kernel@vger.kernel.org, 
 romain.sioen@microchip.com, alexandre.belloni@bootlin.com, 
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
 conor+dt@kernel.org, claudiu.beznea@tuxon.dev
To: Horatiu Vultur <horatiu.vultur@microchip.com>
In-Reply-To: <20251201082629.2326339-1-horatiu.vultur@microchip.com>
References: <20251201082629.2326339-1-horatiu.vultur@microchip.com>
Message-Id: <176459099710.2909214.17458039501550116582.robh@kernel.org>
Subject: Re: [PATCH v4 0/2] ARM: add support for pcb8385
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


On Mon, 01 Dec 2025 09:26:27 +0100, Horatiu Vultur wrote:
> Add pcb8385 and the documentation for it.
> This is a moduler board on which it can add different daughter cards.
> 
> v3->v4:
> - override i2c0 using labels instead of having it under flx0
> - override usart3 using labels instead of having it under flx3
> 
> v2->v3:
> - remove the linux,default-trigger properties
> 
> v1->v2:
> - sort nodes in alphanumerical order
> - move the eeprom nodes under i2c0
> 
> Horatiu Vultur (2):
>   dt-bindings: arm: at91: add lan966 pcb8385 board
>   ARM: dts: Add support for pcb8385
> 
>  .../devicetree/bindings/arm/atmel-at91.yaml   |   6 +-
>  arch/arm/boot/dts/microchip/Makefile          |   3 +-
>  .../boot/dts/microchip/lan966x-pcb8385.dts    | 131 ++++++++++++++++++
>  3 files changed, 137 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm/boot/dts/microchip/lan966x-pcb8385.dts
> 
> --
> 2.34.1
> 
> 
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
 Base: tags/next-20251201 (exact match)
 Base: tags/next-20251201 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for 20251201082629.2326339-1-horatiu.vultur@microchip.com:

arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: /soc/usb@200000: failed to match any schema with compatible: ['microchip,lan9662-udc', 'atmel,sama5d3-udc']
arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: /soc/usb@200000: failed to match any schema with compatible: ['microchip,lan9662-udc', 'atmel,sama5d3-udc']
arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): $nodename:0: 'serial@200' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): False schema does not allow 32
	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): $nodename:0: 'serial@200' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): False schema does not allow 32
	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: rng@e0048000 (atmel,at91sam9g45-trng): 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/rng/atmel,at91-trng.yaml
arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): $nodename:0: 'serial@200' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): False schema does not allow 32
	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): $nodename:0: 'serial@200' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): False schema does not allow 32
	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): 'atmel,usart-mode' is a required property
	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): $nodename:0: 'serial@200' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): False schema does not allow 32
	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml






