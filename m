Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD44E6BF11
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 14:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnS3v7qPmzV1Oyw++Ih2xyYy5hDUH2m+RPq12Ha7Abg=; b=v1D7M9AHw0CVA1OIgwvM3uyV1E
	S03ntv+pIGi08iZZVV2RQAGGprYlO2iq1X19ImXonf1Tch3LWmyBM7Xh0fybCCUO7/tzMbrNli99V
	87v5w345LEyON1g8kXpW7pm6bPtqCxgwR3wmsernsu7TRGINJy0OxplpECf6RiFHQdOl/r+yMZxpw
	EOFp+ZG/kHmTcrVkyHbdnvOxYikgQ6AEZvomaASm0tbQnPLEG3TA5cSkCI8l8k4ttQhtQYoS866VW
	Ewxi6MMXuz+r3tkBrsdZdXexfbEZSF5YlzwlDvlZXDpOyiNmflz6YGaCJOReoAG6GMOSjgoE8GuIH
	Qw39YaDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlp4p-00000001Ysc-3Lij;
	Fri, 30 Jan 2026 14:02:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlp4n-00000001YsH-1FSi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 14:02:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 478A3153B;
	Fri, 30 Jan 2026 06:02:13 -0800 (PST)
Received: from [10.33.50.63] (e142021.arm.com [10.33.50.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CA6B3F632;
	Fri, 30 Jan 2026 06:02:18 -0800 (PST)
Message-ID: <5c8e88f9-4f21-41ec-ba55-bc3b06861157@arm.com>
Date: Fri, 30 Jan 2026 15:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev, linus.walleij@linaro.org,
 Jun Nie <jun.nie@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Drew Fustini <fustini@kernel.org>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260128203455.38569-1-stefandoesinger@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_060221_412529_703063BB 
X-CRM114-Status: GOOD (  45.32  )
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

Hi Stefan,

On 1/28/26 21:34, Stefan Dösinger wrote:
> Hi,
> 
> In the past few weeks I worked on booting my own kernel on ZTE/Sanechip's
> zx297520v3 SoC. This SoC is a relative of the zx296718 that was once
> supported by the kernel. It is in use in a lot of LTE to WiFi routers in
> Africa, China and Eastern Europe, although some devices were sold or
> distributed by ISPs in the EU too. My goal is to make OpenWRT run on these
> devices.
> 
> I would like to ask for comments on these 7 patches to make sure they are
> going in the right direction. They are the bare minimum to get the kernel
> to start and run an interactive busybox on the UART.
> 
> Here are a few questions that I couldn't answer myself:
> 
> 1) The GIC is a GICv3, but there are some extra registers (probably on a
> different chip) to switch PPIs and SPIs between level high/level low or
> rising edge/falling edge. The only device where this matters appears to
> the timer. It uses level low IRQs, but the GIC has PPIs configured to
> level-high by default. By setting some non-standard registers, I can get
> the PPIs to level-low and the timer works OK. Is there any precedence on
> how to handle this? I am tempted to make a zte,zx29-gic-v3 .compatible
> glue that sets the PPIs to level-low on init.

Wouldn't it be possible to fix this up in firmware and not bother the 
kernel with it? It would treat this like some very platform specific 
setup, as there is probably also very little point it ever doing it any 
other way?

> 2) The boot loader doesn't set up the secure/non-secure world properly and
> doesn't enable register access to the GIC CPU interface. I found the
> Raspberry Pi 3 boot stub as a good guidance and put sample code in
> Documentation/arch/arm/zte/zx297520v3.rst . An e.g. OpenWRT build for this
> device would have to include a similar setup sequence that it runs from
> U-Boot before jumping to the kernel. Did I miss any alternatives here?

The arm64 booting.rst specifies the expectations of the kernel very 
clearly, for instance it demands the GIC to be setup correctly and be 
booted in non-secure state. The arm(32) kernel was much more forgiving, 
mostly because many firmwares couldn't be fixed, so there was no choice.
But I feel like for "new" devices we should lean on the safe side and 
use the firmware to bring the system in a sane state (pun intended).

It looks like you have access to the firmware and can change it?

> 3) The SoC has clock and reset controls in the same MMIO space, even the
> same 32 bit registers. What is the preferred way to handle this? Two
> separate clk and reset drivers that write into the same place? One
> multifunction driver that exposes clock and resets? One syscon that
> contains the reg values and two separate clk and reset drivers that
> consume the syscon?

That's quite common, and the solution is to have one driver, that acts 
as both a clock and reset controller (registers to both subsystems). 
Look at sunxi, for instance (from the sun50i-a64.dtsi):
	ccu: clock@1c20000 {
		compatible = "allwinner,sun50i-a64-ccu";
		reg = <0x01c20000 0x400>;
		#clock-cells = <1>;
		#reset-cells = <1>;
	};
	uart0: serial@1c28000 {
		....
		clocks = <&ccu CLK_BUS_UART0>;
		resets = <&ccu RST_BUS_UART0>;
	};

