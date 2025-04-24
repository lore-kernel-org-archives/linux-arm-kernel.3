Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B273DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JaqUIEsGhfYDD87B1ocMimRBDau19SHm7VF7ZnK3FEc=; b=fjxUxqH6Al1bc7+GWMYaTrfcrf
	Pi2L6gYskPFz6wB9oxDUEJHwt6xjeWG+AbU/4Rh3O+uW+MUqc5y7ObaMn8jkcHjcZ5T5MaQcSqu4s
	Erfjjs9BTCntVnGNT7vJkvhI3ZhyNr4sPNlNYRwtNE/KkWuUobn0fNeXOrn3mjs6t9zmCw2+a3G/o
	QWvocPlt9miIUI1ddXWFLN7fYmmSBRAYkkuAReNHyefbrsjrPnd+A1nojBEMLZiKmuW8vHixrqnuv
	R6itJFPcRbF7MJcLPQYJBUEZSY5ubD4EgZFpO09h6ynX66QClNufZwTrKc8H9I4z/RJXW4OFq3EOu
	UZr7M02Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z4g-0000000EcNc-3Iir;
	Thu, 24 Apr 2025 16:05:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7x88-0000000EIxZ-0Jxg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:00:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FFAC1063;
	Thu, 24 Apr 2025 07:00:37 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C995C3F66E;
	Thu, 24 Apr 2025 07:00:39 -0700 (PDT)
Date: Thu, 24 Apr 2025 15:00:37 +0100
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
Message-ID: <20250424150037.0f09a867@donnerap.manchester.arm.com>
In-Reply-To: <4ba3e7b8-e680-40fa-b159-5146a16a9415@lunn.ch>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
	<20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
	<aa38baed-f528-4650-9e06-e7a76c25ec89@lunn.ch>
	<20250424014120.0d66bd85@minigeek.lan>
	<835b58a3-82a0-489e-a80f-dcbdb70f6f8d@lunn.ch>
	<20250424134104.18031a70@donnerap.manchester.arm.com>
	<4ba3e7b8-e680-40fa-b159-5146a16a9415@lunn.ch>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_070044_206779_D30A6875 
X-CRM114-Status: GOOD (  25.15  )
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

On Thu, 24 Apr 2025 14:57:27 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

Hi Andrew,

> > > Just to be clear, you tried it with "rgmii-id" and the same <300> and
> > > <400> values?  
> > 
> > Yes, sorry, I wasn't clear: I used rgmii-id, then experimented with those
> > values.  
> 
> O.K, great.
> 
> I do suspect the delays are not actually in pico seconds. But without
> a data sheet, it is hard to know.
> 
>        if (!of_property_read_u32(node, "allwinner,rx-delay-ps", &val)) {
>                 if (val % 100) {
>                         dev_err(dev, "rx-delay must be a multiple of 100\n");
>                         return -EINVAL;
>                 }
>                 val /= 100;
>                 dev_dbg(dev, "set rx-delay to %x\n", val);
>                 if (val <= gmac->variant->rx_delay_max) {
>                         reg &= ~(gmac->variant->rx_delay_max <<
>                                  SYSCON_ERXDC_SHIFT);
>                         reg |= (val << SYSCON_ERXDC_SHIFT);
> 
> So the code divides by 100 and writes it to a register. But:
> 
> static const struct emac_variant emac_variant_h3 = {
>         .rx_delay_max = 31,
> 
> 
> static const struct emac_variant emac_variant_r40 = {
>         .rx_delay_max = 7,
> };
> 
> With the change from 7 to 31, did the range get extended by a factor
> of 4, or did the step go down by a factor of 4, and the / 100 should
> be / 25? I suppose the git history might have the answer in the commit
> message, but i'm too lazy to go look.

IIRC this picosecond mapping was somewhat made up, to match common DT
properties. The manual just says:
====================
12:10  R/W  default: 0x0 ETXDC: Configure EMAC Transmit Clock Delay Chain.
====================

So the unit is really unknown, but is probably some kind of internal cycle count.
The change from 7 to 31 is purely because the bitfield grew from 3 to 5
bits. We don't know if the underlying unit changed on the way.
Those values are just copied from whatever the board vendor came up with,
we then multiply them by 100 and put them in the mainline DT. Welcome to
the world of Allwinner ;-)

And git history doesn't help, it's all already in the first commit for this
driver. I remember some discussions on the mailing list, almost 10 years
ago, but this requires even more digging ...

Cheers,
Andre



> 
> I briefly tried "rgmii", and I couldn't get a lease, so I quite
> > confident it's rgmii-id, as you said. The vendor DTs just use "rgmii", but
> > they might hack the delay up another way (and I cannot be asked to look at
> > that awful code).
> > 
> > Cheers,
> > Andre  


