Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F7ECC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 07:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHbtPw6Fpa3W67Ti492QqigdUKJyYU9HzcZKUgG/dMg=; b=dYDFaT27aEmRnrCwpgFwS2YD7N
	2ole3WNd3Cn23oVAa85hPXT6t/t3wH4GNAQ15Wu1AzbyO7UBOY/9Ox1YKSNnXw6cQpgf+D6JRs6pf
	M0xlYJ54iezCbjmQCdWYIHE2gvwOeo6a8cBB01kA1tkk+XMTWEUtfzpVsaumCF427A6fuydYIil9N
	OkgCO6TWPd9aNo20nM4LxvbHUR9yVlJUWUExyKDhMNUZoyLhRaRucydG8rN40qQpwTSD5EfiQg69z
	bFMRN+MOnMYz/+WVjFgRWtkP2cGq+lPPgXBsV4JLRB5HRWrDkxnMfJuEtTV4A9WigaW0FMUc0iRCf
	ih2JPUBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHG2W-0000000H35v-2Qk1;
	Thu, 15 Oct 2026 07:38:12 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHG1l-0000000H33K-3AdN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 07:38:11 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id BAA741FAE5;
	Thu, 15 Oct 2026 09:37:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792049843;
	bh=wHbtPw6Fpa3W67Ti492QqigdUKJyYU9HzcZKUgG/dMg=; h=From:To:Subject;
	b=vDb0hcRN771AToJfOrVaFxj3rLlsOVGPKBFGmNtk30XW/pxEFUJrys1rDuyft1sXq
	 NaHw8v5QCRABpLwNtJA0wd9sC5dTjB7rzZmMQLoDG9NAPlWrcTH+ESYdok7G1W2i32
	 jZMxXFn+1+uNP27M1HRhcmE0nB4kmIFE/RT41qTYSvbQB1JrBImyNNV8ds5OLxtOqM
	 K5F48olx2/BrPo3ZkFxLOlg75hFqAdutW3UZ0rytCzl8lBauxlnWWQyGSLSCF7NDUL
	 3FfOdfcsy2677F0iM58cSnNzQKsM8cWuOI9F3qmocdXInxP/ji5MwbKxXQg2CWHosE
	 m+zWaX01X3u+g==
Date: Thu, 15 Oct 2026 09:37:19 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: dts: freescale: imx95-toradex-osm-dev:
 Remove ETH_A PHY interrupt
Message-ID: <20261015073719.GA58156@francesco-nb>
References: <20261014075812.29154-1-francesco@dolcini.it>
 <20261014075812.29154-2-francesco@dolcini.it>
 <as-Pp99xLXk0nRJd@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as-Pp99xLXk0nRJd@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_003725_959628_7E2F045E 
X-CRM114-Status: GOOD (  15.83  )
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

On Wed, Oct 14, 2026 at 09:20:23AM -0500, Frank Li wrote:
> On Wed, Oct 14, 2026 at 09:58:09AM +0200, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > GPIO_A7 is a boot strap on the OSM iMX95 module. The pull-up on the OSM
> > Development Board Ethernet PHY interrupt line causes the module to enter
> > USB loader mode instead of booting normally when the reset button is
> > held for more than 0.5 seconds.
> >
> > The PHY interrupt connection has been removed from the carrier board,
> 
> Look like it is hardware modification, can declear the version number here
> 
> Since V_x.y, the PHY interrupt connection has been removed...

Valid point. It deserves a better explanation.

 1. There is no change in the actual board revision.
 2. Moving from interrupt to polling works always, so it does not
    require any change on the board.
 3. On our board is possible to disconnect the interrupt just removing a
    jumper. The actual board revision stay the same. This is a new
    product, that is going to be generally available in a few days. We
    are going to ship boards with such jumper removed to
    solve the i.MX95 strap option issue on reset.
 4. Future board revisions might completely disconnect the ethernet
    interrupt, removing the actual connection from the schematics. Given
    we work in polling (after this patch is merged), this will be a
    transparent change that will not create any kind of software
    incompatibility.


Should I incorporate this detailed information in the commit message and
send a v2 or the current commit message is fine ?

Francesco


