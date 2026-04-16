Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B66F433CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 00:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1XEqYLz+VFVxVLLY5sh99l0d3isS+L35SSH4/U236E=; b=a3dQkfTZuo4ubpGBQdyoWH/0ns
	cFtnxj3tD0acC1C22Y2st9Y6UwB6+CR/bS3qi1nw2aGy6ZyUk8VzvW5el4kNJH+Ar9iNIDEaL8bya
	QH/CK9fKf9HvUZgPVQzIGfOgdk+ZV4C2RnH2rFxUZwUkYURduExLcF9XOx/9yW8dMdfMVmKxhyYBI
	o9RHde5C1XkwmFBR+Vo7e8M9QStbhxqP6Oh9opEucf92BFO5XexSiOuVIJT8uDRzByBSPI3Jrw3GD
	XSgcnRHIeFKOTO1uOE733iQdix8iFaHbXcd/CuzuparSn6fCoIBwccMCRx/15TVlp8zKo4Zpl+bGO
	NqXSt/mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDACR-00000001mXN-3SMb;
	Thu, 16 Apr 2026 00:03:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDACO-00000001mVw-2VAf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 00:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b1XEqYLz+VFVxVLLY5sh99l0d3isS+L35SSH4/U236E=; b=K147q+AkNu7v6MOBFr/Kx4ZCS/
	T0csGRKPmVl/FJDc2YFb2Bzm5v5cwtje9EpZ6KgxOUb2amWuMMo0wFreTVxnU9hsCKzKZb8RoaQHl
	brC5TGP5MX2BvqHZZbg0QvpD/1swD/EJRWAX42+71zg6jBg1xF4SJQXJbyRXn3kAnIFt1JH+uCXpc
	9v1IJV3rorGpFxGr8ACW0UEYa0ON60Wya88Na71bjBSjJsSzSDVSulraB1IHGeRO1fSdrFIsbSJPj
	fIH6YoeI2nxlJ8Jq5a5ex2QOji0i6GP8TDSCVBqVReHYCT7BbDB7H9x04siYBRQdMsk7X7FYrgbbp
	2bzSa/2g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55132)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wDACE-000000002d7-1Y8c;
	Thu, 16 Apr 2026 01:03:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wDACA-000000002fX-2zo6;
	Thu, 16 Apr 2026 01:02:58 +0100
Date: Thu, 16 Apr 2026 01:02:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	Linux Network Development Mailing List <netdev@vger.kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: enable RPS and RBU interrupts
Message-ID: <aeAnMTU6iiPPE0_W@shell.armlinux.org.uk>
References: <20260413110222.49fc3759@kernel.org>
 <ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
 <CAH5Ym4i7VV53hQGY3AjAUW3B8g_ffgmw69kPhPrk2CmcRbguuQ@mail.gmail.com>
 <ad5LlXzeQ8j14Mjg@shell.armlinux.org.uk>
 <ad7nsUQvksJF7JFK@shell.armlinux.org.uk>
 <CAH5Ym4jA8w9=UxMT4vKJpnXkuDHtkFtMcg4u2sy_0S+8wgy-9w@mail.gmail.com>
 <ad-ID2WaPgPJqdsa@shell.armlinux.org.uk>
 <CAH5Ym4jKdzDeYwCfkMLmUz0FsiD2vFwfuAvqFE=uvMtPmakeMQ@mail.gmail.com>
 <ad_o4aDP0UBY_8i4@shell.armlinux.org.uk>
 <CAH5Ym4j3GePEMEMmg1Z27gYfQ0N8Sc1BMW1rnvNZ4aLQ+cfFyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5Ym4j3GePEMEMmg1Z27gYfQ0N8Sc1BMW1rnvNZ4aLQ+cfFyQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_170312_638495_458E4048 
X-CRM114-Status: GOOD (  23.60  )
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

On Wed, Apr 15, 2026 at 01:50:53PM -0700, Sam Edwards wrote:
> On Wed, Apr 15, 2026 at 12:37 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > It's not a question about how I define RBU - this is defined by Synopsys
> > and I'm using it *exactly* that way as stated in the documentation.
> >
> > "This bit indicates that the host owns the Next Descriptor in the
> > Receive List and the DMA cannot acquire it. The Receive Process is
> > suspended. ... This bit is set only when the previous Receive
> > Descriptor is owned by the DMA."
> >
> > In other words, DMA has processed the previous receive descriptor which
> > _was_ owned by the hardware, written back to clear the OWN bit, and
> > then fetches the next descriptor and finds that the OWN bit is also
> > clear.
> 
> I'm only trying to leave open the possibility that the Synopsys
> technical writer and the hardware implementation team weren't
> communicating clearly. We already have a situation where RPS isn't
> behaving as documented (even if that's likely just hardware
> misconfiguration), so while I'm currently pretty sure RBU carries no
> other (actual) meaning than "DMA caught up to OWN=0," I'm only about
> 75% confident.

It doesn't make sense for RPS to be set though. RPS is "Receive Process
Stopped" and it's documented as being raised when the receive process
enters the stopped state.

If we look at the DMA Debug Status 0 register at 0x100c, then this
gives us a four bit bitfield for channels 0, 1 and 2. Further channels
are in 0x1010. I've added code to dump these when RBU occurs:

dwc-eth-dwmac 2490000.ethernet eth0: debug status: 0x00006400 0x00000000

bits 11:8 are RPS0, which indiciates that the DMA channel 0 receive
process state is "Suspended (Rx Descriptor Unavailable)". If this were
0, then it would be "Stopped (Reset or Stop Receive Command issued)".

So, RPS isn't being raised because the process state isn't entering
the stopped state, which makes sense - because we haven't issued a
stop command, nor have we caused a reset, and the documented recovery
from this condition is to merely advance the tail pointer, rather than
issuing a command to re-start the receive process.

When this is done (because stmmac_rx() continues to periodically run
because of NAPI) RPS0 does change back to 3 "Running (Waiting for Rx
packet)" but it seems that although there are packets waiting to be
written out, that never happens (the Queue 0 Receive Debug register
indicates that there are packets in the receive queue, the receive
queue fill level is above the flow control activate threshold, and
the MAC itself hammers the network with pause frames as a result.)

Thus, I think that the fact that RPS isn't being signalled is entirely
reasonable and consistent with the available documentation.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

