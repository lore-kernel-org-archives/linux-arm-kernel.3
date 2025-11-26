Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19AAD11184
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 22:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdrMnZaHol+gh7JC5IZ54DjhTXaK6ZsW1Zs+wLD7OTs=; b=ryjoyOY3PgJdO1zEc1qOZQN2EV
	uiKjo5b7lSOJyTt/tjb7u9OwgthP5zJAFY1mHgmwNCXpVl2t+CBlRIFKaBCL9vrXQj1QOPUIubxku
	yYL4iw9tWVjw3kHy87K85IBUzOjRJzV4qciWad0+0KKc76UsUxvCSBLPlzIY/93ef1QvjGrYyY65l
	pNnX4orY/YNACzJxLcfXaGstj9oeIgdI5G+Q+GpFyiswLC2ptKSAF+fepV2LXE4EQuv/Rb+GOzJHW
	OvZ4h8riImHXxv0OG15y+D5BvBAlXsU/PC73LLTjUiTTTmP2JwHDqx9zv16HVkNmjRaYIOcPyb8Nf
	PQXF11bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOOHX-0000000FjMp-3q2K;
	Wed, 26 Nov 2025 22:46:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOOHP-0000000FjKL-3KS9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 22:46:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3512A4382C;
	Wed, 26 Nov 2025 22:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E1BC113D0;
	Wed, 26 Nov 2025 22:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764197191;
	bh=bNM+CROlydlXKDMoCqe7N1HXOL9Z+z1dmdlwlkSYP0M=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=TRJ4EDK2vXcBHljpyUP3HNsgF9G+D3tNgwh+DrxhZ9yfpcpyM/dS/0fGQV/N+b42N
	 bmE+4rvbDG+8gWDot8lbdqHfFrUGElOT90ksM6tOOdxTr4d4SMFvUY4wXayiUn4FeF
	 dfYYinsTEpY/qiLKRvDhJRP4cg1jppxD29RaFf7K/8drflhFeBg2DDH1aKiJ9wJwbN
	 /qSoiRC7gl5/C1cM33xgZuA/cnEHKuR1FATScWakDQfHELUxMda8wSexd7FnRWhVAK
	 o6zyHzTgkgyJc24FintKqpdG5eWyUOfhzx9gMdsoIiX2Amrl6phT/YP8+8e4IvtBqS
	 4uzfOpQCI8fow==
From: Rob Herring <robh@kernel.org>
Date: Wed, 26 Nov 2025 16:46:29 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Ryan.Wanner@microchip.com, 
 romain.sioen@microchip.com, nicolas.ferre@microchip.com, 
 claudiu.beznea@tuxon.dev, alexandre.belloni@bootlin.com, krzk+dt@kernel.org
To: Horatiu Vultur <horatiu.vultur@microchip.com>
In-Reply-To: <20251126100151.1559590-1-horatiu.vultur@microchip.com>
References: <20251126100151.1559590-1-horatiu.vultur@microchip.com>
Message-Id: <176419714481.2726359.16798282036348525511.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] ARM: add support for pcb8385
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_144631_874954_A5E2D90F 
X-CRM114-Status: GOOD (  17.28  )
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


On Wed, 26 Nov 2025 11:01:49 +0100, Horatiu Vultur wrote:
> Add pcb8385 and the documentation for it.
> This is a moduler board on which it can add different daughter cards.
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
>  .../boot/dts/microchip/lan966x-pcb8385.dts    | 133 ++++++++++++++++++
>  3 files changed, 139 insertions(+), 3 deletions(-)
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
 Base: tags/next-20251124 (exact match)
 Base: tags/next-20251124 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for 20251126100151.1559590-1-horatiu.vultur@microchip.com:

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






