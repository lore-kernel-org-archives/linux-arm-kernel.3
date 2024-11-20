Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D521FD711BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 16:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdjFODBco2eIzG/f9XAkw6kIHG/8HhzqW1HE5VgOYdg=; b=XA+R/StIdklyt0/yLUU+auUcEu
	6f99s70+rxICNVU562GXnNwGaR+E8d+WT9f7Syc654JVR31kPPW7ORZPsEvZ6uFtSwSW1ySdN8vAT
	GzQO8cQWOpvNRGdZcttHjAXiCsc+IdtiKeFC/Kg+SEYRIun19FgZgR/sQaOipuHagsDIcxuJOx5Mf
	IDCdPODeYkcUrsDfrhz63WQRmGqOwQ9MqoK8Hk7LFP0MyHGLiTPpAbLB4+zLeHb/ySxEm6/2d6XR9
	lbnx3Kk42pcOVYt6hbFYLwiuMnNmr9b4ga+bVRVdrar/NI5fywleE3bI5TpIM9qRhOAlRwqsf9/Fb
	k+NSqz0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnDw-0000000Flz7-2MF8;
	Wed, 20 Nov 2024 16:06:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnAM-0000000FlB0-1BkL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 16:02:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C40B35C5DB2;
	Wed, 20 Nov 2024 16:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B5AC4CED3;
	Wed, 20 Nov 2024 16:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732118573;
	bh=JgLWOHmUTemObVeIGpwUPte2754GI41s/ZUZDvGmHiY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=EzZq/XnKvOEpmQceuz8jMQBGH5pVIq3kKZdMG4KalP4y7FTZI/yJN3F4PK5Vng818
	 3iMYCfcfl3WqQ9+5Ws3rnE5efRknAkNqdUPFVq6HQIen8Z8phCIQPdEIQDzt+wl65i
	 GxnPr47skISDZjmpBVuLTLnTdMNlGA+SAJ7BLYWD9LpKsXqjh7KvS28/M9rOEM1KDI
	 zTfV/gsu/REEUuH1Pz5E7uVIxsCH+JkrhbI9WC/LQC+AtaW1cy+MjcTJohYRHm2Mke
	 zHgrEJabJJLC1gyC+gdckFMVWiojkOzhc8/A7k0oP5MuS4SZSpyAZnIm5vq/WZLYA0
	 MFbVcbyjxh4kA==
