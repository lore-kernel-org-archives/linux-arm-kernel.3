Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D28CC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 13:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLOnZ2UTyrylA2FFyaswe4EF8XokfNAhk0bQQAwopKg=; b=ri8l4zSdZQEzZ+mHBblYdbBF87
	br5ioGM+i2DoBDoutl3FX4bLcW0vdphozGn1ni7UuQoUP/RoKsalKszwjIwBdw7DD49l2O8o9aSlT
	qYXmRg7ZNLouLKWZzstXSxGNKu0AQq7F6W7gBPMR7i6C3iWbEA46o899ck5eKv731J70uv5Dwl2dx
	1a41oOXZu/3buKNGVuJa5TyUBMLvLiVh6bB3opXiLlAz+ZKzDhkq1qGk0IpNrQUxQ3S8ZLgydNMJY
	oYnJEX8D25XItSF8z3Qpvzh3KYuAwv5I8c74zWUTCVOnqyedinQ/iYCb9Pk1vI14vTIISgzdP3BpI
	qzZpi1QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFJI-00000000Spb-0x1X;
	Mon, 31 Mar 2025 13:36:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFFu-00000000SEy-23mf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 13:32:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EC34C6116B;
	Mon, 31 Mar 2025 13:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA63C4CEE9;
	Mon, 31 Mar 2025 13:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743427965;
	bh=wCPV4I6wxnXDIBDU9w1IluZ+zjKn8hfElMW+5JaDEC0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=l8wfqMOR3nQ2jR199RvQllaryJPM3uSggSgD0a6d3Q+FS/v9hTzWlrmZ8HXw87d5o
	 a6IiI+sQ8X6AOo78ctWlNfCMqWJq9/vc4YAHT2WRPsMfCLzxuINRjmGcUYNi0zgHv+
	 43vldzx4q0+HmAnMml1kMGBwt4P8zeC7LxMM320Ue+H20uEO3MmMQhwTRdMBWHESuo
	 ELRDW1IDQESY8y3t4LHdIdzxTjIHBjrRbQkzJ5Y20g9jM2A42zVMCH+5RZAQ+OPxgI
	 MV8KqT8kmc+ZnbrVOoUa4bvHm7si9bj41qLY5kAUhS5vDKd0Gd0LbHivEeHzTR0Kwx
	 wG4V4NpoOL3wA==
Date: Mon, 31 Mar 2025 08:32:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kever Yang <kever.yang@rock-chips.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-renesas-soc@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 linux-kernel@vger.kernel.org, Junhao Xie <bigfoot@classfun.cn>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250330195715.332106-1-marek.vasut+renesas@mailbox.org>
References: <20250330195715.332106-1-marek.vasut+renesas@mailbox.org>
Message-Id: <174342765546.2641812.18254954916877172569.robh@kernel.org>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: r8a779g3: Add Renesas R-Car
 V4H Sparrow Hawk board support
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


On Sun, 30 Mar 2025 21:56:08 +0200, Marek Vasut wrote:
> Add Renesas R-Car V4H Sparrow Hawk board based on R-Car V4H ES3.0 (R8A779G3)
> SoC. This is a single-board computer with single gigabit ethernet, DSI-to-eDP
> bridge, DSI and two CSI2 interfaces, audio codec, two CANFD ports, micro SD
> card slot, USB PD supply, USB 3.0 ports, M.2 Key-M slot for NVMe SSD, debug
> UART and JTAG.
> 
> The board uses split clock for PCIe controller and device, which requires
> slight extension of rcar-gen4-pci-host.yaml DT schema, to cover this kind
> of description. The DWC PCIe controller driver already supports this mode
> of clock operation, hence no driver change is needed.
> 
> Marek Vasut (4):
>   dt-bindings: PCI: rcar-gen4-pci-host: Document optional aux clock
>   dt-bindings: vendor-prefixes: Add Retronix Technology Inc.
>   dt-bindings: soc: renesas: Document Renesas R-Car V4H Sparrow Hawk
>     board support
>   arm64: dts: renesas: r8a779g3: Add Renesas R-Car V4H Sparrow Hawk
>     board support
> 
>  .../bindings/pci/rcar-gen4-pci-host.yaml      |   8 +-
>  .../bindings/soc/renesas/renesas.yaml         |   7 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/boot/dts/renesas/Makefile          |   2 +
>  .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 671 ++++++++++++++++++
>  5 files changed, 687 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> 
> ---
> Cc: "Krzysztof Wilczyński" <kw@linux.com>
> Cc: "Rafał Miłecki" <rafal@milecki.pl>
> Cc: Aradhya Bhatia <a-bhatia1@ti.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Junhao Xie <bigfoot@classfun.cn>
> Cc: Kever Yang <kever.yang@rock-chips.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> 
> --
> 2.47.2
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
 Base: tags/next-20250328 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/renesas/' for 20250330195715.332106-1-marek.vasut+renesas@mailbox.org:

arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d8000: clock-names: ['core', 'ref'] is too short
	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: pcie@e65d8000: clock-names: ['core', 'ref'] is too short
	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dtb: pcie@e65d8000: clock-names: ['core', 'ref'] is too short
	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dtb: pcie@e65d8000: clock-names: ['core', 'ref'] is too short
	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d8000: clock-names: ['core', 'ref'] is too short
	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: pcie@e65d8000: clock-names: ['core', 'ref'] is too short
	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#






