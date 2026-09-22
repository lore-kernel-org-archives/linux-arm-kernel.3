Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3C3C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epLKlfGDykDfXkk+Y0D/AaucwRf+XcEMpU10b13wknc=; b=Hk8uguL7pJ+v7YNIFlV4Th6wiN
	8umuarN8SprxmHdFE7GTXydqXKLhPXrJ3tBvkuVK5UDYl9ACUBwOLqNOdHR3F6Ei5WAuleMaFMos+
	+z/cHcMJit5crnCPn7JyPdceMsZY/SMOCY7g6jlZJJ3ICPWoQXl/OkwqNmCqWTK7L+/i/ctgID9uw
	hJOEfUAMVX+OD8T5ZUn/T/CGM0p22nb5B3dCL+qB9uEH65APAhWp7j1VetUJSu1PZ5sJ8bdk1u0UL
	XqXTKBIsL8PtTvG0NAXc1377o12UbFFdVbq52yyZS1PkZK4RjU7p5epKvNmJpYmG9X6zmjvC05Vr0
	au+W8pnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93pe-000000067rx-0UgL;
	Tue, 22 Sep 2026 16:59:02 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93pZ-000000067qB-2FWq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:59:00 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0AA241F92A;
	Tue, 22 Sep 2026 18:58:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790096330;
	bh=epLKlfGDykDfXkk+Y0D/AaucwRf+XcEMpU10b13wknc=; h=From:To:Subject;
	b=Lzr3WnjzMEoqpcPP57y5SsFciig28SHwKyy+I6I+JDMjQoaef6jD15UUc8J1C7Br/
	 TMy/3GQIVQIrl/hTL65VS6e+OdSpjnBibdwoD+ctPBMHpOYJHFSJHkvbuwYU3ahAW8
	 3vgXewCPty8SG1LcqN8fEy1M5f6tfpGRURU6yzlglWVjqmWbFzd8nbT2jAXoTFeKRp
	 i21MRpZPpGSVssTEjR0rNi2iAqiRkl6MfCpBnHHa4syn5U9Iw8YePqJ/3WHj3K4r50
	 uDRo+tKf+gOtUABO/RGmJwfGtPTK9gLUhRDscWU1sE4NnX/5lfTWg+bc3bVVEv7a7R
	 cqxo4wUbYVVIw==
Date: Tue, 22 Sep 2026 18:58:46 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 0/4] arm64: dts: freescale: Add Toradex iMX95 overlays
Message-ID: <20260922165846.GA290956@francesco-nb>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
 <arKn0LhC5fty7dHN@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKn0LhC5fty7dHN@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_095857_739863_C8E18DB4 
X-CRM114-Status: GOOD (  13.46  )
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

On Tue, Sep 22, 2026 at 11:07:44AM -0500, Frank Li wrote:
> On Tue, Sep 22, 2026 at 04:33:45PM +0200, Ernest Van Hoecke wrote:
> > This series adds device tree overlays for the Toradex Verdin, Aquila,
> > and SMARC iMX95 SoMs.
> >
> > The series adds support for:
> > - NAU8822 Bridge Tied Load configuration on the Verdin Development Board
> > - UART_4 reservation for Cortex-M7 firmware on Verdin and Aquila
> > - SER0 reservation for Cortex-M7 firmware on SMARC
> >
> > The UART overlays mark the port as reserved so Linux does not claim it.
> > Firmware remains responsible for configuring the UART and its pads.
> >
> > The Makefile entries build standalone DTBOs and ready-to-use composed
> > DTBs for the corresponding Development Boards.
> >
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> > Ernest Van Hoecke (4):
> >       arm64: dts: freescale: imx95-verdin: Add NAU8822 Bridge Tied Load
> >       arm64: dts: freescale: imx95-verdin: Add Cortex-M7 UART_4 overlay
> >       arm64: dts: freescale: imx95-aquila: Add Cortex-M7 UART_4 overlay
> 
> both reserved lpuart2, can you share one dtso?

The comment in the DT file must be different because it's important to
reference the actual board it applies to.

So to fulfill this request we would need to add a common dtsi, include
it from two different dtso files.

This to save 2 lines of duplicated code, `&lpuart2 { status = "reserved"; };`.

To me this is just worst than the current proposal.

Francesco