Date: Wed, 20 Nov 2024 10:02:52 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan.Wanner@microchip.com
In-Reply-To: <cover.1732030972.git.Ryan.Wanner@microchip.com>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
Message-Id: <173211841742.1124520.7475940959733704423.robh@kernel.org>
Subject: Re: [PATCH 00/15] Add support for SAMA7D65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_080254_420397_0B2DDC91 
X-CRM114-Status: GOOD (  19.51  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, arnd@arndb.de, alexandre.belloni@bootlin.com, sboyd@kernel.org, mturquette@baylibre.com, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, romain.sioen@microchip.com, mihai.sain@microchip.com, linux-gpio@vger.kernel.org, dharma.b@microchip.com, linux-serial@vger.kernel.org, claudiu.beznea@tuxon.dev, varshini.rajendran@microchip.com, krzk+dt@kernel.org, linux-spi@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Tue, 19 Nov 2024 09:40:06 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> This series adds support for the SAMA7D65 SoC.
> 
> There have been patches in this series that have been tagged as
> Reviewed-by or Acked-by, I will link these threads below.
> 
> 1) https://lore.kernel.org/lkml/20240829-sama7d65-core-dt-v1-1-e5d882886f59@microchip.com/
> 2) https://lore.kernel.org/lkml/20240829-sama7d65-sck-v1-1-3e7b19e3cbf9@microchip.com/
> 3) https://lore.kernel.org/lkml/20240829-sama7d65-next-v1-1-53d4e50b550d@microchip.com/
> 4) https://lore.kernel.org/lkml/1da0abbb-94e5-42fd-a2d2-71d5d7d253fb@microchip.com/
> 
> The clock system patches have been sent before and are added to this set
> to follow the correct practice of submitting patches. I will list that
> thread below.
> 
> 1) https://lore.kernel.org/linux-arm-kernel/d970e158-db74-4ffe-9fb4-57026ac0a947@tuxon.dev/
> 
> Dharma Balasubiramani (7):
>   dt-bindings: mfd: atmel,sama5d2-flexcom: add
>     microchip,sama7d65-flexcom
>   dt-bindings: atmel-sysreg: add sama7d65 RAM and PIT
>   dt-bindings: mmc: atmel,sama5d2-sdhci: add microchip,sama7d65-sdhci
>   dt-bindings: serial: atmel,at91-usart: add microchip,sama7d65-usart
>   dt-bindings: pinctrl: at91-pio4: add microchip,sama7d65-pinctrl
>   dt-bindings: clocks: atmel,at91sam9x5-sckc: add sama7d65
>   dt-bindings: clock: Add SAMA7D65 PMC compatible string
> 
> Romain Sioen (2):
>   dt-bindings: ARM: at91: Document Microchip SAMA7D65 Curiosity
>   ARM: dts: microchip: add support for sama7d65_curiosity board
> 
> Ryan Wanner (5):
>   ARM: configs: at91: sama7: add new SoC config
>   ARM: dts: microchip: add sama7d65 SoC DT
>   clk: at91: clk-master: increase maximum number of clocks
>   clk: at91: clk-sam9x60-pll: increase maximum amount of plls
>   clk: at91: sama7d65: add sama7d65 pmc driver
> 
> Varshini Rajendran (1):
>   dt-bindings: clock: at91: Allow MCKs to be exported and referenced in
>     DT
> 
>  .../devicetree/bindings/arm/atmel-at91.yaml   |    7 +
>  .../devicetree/bindings/arm/atmel-sysregs.txt |   14 +-
>  .../bindings/clock/atmel,at91rm9200-pmc.yaml  |    2 +
>  .../bindings/clock/atmel,at91sam9x5-sckc.yaml |    1 +
>  .../bindings/mfd/atmel,sama5d2-flexcom.yaml   |    9 +-
>  .../bindings/mmc/atmel,sama5d2-sdhci.yaml     |    1 +
>  .../pinctrl/atmel,at91-pio4-pinctrl.txt       |    1 +
>  .../bindings/serial/atmel,at91-usart.yaml     |    1 +
>  arch/arm/boot/dts/microchip/Makefile          |    3 +
>  .../dts/microchip/at91-sama7d65_curiosity.dts |   89 ++
>  .../arm/boot/dts/microchip/sama7d65-pinfunc.h |  947 ++++++++++++
>  arch/arm/boot/dts/microchip/sama7d65.dtsi     |  155 ++
>  arch/arm/configs/multi_v7_defconfig           |    1 +
>  arch/arm/configs/sama7_defconfig              |    1 +
>  arch/arm/mach-at91/Kconfig                    |   12 +
>  drivers/clk/at91/Makefile                     |    1 +
>  drivers/clk/at91/clk-master.c                 |    2 +-
>  drivers/clk/at91/clk-sam9x60-pll.c            |    2 +-
>  drivers/clk/at91/pmc.c                        |    1 +
>  drivers/clk/at91/sama7d65.c                   | 1373 +++++++++++++++++
>  include/dt-bindings/clock/at91.h              |    4 +
>  21 files changed, 2614 insertions(+), 13 deletions(-)
>  create mode 100644 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
>  create mode 100644 arch/arm/boot/dts/microchip/sama7d65-pinfunc.h
>  create mode 100644 arch/arm/boot/dts/microchip/sama7d65.dtsi
>  create mode 100644 drivers/clk/at91/sama7d65.c
> 
> --
> 2.43.0
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


New warnings running 'make CHECK_DTBS=y microchip/at91-sama7d65_curiosity.dtb' for cover.1732030972.git.Ryan.Wanner@microchip.com:

arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/pinctrl@e0014000: failed to match any schema with compatible: ['microchip,sama7d65-pinctrl']
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1800000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1800000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1804000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1804000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']






