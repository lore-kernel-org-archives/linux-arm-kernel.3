Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B58CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 23:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60xs9yLtLPnojCcuFs3uou5Y1xjZyu+1do+qwLjgKkc=; b=X0pbe9hv8oRUXlTPVt+mqvcqVZ
	nvg3+zdpfRGs7Pa6H2Bl7EXGT5ai7VxkTD88nvpVka0X3xU9uuMJMu01pbfRUG5Z5bUJFu1i4dXEE
	91CI9pzM4kBXqmCtg6seozIF6rgj2jt+QIupTD45vQHoaaLj+3rM5Twhe28DO1hW9ABsXb5G1Yx+t
	PvMTIhNqV174kyvbd2LIHc3royaqsay5/6MbdAM8FhDk6CoLyLO56X8ighRWF4mdyTH7yJ+sQawu+
	4dGe/2oyMTeqZLWSEm+h6zBiEhawny3ySkDKpWGJ/J5JMX60vdV9QrYXZKyCy1FXuF191yqwDyYW9
	fv/5AHYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urm0o-00000003f5V-1wtZ;
	Thu, 28 Aug 2025 23:26:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjHt-00000003BDw-2OKw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 20:32:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFC9344FD1;
	Thu, 28 Aug 2025 20:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A97C4CEEB;
	Thu, 28 Aug 2025 20:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756413120;
	bh=chUn1trC5oap78AGczBtZJXhoPTABqNbnbAgK9/1vKE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=F4mAE+wlzG6ckj5Bggxfixgyh/Nqc6XfCZLnWK5mygT4nR1rH/eBWoXh4NpF5bJW5
	 sOGyF2MqffaXUYQIKmcT5r+Q3u+u69KtmrkfTqcsWWAvN29uvH2psbyDsVBtPBdfLH
	 uwiLN+vY6jpuuoSHLdXr4GM2XXNujl4Wjt91qmu4cEIIXlEt0m2VYapmXYf5f9MF8j
	 4oiA0PbS1zaFvN4ka7oUPogW16o74kFxQYVbForFSfo8whiogVBamurFcualvFyWGq
	 bf2Pqda6GGBeBcoU0D44ogsfCbKVyh13SyVHjtE1WYcr08YCuG35dZXeSznMNHKrmE
	 lBsJsMSRNIKuQ==
Date: Thu, 28 Aug 2025 15:31:59 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, florian.fainelli@broadcom.com, 
 Ulf Hansson <ulf.hansson@linaro.org>, linux-gpio@vger.kernel.org, 
 Jonathan Bell <jonathan@raspberrypi.com>, svarbanov@suse.de, 
 linus.walleij@linaro.org, devicetree@vger.kernel.org, 
 linux-serial@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 conor+dt@kernel.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Jiri Slaby <jirislaby@kernel.org>, krzk+dt@kernel.org, 
 Al Cooper <alcooperx@gmail.com>, linux-mmc@vger.kernel.org, 
 wahrenst@gmx.net, iivanov@suse.de, mbrugger@suse.com, 
 Will Deacon <will@kernel.org>, Phil Elwell <phil@raspberrypi.com>
To: Andrea della Porta <andrea.porta@suse.com>
In-Reply-To: <cover.1756386531.git.andrea.porta@suse.com>
References: <cover.1756386531.git.andrea.porta@suse.com>
Message-Id: <175641306018.2175061.15558471823903740794.robh@kernel.org>
Subject: Re: [PATCH v2 0/5] Add peripheral nodes to RaspberryPi 5 DT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_133201_652617_C94BF090 
X-CRM114-Status: GOOD (  23.13  )
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


On Thu, 28 Aug 2025 15:17:09 +0200, Andrea della Porta wrote:
> Hi,
> 
> The following patches add a few peripheral DT nodes and related pin/gpio
> nodes for Raspberry Pi 5.
> 
> - Patch 1: Amend the bindings to avoid DT compiler warnings.
> 
> - Patch 2: Adds core pinctrl nodes and defines SD pins as a first appliance
>   for the pinctrl.
> 
> - Patch 3: Wires the gpio-key for power button and related gpio controller.
> 
> - Patch 4: Adds DT node for WiFi.
> 
> - Patch 5: Adds Bluetooth DT node.
> 
> All comments and suggestions are welcome!
> 
> Happy hacking!
> Ivan and Andrea
> 
> 
> CHANGES in V2:
> 
> --- DTS ---
> 
> - bcm2712.dtsi: added a proper clocks node to the uarta serial
>   in order to replace the legacy clock-frequency property. As
>   a result, the following patch from the previous patchset
>   has been dropped since it's now useless:
> 
>   "dt-bindings: serial: Add clock-frequency property as an alternative to clocks"
> 
> 
> Andrea della Porta (1):
>   dt-bindings: mmc: Add support for capabilities to Broadcom SDHCI
>     controller
> 
> Ivan T. Ivanov (4):
>   arm64: dts: broadcom: bcm2712: Add pin controller nodes
>   arm64: dts: broadcom: bcm2712: Add one more GPIO node
>   arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
>   arm64: dts: broadcom: bcm2712: Add UARTA controller node
> 
>  .../bindings/mmc/brcm,sdhci-brcmstb.yaml      |   2 +-
>  .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 133 ++++++++++++++++++
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  55 ++++++++
>  3 files changed, 189 insertions(+), 1 deletion(-)
> 
> --
> 2.35.3
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
 Base: tags/next-20250828 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/broadcom/' for cover.1756386531.git.andrea.porta@suse.com:

arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: /soc@107c000000/pinctrl@7d504100: failed to match any schema with compatible: ['brcm,bcm2712c0-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d504100: failed to match any schema with compatible: ['brcm,bcm2712c0-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: /soc@107c000000/pinctrl@7d510700: failed to match any schema with compatible: ['brcm,bcm2712c0-aon-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d510700: failed to match any schema with compatible: ['brcm,bcm2712c0-aon-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[28, 4], [28, 16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[28, 4], [28, 16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d504100: failed to match any schema with compatible: ['brcm,bcm2712c0-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d510700: failed to match any schema with compatible: ['brcm,bcm2712c0-aon-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[28, 4], [28, 16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#






