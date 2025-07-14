Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1751C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hE0b7p0HWweAEZi+TeBWIa3x7BgUGPPOyhVgW+fkUsE=; b=syLu7H95F0OgGcWTMPofm8cE1n
	Q2AbTV9bC/53Kk5um0qmp4jlGKVq7flqSOL0q+vGkkzhpIId3dg054aYzUjTTjggICL66CsCYygB7
	4IXmsefZcm8LCusTtvUeenMyQasn5U4aR56fJUMos7ULjyYfy4TCHFtBa6ZVYTdFYOtJHloPwXxEE
	vuSVg6M7w+oEp7BfDQxovWYgGEAmFSxLrXHWqD6ykkyb6v1oYcMMuTUz/WHkQd8eeGh9aNQju//IS
	benrHdYpzDFGV7QQ6ZOJ4fbz1v5uMljdB0S/+co3rN0z1NYONLEZ6p5drLRFQ1UOE8ESVxAUyab4o
	3e3OPaMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFS-0000000342A-3OsL;
	Mon, 14 Jul 2025 18:49:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubL2f-00000002enp-2WEY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:24:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 18B5A5C57FC;
	Mon, 14 Jul 2025 15:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A59C4CEED;
	Mon, 14 Jul 2025 15:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752506672;
	bh=97EuZvHvv4ugwMLOhUGF3QO1KrDIi3MQ4YL2KEQadRw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=oihjKSIi/U08U/aF0oUWpCIvcwpkg4fY55ayG74wWQprui21gdwqtombf2URQo2Tc
	 LN/GXPynytAMNsfWcmS4uHX6+SlBU9ibf+1V7tswTWHqOmpfuOhUqBSNdIaKNgofSV
	 vSwTzka19riEp3AEyvwm6Tod0tll9S+tiKkWC7PAJb+lzu1Dy/gRe/Ie9Vg75cWDqd
	 cc+LH9F0YDbuCqxy/iOJJp+r+7rUJY07sWBMdrTRElf8GR55C4EcnP2k/vZIcAj2u0
	 v+a0bPeqT+4xYBYNq/RJ0FQNBLbTk7ot9e/lfK0s7SAdoP3EA/zLqeHw6opRbnHqMc
	 m2bNRSUAGuYOw==
Date: Mon, 14 Jul 2025 10:24:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rafal Milecki <zajec5@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Taishi Shimizu <s.taishi14142@gmail.com>
In-Reply-To: <20250713071826.726682-1-s.taishi14142@gmail.com>
References: <20250713071826.726682-1-s.taishi14142@gmail.com>
Message-Id: <175250104141.2052760.5355993543096717369.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] ARM: BCM5301X: Add support for Buffalo
 WXR-1750DHP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_082433_732858_5D80CDE7 
X-CRM114-Status: GOOD (  19.61  )
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


On Sun, 13 Jul 2025 16:18:23 +0900, Taishi Shimizu wrote:
> This patch series adds support for the Buffalo WXR-1750DHP router,
> based on the Broadcom BCM4708 SoC.
> 
> Patch 1 updates the device tree bindings documentation to list
> Buffalo WXR-1750DHP as a supported board under BCM4708.
> 
> Patch 2 introduces a device tree source file for the router.
> 
> Changes since v1:
>  - remove `chosen` node and `bootargs` (inherited from bcm4708.dtsi)
>  - replace `label` in LEDs with `color` and `function` properties
>  - change USB LED to use `LED_FUNCTION_USB` and added `trigger-sources`
>  - reorder GPIOs and clean up button node formatting
> 
> Taishi Shimizu (2):
>   dt-bindings: arm: bcm: Add support for Buffalo WXR-1750DHP
>   ARM: dts: BCM5301X: Add support for Buffalo WXR-1750DHP
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> # for patch 1
> 
>  .../bindings/arm/bcm/brcm,bcm4708.yaml        |   1 +
>  arch/arm/boot/dts/broadcom/Makefile           |   1 +
>  .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 138 ++++++++++++++++++
>  3 files changed, 140 insertions(+)
>  create mode 100644 arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
> 
> 
> base-commit: 379f604cc3dc2c865dc2b13d81faa166b6df59ec
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


This patch series was applied (using b4) to base:
 Base: using specified base-commit 379f604cc3dc2c865dc2b13d81faa166b6df59ec

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/broadcom/' for 20250713071826.726682-1-s.taishi14142@gmail.com:

arch/arm/boot/dts/broadcom/bcm958305k.dtb: pwm@180aa500 (brcm,kona-pwm): compatible:0: 'brcm,kona-pwm' is not one of ['brcm,bcm11351-pwm']
	from schema $id: http://devicetree.org/schemas/pwm/brcm,kona-pwm.yaml#
arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dtb: pcie@12000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
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






