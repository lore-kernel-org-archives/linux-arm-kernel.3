Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39418C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ae29yEhmLtJ/pu/9Q7lgVQf9iEv2Fh8049ORrGbyr4g=; b=fdO0UtWYliyZqB8NfxJBZXJY0C
	qCXarBPBqfwzL1vqhAIx+jjnxCjp0hUSKWLKB+fm3y8MNKAytKFOZSTPfpPjwvW+6VhWyZUUieQSL
	6mN2w/BVf+5hmkk9RODYCWUvFBjdnyWcRhsEn94tMM6AGQ/+pvnUGooO43fFFKZx7yArhseLClg7I
	0UmSaHPJ+IgGk4tDgPCQ8s4YTJjXQ/cWWZ4APmWFH1TvO4Lvqx8Vn9Nd+JXEwQYOZYAoqAXu1Qld7
	lT060VFPGrYNWJTMRGz93b0AOYPo0qv7tkajr7o05M7DN0DCiJ4OQbEzXjb0uImaryR10exs02B14
	fAzSJ9UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4k7c-00000006ZZ1-3fJI;
	Tue, 15 Apr 2025 17:30:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jp1-00000006WXY-2w6e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:11:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E953661360;
	Tue, 15 Apr 2025 17:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4368AC4CEE9;
	Tue, 15 Apr 2025 17:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744737102;
	bh=bX3HlicaR5g9IQkWktPKTPPgxg/GT1DUALZhUDDxksQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IP85qR6bV4L3UG0faBuQ49erg90k/sWL9aUpz1KIaYIwzgy4fFx3RwsRnRgaMWE0m
	 hGFVDqDUJjUwDDN7lCB7mrtF68mDZkkYqPvHojepnb3crZXbW9flRJkXBd/AMQ3ryB
	 +GAdxi6ubLdQz/wmUsueTYvoug8FfiWLI1eOJdPivkyMRkD4PBeuz85+GbmWNXNNDL
	 GjFUXg9DBkqstMFdkJ43UZ042/UPntgyRExtbXAg2IV6cfIP8MphsHu3tLR1RkN/y0
	 7VTTlyFDtRLLXddVyvHjukOEZX9qTGZNHVSUbJS4x7LnHCvJt5X/69cM0dZwKgW0CY
	 QAmSiHJQiWi0w==
Date: Tue, 15 Apr 2025 12:11:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: p.zabel@pengutronix.de, claudiu.beznea@tuxon.dev, 
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 sre@kernel.org, linux-pm@vger.kernel.org, krzk+dt@kernel.org, 
 lee@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 conor+dt@kernel.org
To: Ryan.Wanner@microchip.com
In-Reply-To: <cover.1744666011.git.Ryan.Wanner@microchip.com>
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
Message-Id: <174473699521.763781.11057126533938200198.robh@kernel.org>
Subject: Re: [PATCH v5 00/11] Enable Power Modes Support for SAMA7D65 SoC
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


