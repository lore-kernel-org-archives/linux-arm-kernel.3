Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C995D3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 13:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b71pPrrHkkiZMKpr8Ub09txtcQ6oadNKTnCA1FkS6P0=; b=wXfPprSiOSIAF/zsUcl5DwHBmw
	PIFW2q57fomIX68MIHLoWQItNl3kYHvI/Sog2V70mM1p9Vtz08S6JNNO2sgXBal5q9pvpGh8Z4N8Q
	aPRr8e4S0mGJy48QrtGrqg42X8uN0zeZvklxLO/P22+g9W0FqHlw7s+651zfAoiPhdCHJELJeZIoJ
	Df3p9zIg44bvUT0XlA/v/o/1+oYkcxVC1qpb99lo4yspOGhEknbzUJZyxDz+f25szB4ubAYrI3KTw
	b+/jmge49nJOSRrTE6eXOCmmu0uSNYgRayn4wu+0EbZo1N8MYubsyN1sqMikrf94V05mnsWnSUer5
	sN7iH4vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSbj1-0000000D9eg-2IV0;
	Mon, 08 Dec 2025 13:56:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSbj0-0000000D9eV-1RPh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 13:56:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7831760147;
	Mon,  8 Dec 2025 13:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD3AC4CEF1;
	Mon,  8 Dec 2025 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765202185;
	bh=q5kBNRf/SqM11IIdQGXe3UAt3yaCS3kjKRmqVeeP9H0=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=HhmYCQKJStj4S72teW2h59OFaEYI+LwRmGkaAf9KseT5IUwaL0iBwlUGoHxdVCbeh
	 XPNjK9xwBRmC5jAtewGDLhLaD9xGG4/coydwk+gCfTmuL0mHWwO1ld0jLBj+9XyImY
	 RVJGSJTYx8C5B5qlFPcnwMxlolDoPoWnKYUbKH1Dl6FheNZdY99n3d++ZkCu1VQFiw
	 UcLc7ReP7NMDIGjgyMfFEpI75Nug0eXouuHw7X5Nw/HyxtQVZmv8z2cSfC5L7Ktkwm
	 dvAkWVab4tz4CpKtD18+25ZeuIMDZCmthEHQ2t+QgNiB1fA7wGcvjQS+BkNuu/bQ6g
	 1VYqO7/Xito8g==
From: Rob Herring <robh@kernel.org>
Date: Mon, 08 Dec 2025 07:56:22 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: romain.sioen@microchip.com, alexandre.belloni@bootlin.com, 
 conor+dt@kernel.org, nicolas.ferre@microchip.com, 
 wsa+renesas@sang-engineering.com, claudiu.beznea@tuxon.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org
To: Horatiu Vultur <horatiu.vultur@microchip.com>
In-Reply-To: <20251208083545.3642168-1-horatiu.vultur@microchip.com>
References: <20251208083545.3642168-1-horatiu.vultur@microchip.com>
Message-Id: <176520193900.1461308.2377381391783792991.robh@kernel.org>
Subject: Re: [PATCH v5 0/2] ARM: add support for pcb8385
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


On Mon, 08 Dec 2025 09:35:43 +0100, Horatiu Vultur wrote:
> Add pcb8385 and the documentation for it.
> This is a moduler board on which it can add different daughter cards.
> 
> v4->v5:
> - change the status for aes node to be "reserved"
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
 Base: tags/next-20251208 (exact match)
 Base: tags/next-20251208 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for 20251208083545.3642168-1-horatiu.vultur@microchip.com:

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






