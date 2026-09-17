Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7252C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04sGXrdIwPyZcUs1Jy4idOXaBQa8m7ARyP/sXMKY+Ns=; b=TTuFp/oqpEktmk/fk75/9DGtZL
	My8LZaArXOEHRRt8BVOk6XIpLYPa0XiJoIVsFdaHYM7qlmg7+q5Wk/NGyy6RJO3Yvb/JLksZuqY6c
	6/Fhz5mzmO/4us1AzBGvRG0U9OHHlKYG7AlKd+Wpk3TEJMkiBexNmw6oWtLoKbjjAg9VRfSg76/Ei
	HPWVf1b+K5TSJuH+OqDF6ltrEHpLIuqb1yxEFL977EwLzt7JXdsq6RQVcS7BX6RIvj5eAr8Sd+qRh
	2WGWP2vKLOteE2Fgxkytw3xoajfzmfB+ACRr5cscMzE2q1BGTC8J2xkAMkWTYjvUI7s5nxpg0yCxn
	bLiAKeSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Cn7-0000000BW0t-1OBZ;
	Thu, 17 Sep 2026 14:08:45 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Cn4-0000000BW0A-1VH5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:08:43 +0000
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id DADEA227EA;
	Thu, 17 Sep 2026 16:08:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789654120;
	bh=04sGXrdIwPyZcUs1Jy4idOXaBQa8m7ARyP/sXMKY+Ns=; h=From:To:Subject;
	b=WC3Jbluydah594rbdqN0S7h5hmk27BYCVaKXWLXc4MwHJbWaqWuZ99DmAd6TcDQEv
	 Qi6K9EaajyTsBzNtbAFBWeJjEGQwsqgy3jjkRN7IoazC/WzjS9yoFDUBBPHcQiTbAN
	 24bGCyieBr7tmrjAT6FJqo+i3WJE5ZiLgKZB+1bhbzy6vjmL3mWruLcf1jL+iukI8c
	 uAlwYAV07d7A9iuxUD4+onViwCVUm03Yt/SYhUqOpXD7lYQnuxwhjYXwo+IrmkqbwW
	 8zU8JXtamiiPZrtTe03/p1AE4p+CNnF6NBLB+cIRK4bQ8Uom1+s+Qb6h8yJfUvjGtI
	 IcCwwbNwWStVg==
Date: Thu, 17 Sep 2026 16:08:36 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <20260917140836.GA119572@francesco-nb>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <aqQQjCW1xaGfPdss@SMW015318>
 <20260914054214.GA19835@francesco-nb>
 <aqgEfRl9INLZ-DWM@SMW015318>
 <aqgGgxzqiIbF66DX@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqgGgxzqiIbF66DX@francesco-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_070842_558070_DD03D1CB 
X-CRM114-Status: GOOD (  24.19  )
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

On Mon, Sep 14, 2026 at 04:36:51PM +0200, Francesco Dolcini wrote:
> On Mon, Sep 14, 2026 at 09:28:13AM -0500, Frank Li wrote:
> > On Mon, Sep 14, 2026 at 07:42:14AM +0200, Francesco Dolcini wrote:
> > > Hello Frank,
> > >
> > > On Fri, Sep 11, 2026 at 09:30:36AM -0500, Frank Li wrote:
> > > > On Fri, Sep 11, 2026 at 11:19:46AM +0200, Francesco Dolcini wrote:
> > > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > >
> > > > > Add support for the Lino iMX93 SoM, its Verdin adapter and development
> > > > > carrier board.
> > > > >
> > > > > The SoM is available in two variants, with i.MX91 or i.MX93 SoC, using
> > > > > the same PCB (the two chips are pin to pin compatible), to avoid
> > > > > duplication create a common dtsi to share commonalities.
> > > > >
> > > > > Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
> > > > > Link: https://www.toradex.com/accessories/lino-verdin-adapter
> > > > > Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
> > > > > Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > > > > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > > > > Co-developed-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > Co-developed-by: Franz Schnyder <franz.schnyder@toradex.com>
> > > > > Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> > > > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > >
> > > ...
> > >
> > > > > +&gpio1 {
> > > > > +	gpio-line-names =
> > > > > +		"LINO_P18",
> > > > > +		"LINO_P16",
> > > > > +		"PMIC_I2C_SCL",
> > > > > +		"PMIC_I2C_SDA",
> > > > > +		"",
> > > > > +		"",
> > > > > +		"",
> > > > > +		"",
> > > > > +		"",
> > > > > +		"",
> > > > > +		"LINO_P65", /* 10 */
> > > > > +		"LINO_S18",
> > > > > +		"LINO_S24",
> > > > > +		"LINO_S20",
> > > > > +		"LINO_S22",
> > > > > +		"";
> > > >
> > > > Can you wrap to 4 names pre line
> > > >
> > > > 	gpio-line-names = "LINO_P18", "LINO_P16", "PMIC_I2C_SCL", "PMIC_I2C_SDA",
> > > > 			  "", "", "", "",
> > > >
> > > > Reduce LOC, and easy to locate number, such gpio 13,  second of 3rd line
> > >
> > > I already replied on the v1 that I disagree on your request.
> > 
> > Your v2 sent too quick before I read v1.
> > 
> > > To me it is
> > > just more readable the way it is now and I do not see minimizing the
> > > lines of code something that is bringing any kind of benefit on its own.
> > 
> > The major concern is that it makes code read harder and lost focus by long
> > lines.
> 
> Understood, we do disagree on this.
> 
> > > Is this blocking this from being picked up?
> > > Is there any other concern on this series?
> 
> Can you answer these two questions?

Please let me know if it is a requirement to have the gpio line names
wrapped with 4 elements per row or not. I am waiting on your answer on
this.

Thanks,
Francesco


