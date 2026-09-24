Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403B6C98311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 10:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2TGthl/l+U6JPEQBZKjZ9tOpbNIpNQGFR6OfZqJpSA=; b=GVC1GYTfCD+wy8SyXOJYKKKjU5
	+64Y+8v6Ek8+XLqd0qKFydzDIK1yG/YG9izjyeJC7+Gr8b8SJw1XITq0pl3Uxe+P9oT28lu1h49I3
	/4lvdGlgvXrErwgy6Z9RGg0i1pdvgvSS36GGHT3tV7wCM/sAF38WTMtL4aHuR16g+H2zkN7qGKQ74
	PnM5HSGCUBk9H05TFGrTZ4P3M92ZHZIT2E4dIb8rVHTgJuwFBTz54Oe5khGy9A4MUbc92MLGvTmrC
	PGrDBEfnsUDSKxlMRkePS5jn5ymJ7/fD6SEDYOG/IhGTYkERwn1GsoG0Db2EDId3lz/WixmFX31rm
	Bzv12thg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gS7-0000000Ag2b-3xCe;
	Thu, 24 Sep 2026 10:13:20 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gS4-0000000Ag25-0QyU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 10:13:18 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2B6881F997;
	Thu, 24 Sep 2026 12:13:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790244792;
	bh=b2TGthl/l+U6JPEQBZKjZ9tOpbNIpNQGFR6OfZqJpSA=; h=From:To:Subject;
	b=UaIdCqg+hu7W+ebM6pu7YOWBnzzVbwue7iJ75Sz38ZQcbYTgwSLsmJQeaddtf5BTX
	 mV8O9Q+5QVPKE6pFTf914RuvC64r63XFEkcTOK6EIV97dYv8SxMPjOTNoP25gYBXQL
	 38P31uG898kVdtPxbiBVLIGP1ZnE7dIS5kvn00KqUIwctEK2akasjJ25tTdoBPSkKb
	 u6lZniGTkR/dKyK2MNDbDuXao6NWoInbNXKQb1p+HLFHIFUPYXX94OYU9I0Gb1CzIT
	 0c5DdtdLqIsXPXqFZB5EjpacnbRuv3kKQ8BpXJbnDJANo+eVc3PMbs6ko2fEPSY8S6
	 rgXigSkc7Xgyw==
Date: Thu, 24 Sep 2026 12:13:08 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 0/4] arm64: dts: freescale: Add Toradex iMX95 overlays
Message-ID: <20260924101308.GA45659@francesco-nb>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
 <arKn0LhC5fty7dHN@SMW015318>
 <20260922165846.GA290956@francesco-nb>
 <arLJl3jyyytfS_Qw@SMW015318>
 <20260923084111.GA460930@francesco-nb>
 <arPrD4TDYhjYxFGJ@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arPrD4TDYhjYxFGJ@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_031316_467461_3B0402BD 
X-CRM114-Status: GOOD (  51.16  )
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

Hello Frank,

