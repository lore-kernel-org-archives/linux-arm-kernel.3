Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EA1C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJMm6DfceF2eUzZBuyIgi41UTIevjuCmrQ2v1FeFLbI=; b=v9pjdaqtjhOApWCcarqdiqrpUf
	eKAluybEiCrCy3J18oNNAEOyhml+ZKXR3LykpZIEOg1JUKqiwrIOObns6wS/0TVUWI2eWdtsFsQk0
	Rlw7y5HjG7AVj8nBqJhQ2NomnFV4hOCAe4kNeYwI4ohEJZaWA5ZPl4NB17LA8HxBUR2xMe/QGWeZC
	Q6cQj6aADdKhRFz0t67cWD0fq0tPtqNh5yQN8E96mYdJoBkPwzn87RAjblkXyjAcFzglAH8Gmjb3O
	U4D3La2/vaQN/04rjQZQNaBjFR4Q9MWE5c5ohOKldB2WWQIXVFKB+phv29/ywdSu6aT2JQ+9tla2K
	n3sa/5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQWn-00000004H4i-28vm;
	Fri, 09 May 2025 16:24:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOWy-00000003v1U-1Tey
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:16:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C028A4A761;
	Fri,  9 May 2025 14:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6F4C4CEE4;
	Fri,  9 May 2025 14:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746800211;
	bh=vMVUJZu9yYRGIoVM8aKfqXn5nkHn4uhH6yrt76qg8Bo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ccrr7mhG0MUfhAyaZklvA7LfwZOJnA0way4Qf/VXo+XXV5znPdMuiKRnRaghQfLph
	 fq2Vhqf0OSAMuTO1bec60sjVOHQVSeb220o4P2U1wFWLl4qofUL86KOHqLGWpdgLGx
	 RZZKQ0LMuPtjKKQoPywZk1dUAw+hBy4SR/9uQedk3QD8g6lnBG0fqjZ4D6Akjy8FNy
	 I/JOGXJ9bb7hE+8DOp6lkaaPGn1dNhWB/L52aTz93Gy4tnlyenMYjso8/oAA10exqk
	 KtqBDlUcbyHoSjv91c7Efxsj4WnqvqT8YhN6q4NA+kD2LLV095FC7iMxi1cZ6E/yZm
	 BWiMcR8pzW3hg==
Date: Fri, 09 May 2025 09:16:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Tero Kristo <kristo@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nishanth Menon <nm@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
To: Bryan Brattlof <bb@ti.com>
In-Reply-To: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
Message-Id: <174679984762.3368109.6575241416894070817.robh@kernel.org>
Subject: Re: [PATCH v5 0/3] arm64: dts: ti: introduce basic support for the
 AM62L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_071652_430865_C2830530 
X-CRM114-Status: GOOD (  27.18  )
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


