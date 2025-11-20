Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB52CCF64AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 02:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4cgqjgITxrAJC2kIoTAAAZ6GCUX7OP48fga8EWuzro=; b=A/WRD3KjNqIjoaJaq/18CC7jJp
	GEMZKCHzUviYDpgmjOzfeH5g5UOvZ6PP/wUGQHHjFdkiyogUWQmID4gVcjxCbj4oMgC1SqBymVRap
	q7pObgKxyKBmtaMPkBrdK7NA6F3Ye7jX8PKPRNNzztOtFrdt/Fuj542nRDsn+S5DDQeqI522hqShQ
	O0cd0taLZ298VRulnsOTeyc21Uzqac15kuSHMhkPEhivz+cMcisRUlIJH2U3voDoyWtJIx7tHO6Nh
	/ovPSQ26mVlXMEqZRS3CyAjOBgjKhs5K8Q4M7jUs6r6Py6eM40Z7JY2+UaFh8FD1M1q69Yoc9hoFq
	x6lY9G8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLuku-0000000612A-0EnX;
	Thu, 20 Nov 2025 02:50:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLuks-0000000611w-1pcU;
	Thu, 20 Nov 2025 02:50:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 863C96018D;
	Thu, 20 Nov 2025 02:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE17C4CEF5;
	Thu, 20 Nov 2025 02:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763607041;
	bh=Aa7WnttGEYS9DURKutasxGDYsZUdjqB9YngO+llu6wc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S8MjIokIPFiZtBoyLBhAKt0Eug5olwn21DgCteRt2goUeFiplqSVQ0DaqYvklPhyY
	 CS6dPeKFTQq8swWVerxdr/5zzsYF/BKPGHhHhpFXgo9ae/HcvxaRnI8AMl6Fi6c7Bk
	 +CDWkdTTQ2Ciey6FwLEhQrPo5NyN8Z6pwhxSub3K9YLEN906H3WNsDabCsJ7uJPwwv
	 WbwKo4JVKIRsFYv6yqO9uIwikHQVDb4oiUOLL6Cre0bDb4ErQ1MRPixvYzd6JPJv+z
	 m8+4+SzI6lWRulT2OP6V8nNlbYVlB2Df9yTZi/CIxe+J/p5us+qqAo0L6z4az0lpZF
	 ZvxsXSDUBtB3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB15F39EF96C;
	Thu, 20 Nov 2025 02:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 00/11] arm64: dts: mediatek: Add Openwrt One AP
 functionality
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176360700676.1051457.11874224265724256534.git-patchwork-notify@kernel.org>
Date: Thu, 20 Nov 2025 02:50:06 +0000
References: <20251115-openwrt-one-network-v4-0-48cbda2969ac@collabora.com>
In-Reply-To: <20251115-openwrt-one-network-v4-0-48cbda2969ac@collabora.com>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ryder.lee@mediatek.com, jianjun.wang@mediatek.com, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 chunfeng.yun@mediatek.com, vkoul@kernel.org, kishon@kernel.org,
 lee@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org,
 nbd@nbd.name, kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, netdev@vger.kernel.org, daniel@makrotopia.org,
 bryan@bryanhinton.com, conor.dooley@microchip.com
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

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 15 Nov 2025 21:58:03 +0100 you wrote:
> Significant changes in V4:
>   * Drop patches that were picked up
>   * Improve mediatek,net dt bindings:
>     - Move back to V2 version (widening global constraint, constraining
>       per compatible)
>     - Ensure all compatibles are constraint in the amount of WEDs (2 for
>       everything apart from mt7981). Specifically adding constraints for
>       mediatek,mt7622-eth and ralink,rt5350-eth
> Significant changes in V3:
>   * Drop patches that were picked up
>   * Re-order patches so changes that don't require dt binding changes
>     come first (Requested by Angelo)
>   * Specify drive power directly rather then using MTK_DRIVE_...
>   * Simply mediatek,net binding changes to avoid accidental changes to
>     other compatibles then mediatek,mt7981-eth
> Significant changes in V2:
>   * https://lore.kernel.org/lkml/20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com/
>   * Only introduce labels in mt7981b.dtsi when required
>   * Switch Airoha EN8811H phy irq to level rather then edge triggered
>   * Move uart0 pinctrl from board dts to soc dtsi
>   * Only overwrite constraints with non-default values in MT7981 bindings
>   * Make SPI NOR nvmem cell labels more meaningfull
>   * Seperate fixing and disable-by-default for the mt7981 in seperate
>     patches
> 
> [...]

Here is the summary with links:
  - [v4,01/11] dt-bindings: mfd: syscon: Add mt7981-topmisc
    (no matching commit)
  - [v4,02/11] dt-bindings: PCI: mediatek-gen3: Add MT7981 PCIe compatible
    (no matching commit)
  - [v4,03/11] dt-bindings: phy: mediatek,tphy: Add support for MT7981
    (no matching commit)
  - [v4,04/11] arm64: dts: mediatek: mt7981b: Add PCIe and USB support
    (no matching commit)
  - [v4,05/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable PCIe and USB
    (no matching commit)
  - [v4,06/11] dt-bindings: net: mediatek,net: Correct bindings for MT7981
    https://git.kernel.org/netdev/net-next/c/bc41fbbf6faa
  - [v4,07/11] arm64: dts: mediatek: mt7981b: Add Ethernet and WiFi offload support
    (no matching commit)
  - [v4,08/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable Ethernet
    (no matching commit)
  - [v4,09/11] arm64: dts: mediatek: mt7981b: Disable wifi by default
    (no matching commit)
  - [v4,10/11] arm64: dts: mediatek: mt7981b: Add wifi memory region
    (no matching commit)
  - [v4,11/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable wifi
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



