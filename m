Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D115B109879E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35EoSgbbhAMpHfUa5IEUpJhv+RfkkFYAmzR+GISPIcg=; b=XVSF6Pl1aDz73/KXUMQNKL0nq6
	/Bf6sUBJnQqFau9j/2qhFLjA/guVlPXOj+cvHtvit3Yr0rOVFd11FVPHS0OKblAXfb4SzGsgN+V41
	vV11/qbqAqBRHvQ/pBMfFBHIklFZX53GKLim3oYDEdim+abRRHeKEk7IHYRS1uB1hr2mVnD7UcZ4i
	OZ64UE9kKjAmGXNTTzu0s2LNdDDAZhf+P8POyQ0ZpfjAa0p+FAZnzh7I+bSIefncORHvwh/lmaTsv
	60ALInoUX2efFJnkje60FhvVNOI+cRhRRWqggqtReZD0FZl/ReBkzIMzqfJqsrNK58LNczqAAHE78
	Qi/6zLsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bzA-0000000D3Mo-2l3m;
	Fri, 20 Mar 2026 15:42:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bz8-0000000D3LC-05ek
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=35EoSgbbhAMpHfUa5IEUpJhv+RfkkFYAmzR+GISPIcg=; b=aKpzz2F9dfiCBQHrtsBiS6N5tr
	g4AtNbwdyt0kzsS3C8LNah+XiY2waqV3n75UtiNdsrPY+8V8SUt0ve15lkf81AhMfdlneyApQNzLO
	+7YVv0QsgBW3IPWsC8LjsWqMbIZ8FZkKj0SuaDd0E7tfHP382wqwEh51JRPBfdyfvGXDU7NIcw55X
	wMi4ScybbCncHBruRK68hWArWkJfuRJqGBkV6PxWfK3d3Q1XsYX4yWnIRy6U8iSa2g9TdABcXb5zm
	FoI3M28F/A1BFrIT6e4X2OqE2TjHihLdD4S1juYeY6lBrzrZHB8Q1nNeUd16WTB/CvX49nTlTyuaH
	cHSshQGQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51948)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w3bys-000000006Eh-2XKC;
	Fri, 20 Mar 2026 15:41:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w3byo-000000000wF-1R2i;
	Fri, 20 Mar 2026 15:41:42 +0000
Date: Fri, 20 Mar 2026 15:41:42 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: yangg9 <cohenyang511@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	kuba@kernel.org, yangg9@xiaopeng.com, edumazet@google.com,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, maxime.chevallier@bootlin.com,
	vladimir.oltean@nxp.com, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: close reset IRQ window and avoid double free
Message-ID: <ab1qthMmffkAKVQ8@shell.armlinux.org.uk>
References: <20260320061955.833785-1-cohenyang511@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320061955.833785-1-cohenyang511@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_084202_060634_68224798 
X-CRM114-Status: GOOD (  16.74  )
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

On Fri, Mar 20, 2026 at 02:19:55PM +0800, yangg9 wrote:
> From: yangg9 <yangg9@xiaopeng.com>
> 
> During reset, stmmac_reset_subtask() used to set STMMAC_DOWN before IRQs
> were freed in __stmmac_release(). That leaves a window where interrupts can
> still fire after the device is marked down, which may lead to interrupt
> storms while the interface is transitioning.
> 
> Move stmmac_free_irq() earlier in the reset flow, before setting
> STMMAC_DOWN, so the reset path no longer has that interrupt window.
> 
> Since IRQs are now released in stmmac_reset_subtask(), guard IRQ release in
> __stmmac_release() with STMMAC_DOWN to avoid a second free_irq() during the
> same reset sequence.
> 
> This removes the interrupt-storm window in reset and prevents double IRQ
> release.

So, some points that need to be raised:

- What is the point of STMMAC_DOWN?

STMMAC_DOWN isn't set when the interface is administratively brought
down, the only place where this flag is set is in
stmmac_reset_subtask() and later cleared.

The flag appears to prevent stmmac_service_event_schedule() queueing
the service task while it's still operating, but STMMAC_SERVICE_SCHED
already does that.

It also prevents interrupts being serviced, which causes your
interrupt storm. However, does this matter? Surely stmmac_release()
can already cope with the interrupt handlers being active, since
taking an interface administratively down involves interacting with
it in an active state - when a packet may be received.

It's also used in stmmac_xdp_xmit() and stmmac_xsk_wakeup() to block
further processing in those paths. However, for stmmac_xsk_wakeup()
the only path which calls stmmac_service_event_schedule() is
stmmac_global_err() which nautily calls netif_carrier_off() behind
phylink's back, which will corrupt phylink's state and lead to
phylink API calls being made in weird orders to the driver (this
needs to die.) However, stmmac_xsk_wakeup() checks whether the
carrier is on as well, which is a duplicate check.

So, here's the question: do we need to test STMMAC_DOWN in the
interrupt handlers at all? Can we delete those tests? As you seem
to have a way of triggering the reset subtask, please try removing
those tests from the interrupt handlers, thus simplifying the code
rather than trying a more complex solution.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

