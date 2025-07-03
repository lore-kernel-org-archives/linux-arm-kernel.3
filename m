Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD434C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 08:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iurUCQkQ6NU0bD6+V+iw118TmNVywv06hQqDSqml8f4=; b=RCqRF45a3ZyxMiwy7Oi8t15xdd
	xrsW9xILQtxp5GVBqCAbjh6FON6qeitSQfGFBnwJXzqV3vUH1mHjaDkRuEZK3V5ZTAf5C+oaVtxRq
	yHg3wTLeRr+H5hf+bH0SHfNdwrsZZy+Bg8x1AHHYlCnYxADYj2U1RgpBDn7dFI/voRhfa6a04k+y0
	kQGgEn3bm0+aKnhwzkZ6i612Ag2SvZYmnA0uAJ8Ee7tYfYLDi6QZrWtWUdYxCQ3ZwiukqpQWMVsnI
	zt7zyY9witVSTmlgQ04paN62yO0Ro1bvWqbbEBbg6pNLRqNTPdiLusBlVVq/8SqMa6Nx6BA/WAh6p
	yDvQ3MuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXF6z-0000000AdpH-2Ddc;
	Thu, 03 Jul 2025 08:16:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEvb-0000000AbyZ-3lWJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 08:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iurUCQkQ6NU0bD6+V+iw118TmNVywv06hQqDSqml8f4=; b=m+X8rmO7ABcAgVme6uM4LHj+d1
	WYzvhrViBMOPIoPNblfxEgNGO1uvQRItO3AdLJWOPy/k531y5YFuyWth71nC4/ByK1iCWgfsXPQDo
	neP4KP+lu27yO8zDeTTWNAVX9bc+j7qY2mq0JEfsLBNbTdoggQOvaV8QBLyLBkb9epgEpsTT06H+u
	qs9ZlY+I2wofvcd3cJkxEYiTH/fsjrQ1NzuDfyGbRhKaoszL0GPVYwyjZ1wJVKrHgYOjUNoS4bozz
	PtmhstF51mhw2k+kO4PEAA4il2AJFsIrVErP5Q7YN5KViW1Fl6oO5MQo8e+tn0DhuIURCSvJ9lQwD
	BUwEH+bQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56566)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uXEvK-0000MI-0j;
	Thu, 03 Jul 2025 09:04:02 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uXEvI-0004vN-04;
	Thu, 03 Jul 2025 09:04:00 +0100
Date: Thu, 3 Jul 2025 09:03:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: DT: imx6-sr-som: Replace license text comment with
 SPDX identifier
Message-ID: <aGY5bx1Qpx_7Dqea@shell.armlinux.org.uk>
References: <20250702-sr-som-dts-lic-v1-1-2e8584e6c837@prolan.hu>
 <aGWqIzNvSVw4olz5@shell.armlinux.org.uk>
 <2f628251-5b67-47e0-8038-6c1aeee1ef91@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f628251-5b67-47e0-8038-6c1aeee1ef91@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_010419_934133_68B1ABA4 
X-CRM114-Status: GOOD (  17.98  )
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

On Wed, Jul 02, 2025 at 11:56:20PM +0200, Csókás Bence wrote:
> Hi,
> 
> On 2025. 07. 02. 23:52, Russell King (Oracle) wrote:
> > On Wed, Jul 02, 2025 at 11:41:54PM +0200, Bence Csókás wrote:
> > > Replace verbatim license text with a `SPDX-License-Identifier`.
> > > 
> > > The comment heades mis-attributes this license to be "X11", but the
> > > license text does not include the last line "Except as contained in this
> > > notice, the name of the X Consortium shall not be used in advertising or
> > > otherwise to promote the sale, use or other dealings in this Software
> > > without prior written authorization from the X Consortium.". Therefore,
> > > this license is actually equivalent to the SPDX "MIT" license (confirmed
> > > by text diffing).
> > > 
> > > Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> > 
> > As Florian has already mentioned, the preferred format for the summary
> > for arch/arm is "ARM: ... " and by extension for arch/arm/boot/dts,
> > it's "ARM: dts: ...", not "arm: DT: ..."
> 
> Ohh, I misread it, I thought it was just about `imx6: board:` ->
> `imx6-board:`... Ok, I will re-format it for v2.

Note that it applies to _all_ patches to arch/arm/boot/dts.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

