Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F8AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 14:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcZHDoThaYxly+4j90kjqZOMipH5MZr1Fpg6uBi+DCg=; b=owYGM7DSudX7OE6OKWcw79fLEV
	YnHVkS5fprC5ihir9H933nF/hunEWWFAcSbXKvtNRxD47510/5rdIBfpSlQSWjPhREMvdnV/ZNSNX
	rguIMrdFtQqNl7XAqrVml6zIMYjDtFzp8hvEcuqgQ4eX22UosLK54c5wutgSZ5ES4jaged1fI98IF
	0AxK2N08C1ddY43AqGksd5hW4SgIL/i5If24Cba3bHpR1N69e3m/7uBqg6LtnupSfR8v7sbJe3NeB
	cO4BiC8553bTQaFgMOH8eDQUCehd8s7Zx/VmLUfCKu/gfa6drrHSTSxLLmVKk3XJnjprEGKGjuLAa
	Qt1kssgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xEC-0000000EJih-0B0s;
	Thu, 24 Apr 2025 14:07:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vt8-0000000E3z2-2JAd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 12:41:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 569A51063;
	Thu, 24 Apr 2025 05:41:04 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F21163F59E;
	Thu, 24 Apr 2025 05:41:06 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:41:04 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
Message-ID: <20250424134104.18031a70@donnerap.manchester.arm.com>
In-Reply-To: <835b58a3-82a0-489e-a80f-dcbdb70f6f8d@lunn.ch>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
	<20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
	<aa38baed-f528-4650-9e06-e7a76c25ec89@lunn.ch>
	<20250424014120.0d66bd85@minigeek.lan>
	<835b58a3-82a0-489e-a80f-dcbdb70f6f8d@lunn.ch>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_054110_638377_36F82D16 
X-CRM114-Status: GOOD (  22.76  )
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

On Thu, 24 Apr 2025 14:16:16 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Thu, Apr 24, 2025 at 01:42:41AM +0100, Andre Przywara wrote:
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
> > Those go on top of the main 2ns delay  
> 
> Which 2ns delay? "rgmii" means don't add 2ns delay, the PCB is doing
> it. So if there is a 2ns delay, something is broken by not respecting
> "rgmii".
> 
> > I just tried, it also works with some variations of those values, but
> > setting tx-delay to 0 stops communication.  
> 
> Just to be clear, you tried it with "rgmii-id" and the same <300> and
> <400> values?

Yes, sorry, I wasn't clear: I used rgmii-id, then experimented with those
values. I briefly tried "rgmii", and I couldn't get a lease, so I quite
confident it's rgmii-id, as you said. The vendor DTs just use "rgmii", but
they might hack the delay up another way (and I cannot be asked to look at
that awful code).

Cheers,
Andre

