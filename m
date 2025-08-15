Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98EBCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 21:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6H8T8sq6q2uOPadasPsgDIQTeCBLg4ZNgmyV7gn1ou4=; b=krUDPlsaonNDcNJrrZN517/+ho
	iBe6Bct3KhzSubZzqGw+X6LPgP3KPgmNwITzdZQBNgj1kfXa+AiIMBzC+bOGvG9QSj3MplcDgExGZ
	Tgb/zxVRT7twawz3qYphhHFZP6wzSxVpkrsI4AYa5XUeVYIvEZ5kJ6e8piVxt44cisYKWDUA2Liql
	gBpaQUDYJ7OEmiYpM79/OFyO7ROP0QkLXOsjnb8SiAxbJOZzePegzo+e24gJFthQmC9ZIQBKsKyYt
	EWzFLYocqos/R1c8V3OZVODVu1Txy/hcjf8KhIgtTBAcFSCSmwx4ThBUW0Lw1BQF/p6HbNnaFlU6C
	vV3aMFFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un1xE-00000003Y1h-3swC;
	Fri, 15 Aug 2025 21:27:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un1pQ-00000003XEr-2bam
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 21:19:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F2AC7464C4;
	Fri, 15 Aug 2025 21:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B913CC4CEF8;
	Fri, 15 Aug 2025 21:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755292751;
	bh=cJhl0OslGGxuBTiQrTRj+9aBCfXCW2Jm4WVhzEwl87Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=H86O9bnz9X1b8H1xu/xBQtEiPymWyHyurxwQ884fE4MynR5nygyGrARiRtqulgDrM
	 4oz5B2gxZsExmYQYX/T4LcpD1h7Y8lFeTqLG9ofIcy8k6lmuuFpJc5tZfM60f3bxZ1
	 RufZaGvs9OfPz4z8Dm6Zp/y7cTI+RpIe7lM1evnwvhMYSMh8MGNmVQTKUmeaBSE14m
	 dlTfAtjLgbtH5S2pHCgKz7b5QhhtOHTPc5Gu7SPNocR8d+/LbREeeQP2jorVB1vu6G
	 b34hE7GpoD7V/kIaRl8rgy6UAsEgy/++Yr96cyrWb4IRG1dd2R48GXWBsHYprCrvQ+
	 vdLN2LNqTzoow==
Date: Fri, 15 Aug 2025 16:19:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Csaba Buday <buday.csaba@prolan.hu>, linux-arm-kernel@lists.infradead.org
To: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
In-Reply-To: <20250815-b4-tx6ul-dt-phy-rst-v1-1-9b65e315d9d3@prolan.hu>
References: <20250815-b4-tx6ul-dt-phy-rst-v1-1-9b65e315d9d3@prolan.hu>
Message-Id: <175529260064.3212410.10009645356875369525.robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6ul-tx6ul: Switch away from deprecated
 `phy-reset-gpios`
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_141912_708692_E60FF584 
X-CRM114-Status: GOOD (  14.17  )
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


On Fri, 15 Aug 2025 17:17:37 +0200, Bence Csókás wrote:
> The Ethernet PHY's reset GPIO should be specified in the node of the PHY
> itself, instead of the MAC (`fec`). The latter is deprecated, and was an
> i.MX-specific extension, incompatible with the new reset controller
> subsystem.
> 
> Co-developed-by: Csaba Buday <buday.csaba@prolan.hu>
> Signed-off-by: Csaba Buday <buday.csaba@prolan.hu>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
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
 Base: using specified base-commit 0cc53520e68bea7fb80fdc6bdf8d226d1b6a98d9

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250815-b4-tx6ul-dt-phy-rst-v1-1-9b65e315d9d3@prolan.hu:

arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0011.dtb: / (karo,imx6ul-tx6ul): i2c-gpio: {'compatible': ['i2c-gpio'], '#address-cells': 1, '#size-cells': 0, 'pinctrl-names': ['default'], 'pinctrl-0': [[69]], 'sda-gpios': [[48, 1, 0]], 'scl-gpios': [[48, 0, 0]], 'clock-frequency': 400000, 'status': ['okay'], 'rtc@68': {'compatible': ['dallas,ds1339'], 'reg': [[104]], 'status': ['disabled']}} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: / (karo,imx6ul-tx6ul): i2c-gpio: {'compatible': ['i2c-gpio'], '#address-cells': 1, '#size-cells': 0, 'pinctrl-names': ['default'], 'pinctrl-0': [[68]], 'sda-gpios': [[48, 1, 0]], 'scl-gpios': [[48, 0, 0]], 'clock-frequency': 400000, 'status': ['okay'], 'rtc@68': {'compatible': ['dallas,ds1339'], 'reg': [[104]], 'status': ['disabled']}} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0011.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c22): 'resets' is a dependency of 'reset-names'
	from schema $id: http://devicetree.org/schemas/reset/reset.yaml#
arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c22): 'resets' is a dependency of 'reset-names'
	from schema $id: http://devicetree.org/schemas/reset/reset.yaml#






