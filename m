Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47B7FD8763
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 13:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVX+e0F9KN8dfj/SwmnvICc5jP1yDHnEZ0Sn7ozoJNs=; b=mkVOsHsQ4VrtItt6zEtc8hT5hV
	BF9eLOpwd8IW8WcstlvXUJrjAOXymPll+tYrhvQO1Fb1Iafz05/UGRivzEMviasRh9YYZ01IE4YTG
	BPiNj6NECmZj75GT7EOkALlUV5SbMmL69AFTH/dwPEOfa50Nap+qGmaT88sb//qeab59Fs8KMyn69
	C8YsaK5HfWZoHNo17w5y5sivIjeqzwuk4k9QVNvaZ6B2xD4llIJdQA997BsaYhmb91Extb91i/Qk/
	y0zLP7PZroK3mogCPyE403mIV3G8hss7nklMpRiJXw4SbVa1o1136GlJvF4OBDQAht3TqFWVPa8lh
	Vd3VzMOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UD7-00000006OGF-2Wmg;
	Tue, 17 Mar 2026 13:11:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UD1-00000006ODr-4BR7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 13:11:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wVX+e0F9KN8dfj/SwmnvICc5jP1yDHnEZ0Sn7ozoJNs=; b=EPue8tD3UjFJLyx+/NIDJIFQFG
	CCdoKdaIuUH7eJ+4tYTn/wTRk4U9UzHLkBcTwnYjtu/CHI3q1EnJ8OewQDOdHV574I/ua1i2KjrRW
	nkCrgvXJhhR+/9zsyJiTVlb6FfW43WjKokDq1KCt8MwUtRl/Xhx5k4HHazKF6A89/7AuzUZm8xC2T
	h9C/Ubvqtb3MjEYh2KUtoCR5RwEzeUDZXmkoBRnbDG+n2B3ALsAKXB2hM/XIu6N40n7ORJVbrI9t3
	3SASwFucwlFauZh+LFefZI35v/Uq8R7ND0OoYkbdR1cOhEutZM7ZBFcrngrETuzhPl+i1e5P8SoyB
	ajRZrEMw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59600)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w2UCl-000000005EG-45Ud;
	Tue, 17 Mar 2026 13:11:28 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w2UCi-00000000649-1jir;
	Tue, 17 Mar 2026 13:11:24 +0000
Date: Tue, 17 Mar 2026 13:11:24 +0000
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
Message-ID: <ablS_C8oEQFeSU1Q@shell.armlinux.org.uk>
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
 <20260313105718.359614-2-christophe.roullier@foss.st.com>
 <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
 <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
 <abStv0IPLfkKMD-W@shell.armlinux.org.uk>
 <CAD++jL=Av5K7Ag95LYou4TMKGR59TmtiQpxcnpcj+4tZFtzRug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=Av5K7Ag95LYou4TMKGR59TmtiQpxcnpcj+4tZFtzRug@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_061144_375050_C73DD8BB 
X-CRM114-Status: GOOD (  30.11  )
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

On Tue, Mar 17, 2026 at 01:13:14AM +0100, Linus Walleij wrote:
> On Sat, Mar 14, 2026 at 1:37 AM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Sat, Mar 14, 2026 at 12:44:56AM +0100, Linus Walleij wrote:
> > > On Fri, Mar 13, 2026 at 12:08 PM Russell King (Oracle)
> > > <linux@armlinux.org.uk> wrote:
> > > > On Fri, Mar 13, 2026 at 11:57:16AM +0100, Christophe Roullier wrote:
> > > > > In the deepest low-power modes, the pinctrl configuration is lost
> > > > > and is never restored if the interface is down.
> > > > > This commit ensures that the pinctrl state is set in all cases.
> > > >
> > > > Shouldn't the pin state be restored by the pinctrl layer?
> > >
> > > What we have in the device core only applies "init" and "default"
> > > states, and provides these handles for transitioning to "sleep"
> > > and "default" again (like a state machine).
> >
> > What I was meaning is that - for a driver using the "default" state,
> > if the hardware loses the pinctrl state during sleep, isn't it the
> > responsibility of the pinctrl driver to restore the state rather
> > than leaving it in whatever states it happens to be when the SoC
> > comes back from suspend?
> 
> Aha I understand.

I'm not so sure. My point is that if a driver binds, and pinctrl
ends up using the default pinctrl settings, then should it not
be the case that after a suspend/resume cycle, the pinctrl
settings remain configured in the default state with no driver
intervention?

This is my point - a driver that is unaware of pinctrl should not
have to do anything special in its resume path to ensure that the
pinctrl state that was configured by generic code at probe time
is maintained after a resume - that state should not be lost.

I'm trying to get an answer on this, because the original patch
description here says:

| In the deepest low-power modes, the pinctrl configuration is
| lost and is never restored if the interface is down.

stmmac uses the "default" pinctrl state at probe time. This commit
says that is lost over suspend/resume - which to me sounds like
a pinctrl driver bug, because on resume, the pinctrl driver is not
ensuring that the pinctrl state is restored to whatever it was when
the suspend happened (whether the driver explicitly changed it or
not.)

To put it another way...

On entry to probe for a non-pinctrl driver, if DT describes a default
pinctrl state, that state will be selected by core code.

On suspend, the driver is free to select another state if it so wishes,
or do nothing (e.g. it's unaware of pinctrl.)

On resume, the pinctrl layer, what is expected to happen. Surely, it
is reasonable for a pinctrl unaware driver, or at least a driver which
has _not_ changed the pinctrl state to expect that the default pinctrl
state is still in effect when its resume function is called - and if
that is not the case, then there's a bug here.

Another way to put it...

We shouldn't be expecting device drivers to have to mess with pinctrl
e.g. switching to a sleep state and then back to a default state just
to have pinctrl settings restored to a functional state on resume.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

