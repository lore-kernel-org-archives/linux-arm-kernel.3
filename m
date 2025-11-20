Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B840CF9C40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 15:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtUd2zXE+4kcDs6e+pY+XCYwSZGK9CfIAoWdLs7VJUU=; b=ynaaCF/wbl4ALQPXH8v5GJN1B7
	FyMG8ti9QMcLZKSwTpuWcJCEPM8ZC5w+wbzef0UFdKD1JwEexJgSGT6s430wA037c9eMB6aZNzL07
	BbQvjU7IIajzaq9f2Xps8ei71mx121n01LnrSDstw71nmZaKAGUIgPv8BavGIgjUzipqj2RN6GPe6
	B3MqpcoVlFK+3T7eLeT1eHPTyaQK6Q1fWtIYfx4F8QRC1TTINx9/tAqN257yo0vJnc02JAtgEWUrI
	blnKjRi/E3DJrlRJHiT7BcqYhj0MOl/eyJBVW8CZaEFFFnnCIan9EuQgNFDJhkmm46YyP848TBgqV
	f7GweD5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM6lm-00000006vqC-1mko;
	Thu, 20 Nov 2025 15:40:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM6lj-00000006vpn-0hkG;
	Thu, 20 Nov 2025 15:40:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C11360137;
	Thu, 20 Nov 2025 15:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC6EC4CEF1;
	Thu, 20 Nov 2025 15:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763653222;
	bh=tNNmZ2QL/T1AtHJf3KMxZyhhMvxqTgXsdcTVHNZESwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i4NueJCx9r7KrKIBLF+cUWlHEImFEFp6i4HTJfMhvWzE0AhQ79mVl9GJ5OUOETAfM
	 v62QWN+2FK0HlefMQ7hG+2OPPC0f9N+/gkosLtmKA10LtlP8Bb6C0zwAuL//WSEnXI
	 MT/BFVyE4z4b/wO3+IbcPDwRX7sIFXsco2qbEug2EQ4KzlmW5vKE5c8ACO1XaJXN4h
	 qnbhCjeCCgO/PPPzTjLptR4lFLi1Oh5evb4wDshNYs3UoCfHEbsrc4bUgNU43cgYSE
	 4+k2PcHFO4ggtL4T/WYyj66+4LfcwwcuIGBfwfs8EOo4ZCJdE0o7PmsRZlYtEdCVlQ
	 kjnswH7RBQq/Q==
Date: Thu, 20 Nov 2025 15:40:12 +0000
From: Lee Jones <lee@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: patchwork-bot+netdevbpf@kernel.org,
	Sjoerd Simons <sjoerd@collabora.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	chunfeng.yun@mediatek.com, vkoul@kernel.org, kishon@kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, lorenzo@kernel.org, nbd@nbd.name,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, netdev@vger.kernel.org,
	daniel@makrotopia.org, bryan@bryanhinton.com,
	conor.dooley@microchip.com
Subject: Re: [PATCH v4 00/11] arm64: dts: mediatek: Add Openwrt One AP
 functionality
Message-ID: <20251120154012.GJ661940@google.com>
References: <20251115-openwrt-one-network-v4-0-48cbda2969ac@collabora.com>
 <176360700676.1051457.11874224265724256534.git-patchwork-notify@kernel.org>
 <20251120152829.GH661940@google.com>
 <20251120073639.3fd7cc7c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120073639.3fd7cc7c@kernel.org>
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

On Thu, 20 Nov 2025, Jakub Kicinski wrote:

> On Thu, 20 Nov 2025 15:28:29 +0000 Lee Jones wrote:
> > > Here is the summary with links:
> > >   - [v4,01/11] dt-bindings: mfd: syscon: Add mt7981-topmisc
> > >     (no matching commit)  
> > 
> > I thought this days of Net randomly picking up MFD patches were behind us!
> 
> Take another look at the message. We picked out just one of the changes
> here.

Ah super!

Thanks for the clarification and apologies for misreading the output.

> > >   - [v4,02/11] dt-bindings: PCI: mediatek-gen3: Add MT7981 PCIe compatible
> > >     (no matching commit)
> > >   - [v4,03/11] dt-bindings: phy: mediatek,tphy: Add support for MT7981
> > >     (no matching commit)
> > >   - [v4,04/11] arm64: dts: mediatek: mt7981b: Add PCIe and USB support
> > >     (no matching commit)
> > >   - [v4,05/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable PCIe and USB
> > >     (no matching commit)
> > >   - [v4,06/11] dt-bindings: net: mediatek,net: Correct bindings for MT7981
> > >     https://git.kernel.org/netdev/net-next/c/bc41fbbf6faa
> > >   - [v4,07/11] arm64: dts: mediatek: mt7981b: Add Ethernet and WiFi offload support
> > >     (no matching commit)
> > >   - [v4,08/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable Ethernet
> > >     (no matching commit)
> > >   - [v4,09/11] arm64: dts: mediatek: mt7981b: Disable wifi by default
> > >     (no matching commit)
> > >   - [v4,10/11] arm64: dts: mediatek: mt7981b: Add wifi memory region
> > >     (no matching commit)
> > >   - [v4,11/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable wifi
> > >     (no matching commit)

This is a very odd way of presenting that one patch from the set was merged.

Not sure I've seen this before.  Is it new?

It's very confusing.  Is it a core PW thing and / or can it be configured?

-- 
Lee Jones [李琼斯]