On Wed, Sep 23, 2026 at 10:06:55AM -0500, Frank Li wrote:
> On Wed, Sep 23, 2026 at 10:41:11AM +0200, Francesco Dolcini wrote:
> > On Tue, Sep 22, 2026 at 01:31:51PM -0500, Frank Li wrote:
> > > On Tue, Sep 22, 2026 at 06:58:46PM +0200, Francesco Dolcini wrote:
> > > > On Tue, Sep 22, 2026 at 11:07:44AM -0500, Frank Li wrote:
> > > > > On Tue, Sep 22, 2026 at 04:33:45PM +0200, Ernest Van Hoecke wrote:
> > > > > > This series adds device tree overlays for the Toradex Verdin, Aquila,
> > > > > > and SMARC iMX95 SoMs.
> > > > > >
> > > > > > The series adds support for:
> > > > > > - NAU8822 Bridge Tied Load configuration on the Verdin Development Board
> > > > > > - UART_4 reservation for Cortex-M7 firmware on Verdin and Aquila
> > > > > > - SER0 reservation for Cortex-M7 firmware on SMARC
> > > > > >
> > > > > > The UART overlays mark the port as reserved so Linux does not claim it.
> > > > > > Firmware remains responsible for configuring the UART and its pads.
> > > > > >
> > > > > > The Makefile entries build standalone DTBOs and ready-to-use composed
> > > > > > DTBs for the corresponding Development Boards.
> > > > > >
> > > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > ---
> > > > > > Ernest Van Hoecke (4):
> > > > > >       arm64: dts: freescale: imx95-verdin: Add NAU8822 Bridge Tied Load
> > > > > >       arm64: dts: freescale: imx95-verdin: Add Cortex-M7 UART_4 overlay
> > > > > >       arm64: dts: freescale: imx95-aquila: Add Cortex-M7 UART_4 overlay
> > > > >
> > > > > both reserved lpuart2, can you share one dtso?
> > > >
> > > > The comment in the DT file must be different because it's important to
> > > > reference the actual board it applies to.
> > > >
> > > > So to fulfill this request we would need to add a common dtsi, include
> > > > it from two different dtso files.
> > >
> > > No, direct use one dtso. see
> > >
> > > https://elixir.bootlin.com/linux/v7.3-rc3/source/arch/arm64/boot/dts/freescale/imx-pcie0-ep.dtso
> > >
> > > And makefile to check how apply the same dtso for difference boards
> >
> > imx-pcie0-ep.dtso works as a single shared file because its content is
> > generic, there is no board name anywhere in it, and nobody needs to
> > apply that specific dtbo by hand to know what it is for.
> >
> > These overlays are different: they are meant to be picked up and applied
> > directly by the end user, in addition to also being combined in-tree
> > into a ready DTB. Put yourself in that user's shoes: they have a Verdin
> > board, they want to free up UART_4 for their Cortex-M7 firmware, and
> > they go looking in arch/arm64/boot/dts/freescale/ for the overlay that
> > does that for their board. What they need at that point is a file name
> > that says "this is for Verdin" and "this is the UART_4 one", and once
> > they open it, a comment that confirms both: which board and which
> > specific UART. That is the whole point of shipping the overlay
> > separately from a combined DTB: it is meant to be readable and
> > applicable on its own by someone who is not a DT expert.
> 
> If someone is not DT expert, most likely direct use your prebuild dtbs,
> not apply dtso theyself.
> 
> >
> > There is also a second, even more constrained user: the one who never
> > looks at the kernel sources at all, and only gets the compiled .dtbo as
> > deployed on their distribution, e.g. under /boot/overlays/ on the
> > target, or the more generic paths used by distributions like Debian
> > (/boot/firmware/overlays/) or Armbian (user_overlays= in
> > armbianEnv.txt), picking it by name from an overlay list or a U-Boot
> > env variable. Comments do not survive dtc compilation, so for that user
> > the file name is the only information available, there is no comment to
> > fall back on.
> >
> > A single dtso shared between Verdin and Aquila fails that on both
> > counts: the name has to become something generic like
> > imx95-verdin-aquila-uart4-mcu.dtso (immediately confusing: which board
> > is it really for? can I use it on either?), and the comment inside can
> > no longer say which board it targets either. That is worse for the
> > person using it, for the sake of avoiding 2 lines of duplication:
> >
> >   &lpuart2 {
> >   	status = "reserved";
> >   };
> >
> > It also does not reduce the Makefile churn: we need the same number of
> > Makefile lines/combos either way, one dtso reused for two boards or two
> > dedicated ones. And this file will not change once merged, so there is
> > no maintenance overhead from keeping it per board.
> >
> > We agree that avoiding duplication is generally the right call. When
> > there is real, growing duplication across dtso files, the right fix is
> > a shared dtsi included by the dtso files, not merging them into one. In
> > this case the duplication is 2 lines that will not change, so it does
> > not meet that bar either way.
> 
> It is not exactly true. include dtsi only one method. Basic there are two
> kind type overy all files
> 
> - one is for addtional boards.
> - change configuration.
> 
> You provide difference configuration, basically it is developping boards.
> The real productions is fixed.
> 
> Your uboot scripts or other manually should hide complex. like PC grub
> menu, just choose 1,2,3...
> 
> If someone like advance, he need know more knowledge.

I, myself, and us as Toradex, care way more of our users/developer than
just pretending them to know more.

> Makefile show how to apply dtso to correct dtb.  filename rule can't
> resolve problems without know detail.
> 
> The put lpuart2 as reserved also used by other boards, not only verdin
> and aquila.

And I also disagree on this.

Having consistent and correct file names is important, we have the same
naming scheme for SoM using non-NXP SoC, and there is a clear benefit
from this for the users that has the information complete and correct
just from the file name.

With that said, considering our disagreement, let's try to get to a
point:

 1. is it a requirement to have this changed to have it merged?
 2. if the answer is yes, is imx95-verdin-aquila-uart4-mcu.dtso fine?

Thanks,
Francesco