Find code in drivers/clk/sunxi-ng/ccu_common.c:sunxi_ccu_probe().

> 4) The CPU is a Cortex A53 running in arm32 mode (in the shipped firmware
> too). It doesn't appear to have an FPU. Reading FPSID results in an
> exception (so vfpmodule.c/vfp_init says VFP is not available). I tried
> enabling p10 and p11 in NSACR, but without success. NSACR seems to always
> read 0 too. Is this really a Cortex A53 without FPU or did I miss
> something?
> 
> 5) Relatedly, are there any advantages to running in arm64 mode? The
> devices are relatively memory constrained (64mb), so the larger binary
> size from 64 bit pointers is probably a negative, while the larger
> register set might be a positive. I doubt switching to arm64 mode is
> possible at all, but I'm nevertheless curious.

Allwinner cores also reset into EL3/AArch32, there an RMR reset brings 
it into AArch64 state. For this to work Allwinner provides a writable 
MMIO register that backs the architecturally read-only RVBAR, so you can 
program the AArch64 entry point.
https://github.com/u-boot/u-boot/blob/master/arch/arm/mach-sunxi/rmr_switch.S
Not sure if this works here, of course, but just FYI.
In any case I feel this beast is better left in arm32 land ;-)

Cheers,
Andre

> 6) The old removed zx29 code used "zte," as the vendor for the
> compatibles. Sanechips is a subsidiary of ZTE that designed these chips.
> Are there any preferences for either "zte," or "sanechips,"?
> 
> As for the rest of the hardware, my entire patchset can be found here:
> https://gitlab.com/stefandoesinger/zx297520-kernel/ . So far 3 people from
> the OpenWRT community are helping with testing on different routers (Tecno
> TR118, ZTE K10, ZLT S10 in addition to my D-Link DWR932 and HGSD R310).
> 
> USB: Standard dwc2 WiFi: rtl8192, but in the SDIO version. I hacked sdio
> into rtl8xxxu but it'll need major cleanup. ethernet: STMicro stmmac. ZTE
> wrote their own driver for it. I spent a week re-implementing it before I
> was able to match the HW to stmmac. SDIO: standard dw-mshc NAND: A 128 MB
> SPI NAND chip connected to a homebrew QSPI controller. The driver is
> copypasta from stm32-qspi, but the hardware registers seem incompatible
> LTE: A Cortex M0 is doing the heavy lifting and talks to the main CPU via
> RPMsg. I hope to be able to handle this in userspace, but I haven't looked
> into it yet. clk, pinctrl, pmdomain: My own code based on the zx2967xx
> code.
> 
> Patch changelog v2: checkpatch.pl fixes.
> 
> Stefan Dösinger (7):
>    ARM: zte: Add zx297520v3 platform support.
>    dt-bindings: arm: Add zx297520v3 board binding.
>    ARM: dts: Add D-Link DWR-932M support.
>    ARM: zte: Add support for zx29 low level debug.
>    ARM: dts: Add an armv7 timer for zx297520v3.
>    ARM: zte: Bring back ZX29 UART support.
>    ARM: dts: Declare UART1 on zx297520v3 boards.
> 
>   Documentation/arch/arm/zte/zx297520v3.rst     | 106 ++++++++++++++++++
>   .../devicetree/bindings/arm/zx29.yaml         |  20 ++++
>   MAINTAINERS                                   |   6 +
>   arch/arm/Kconfig                              |   2 +
>   arch/arm/Kconfig.debug                        |  12 ++
>   arch/arm/Makefile                             |   1 +
>   arch/arm/boot/dts/Makefile                    |   1 +
>   arch/arm/boot/dts/zte/Makefile                |   3 +
>   arch/arm/boot/dts/zte/dlink-dwr-932m.dts      |  21 ++++
>   arch/arm/boot/dts/zte/zx297520v3.dtsi         |  83 ++++++++++++++
>   arch/arm/include/debug/pl01x.S                |   7 ++
>   arch/arm/mach-zte/Kconfig                     |  23 ++++
>   arch/arm/mach-zte/Makefile                    |   2 +
>   arch/arm/mach-zte/zx297520v3.c                |  19 ++++
>   drivers/tty/serial/amba-pl011.c               |  37 ++++++
>   include/linux/amba/bus.h                      |   6 +
>   16 files changed, 349 insertions(+)
>   create mode 100644 Documentation/arch/arm/zte/zx297520v3.rst
>   create mode 100644 Documentation/devicetree/bindings/arm/zx29.yaml
>   create mode 100644 arch/arm/boot/dts/zte/Makefile
>   create mode 100644 arch/arm/boot/dts/zte/dlink-dwr-932m.dts
>   create mode 100644 arch/arm/boot/dts/zte/zx297520v3.dtsi
>   create mode 100644 arch/arm/mach-zte/Kconfig
>   create mode 100644 arch/arm/mach-zte/Makefile
>   create mode 100644 arch/arm/mach-zte/zx297520v3.c
> 
> 
> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449


