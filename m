Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA50C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 18:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJezJ3JKJn/lT7bV9zFqb3A9+YwgHaor3OWOH2QhrfY=; b=Wmt38I/IHzS3yfrUP5SZIdcl6B
	xL7W6tddKp7XHp6q+l4Vg6aeVFF3AVWVmdt3E4dst7akSzFNgPaHkJDHmgCtsjGNdo31t0cXXlvWk
	hzBjNkwTICcbyCjEzLMRrWe6/+GJt1zBojJ0zrHtCn277FZ85zpOrBb7e39s69zhPJ7MyYGwNUZlP
	OXAfj+EQq72RpFAInwM5qO+7xiNzVzsrdO9MOhlN11YMCIAGm5VCpSfErkEV8WZVDwhFd5/6GEdV0
	/G8Jc8bj6XHO+cw3jlCtSAVp2e9oL+J3XvtdxR01cfUYmzsaXjj9kL+vbHsMiT0CH0SSRAxijYCbJ
	gDzQbVQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57Km-0000000AXiC-0SEh;
	Wed, 16 Apr 2025 18:18:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u578j-0000000AUtt-3Jlp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 18:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NJezJ3JKJn/lT7bV9zFqb3A9+YwgHaor3OWOH2QhrfY=; b=OH6qEwFHc99Ha7JqwKv7jMP/VA
	I+OxXNDjHtKYzKMGYs/zxhUe0+ZWnqGJ3zNiAOihoC2jTDMThgiHTw/CTK5z2Ek53gqxTw0/s/dZo
	uXyj4Qc3NPwaUN392Mhj+9rsbliM7UnI+NhBxZQP+6ztCGKnMGy/ao+69nciB7cP7/Wq4Rkjmi0gA
	U+aPBkgQKOP9gB4lpCkBPoTe2Jhnjw4V2BKwaitBzQ29vdyQsAJPMs1aKscY52Dh1w7kEcMnUcH+l
	ZYX/zldrDIY2Zq+zD0eNlVoXMVe80MJ8dGH1NrTgj+qKKmNm0mEAy3h9H9qk/yl66JJr1zhLxSpKZ
	yefTPZ7w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57022)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u576b-0001lk-0h;
	Wed, 16 Apr 2025 19:03:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u576W-0001bU-1K;
	Wed, 16 Apr 2025 19:03:20 +0100
Date: Wed, 16 Apr 2025 19:03:19 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 1/3] net: stmmac: call phylink_start() and
 phylink_stop() in XDP functions
Message-ID: <Z__w52jL05YbqSTW@shell.armlinux.org.uk>
References: <Z/ozvMMoWGH9o6on@shell.armlinux.org.uk>
 <E1u3XG6-000EJg-V8@rmk-PC.armlinux.org.uk>
 <20250414174342.67fe4b1d@kernel.org>
 <Z_4s5DmCPKB8SUJv@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_4s5DmCPKB8SUJv@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_110537_827695_964FAB6B 
X-CRM114-Status: GOOD (  29.41  )
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

On Tue, Apr 15, 2025 at 10:54:44AM +0100, Russell King (Oracle) wrote:
> On Mon, Apr 14, 2025 at 05:43:42PM -0700, Jakub Kicinski wrote:
> > IIUC this will case a link loss when XDP is installed, if not disregard
> > the reset of the email.
> 
> It will, because the author who added XDP support to stmmac decided it
> was easier to tear everything down and rebuild, which meant (presumably)
> that it was necessary to use netif_carrier_off() to stop the net layer
> queueing packets to the driver. I'm just guessing - I know nothing
> about XDP, and never knowingly used it.
> 
> > Any idea why it's necessary to mess with the link for XDP changes?
> 
> Depends what you mean by "link". If you're asking why it messes with
> netif_carrier_foo(), my best guess is as above. However, phylink
> drivers are not allowed to mess with the netif_carrier state (as the
> commit message states.) This is not a new requirement, it's always
> been this way with phylink, and this pre-dates the addition of XDP
> to this driver.
> 
> As long as the code requires the netif_carrier to be turned off, the
> only way to guarantee that in a phylink using driver is as per this
> patch.
> 
> I'm guessing that the reason it does this is because it completely
> takes down the MAC and tx/rx rings to reprogram everything from
> scratch, and thus any interference from a packet coming in to be
> transmitted is going to cause problems.

I'd like the "what do you mean by link" clarified before I update the
commit message.

If you're referring to the carrier state via netif_carrier_off() /
netif_carrier_on(), then nothing actually changes in that respect
because the carrier manipulation is being done by the driver today,
behind phylink's back. That changes to inside phylink with phylink's
knowledge.

It is my understanding that netif_carrier_off() / netif_carrier_on()
get notified to userspace, so this is visible today when XDP changes.

If you are referring to the messages that appear on the kernel console,
then yes, phylink will print those in addition, which actually makes
it more consistent with what's being reported to userspace.

Depending which you are referring to changes what I should say in the
commit message. E.g.

"We retain the changes to carrier state, which are already being
reported to userspace as link loss/link gain events, but we gain
kernel messages reporting the link state."

if you're referring to the carrier state. Or maybe:

"This change will have the side effect of printing link messages to
the kernel log, even though the physical link hasn't changed state.
This matches the carrier state."

if you're referring to the additional kernel messages.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

