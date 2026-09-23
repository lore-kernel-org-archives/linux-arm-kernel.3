Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E537C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Y5i9c/b4TYc01Xqc0JU1jpnublj/HzO6uENI1sGzb8=; b=2fmHZ5+y1Ewgeccxjqvl7mEQ0W
	H0EL0vkbBV0/k7XprheUTaKKqtU9I9jzEpDyk3bUytrt9CtrV3ZrmmCw45BEiApqg7Bdpl9LzqlHa
	w6DdjGp04dhgfNpbsIehukNO+Dus/W4jdyxRrZJiwunAZALEQRCabCllk7GVQQFuVYiqzLM+5bZuL
	rBOYch/Qu2gBYjF2SkJf4n6x82h7zVbpnmO8y0d96BFM/8ndAwdHYcpelr0+rZiUrO8V9oP/BaXD0
	Cpj2XUHMA+tpPmXrOBLfqQbuBBU58SucpjGB5/xEmAY0decldj7RM2kHZbYuhligCWhrl7kv0XmGt
	uK9ij4EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IXb-00000007Z5F-0not;
	Wed, 23 Sep 2026 08:41:23 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IXX-00000007Z4U-2MMk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:41:22 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 23BB920183;
	Wed, 23 Sep 2026 10:41:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790152875;
	bh=8Y5i9c/b4TYc01Xqc0JU1jpnublj/HzO6uENI1sGzb8=; h=From:To:Subject;
	b=x1Avj4a12eFSUsPZsD1djDgeS5gYKxM7uCO0L1tgYjmDm03qNKjEzVZWwtJCH34uG
	 A1zYjTj+FzQvp0/7yWVtObnO1iPb4bbqijf/jnKCHFcbxdDQjjUtlcm9lu/N9waqJn
	 tEftFjnNDitFws9DIcL23vqjkWqINbkWG28+vtQiArhGeG3lb1o+vRO6NbhogTx0L1
	 M7yxvtuIFX21K5+orZtH651vLCXuVG0HpWUaY47CfgJ32CWxIV1LxMARlqC115c8n0
	 WYDZv4LjfyMSYlb9FkIW8cojL1CB/xr9JcjAHKDiKXez9We0kfFtilST/qqpM0XT+A
	 BeUMWexYWafCA==
Date: Wed, 23 Sep 2026 10:41:11 +0200
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
Message-ID: <20260923084111.GA460930@francesco-nb>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
 <arKn0LhC5fty7dHN@SMW015318>
 <20260922165846.GA290956@francesco-nb>
 <arLJl3jyyytfS_Qw@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arLJl3jyyytfS_Qw@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_014120_655859_50BE9DFA 
X-CRM114-Status: GOOD (  31.96  )
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

On Tue, Sep 22, 2026 at 01:31:51PM -0500, Frank Li wrote:
> On Tue, Sep 22, 2026 at 06:58:46PM +0200, Francesco Dolcini wrote:
> > On Tue, Sep 22, 2026 at 11:07:44AM -0500, Frank Li wrote:
> > > On Tue, Sep 22, 2026 at 04:33:45PM +0200, Ernest Van Hoecke wrote:
> > > > This series adds device tree overlays for the Toradex Verdin, Aquila,
> > > > and SMARC iMX95 SoMs.
> > > >
> > > > The series adds support for:
> > > > - NAU8822 Bridge Tied Load configuration on the Verdin Development Board
> > > > - UART_4 reservation for Cortex-M7 firmware on Verdin and Aquila
> > > > - SER0 reservation for Cortex-M7 firmware on SMARC
> > > >
> > > > The UART overlays mark the port as reserved so Linux does not claim it.
> > > > Firmware remains responsible for configuring the UART and its pads.
> > > >
> > > > The Makefile entries build standalone DTBOs and ready-to-use composed
> > > > DTBs for the corresponding Development Boards.
> > > >
> > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > ---
> > > > Ernest Van Hoecke (4):
> > > >       arm64: dts: freescale: imx95-verdin: Add NAU8822 Bridge Tied Load
> > > >       arm64: dts: freescale: imx95-verdin: Add Cortex-M7 UART_4 overlay
> > > >       arm64: dts: freescale: imx95-aquila: Add Cortex-M7 UART_4 overlay
> > >
> > > both reserved lpuart2, can you share one dtso?
> >
> > The comment in the DT file must be different because it's important to
> > reference the actual board it applies to.
> >
> > So to fulfill this request we would need to add a common dtsi, include
> > it from two different dtso files.
> 
> No, direct use one dtso. see
> 
> https://elixir.bootlin.com/linux/v7.3-rc3/source/arch/arm64/boot/dts/freescale/imx-pcie0-ep.dtso
> 
> And makefile to check how apply the same dtso for difference boards

imx-pcie0-ep.dtso works as a single shared file because its content is
generic, there is no board name anywhere in it, and nobody needs to
apply that specific dtbo by hand to know what it is for.

These overlays are different: they are meant to be picked up and applied
directly by the end user, in addition to also being combined in-tree
into a ready DTB. Put yourself in that user's shoes: they have a Verdin
board, they want to free up UART_4 for their Cortex-M7 firmware, and
they go looking in arch/arm64/boot/dts/freescale/ for the overlay that
does that for their board. What they need at that point is a file name
that says "this is for Verdin" and "this is the UART_4 one", and once
they open it, a comment that confirms both: which board and which
specific UART. That is the whole point of shipping the overlay
separately from a combined DTB: it is meant to be readable and
applicable on its own by someone who is not a DT expert.

There is also a second, even more constrained user: the one who never
looks at the kernel sources at all, and only gets the compiled .dtbo as
deployed on their distribution, e.g. under /boot/overlays/ on the
target, or the more generic paths used by distributions like Debian
(/boot/firmware/overlays/) or Armbian (user_overlays= in
armbianEnv.txt), picking it by name from an overlay list or a U-Boot
env variable. Comments do not survive dtc compilation, so for that user
the file name is the only information available, there is no comment to
fall back on.

A single dtso shared between Verdin and Aquila fails that on both
counts: the name has to become something generic like
imx95-verdin-aquila-uart4-mcu.dtso (immediately confusing: which board
is it really for? can I use it on either?), and the comment inside can
no longer say which board it targets either. That is worse for the
person using it, for the sake of avoiding 2 lines of duplication:

  &lpuart2 {
  	status = "reserved";
  };

It also does not reduce the Makefile churn: we need the same number of
Makefile lines/combos either way, one dtso reused for two boards or two
dedicated ones. And this file will not change once merged, so there is
no maintenance overhead from keeping it per board.

We agree that avoiding duplication is generally the right call. When
there is real, growing duplication across dtso files, the right fix is
a shared dtsi included by the dtso files, not merging them into one. In
this case the duplication is 2 lines that will not change, so it does
not meet that bar either way.

We would like to keep the two dedicated dtso files.

Francesco