On Wed, 07 May 2025 22:09:18 -0500, Bryan Brattlof wrote:
> Hello Everyone,
> 
> This small series adds the initial support (currently just a UART) for
> TI's AM62L SoC family.
> 
> The AM62L is a lite, low power and performance optimized family of
> application processors that are built for Linux application development.
> AM62L is well suited for a wide range of general-purpose applications
> with scalable ARM Cortex-A53 core performance and embedded features such
> as: Multimedia DSI/DPI support, integrated ADC on chip, advanced lower
> power management modes, and extensive security options for IP protection
> with the built-in security features.
> 
> Additionally, the AM62Lx devices includes an extensive set of
> peripherals that make it a well-suited for a broad range of industrial
> applications while offering intelligent features and optimized power
> architecture as well. In addition, the extensive set of peripherals
> included in AM62Lx enables system-level connectivity, such as: USB,
> MMC/SD, OSPI, CAN-FD and an ADC.
> 
> AM62L is a general purpose processor, however some of the applications
> well suited for it include: Human Machine Interfaces (HMI), Medical
> patient monitoring , Building automation, Smart secure gateways, Smart
> Thermostats, EV charging stations, Smart Metering, Solar energy and
> more.
> 
> Some highlights of AM62L SoC are:
>  - Single to Dual 64-bit Arm® Cortex®-A53 microprocessor subsystem up to
>    1.25GHz Integrated Giga-bit Ethernet switch supporting up to a total
>    of two external
>  - 16-bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
>  - Display support: 1x display support over MIPI DSI (4 lanes DPHY) or
>    DPI (24-bit RGB LVCMOS)
>  - Multiple low power modes support, ex: Deep sleep and Standby
>  - Support for secure boot, Trusted Execution Environment (TEE) &
>    Cryptographic Acceleration
> 
> For more information check out our Technical Reference Manual (TRM)
> which is located here:
> 
> 	https://www.ti.com/lit/pdf/sprujb4
> 
> Happy Hacking
> ~Bryan
> 
> Changes in v1:
>  - switched to non-direct links so TRM updates are automatic
>  - fixed indentation issues with a few nodes
>  - separated bindings into a different patch
>  - removed current-speed property from main_uart0{}
>  - removed empty reserved-memory{} node
>  - removed serial2 from aliases{} node
>  - corrected the main_uart0{} pinmux
>  - Link: https://lore.kernel.org/all/20241117-am62lx-v1-0-4e71e42d781d@ti.com/
> 
> Changes in v2:
> - alphabetized phandles
> - corrected macro and node names for main_uart0 pinmux
> - Link to v2: https://lore.kernel.org/r/20250108-am62lx-v2-0-581285a37d8f@ti.com
> 
> Changes in v3:
> - added more nodes which have been validated
> - added link to data sheet which is now public
> - Link to v3: https://lore.kernel.org/r/20250109-am62lx-v3-0-ef171e789527@ti.com
> 
> Changes in v4:
> - corrected copyright date
> - used the ranges property for the fss{} node
> - converted control MMR's space into a syscon{} node
> - Link to v4: https://lore.kernel.org/r/20250407-am62lx-v4-0-ce97749b9eae@ti.com
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
> Bryan Brattlof (1):
>       dt-bindings: arm: ti: Add binding for AM62L SoCs
> 
> Vignesh Raghavendra (2):
>       arm64: dts: ti: k3-am62l: add initial infrastructure
>       arm64: dts: ti: k3-am62l: add initial reference board file
> 
>  Documentation/devicetree/bindings/arm/ti/k3.yaml |   6 +
>  arch/arm64/boot/dts/ti/Makefile                  |   3 +
>  arch/arm64/boot/dts/ti/k3-am62l-main.dtsi        | 673 +++++++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62l-thermal.dtsi     |  25 +
>  arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi      | 133 +++++
>  arch/arm64/boot/dts/ti/k3-am62l.dtsi             | 121 ++++
>  arch/arm64/boot/dts/ti/k3-am62l3-evm.dts         | 294 ++++++++++
>  arch/arm64/boot/dts/ti/k3-am62l3.dtsi            |  67 +++
>  arch/arm64/boot/dts/ti/k3-pinctrl.h              |   2 +
>  9 files changed, 1324 insertions(+)
> ---
> base-commit: ed6f779e213070572e53e9801e4a6e510d7bc208
> change-id: 20241220-am62lx-ca9498efd87e
> 
> Best regards,
> --
> Bryan Brattlof <bb@ti.com>
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
 Base: using specified base-commit ed6f779e213070572e53e9801e4a6e510d7bc208

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250507-am62lx-v5-0-4b57ea878e62@ti.com:

arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: serial@0 (ti,am64-uart): clock-names:0: 'fclk' was expected
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: syscon@43000000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: syscon@9000000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: syscon@9000000 (syscon): 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: spi@fc40000 (ti,am654-ospi): '#address-cells' is a dependency of '#size-cells'
	from schema $id: http://devicetree.org/schemas/reg.yaml#






