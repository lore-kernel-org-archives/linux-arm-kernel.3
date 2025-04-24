Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47157C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1J9mFkkBpIdwNvWfOOFzExhSUBtROAe0D6MBytZ7Go=; b=K90P9+zjQhit6APS3xWwoUR/aj
	gEJ9y60K6qfM9ICqLr/jHeI2TSDNgUSfYMI4mxhADtV+iTikfBQl/LMyeiCny6Eqq3BcLRfrd122c
	5Zmdc3/Oiv/FePliiqUSjCqLTTTHIDe2vBVCxtBYhfb59Rw5neU2jyGZ48vMj1F875ZJtsU/O0zEW
	ynI1nQb77Z62ltDOwlwkdGaVGlLjjq/iziK/8w1uBFj+oIOwq1gWWGWfV5z//UYPj9XGf1ke4mwNt
	oQTNhF7g4Hhta+JpKfG0Wztow/YI1qU/V74+7vgckZPi8gZx3lPW8UKVxtpw8t8Zicaqf2Ne9vGuz
	D+OPxIuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z3Q-0000000EaKd-0QHv;
	Thu, 24 Apr 2025 16:04:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vKc-0000000DxVJ-1c84
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 12:05:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83B231063;
	Thu, 24 Apr 2025 05:05:24 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B57FC3F59E;
	Thu, 24 Apr 2025 05:05:26 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:05:23 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
Message-ID: <20250424130523.6ceecca3@donnerap.manchester.arm.com>
In-Reply-To: <20250424100514-GYA48784@gentoo>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
	<20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
	<aa38baed-f528-4650-9e06-e7a76c25ec89@lunn.ch>
	<20250424014120.0d66bd85@minigeek.lan>
	<20250424100514-GYA48784@gentoo>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_050530_471492_1BFF0D48 
X-CRM114-Status: GOOD (  25.68  )
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

On Thu, 24 Apr 2025 10:05:14 +0000
Yixun Lan <dlan@gentoo.org> wrote:

Hi,

> Hi Andrew, Andre,
> 
> On 01:42 Thu 24 Apr     , Andre Przywara wrote:
> > On Wed, 23 Apr 2025 18:58:37 +0200
> > Andrew Lunn <andrew@lunn.ch> wrote:
> > 
> > Hi,
> >   
> > > > +&emac0 {
> > > > +	phy-mode = "rgmii";    
> > > 
> > > Does the PCB have extra long clock lines in order to provide the
> > > needed 2ns delay? I guess not, so this should be rgmii-id.  
> > 
> > That's a good point, and it probably true.
> >   
> > >   
> > > > +	phy-handle = <&ext_rgmii_phy>;
> > > > +
> > > > +	allwinner,tx-delay-ps = <300>;
> > > > +	allwinner,rx-delay-ps = <400>;    
> > > 
> > > These are rather low delays, since the standard requires 2ns. Anyway,
> > > once you change phy-mode, you probably don't need these.  
> >   
> As I tested, drop these two properties making ethernet unable to work,
> there might be some space to improve, but currently I'd leave it for now

Yes, I think we need those delays to be programmed into the syscon clock
register, and have been doing so for years.

> > Those go on top of the main 2ns delay, I guess to accommodate some skew
> > between the RX and TX lines, or to account for extra some PCB delay
> > between clock and data? The vendor BSP kernels/DTs program those board
> > specific values, so we have been following suit for a while, for the
> > previous SoCs as well.
> > I just tried, it also works with some variations of those values, but
> > setting tx-delay to 0 stops communication.
> >   
> I'd not bother to try other combinations, and just stick to vendor's settings

I learned to not rely too much on Allwinner BSP settings ;-)

And it's quite easy to experiment, actually: you can write directly to
0x3000030, for instance using devmem or peekpoke, at Linux runtime. Run
some tests or benchmarks, then try a new setting, without rebooting.

Cheers,
Andre.

