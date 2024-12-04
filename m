Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8BFE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0UI9RVYI7CpiaDoEdpIIrcx8Tm046GiLKGNeURsScg=; b=EqKvyli6BNjhxpaBFKb3VrLYd9
	XsjZLNfjEeptLgo3sdPt1Fg4J5xRP3nbTvmG7dra99WCAGI59rqj1fPnUZ09+wOd4XzExFYRvmX9W
	BlwZUCBvwoSKGlgts9Z7UQjeVClV9TOxWVIZ2nLoLCbl0KlKu6XKsyra+nbrTiQqz+dFGG2qYJjST
	hJvVxhvCLKvvxqy/6TUiTKssxZjTKMglCkH/U9YSKcgsLccF5QTuOTfwbFXAxC7pfM4y/mD1UBri5
	VrelzYkG9rx0ZMUzm0bBoJU3ZOf0F3BICfZy2AgFzj6nOOb71b1eENRHd63ubaOT64JxZ36YE11Th
	Wq+G8Wjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqWo-0000000CrIR-1OMx;
	Wed, 04 Dec 2024 14:38:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqVn-0000000CrDA-2lKt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 14:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=d0UI9RVYI7CpiaDoEdpIIrcx8Tm046GiLKGNeURsScg=; b=sEGo/kECC6aoG5eXWn7eeUIOsc
	AzbwoOVjUPAmNtvIqYUFbbuprKBUU0ZCyUf6nPTck/DdLE5+kJol5HFD6oCaPopl5UqUNh/W/emu0
	rXQDCogwbrkAuuUGONWArPIt+iBIK9NiWf2l2d/CU2bhnow9npq2iHfRUsifZBG7mYkY3YVymEVCe
	1y+nAK7QhlucUYcRU4Kz1Wx77FpkQy1dyyUNp1nSk7L5+cavG3b30wCrgFRldT6v+YVtwGWOC81o3
	+GPgguCPdoHA6XMJ7ZujAezSJBRc78U6BD4wC990HDvlP4UzTmrcJFeSl36qRufaGtnT1AjS85ASI
	PBQpdnQw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52040)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tIqVd-0003Ow-1h;
	Wed, 04 Dec 2024 14:37:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tIqVZ-0005bq-2F;
	Wed, 04 Dec 2024 14:37:41 +0000
Date: Wed, 4 Dec 2024 14:37:41 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andrew Lunn <andrew@lunn.ch>, Ard Biesheuvel <ardb@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 15/15] ARM: mark footbridge as deprecated
Message-ID: <Z1BpNQjWwxEKFbg0@shell.armlinux.org.uk>
References: <20241204102904.1863796-1-arnd@kernel.org>
 <20241204102904.1863796-16-arnd@kernel.org>
 <CACRpkdahQhj5u9ATghszi-N2OYhFbvHF_W_eAMDAU+vhmvdrJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdahQhj5u9ATghszi-N2OYhFbvHF_W_eAMDAU+vhmvdrJA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_063755_692610_A5B007C5 
X-CRM114-Status: GOOD (  23.53  )
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

On Wed, Dec 04, 2024 at 03:29:09PM +0100, Linus Walleij wrote:
> On Wed, Dec 4, 2024 at 11:30 AM Arnd Bergmann <arnd@kernel.org> wrote:
> 
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Along with RiscPC and SA1100, these are the last remaining Intel StrongARM
> > machines. The Corel NetWinder used to be particular popular in the late
> > 1990s, but was discontinued during the bankruptcy of rebel.com in 2001.
> > The other machine is the DEC (later Intel) EBSA285 evaluation board that
> > was made in small numbers in 1997 for software developers.
> 
> IIRC David Rusling at DEC was sending this board out to interested
> developers.
> 
> > The footbridge/netwinder platform was the main target for the first Debian
> > 2.0 "Hamm" release on the Arm architecture back in 1998, but was dropped
> > in Debian 6.0 "Squeeze" in 2011, which only supported ARMv4T and higher
> > with the EABI based ports as ARMv4 hardware had fallen already out of
> > use by that time.
> >
> > Link: http://netwinder.org/
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> I am booting it occasionally, last time to test my KCFI patches.
> But admittedly that is only to test it for other SA110 users. I remember
> that Christoph had problems consolidating the DMA used in this
> machine as well so it is standing in the way of useful work.

What problems with DMA? The fact that it uses an offset between
physical and PCI bus space should be nothing that causes a problem
for the kernel. As maintainer for Footbridge, I've heard nothing
about there being any issue.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

