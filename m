Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CA0C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 15:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMLW30eR5s2b5tHqWYXTUH+UxITsWsfowgYonNz5icw=; b=n3GdNt7yV2Bi5MEmoNKHd6lkG+
	7ruqI8bTqCpypTwcSIYYWMR5a5rjOibcZYsHEm2O9xuCJrxcv4suqqzwBoe3hSDilQoNkxjZGJRWD
	NOFak0fck2yQbhEidHnbznJrmUWX6heAjwWN0Sm+1bh3HxY/SAxVxCumdK+rmoj8n5prJyfWAyrla
	0ti3EcuYj6dED8W/Kj261LxsplDbHxhsMj3zPVqSyq6I696yB5ktcj+y9Y0hjYcpErs0Siw+Xi3gx
	MVPmko3c2gPOZalTsHzQ+8iBIL+v2f8HZyFewfZbZJ8mNiH+IIeQp6pc2WggaLJepyEaqVPq3GCvA
	eip/m+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ssd-00000004ZQ2-1dHx;
	Mon, 21 Apr 2025 15:16:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6skL-00000004Y6E-1DFq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 15:07:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE6296115F;
	Mon, 21 Apr 2025 15:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19284C4CEEC;
	Mon, 21 Apr 2025 15:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745248064;
	bh=tVN20hZ85YLN+8NRYnvSHeVwieScBTswPZoX8rBIYV8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=OqaUd7XTkht1TUYKGkZqu9J9GtpEJTuI+4OCZzs80zlgA+gvPVc4IJqI49gfCVV5D
	 0oPYuN5sQUYHofki66+x/9QJMldJXRPCh9W28wAAAFEtqGJImgXSvRxUHiaxdpOuU/
	 Cj/br2jDQ/Sp9gVO7nEENwI17mj5mjSLcnCYiYdCkGN+EdCwBPnwO9EhIUMEVb3wgX
	 A5peEXfHXHmvE5jEOFGJvAhQOCRj7SAlFYG6sMQkPlF3inMPAE6edS0Oyrwq4LRX89
	 rL0fxrngr0Pa05uimrJWMxI73IrDJPGwo3m51lN6wId6xQVfTrzVC3zeK0L7nOwhlH
	 yciv73BtGxEeA==
Date: Mon, 21 Apr 2025 10:07:41 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sebin Francis <sebin.francis@ti.com>, 
 Nishanth Menon <nm@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Dhruva Gole <d-gole@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Vishal Mahaveer <vishalm@ti.com>, linux-arm-kernel@lists.infradead.org, 
 Akashdeep Kaur <a-kaur@ti.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
In-Reply-To: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com>
References: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com>
Message-Id: <174524753085.2426038.13409894396395372581.robh@kernel.org>
Subject: Re: [PATCH 0/7] arm64: dts: ti: k3-am62: Add wakeup-sources for
 low power modes
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


