Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FACED0C612
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jq7w9jdY26VtIq+/atij6+cWTz2g460dXD5EP5HF7Ck=; b=x+78nCgb8InkB9vX2S0P/APNwq
	7xyzBLtcS63N2TQIICw1Rubfk84ULi5TcWurZosqeKdPQ/Q82qLwVSOh6rYWATkiZH0SCWQUVSxEc
	KVDM4hX6nH1XKGMKgTqXQNt59hVglZ9Hj1bIKMaOn0Qpo3q9YHzC+Ow3kNbjgX69KCKG0+xcSCs38
	V9cTug3+t6QLsVX02V1eJqRyqh9o6g5Z0AUF9krnmuYgYvDZTUnqUMVlNOWe5yN6eNfNqLHLim+bA
	xppUvmSEfd6kSmr7MFcUy7Wx4pC1wAMSUGOibf4OxXPpX3eiitjHuLmP/lNtb+G9gjnIm2/Bo3YRV
	tk+Kobzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KyO-00000003w5w-09Kd;
	Fri, 25 Oct 2024 14:07:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Kmf-00000003tUk-2XhV;
	Fri, 25 Oct 2024 13:55:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F9355C5B30;
	Fri, 25 Oct 2024 13:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A9F1C4CECD;
	Fri, 25 Oct 2024 13:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729864520;
	bh=sP9ddLOzD4XD7oJ2gtfjgcFVXKonwqzmaiwnFgWwUl0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=namopyTXYcR+34VhDW1DJIeNZwRgeHEHzEyji0zywrSQfrpLnmi4N0g858xJziiRR
	 6zTQo1Ekfw2dF157XXMsOV+u1y7gZY7WSnLI7Uz01DHRdU+wK1aMxF7qSgY6K3Rn5C
	 5v72aoRCh1oYtyP2potY5imnUGIYgPf5EPQIgbXgRgBcJ8bmRLzW8/52XekJ9R/Ye2
	 0bDdVeawSgA84pWaZVFz9HmHwVm5u8V+sq4C529Qjq6ANnVGMiu4OYKbUT8r/cPcjw
	 HDPCCknnrEqiTWcra0NeX7UVlQbC2bSQVsaMPleqhVXO0/ttgsKa/NR6SFue4b7zWA
	 GOKW2dvPYviLQ==
Date: Fri, 25 Oct 2024 08:55:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: linux-arm-kernel@lists.infradead.org, 
 Yangtao Li <frank@allwinnertech.com>, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Samuel Holland <samuel@sholland.org>, Parthiban <parthiban@linumiz.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-sunxi@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, Viresh Kumar <vireshk@kernel.org>, 
 devicetree@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, Stephen Boyd <sboyd@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nishanth Menon <nm@ti.com>
In-Reply-To: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
Message-Id: <172986441154.1907923.9460630831085493840.robh@kernel.org>
Subject: Re: [PATCH 00/13] sunxi: A100/A133 second stage support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_065521_967501_7D9ADBA3 
X-CRM114-Status: GOOD (  29.04  )
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


