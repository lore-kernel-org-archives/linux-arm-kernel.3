Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EA0C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 17:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hoCv9YGoA5llUMO1DS3w019F1tDGNYulVOCgZz2nIGs=; b=mPkZhvUTDxtBGNSeC14ZcKBp5Y
	FCPWoMvsZcz5yD0bnk8W8wK7InWuZWFDb+zQf71lvF7SN5gtJZLFf2Qn9iRIdDrf6l0q8hvqTVf9u
	9jsVDJ9hq5mzZUh6+qBc2eG96ZkCTQRIOPrFMtEsIR2lHVfvGqoUB2b2Ey7CS4FIEFmamNVKUm0VE
	UDHLKbx8JFQaR1wSXRzp90zKUo2PjwuDZDeoxJjFy72g/Hopg/rjAWUJG4zSLKJibjbaQVFUFy1I4
	MydwwxY5a3eHLxFylIBHI4uCUQXR2HRL3gl5lK461cyLJt6qRnG7mtU4Vn0PZP4rrU7UMdF9JyaXJ
	Aw2oA+TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidNB-0000000C55p-2Mu7;
	Thu, 13 Feb 2025 17:51:37 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tic3P-0000000BlN0-3RYM;
	Thu, 13 Feb 2025 16:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hoCv9YGoA5llUMO1DS3w019F1tDGNYulVOCgZz2nIGs=; b=ryWOgEXdsk/TF9OOvLKmzxDMim
	KyP7yPuREuTwPWt7nCQ0+ViCbXjiIY01szVCEiFXo5WxR+XLk1ztWSTxm2MOo/p06JiRwKwhyTcGE
	Gb7R810BCsHOfsAn5CDRTtDX1VkxZlipdL73eoSwwWKm+D+M3pYS5zpG6PZG8kO+IZZc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tic39-00DnAG-62; Thu, 13 Feb 2025 17:26:51 +0100
Date: Thu, 13 Feb 2025 17:26:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Phil Elwell <phil@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>,
	bhelgaas@google.com, brgl@bgdev.pl,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>, derek.kiernan@amd.com,
	devicetree@vger.kernel.org, dragan.cvetic@amd.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, krzk+dt@kernel.org,
	kw@linux.com, Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	lpieralisi@kernel.org, luca.ceresoli@bootlin.com,
	manivannan.sadhasivam@linaro.org, masahiroy@kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, saravanak@google.com,
	Stephen Boyd <sboyd@kernel.org>, thomas.petazzoni@bootlin.com,
	Stefan Wahren <wahrenst@gmx.net>, Will Deacon <will@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <a3c5103c-829a-4301-ba53-6ef9bd1e74e7@lunn.ch>
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
 <20250213171435.1c2ce376@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213171435.1c2ce376@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_082707_856183_F0DD2F32 
X-CRM114-Status: GOOD (  15.04  )
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

On Thu, Feb 13, 2025 at 05:14:35PM +0100, Herve Codina wrote:
> Hi Phil,
> 
> On Thu, 13 Feb 2025 15:18:45 +0000
> Phil Elwell <phil@raspberrypi.com> wrote:
> 
> > Hi Andrea,
> > 
> > The problem with this approach (loading an overlay from the RP1 PCIe
> > driver), and it's one that I have raised with you offline, is that
> > (unless anyone can prove otherwise) it becomes impossible to create a
> > Pi 5 DTS file which makes use of the RP1's resources. How do you
> > declare something as simple as a button wired to an RP1 GPIO, or fan
> > connected to a PWM output?

Where is this button or fan? On a pluggable board? Isn't that what
overlays are for, and they are stackable. So when you probe the
pluggable board via its eeprom etc, you find the overlay and load it?

Or do you mean a custom board, which has a CPU, RP1 and the button and
fan are directly on this custom board? You then want a board DTS which
includes all these pieces?

	Andrew