On Mon, 21 Apr 2025 10:14:18 +0200, Markus Schneider-Pargmann wrote:
> Hi,
> 
> This series adds devicetree changes needed for Partial-IO support
> on TI am62, am62a, and am62p SoCs. It defines system states for various
> low power modes and configures the wakeup-sources for devices in the CANUART
> group. Depending on the SoC and board details, some low power modes may not
> be available, so the wakeup-sources are described in the board files.
> The series also adds the necessary pinctrl settings required for proper
> wakeup functionality.
> 
> Partial-IO Overview
> ------------------
> Partial-IO is a low power system state in which nearly everything is
> turned off except the pins of the CANUART group (mcu_mcan0, mcu_mcan1,
> wkup_uart0 and mcu_uart0). These devices can trigger a wakeup of the system
> on pin activity. Note that this does not resume the system as the DDR is
> off as well. So this state can be considered a power-off state with wakeup
> capabilities.
> 
> A documentation can also be found in section 6.2.4 in the TRM:
>   https://www.ti.com/lit/pdf/spruiv7
> 
> Implementation Details
> ----------------------
> The complete Partial-IO feature requires three coordinated series, each handling
> a different aspect of the implementation:
> 
> 1. m_can driver series: Implements device-specific wakeup functionality
>     for m_can devices, allowing them to be set as wakeup sources.
>     https://gitlab.baylibre.com/msp8/linux/-/tree/topic/mcan-wakeup-source/v6.15?ref_type=heads
>     https://lore.kernel.org/r/20250421-topic-mcan-wakeup-source-v6-12-v7-0-1b7b916c9832@baylibre.com
> 
> 2. This series (devicetree): Defines system states and wakeup sources in the
>     devicetree for am62, am62a and am62p.
> 
> 3. TI-SCI firmware series: Implements the firmware interface to enter Partial-IO
>     mode when appropriate wakeup sources are enabled.
>     https://gitlab.baylibre.com/msp8/linux/-/tree/topic/tisci-partialio/v6.15?ref_type=heads
> 
> Devicetree Bindings
> -------------------
> This series depends on the dt-schema pull request that adds bindings for
> system-idle-states and updates the binding for wakeup-source:
>   https://github.com/devicetree-org/dt-schema/pull/150
> 
> These new bindings allow us to define the system states and reference them
> from device wakeup-source properties.
> 
> Testing
> -------
> A test branch is available here that includes all patches required to
> test Partial-IO:
> 
> https://gitlab.baylibre.com/msp8/linux/-/tree/integration/am62-partialio/v6.15?ref_type=heads
> 
> After enabling Wake-on-LAN the system can be powered off and will enter
> the Partial-IO state in which it can be woken up by activity on the
> specific pins:
>     ethtool -s can0 wol p
>     ethtool -s can1 wol p
>     poweroff
> 
> I tested these patches on am62-lp-sk.
> 
> Best,
> Markus
> 
> Previous versions
> -----------------
>  - As part of the series "firmware: ti_sci: Partial-IO support"
>    https://lore.kernel.org/r/20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> Markus Schneider-Pargmann (7):
>       arm64: dts: ti: k3-pinctrl: Add WKUP_EN flag
>       arm64: dts: ti: k3-am62: Define possible system states
>       arm64: dts: ti: k3-am62a: Define possible system states
>       arm64: dts: ti: k3-am62p: Define possible system states
>       arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source system-states
>       arm64: dts: ti: k3-am62a7-sk: Set wakeup-source system-states
>       arm64: dts: ti: k3-am62p5-sk: Set wakeup-source system-states
> 
>  arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 60 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62.dtsi      | 22 +++++++++
>  arch/arm64/boot/dts/ti/k3-am62a.dtsi     | 27 ++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts  | 76 ++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62p.dtsi     | 27 ++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts  | 76 ++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-pinctrl.h      |  2 +
>  7 files changed, 290 insertions(+)
> ---
> base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
> change-id: 20250415-topic-am62-dt-partialio-v6-15-327dd1ff17da
> prerequisite-change-id: 20241009-topic-mcan-wakeup-source-v6-12-8c1d69931bd8:v7
> prerequisite-patch-id: 02b7142f56c849c9a3faab2d2871805febd647aa
> prerequisite-patch-id: 830b339ea452edd750b04f719da91e721be630cb
> prerequisite-patch-id: 56fd0aae20e82eb2dfb48f1b7088d62311a11f05
> prerequisite-patch-id: 41f55b96c0428240d74d488e3c788c09842a1753
> 
> Best regards,
> --
> Markus Schneider-Pargmann <msp@baylibre.com>
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
 Base: using specified base-commit 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
 Deps: looking for dependencies matching 11 patch-ids
 Deps: Applying prerequisite patch: [PATCH v7 1/4] dt-bindings: can: m_can: Add wakeup properties
 Deps: Applying prerequisite patch: [PATCH v7 2/4] can: m_can: Map WoL to device_set_wakeup_enable
 Deps: Applying prerequisite patch: [PATCH v7 3/4] can: m_can: Return ERR_PTR on error in allocation
 Deps: Applying prerequisite patch: [PATCH v7 4/4] can: m_can: Support pinctrl wakeup state
 Deps: Applying prerequisite patch: [PATCH 1/7] arm64: dts: ti: k3-pinctrl: Add WKUP_EN flag
 Deps: Applying prerequisite patch: [PATCH 2/7] arm64: dts: ti: k3-am62: Define possible system states
 Deps: Applying prerequisite patch: [PATCH 3/7] arm64: dts: ti: k3-am62a: Define possible system states
 Deps: Applying prerequisite patch: [PATCH 4/7] arm64: dts: ti: k3-am62p: Define possible system states
 Deps: Applying prerequisite patch: [PATCH 5/7] arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source system-states
 Deps: Applying prerequisite patch: [PATCH 6/7] arm64: dts: ti: k3-am62a7-sk: Set wakeup-source system-states
 Deps: Applying prerequisite patch: [PATCH 7/7] arm64: dts: ti: k3-am62p5-sk: Set wakeup-source system-states

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com:

arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: /system-idle-states/system-partial-io: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: /system-idle-states/system-partial-io: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: /system-idle-states/system-deep-sleep: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: /system-idle-states/system-deep-sleep: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: /system-idle-states/system-partial-io: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: /system-idle-states/system-mcu-only: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: /system-idle-states/system-mcu-only: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: /system-idle-states/system-deep-sleep: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: /system-idle-states/system-partial-io: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: /system-idle-states/system-standby: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: /system-idle-states/system-standby: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: /system-idle-states/system-mcu-only: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: /system-idle-states/system-deep-sleep: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: /system-idle-states/system-standby: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: /system-idle-states/system-mcu-only: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: /system-idle-states/system-standby: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: /system-idle-states/system-partial-io: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: /system-idle-states/system-partial-io: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: /system-idle-states/system-deep-sleep: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: /system-idle-states/system-deep-sleep: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: /system-idle-states/system-mcu-only: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: /system-idle-states/system-mcu-only: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: /system-idle-states/system-standby: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: /system-idle-states/system-standby: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /system-idle-states/system-partial-io: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /system-idle-states/system-io-ddr: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: /system-idle-states/system-partial-io: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /system-idle-states/system-deep-sleep: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: /system-idle-states/system-deep-sleep: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /system-idle-states/system-mcu-only: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: /system-idle-states/system-mcu-only: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /system-idle-states/system-standby: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: /system-idle-states/system-standby: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: serial@4a00000 (ti,am64-uart): wakeup-source: [[4, 5, 6, 7]] is not of type 'boolean'
	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: can@4e08000 (bosch,m_can): wakeup-source: [[14, 4, 5, 6, 7]] is not of type 'boolean'
	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: can@4e18000 (bosch,m_can): wakeup-source: [[14, 4, 5, 6, 7]] is not of type 'boolean'
	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: serial@0 (ti,am64-uart): wakeup-source: [[4, 5, 6, 7]] is not of type 'boolean'
	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /system-idle-states/system-partial-io: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /system-idle-states/system-io-ddr: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /system-idle-states/system-deep-sleep: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /system-idle-states/system-mcu-only: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /system-idle-states/system-standby: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@4a00000 (ti,am64-uart): wakeup-source: [[4, 5, 6, 7]] is not of type 'boolean'
	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: can@4e08000 (bosch,m_can): wakeup-source: [[13, 4, 5, 6, 7]] is not of type 'boolean'
	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: can@4e18000 (bosch,m_can): wakeup-source: [[13, 4, 5, 6, 7]] is not of type 'boolean'
	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@0 (ti,am64-uart): wakeup-source: [[4, 5, 6, 7]] is not of type 'boolean'
	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: /system-idle-states/system-partial-io: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: /system-idle-states/system-io-ddr: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: /system-idle-states/system-deep-sleep: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: /system-idle-states/system-mcu-only: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: /system-idle-states/system-standby: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: /system-idle-states/system-partial-io: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: /system-idle-states/system-deep-sleep: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: /system-idle-states/system-mcu-only: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: /system-idle-states/system-standby: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /system-idle-states/system-partial-io: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /system-idle-states/system-deep-sleep: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /system-idle-states/system-mcu-only: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /system-idle-states/system-standby: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: can@4e08000 (bosch,m_can): wakeup-source: [[9, 10, 11, 12]] is not of type 'boolean'
	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: can@4e18000 (bosch,m_can): wakeup-source: [[9, 10, 11, 12]] is not of type 'boolean'
	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: /system-idle-states/system-partial-io: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: /system-idle-states/system-deep-sleep: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: /system-idle-states/system-mcu-only: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: /system-idle-states/system-standby: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: /system-idle-states/system-partial-io: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: /system-idle-states/system-deep-sleep: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: /system-idle-states/system-mcu-only: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: /system-idle-states/system-standby: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: /system-idle-states/system-partial-io: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: /system-idle-states/system-deep-sleep: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: /system-idle-states/system-mcu-only: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: /system-idle-states/system-standby: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: /system-idle-states/system-partial-io: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: /system-idle-states/system-deep-sleep: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: /system-idle-states/system-mcu-only: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: /system-idle-states/system-standby: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-sk.dtb: /system-idle-states/system-partial-io: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-sk.dtb: /system-idle-states/system-deep-sleep: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-sk.dtb: /system-idle-states/system-mcu-only: failed to match any schema with compatible: ['system-idle-state']
arch/arm64/boot/dts/ti/k3-am625-sk.dtb: /system-idle-states/system-standby: failed to match any schema with compatible: ['system-idle-state']






