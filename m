Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB685E87827
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 13:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWGKlBRXsvslJKCJ791DxTaky6mRbtocoIFvmRiqDpg=; b=b7+96sW123/I7r5CzScgHp8pY/
	77V8zMhHiK2dfW2tgDl46m1jUj8nPEJR0QqA87dL/i/kHdTaiM9oP43zE0KO6iT81rMd/2pcTaF5u
	YqIhw68sjeq0/vSdSaIcYLccb6rpz9kDNvnz/qq+Q5AUA3J+jYn5HooFvzdb5JXSSy+eV4zI5fqCz
	H/y3Is+lDWYM/CU2dvAuYGqXA6kE17BBj4J9x+P81CupGJ3QS4RR/kzJKZqK4sL6LNNztJwi8SDnH
	FH93cwM6Z7oaU4W5NjkQOQdvDEshWCtSH+/JoEXmVhDUhW7ZRFOtYwPDqhs6RcjFbv0QWt2bmB2xn
	qsMNSxpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGWU-00000006fQC-2uXN;
	Tue, 03 Feb 2026 13:32:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGWS-00000006fPr-09VK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 13:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=SWGKlBRXsvslJKCJ791DxTaky6mRbtocoIFvmRiqDpg=; b=hn35khLI9F+pQXZndNVLk9eWGu
	e5pdDrsNjn9640vLGnMmqtEN7pXRuPz7UuKOZVZ5F50nJ6Vfu/ONU0pb1BLR52+DJDct1m9VTZC3p
	AO4CTi/+XgjtGceZY6FNAS8lBwAdPdeRQ3iaDfeziTQUN4Le+n+LTZDHrkTNyomjqNus=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vnGW2-005wva-Bx; Tue, 03 Feb 2026 14:32:26 +0100
Date: Tue, 3 Feb 2026 14:32:26 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?Q?=C5=81ukasz?= Majewski <lukasz.majewski@mailbox.org>
Cc: Jakub Kicinski <kuba@kernel.org>, shawnguo@kernel.org,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	edumazet@google.com, netdev@vger.kernel.org, pabeni@redhat.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, conor+dt@kernel.org,
	horms@kernel.org, richardcochran@gmail.com, robh@kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, wahrenst@gmx.net,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Subject: Re: [net-next,v22,4/7] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <3632215c-24cc-42a3-b565-c2e48be5bdf7@lunn.ch>
References: <20260131233459.1625279-5-lukasz.majewski@mailbox.org>
 <20260203014247.824561-2-kuba@kernel.org>
 <20260203110341.1ce21455@wsk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203110341.1ce21455@wsk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_053252_077968_C9121745 
X-CRM114-Status: GOOD (  22.62  )
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

> > jakub: maybe add a TODO comment transiently here, since later patch
> > implements the cleanup?
> 
> The mtip_switch_tx() is empty as we have agreed, that I will divide
> this driver to several patches to ease the review.
> 
> Adding TODO seems to only make AI review happy, as:
> 
> - The patch which adds support for FEC_MTIP_L2SW in Kconfig will be
>   sent after the driver is accepted to net-next
> 
> - Those commits are even now bisectable when FEC_MTIP_L2SW is
>   enabled (when I test the setup).
> 
> Anyway, if you still would like to have the TODO comment, then please
> give me a hint how it shall be written to make the AI happy...

I would not make too much effort in keeping the AI happy, for
something we understand is transient. It is currently not a gate for
acceptance.

> And maybe a few my thoughts:
> 
> 1. AI review seems to bring each time different issues - even the
> "grammatic" ones were not provided with the first AI generated review.

The rules are being tweaked as we gain experience with it, so i would
not expect it to produce the same output every time. Even if it was
stable, it is not clear to me if it is reproducible.
 
> 2. I have tried to setup claudie> to run the patch set through it -
> however, it requires a paid account on a cloud/AI vendor (and I guess
> that different vendors' AI engines produce different output for the same
> "AI prompt")?

I expect so. It is clearly not checkpatch.pl and the like were you can
run it 100 times and get the same answer every time. But i think that
is understood. So long as there has been a discussion about its
output, patches should get merged even if there are still AI
comments. It is just another tool used in the review conversations.

	Andrew

