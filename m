Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5F2CF9C49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 16:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slrKq2kMshZDspv3pvDI2DIfj40KNFueWZ7HeyLXlPc=; b=x49u+1pHfBy/bRdZy6tZ3Jkeiz
	EYFL1RfTRAGTxA5sk/X/WBdY8KGX647cAnLiy/+v6BYp1vjOiEDh8d6h6BOD+zcqcu0mEPIBEQaWn
	2XJEwwdyuoUqNW3EqjXp/Zfz7sYafOHlyTARG3f0ZCohTTVOmAwileaEousxC4TkUg9SLTw1Huqli
	EsPYSenuj0iSIcpEk7N4vuOiSDxPD/9oGLhti3J1e6wNTbWBljoieqlXmNGhGKezhzZrA4SZv5DCH
	9RSAEu4gxjhbxuCp45/hs6lNTRp2Ga6rRmBxeGJGka8eVEnZo6Yef+GSQpai9PsWUUdi6C2c+fyLd
	zjeSUOVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7gj-000000071xO-123d;
	Thu, 20 Nov 2025 16:39:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7gg-000000071wF-3UL5;
	Thu, 20 Nov 2025 16:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 199B540313;
	Thu, 20 Nov 2025 16:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08A7C116C6;
	Thu, 20 Nov 2025 16:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763656754;
	bh=BnOq3z51JqZJ8uQTHJFdAkzYEzpauy5TFsDbeB3BY4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V2kg0Tjj5QAKnndNOFZg5UC+/n0jys+8p9t5bz8p2y04vHxqxgOE2geeBodAahomQ
	 6m3d1+OMgwqwVvJImgdEJxg6I3jVlPT88OhSxZ93cPZtdsMP+msfK+1w3cGjTUH5Nv
	 KVXDDGdIK+t3KqYt6Q2bt2kY6nQrRG1SAVr2XiYmixARbV/XEroZo9xi4/Ag7AT0SJ
	 bSMR3ZrrUBkYF+RvU0I7zZpD2Aa96Em+gKXCZFEiXjNqiLkrPQxYJAxKRG/bx0AGZn
	 SfYsbZi5aoUPmDMmRb3KWQe8ti0Kl2mPqG4nN/orjZlqLPNlTDR71a2uEHdq723P1/
	 DQlMOgkh/0V3Q==
Date: Thu, 20 Nov 2025 16:39:04 +0000
From: Lee Jones <lee@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	patchwork-bot+netdevbpf@kernel.org,
	Sjoerd Simons <sjoerd@collabora.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, chunfeng.yun@mediatek.com, vkoul@kernel.org,
	kishon@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, lorenzo@kernel.org,
	nbd@nbd.name, kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, netdev@vger.kernel.org,
	daniel@makrotopia.org, bryan@bryanhinton.com,
	conor.dooley@microchip.com
Subject: Re: [PATCH v4 00/11] arm64: dts: mediatek: Add Openwrt One AP
 functionality
Message-ID: <20251120163904.GL661940@google.com>
References: <20251115-openwrt-one-network-v4-0-48cbda2969ac@collabora.com>
 <176360700676.1051457.11874224265724256534.git-patchwork-notify@kernel.org>
 <20251120152829.GH661940@google.com>
 <20251120073639.3fd7cc7c@kernel.org>
 <20251120154012.GJ661940@google.com>
 <20251120074457.5aa06d89@kernel.org>
 <c23d5d1e-4816-41c7-9886-41d586c84cc6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c23d5d1e-4816-41c7-9886-41d586c84cc6@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_083914_909640_C90918D9 
X-CRM114-Status: GOOD (  14.42  )
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

On Thu, 20 Nov 2025, AngeloGioacchino Del Regno wrote:

> Il 20/11/25 16:44, Jakub Kicinski ha scritto:
> > On Thu, 20 Nov 2025 15:40:12 +0000 Lee Jones wrote:
> > > > > >    - [v4,02/11] dt-bindings: PCI: mediatek-gen3: Add MT7981 PCIe compatible
> > > > > >      (no matching commit)
> > > > > >    - [v4,03/11] dt-bindings: phy: mediatek,tphy: Add support for MT7981
> > > > > >      (no matching commit)
> > > > > >    - [v4,04/11] arm64: dts: mediatek: mt7981b: Add PCIe and USB support
> > > > > >      (no matching commit)
> > > > > >    - [v4,05/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable PCIe and USB
> > > > > >      (no matching commit)
> > > > > >    - [v4,06/11] dt-bindings: net: mediatek,net: Correct bindings for MT7981
> > > > > >      https://git.kernel.org/netdev/net-next/c/bc41fbbf6faa
> > > > > >    - [v4,07/11] arm64: dts: mediatek: mt7981b: Add Ethernet and WiFi offload support
> > > > > >      (no matching commit)
> > > > > >    - [v4,08/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable Ethernet
> > > > > >      (no matching commit)
> > > > > >    - [v4,09/11] arm64: dts: mediatek: mt7981b: Disable wifi by default
> > > > > >      (no matching commit)
> > > > > >    - [v4,10/11] arm64: dts: mediatek: mt7981b: Add wifi memory region
> > > > > >      (no matching commit)
> > > > > >    - [v4,11/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable wifi
> > > > > >      (no matching commit)
> > > 
> > > This is a very odd way of presenting that one patch from the set was merged.
> > > 
> > > Not sure I've seen this before.  Is it new?
> > > 
> > > It's very confusing.  Is it a core PW thing and / or can it be configured?
> > 
> > It's k.org infra bot. Konstantin, would it be possible to highlight
> > more that a series is partially applied?
> 
> I guess that adding "(subset)" like b4 does would improve those messages quite
> a lot ;-)

Right.  Or better still, just omit the ones that weren't touched.

-- 
Lee Jones [李琼斯]

