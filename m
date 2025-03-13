Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3027AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 14:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EvY1LEFvjjHJU3jZAtzphl1AzmykKRYyWCA/SvfCK4=; b=z/9avfCRhX/C0q0flNqh/pYPor
	ZQ/2l9sIpLVm+z94CuvjBJlbIL/MRQwe0kX7JayuJYajMhCczplYxBFZjGXUQhKm+dC4rKOFASkAq
	rsw+95TT5ynGHtQwZZltFFvW6j9xCXDHfa4c6eyWIHINO+CjTXNTxPeZtFPlB7yuteopvHl1thUQG
	P12fC+MbU4oUV9+trWOF0oZW1uB9hD6aYMTvXW3Ir8fsuDiikN80zRmN3zBjc24zt/HKCZXsjOznE
	JrBNomsAWbcHJZjwpqVem2A670O/CjwgcuVmkce/N5I3lOE2QLWEshybaM3SNFA3hYoHkVNrf4STj
	lEZdDGoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjf9-0000000BYKD-1yJv;
	Thu, 13 Mar 2025 14:35:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiRU-0000000BMd5-2ZRX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 13:17:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=4EvY1LEFvjjHJU3jZAtzphl1AzmykKRYyWCA/SvfCK4=; b=Cb
	xcRkr5Js6+IwxGpOdQ1oKGkQeF2cq/TMzpc3U5FT2lIMY76EHMFIggsHj8bcQ651yDwsQnnj+ykg/
	VVeS7E5Fzb19hUdFqt2smal5gYticNcoGaqM1qybqC23066JPaLgcwYgNZK7XSU5DFkTI5Si9hhIM
	sbyH5zQuUwYlRao=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tsiRD-004zrS-Is; Thu, 13 Mar 2025 14:17:27 +0100
Date: Thu, 13 Mar 2025 14:17:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Klein <michael@fossekall.de>,
	Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: bananapi: add support for PHY LEDs
Message-ID: <7cf91323-d550-496a-a8ec-ae104c77224d@lunn.ch>
References: <20250312193629.85417-1-michael@fossekall.de>
 <20250312193629.85417-2-michael@fossekall.de>
 <4637912.LvFx2qVVIh@jernej-laptop>
 <Z9KYqlfUYxRaWnGQ@a98shuttle.de>
 <20250313104042.694c1856@donnerap.manchester.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313104042.694c1856@donnerap.manchester.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_061744_655551_BDE3E2E9 
X-CRM114-Status: GOOD (  21.32  )
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

On Thu, Mar 13, 2025 at 10:40:42AM +0000, Andre Przywara wrote:
> On Thu, 13 Mar 2025 09:34:50 +0100
> Michael Klein <michael@fossekall.de> wrote:
> 
> Hi,
> 
> > On Thu, Mar 13, 2025 at 07:07:24AM +0100, Jernej Škrabec wrote:
> > >Dne sreda, 12. marec 2025 ob 20:36:28 Srednjeevropski standardni čas je Michael Klein napisal(a):  
> > >> The Bananapi M1 has three LEDs connected to the RTL8211E ethernet PHY.
> > >> Add the corresponding nodes to the device tree.
> > >>
> > >> Signed-off-by: Michael Klein <michael@fossekall.de>  
> > >
> > >This is patch 2/2. Which one is patch 1/2? I got only one.  
> > 
> > https://patchwork.kernel.org/project/netdevbpf/patch/20250312193629.85417-1-michael@fossekall.de/
> > 
> > Sorry for any inconvenience in case I messed up the patch submission.
> > 
> > I made two commits for this change and submitted them via `git send-email 
> > HEAD^^`. The first patch went to netdev@vger.kernel.org, the second 
> > to linux-arm-kernel@lists.infradead.org, which seems logical. Have I 
> > done something wrong?
> 
> Well, for those really small "series" it's probably better to send all
> patches to everyone, especially if the first patch gives some context,
> without which the second leaves people (like me) scratching their head.

However, netdev does not like pathchsets which contain patches which
should not be applied to the netdev tree. DT patches generally go
through a different Maintainer to driver changes implementing the
binding.

So for your DT patch, you could add to the commit message something
like:

The RTL8211E ethernet PHY driver has recently gained support for
controlling PHY LEDs via /sys/class/leds. The Bananapi M1 has three
LEDs connected to the RTL8211E PHY.  Add the corresponding nodes to
the device tree.

	Andrew

