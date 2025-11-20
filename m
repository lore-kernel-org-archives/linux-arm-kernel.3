Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB246CF887B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 15:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5U2hSc98padQ2JjUq79ikyl/WV8spjCT6oM6efr7SY=; b=WRpJDKuCfRGuEXveelPQbyNc6/
	gGvH3DlcVli4Hd33CZs0gvgi01LpLrLy/BQARQVuL8/pxr+xzJAnVG03TNhlpwolsNQ940lxnvmQ1
	GuKbiEVv/q8zcp/GeQJByKEeathPluwG+Ewl4TV80z8YojuxbW1cAOpTkXpD4gwHG6xxih602Hxq2
	aUCwZgkAUHroly/8lRm73lgIaBytCUKab8DQO1Wmva2CvXJMeoT4hyeOl7WWpm9GVn+eziBWTzRbo
	ahWxvyZ465svW2Bx/EOCTtsdfkVFHJthMILfDhlWWWsjamvVh3dQJNS8uoteikrxaRWxNqu6FYliX
	XOU6gLRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM6aQ-00000006um4-0FWD;
	Thu, 20 Nov 2025 15:28:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM6aO-00000006ula-0TuO;
	Thu, 20 Nov 2025 15:28:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA094442CD;
	Thu, 20 Nov 2025 15:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A68C4CEF1;
	Thu, 20 Nov 2025 15:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763652519;
	bh=av02gv+HZPyHd+lIw8Xh7wER3k0Uka5SXi0z88gxPdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=us4llj4X391VYU8sOmxwWHHr6n8k/hYwLXlgcz+nzomv7v/yeE+FiT65IYWIbAgx9
	 E3WOUcrMWSI5nuc6ZyTFcoN0rQJStQZ7jj3YcB5EzwnM9SgQNrrF3cTp2pgTU56adT
	 qY5/wBteX0BiewTsoMC6LFq5JKx/5lyeiGolcnXD2fY8OSms46Scsrxx/I6GTHCh4w
	 Q+ywHWt7pBT1aF4HfZVeOTsI2mVlnnUiyOPCn/2zNXDYgqt70Bi1vigQrviKy82t/R
	 Tfq9jc21NLFEJqyJGJi9TIuVjv5kfs6oyASQOLIQdp3xVyZdcwmnc2qV8d4CFOqhSN
	 2LxJGd8kQrtbQ==
Date: Thu, 20 Nov 2025 15:28:29 +0000
From: Lee Jones <lee@kernel.org>
To: patchwork-bot+netdevbpf@kernel.org
Cc: Sjoerd Simons <sjoerd@collabora.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	chunfeng.yun@mediatek.com, vkoul@kernel.org, kishon@kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org,
	nbd@nbd.name, kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, netdev@vger.kernel.org,
	daniel@makrotopia.org, bryan@bryanhinton.com,
	conor.dooley@microchip.com
Subject: Re: [PATCH v4 00/11] arm64: dts: mediatek: Add Openwrt One AP
 functionality
Message-ID: <20251120152829.GH661940@google.com>
References: <20251115-openwrt-one-network-v4-0-48cbda2969ac@collabora.com>
 <176360700676.1051457.11874224265724256534.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176360700676.1051457.11874224265724256534.git-patchwork-notify@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_072840_193166_1AFC599D 
X-CRM114-Status: GOOD (  16.83  )
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

On Thu, 20 Nov 2025, patchwork-bot+netdevbpf@kernel.org wrote:

> Hello:
> 
> This series was applied to netdev/net-next.git (main)
> by Jakub Kicinski <kuba@kernel.org>:
> 
> On Sat, 15 Nov 2025 21:58:03 +0100 you wrote:
> > Significant changes in V4:
> >   * Drop patches that were picked up
> >   * Improve mediatek,net dt bindings:
> >     - Move back to V2 version (widening global constraint, constraining
> >       per compatible)
> >     - Ensure all compatibles are constraint in the amount of WEDs (2 for
> >       everything apart from mt7981). Specifically adding constraints for
> >       mediatek,mt7622-eth and ralink,rt5350-eth
> > Significant changes in V3:
> >   * Drop patches that were picked up
> >   * Re-order patches so changes that don't require dt binding changes
> >     come first (Requested by Angelo)
> >   * Specify drive power directly rather then using MTK_DRIVE_...
> >   * Simply mediatek,net binding changes to avoid accidental changes to
> >     other compatibles then mediatek,mt7981-eth
> > Significant changes in V2:
> >   * https://lore.kernel.org/lkml/20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com/
> >   * Only introduce labels in mt7981b.dtsi when required
> >   * Switch Airoha EN8811H phy irq to level rather then edge triggered
> >   * Move uart0 pinctrl from board dts to soc dtsi
> >   * Only overwrite constraints with non-default values in MT7981 bindings
> >   * Make SPI NOR nvmem cell labels more meaningfull
> >   * Seperate fixing and disable-by-default for the mt7981 in seperate
> >     patches
> > 
> > [...]
> 
> Here is the summary with links:
>   - [v4,01/11] dt-bindings: mfd: syscon: Add mt7981-topmisc
>     (no matching commit)

I thought this days of Net randomly picking up MFD patches were behind us!

>   - [v4,02/11] dt-bindings: PCI: mediatek-gen3: Add MT7981 PCIe compatible
>     (no matching commit)
>   - [v4,03/11] dt-bindings: phy: mediatek,tphy: Add support for MT7981
>     (no matching commit)
>   - [v4,04/11] arm64: dts: mediatek: mt7981b: Add PCIe and USB support
>     (no matching commit)
>   - [v4,05/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable PCIe and USB
>     (no matching commit)
>   - [v4,06/11] dt-bindings: net: mediatek,net: Correct bindings for MT7981
>     https://git.kernel.org/netdev/net-next/c/bc41fbbf6faa
>   - [v4,07/11] arm64: dts: mediatek: mt7981b: Add Ethernet and WiFi offload support
>     (no matching commit)
>   - [v4,08/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable Ethernet
>     (no matching commit)
>   - [v4,09/11] arm64: dts: mediatek: mt7981b: Disable wifi by default
>     (no matching commit)
>   - [v4,10/11] arm64: dts: mediatek: mt7981b: Add wifi memory region
>     (no matching commit)
>   - [v4,11/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable wifi
>     (no matching commit)
> 
> You are awesome, thank you!
> -- 
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
> 
> 

-- 
Lee Jones [李琼斯]