On Mon, 14 Apr 2025 14:41:17 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> This patch set adds support for low power modes for the SAMA7D65 SoC and
> the required components and changes for low power modes.
> 
> The series includes changes in the asm code to account for the addtional
> clocks that are in this SoC.
> 
> The Device tree additions are to enable all the components needed to
> keep the SoC in low power mode.
> 
> There are some DTB check warnings but that is due to the dt-binding not
> in the correct .yaml file format.
> 
> Changes v1 -> v2:
> - Add missing compatible for ddr3phy, it is now in both syscon sets.
> - Fix alphabetical ordering for sama7d65.
> - Remove the incorrect reorganizing patch.
> - Remove sama7g5-rtt as a compatible for sama7d65-rtt and add
>   sama7d65-rtt as a compatible wake up source in the pm driver.
> 
> Changes from v2 -> v3:
> - Correct mistake in v2 sfrbu dt-binding patch.
> - Correct incorrect dt-binding addition and formatting for rtc and rtt bindings.
> - Add missing SoB tag.
> - Cleaned up commit message for Backup mode to describe SHDWC is status
>   register is cleared for this SoC.
> - Cleaned up variable naming and usage for mcks. Changed the mcks number
>   to the correct number of clocks needed to be saved and corrected the
>   ASM code accordingly.
> - Removed the SHDWC from ULP0 wake-up source as it is not configured as
>   a valid wake-up source for ULP0.
> - Separated all the DTSI and DTS changes into individual patches.
> 
> Changes from v3 -> v4:
> - Add sama7d65-gpbr to the dt-binding.
> - Converted the sama5d2-secumod binding into yaml format.
> - Add sama7d65-secumod to the new dt binding.
> - Collect and remove applied and accpeted pathces from the set.
> 
> Changes from v4 -> v5:
> - Use generic naming for dt-binding yaml example.
> - Adjust DTSI SECUMOD node to match generic naming.
> - Collect Acked and Reviewed tags.
> 
> v1) https://lore.kernel.org/linux-arm-kernel/cover.1738257860.git.Ryan.Wanner@microchip.com/
> v2) https://lore.kernel.org/linux-arm-kernel/cover.1739221064.git.Ryan.Wanner@microchip.com/
> v3) https://lore.kernel.org/linux-arm-kernel/cover.1740671156.git.Ryan.Wanner@microchip.com/T/#m576233e7af84d68559afb286884c2b9294e7bc1d
> v4) https://lore.kernel.org/linux-arm-kernel/cover.1742936082.git.Ryan.Wanner@microchip.com/
> 
> Ryan Wanner (11):
>   dt-bindings: sram: Add microchip,sama7d65-sram
>   dt-bindings: power: reset: atmel,sama5d2-shdwc: Add
>     microchip,sama7d65-shdwc
>   dt-bindings: reset: atmel,at91sam9260-reset: add
>     microchip,sama7d65-rstc
>   dt-bindings: rtc: at91rm9200: add microchip,sama7d65-rtc
>   dt-bindings: at91rm9260-rtt: add microchip,sama7d65-rtt
>   dt-bindings: mfd: atmel: Add microchip,sama7d65-gpbr
>   dt-bindings: mfd: syscon: atmel,sama5d2-secumod: convert to yaml
>   dt-bindings: mfd: syscon: add microchip,sama7d65-secumod
>   ARM: dts: microchip: sama7d65: Add SRAM and DRAM components support
>   ARM: dts: microchip: sama7d65: Add RTT and GPBR Support for sama7d65
>     SoC
>   ARM: dts: microchip: sama7d65: Add RTT timer to curiosity board
> 
>  .../bindings/arm/atmel,sama5d2-secumod.yaml   | 49 +++++++++++++++++++
>  .../devicetree/bindings/arm/atmel-sysregs.txt | 25 ----------
>  .../bindings/mfd/atmel,at91sam9260-gpbr.yaml  |  1 +
>  .../power/reset/atmel,sama5d2-shdwc.yaml      |  5 ++
>  .../reset/atmel,at91sam9260-reset.yaml        |  3 ++
>  .../bindings/rtc/atmel,at91rm9200-rtc.yaml    |  4 +-
>  .../bindings/rtc/atmel,at91sam9260-rtt.yaml   |  1 +
>  .../devicetree/bindings/sram/sram.yaml        |  1 +
>  .../dts/microchip/at91-sama7d65_curiosity.dts |  4 ++
>  arch/arm/boot/dts/microchip/sama7d65.dtsi     | 47 ++++++++++++++++++
>  10 files changed, 114 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.15-rc1-45-g43e9076a00b1 (best guess, 7/9 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for cover.1744666011.git.Ryan.Wanner@microchip.com:

arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7d65-uddrc', 'microchip,sama7g5-uddrc']
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7d65-uddrc', 'microchip,sama7g5-uddrc']
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible: ['microchip,sama7d65-ddr3phy', 'microchip,sama7g5-ddr3phy'] does not contain items matching the given schema
	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible:1: 'syscon' was expected
	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#






