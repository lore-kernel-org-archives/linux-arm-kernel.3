Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CD4C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 17:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0ICit655ZgktoYzropZyPBtWwkiaJm1uSiPb1j6R/Q=; b=A2ZnynMd61l+3CSvYIeP8CaQqR
	D8I9PJKEj37uvPWN4OyEzMYpM6scnrCnDucy27FYojTR6adF+NAsiTTrhle4LYrqtCM5l0m3ouV7s
	kCLYwzTZu+wcComBM96N/N0aPjzcoc2vJ0hXtSotfeUZdRvtghHSWh2eY/D1SxQl2e3uSD7ko27l0
	naxFKjR6rJH9thlGtQwlE741MsHEzfP+OrjtRh4WHr/J/fgBlAQ6a+2jD+fWKThDj9ponQeIJA8X8
	on9XRVzdUPMcyNSplgntrbzLpK1lca2TPLz5h6oZe3fuSQ5wYZVH93i1sJNZxPhqRHvtQoJ+DPBxS
	uuLUrRpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm9S-0000000ByPe-2YyZ;
	Thu, 13 Mar 2025 17:15:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsldS-0000000Brxk-0RKE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 16:42:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 69595A47796;
	Thu, 13 Mar 2025 16:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17910C4CEE9;
	Thu, 13 Mar 2025 16:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741884136;
	bh=DyWTNTgy8kHzg4Osmhv7e7UL0kU6+DuQEfTAbk0Nx1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qodb0LD4MmDeeqYnU6AlJa9f/2SqshRXtDrK0QTyvq4aidqSLizjoStsnasZnIC1X
	 Z+sL1VfQjfJ4H3xj2EdAYsShp1iV7rn//+VORCx8UX6tSUhQLYKpG7c9kZpX/YWePr
	 hueGKVjV6PEX4bQWNUsLkH7rfDmTSE44YaCBWe2XTCAbucePAzePGhS5SHbNmlHvEK
	 D5ncERxebtd5CAAR96gZkSOWE5kNklRJ4G6q6e8ecFfft5iqUJweZeGL++7UUrVsVh
	 WrODqU0EyS0GHOP4+yrHy01obzKql8ai3zFyAycFD+tM2mTQ7Z05nb9l3kIfD/b+Dj
	 7vHsr4rR58Odw==
Date: Thu, 13 Mar 2025 16:42:11 +0000
From: Lee Jones <lee@kernel.org>
To: Ryan.Wanner@microchip.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	claudiu.beznea@tuxon.dev, sre@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	p.zabel@pengutronix.de, linux@armlinux.org.uk,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 00/21] Enable Power Modes Support for SAMA7D65 SoC
Message-ID: <20250313164211.GD3645863@google.com>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1740671156.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_094218_275254_CE3B9DC0 
X-CRM114-Status: GOOD (  25.94  )
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

On Thu, 27 Feb 2025, Ryan.Wanner@microchip.com wrote:

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
> 
> Li Bin (1):
>   ARM: at91: pm: fix at91_suspend_finish for ZQ calibration
> 
> Ryan Wanner (20):
>   dt-bindings: mfd: syscon: add microchip,sama7d65-ddr3phy
>   dt-bindings: mfd: syscon: add microchip,sama7d65-sfrbu

Ping me when these are ready to take.

>   dt-bindings: sram: Add microchip,sama7d65-sram
>   dt-bindings: power: reset: atmel,sama5d2-shdwc: Add
>     microchip,sama7d65-shdwc
>   dt-bindings: reset: atmel,at91sam9260-reset: add
>     microchip,sama7d65-rstc
>   dt-bindings: rtc: at91rm9200: add microchip,sama7d65-rtc
>   dt-bindings: at91rm9260-rtt: add microchip,sama7d65-rtt
>   ARM: at91: Add PM support to sama7d65
>   ARM: at91: pm: add DT compatible support for sama7d65
>   ARM: at91: PM: Add Backup mode for SAMA7D65
>   ARM: at91: pm: Enable ULP0/ULP1 for SAMA7D65
>   power: reset: at91-sama5d2_shdwc: Add sama7d65 PMC
>   ARM: dts: microchip: sama7d65: Add SRAM and DRAM components support
>   ARM: dts: microchip: sama7d65: Add Reset Controller to sama7d65 SoC
>   ARM: dts: microchip: sama7d65: Add Shutdown controller support
>   ARM: dts: microchip: sama7d65: Add RTT and GPBR Support for sama7d65
>     SoC
>   ARM: dts: microchip: sama7d65: Add RTC support for sama7d65
>   ARM: dts: microchip: sama7d65: Add SFRBU support to sama7d65
>   ARM: dts: microchip: sama7d65: Enable shutdown controller
>   ARM: dts: microchip: sama7d65: Add RTT timer to curiosity board
> 
>  .../devicetree/bindings/mfd/syscon.yaml       |   4 +
>  .../power/reset/atmel,sama5d2-shdwc.yaml      |   5 +
>  .../reset/atmel,at91sam9260-reset.yaml        |   3 +
>  .../bindings/rtc/atmel,at91rm9200-rtc.yaml    |   4 +-
>  .../bindings/rtc/atmel,at91sam9260-rtt.yaml   |   1 +
>  .../devicetree/bindings/sram/sram.yaml        |   1 +
>  .../dts/microchip/at91-sama7d65_curiosity.dts |  13 +++
>  arch/arm/boot/dts/microchip/sama7d65.dtsi     |  77 +++++++++++++
>  arch/arm/mach-at91/Kconfig                    |   1 +
>  arch/arm/mach-at91/pm.c                       |  47 +++++---
>  arch/arm/mach-at91/pm.h                       |   1 +
>  arch/arm/mach-at91/pm_data-offsets.c          |   2 +
>  arch/arm/mach-at91/pm_suspend.S               | 101 ++++++++++++++++--
>  drivers/power/reset/at91-sama5d2_shdwc.c      |   1 +
>  14 files changed, 238 insertions(+), 23 deletions(-)
> 
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

