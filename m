Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA04E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WclJIgJsn5/+vqwanDjayXoLrKNWxG2h+QLUlcHYmRQ=; b=YLxbcX5wr602PtgD8d3y7+dMar
	8Xiyf86lP2oOIibOwGojahI5yZI54U31+JoCROl83v89osmqrptINV8sWBnyIDGoUp/fbftzHqx2I
	7WtNhK6pXYIDb5tdruLkmTVSaAPzFyo6jec47Jo8ZrKRd1KKTbEBR4c4XUPmbEmew67/WWcGh/YpF
	YdHfNJbX1e/FEb/V/oRrDU4wIGm76Gyf8NE0SKQymYCTn2chS+Wyh7Loqa98jGaOlz271O3D7kGQa
	FPodpVEtjXl2dD/kdMmk4OEAuqIy/GacGvAYfYBi2kHp3lyp9Z7LJQaNdJdO8iHztmBmdLyYBSVOU
	HIzKBrxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrXV-0000000D2Af-0tm2;
	Wed, 04 Dec 2024 15:43:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrWU-0000000D22s-1fqe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WclJIgJsn5/+vqwanDjayXoLrKNWxG2h+QLUlcHYmRQ=; b=F/EQqap+4DoP8zDgpHWkJUx0+A
	Ll7txj0gAs94wtJCbOpIDFMIm/cOz88QFU5EjxODadgZbGzGZraNwPLzxZErR2y7b6xOFEM7Sjkyu
	Y3uqNrg7rf+VKzm11e914QNqYmE0yeX4QC4Y9YH6sEaQraNOUQHD22sC7Xzd4pxqiEMrk/Mpptngt
	OYvZQUi8PZ+ikD2W/cLArd4cyJPY62syzgnGghTKSyTsWAuDoqfnoL5tVkWwuGXyLaC+AKrXiUPt7
	JdeiXeKuj46krz1JFd34qVvFrbYcB8oHF22IzlDs9gCEOwcXKeMaHmsvCIUjfPpv4wfOeoreGXVjZ
	dv1a0J6w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49598)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tIrWP-0003XJ-21;
	Wed, 04 Dec 2024 15:42:38 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tIrWN-0005fA-09;
	Wed, 04 Dec 2024 15:42:35 +0000
Date: Wed, 4 Dec 2024 15:42:34 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andrew Lunn <andrew@lunn.ch>,
	Ard Biesheuvel <ardb@kernel.org>, Daniel Mack <daniel@zonque.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 02/15] ARM: limit OABI support to StrongARM CPUs
Message-ID: <Z1B4aqtmfz19VMjv@shell.armlinux.org.uk>
References: <20241204102904.1863796-1-arnd@kernel.org>
 <20241204102904.1863796-3-arnd@kernel.org>
 <CACRpkdY243J4C3A9_13eTN84T2SeOjyoh0bWk6U1mqffUd6urw@mail.gmail.com>
 <CANp-EDb27XE0SMpDFUKm-L3j=rZhugbK20cQZGtAmP5D0r2C6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANp-EDb27XE0SMpDFUKm-L3j=rZhugbK20cQZGtAmP5D0r2C6w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_074242_432814_D018FBB1 
X-CRM114-Status: GOOD (  16.28  )
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

On Wed, Dec 04, 2024 at 09:50:57AM -0500, Ralph Siemsen wrote:
> On Wed, Dec 4, 2024 at 8:59 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > Hm why do we need a separate netwinder_defconfig if this defconfig already
> > supports it?
> 
> AFAIK footbridge_defconfig is for the "Compaq Personal Server", which
> is different than NetWinder. They could probably be reconciled by
> using devicetree and converting any platform devices. However testing
> could be a challenge, not sure who has working hardware anymore.

It's entirely possible to build one kernel that supports the EBSA285,
NetWinder and Compaq Personal Server. They're all the same machine at
the end of the day (PCI based SA110.) As long as the boot loaders pass
the correct machine type, the correct board file will be selected to
set things up.

However, if I remember correctly, Compaq seemed to be anti-mainline, so
didn't implement the machine ID and other things. I ended up
implementing a shim around the kernel to make mainline bootable on the
platform to correct the stuff that they couldn't be bothered to
implement. I may be adversely blaming them, as history from back then
is rather fuzzy, but I do remember mainline doesn't work because of all
sorts of weirdness they did.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

