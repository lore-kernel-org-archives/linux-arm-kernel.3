Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29858FEA839
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 09:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrD/JzDrD0dZqQ/BKgHkwNPVPT9uW7xqNUxn9RdOSf0=; b=c7nQzKrsADlfNFrX37o0ZYXqgw
	IddERBuV+Ezc7PdMxw1l7c38XUwwsi6MtS/i6RWPkChKhpsPp7nwcpW7GSH6dfB+wJGMqUi46rCxN
	G0C/2BVQNVogJfxvaKmzfLzDbU/gmqggNr2D15eri38L3vQGbtkd21Pa20OFdktzl3QcaVjxumoQc
	bWpEQ1WNEv5Z51LBfhBoQ6GfEbRHDladD1Ch5SDFspmD3P2ALk8PwukRjpK3rKx0UhV7Px5Ebaih8
	efEUimrto/kCAG406t46c/J7xQEs1KBCkik5nSdGffPRjCu2LR2ZOVdWO04WvEhJqUstjjXUoCQqQ
	J6NVL8+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Kxz-000000035ae-2WlA;
	Wed, 25 Mar 2026 09:55:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Kxw-000000035aF-2RJD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 09:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MrD/JzDrD0dZqQ/BKgHkwNPVPT9uW7xqNUxn9RdOSf0=; b=Z8x233+7/xEqjXlOVVGBNMEXlx
	4PiPESHRrXr707uK287cImoqPmojVVBPJjpiVHLP8K9o5bXrO+huTt6l5UZtjgdow0hyYQyewI6qB
	dT32Wx231olUTVkjaMDCdoE0HxdSh2PQBNWYNqzhPUpbLfVZa9mGfdcGMV6l99/nbaqi3JuWsCE/O
	p65OUFIr0EM7afi/FmlgJMmDaIqpLw0LAdkUkZv4NoWGSyxcYpeFInUdc/MoOof2CTfOowrMacfuq
	gDu3gemEl3fmL1dH19WvcRcuwPUBqM40rzNdpubjfZ82DGouFaBdNzPUIFR3/uSAiM2CSbcVfvIKb
	0QuMRIrA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54494)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w5Kxf-0000000039n-2tj3;
	Wed, 25 Mar 2026 09:55:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w5Kxc-000000005wp-1R1H;
	Wed, 25 Mar 2026 09:55:36 +0000
Date: Wed, 25 Mar 2026 09:55:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linusw@kernel.org>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	antonio.borneo@foss.st.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] net: stmmac: fix pinctrl management during
 suspend/resume
Message-ID: <acOxGC7c5L6UwL8H@shell.armlinux.org.uk>
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
 <20260313105718.359614-2-christophe.roullier@foss.st.com>
 <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
 <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
 <abStv0IPLfkKMD-W@shell.armlinux.org.uk>
 <CAD++jL=Av5K7Ag95LYou4TMKGR59TmtiQpxcnpcj+4tZFtzRug@mail.gmail.com>
 <ablS_C8oEQFeSU1Q@shell.armlinux.org.uk>
 <CAD++jLm5_mfx1572Cg+NPhuLoPu6DKDfOwK5XxRc4R_8M7kbYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLm5_mfx1572Cg+NPhuLoPu6DKDfOwK5XxRc4R_8M7kbYw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_025556_894233_9ADA5D85 
X-CRM114-Status: GOOD (  38.30  )
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

On Thu, Mar 19, 2026 at 10:43:25AM +0100, Linus Walleij wrote:
> On Tue, Mar 17, 2026 at 2:11 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > I'm trying to get an answer on this, because the original patch
> > description here says:
> >
> > | In the deepest low-power modes, the pinctrl configuration is
> > | lost and is never restored if the interface is down.
> >
> > stmmac uses the "default" pinctrl state at probe time. This commit
> > says that is lost over suspend/resume - which to me sounds like
> > a pinctrl driver bug, because on resume, the pinctrl driver is not
> > ensuring that the pinctrl state is restored to whatever it was when
> > the suspend happened (whether the driver explicitly changed it or
> > not.)
> >
> > To put it another way...
> >
> > On entry to probe for a non-pinctrl driver, if DT describes a default
> > pinctrl state, that state will be selected by core code.
> >
> > On suspend, the driver is free to select another state if it so wishes,
> > or do nothing (e.g. it's unaware of pinctrl.)
> >
> > On resume, the pinctrl layer, what is expected to happen. Surely, it
> > is reasonable for a pinctrl unaware driver, or at least a driver which
> > has _not_ changed the pinctrl state to expect that the default pinctrl
> > state is still in effect when its resume function is called - and if
> > that is not the case, then there's a bug here.
> >
> > Another way to put it...
> >
> > We shouldn't be expecting device drivers to have to mess with pinctrl
> > e.g. switching to a sleep state and then back to a default state just
> > to have pinctrl settings restored to a functional state on resume.
> 
> OK I see your point, the pinctrl hardware state should not change
> behind the back of the driver, and if it does, and that is worked
> around by these calls to restore the state using the pinctrl PM
> helpers become a messy quirk.
> 
> - Selecting those states to reconfigure pins into special modes
>   during sleep is OK.
> 
> - Selecting those states to restore the hardware state inside the
>   pin controller itself is NOT OK.
> 
> If this is done for the latter reason, you're right of course, there is
> a bug in the pin controller. Certainly it is expected to maintain its
> own state over a suspend/resume cycle.

Thanks for the clarification. So, going back to the original patch:

"In the deepest low-power modes, the pinctrl configuration is lost
 and is never restored if the interface is down.
 This commit ensures that the pinctrl state is set in all cases."

This commit message seems to be suggesting that the switch to sleep
mode and back to default mode is to ensure that the pinctrl driver
for this platform correctly re-sets the pinctrl state back to the
default state - which suggests that this patch is the wrong approach
and there is a bug somewhere in the pin controller layer.

That said, for platforms that do provide a sleep state for stmmac, it
makes sense to switch the pinctrl to that state even when the netif
is down. So, I think there's actually two separate issues:

1. the pin controller not restoring the state that was set at suspend.

2. not switching to sleep state when supported when the netif is down.

and fixing (2) will mask (1) which will be bad. So, I think (1) needs
to be fixed first while we have an easy-to-test case, and my suggested
replacement patch is a better approach for (2).

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