On Thu, 24 Oct 2024 14:05:18 -0300, Cody Eksal wrote:
> Hello! This is my first submission, so please be gentle :)
> 
> Back in 2020, two Allwinner employees, Yangtao Li and Shuosheng Huang, each
> submitted a patch series for the A100 series of SoCs; [1] intended to add
> support for the watchdog, ARM PMU, DMA, USB, and (e)MMC controller, and [2]
> implemented DVFS support. Some patches from the first series landed, but
> the rest were seemingly abandoned.
> 
> Although references to the A100 have been removed by Allwinner, it is
> believed that the A133 and A133 Plus, which are still available, are simply
> better binned variants of the A100; no other differences have been noted
> thus far, and the drivers for the A100 work on the A133 without any
> additional modifications. There has been a resurgence of interest in the
> A133; patches to allow mainline U-Boot to run on these devices are
> currently in progress.
> 
> I have rebased the patches that failed to land, applying the feedback
> provided by maintainers at the time. Some DT binding patches were added, as
> there were a few cases where compatibles were used without being
> documented. Minor reworks were necessary to apply certain patches, as the
> drivers they modified have matured over time.
> 
> Patches 1 and 2 add PMU and watchdog nodes to the device tree. This is
> followed by patches 3-8, which implement support for the USB host and OTG
> peripherals. Patches 9 and 10 add MMC nodes, rounding out what originally
> made up the first patch series; support for these already exists from
> earlier patches. Patches 11-13 finish the job of the second original
> series and this series, implementing OPP and enabling DVFS on these SoCs.
> 
> This series is also available on GitHub [3].
> 
> A sincere thanks to Andre for encouraging me to submit these patches,
> Parthiban for testing this tree on his board, and to the linux-sunxi
> community and its resources for pointing me to these abandoned series in
> the first place [4].
> 
> [1] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=380887&archive=both&state=*
> [2] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=396055&archive=both&state=*
> [3] https://github.com/BrokenR3C0RD/linux-a100/compare/c2ee9f59..allwinner-a100
> [4] https://linux-sunxi.org/Linux_mainlining_effort#Work_In_Progress
> 
> Cody Eksal (4):
>   dt-bindings: phy: sun50i-a64: add a100 compatible
>   dt-bindings: usb: Add A100 compatible string
>   dt-bindings: usb: sunxi-musb: Add A100 compatible string
>   dt-bindings: opp: h6: Add A100 operating points
> 
> Shuosheng Huang (2):
>   cpufreq: sun50i: add a100 cpufreq support
>   arm64: dts: allwinner: a100: Add CPU Operating Performance Points
>     table
> 
> Yangtao Li (7):
>   arm64: dts: allwinner: A100: Add PMU mode
>   arm64: dts: allwinner: a100: add watchdog node
>   phy: sun4i-usb: add support for A100 USB PHY
>   arm64: dts: allwinner: a100: add usb related nodes
>   arm64: allwinner: A100: enable EHCI, OHCI and USB PHY nodes in Perf1
>   arm64: allwinner: a100: Add MMC related nodes
>   arm64: dts: allwinner: a100: perf1: Add eMMC and MMC node
> 
>  .../allwinner,sun50i-h6-operating-points.yaml |   1 +
>  .../phy/allwinner,sun50i-a64-usb-phy.yaml     |   1 +
>  .../usb/allwinner,sun4i-a10-musb.yaml         |   1 +
>  .../devicetree/bindings/usb/generic-ehci.yaml |   1 +
>  .../devicetree/bindings/usb/generic-ohci.yaml |   1 +
>  .../allwinner/sun50i-a100-allwinner-perf1.dts |  59 ++++++
>  .../dts/allwinner/sun50i-a100-cpu-opp.dtsi    |  90 ++++++++
>  .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 193 +++++++++++++++++-
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c        |  28 +++
>  drivers/phy/allwinner/phy-sun4i-usb.c         |  11 +
>  10 files changed, 383 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi
> 
> 
> base-commit: c2ee9f594da826bea183ed14f2cc029c719bf4da
> --
> 2.47.0
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


New warnings running 'make CHECK_DTBS=y allwinner/sun50i-a100-allwinner-perf1.dtb' for 20241024170540.2721307-1-masterr3c0rd@epochal.quest:

arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dtb: cpu-opp-table: $nodename:0: 'cpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/opp/allwinner,sun50i-h6-operating-points.yaml#
arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dtb: cpu-opp-table: 'opp@1080000000', 'opp@1200000000', 'opp@1320000000', 'opp@1464000000', 'opp@408000000', 'opp@600000000', 'opp@816000000' do not match any of the regexes: '^opp-[0-9]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/opp/allwinner,sun50i-h6-operating-points.yaml#






