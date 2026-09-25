Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1D2C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 11:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i++aeiwkX5qCkyfP2sYNezlmPhBYAeBC7if6vewcr7o=; b=35RV4OSSKCYRbqGuuM4RL1E5AB
	csD73fqW2A0p1+z7px8cet1cgPIomOSEGbmHQ+J7EksyWG+joV94XsBUwra8mZIiOc/fcBPp+X/bc
	+uuKMgG+4jzPu7X+ZHBsRXmo9WNIvQ3C+03GwpjOmlClVUONGxKYfF6PhgrYnB0VERYSZKHCscNDR
	2fpWh0eTo547RoEByRcrlYH1sU4CvHYiW85+fzJKen24qQdnnx36jp1raLRhPQ+dV4ObasB8hXE83
	Xeiz07coyM/hXCHYPnuacyKHhgNj1nA4LUdLHwM5nNqfhbF06S/wfYdSIa/WboHeIToya1UVb1BwJ
	6jqsfcOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4Ze-0000000DGdZ-2P2a;
	Fri, 25 Sep 2026 11:58:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4Ze-0000000DGdS-08zW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 11:58:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 70A4541B29;
	Fri, 25 Sep 2026 11:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225451F000FF;
	Fri, 25 Sep 2026 11:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790337521;
	bh=i++aeiwkX5qCkyfP2sYNezlmPhBYAeBC7if6vewcr7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Em87CarAuF/uh4LnbTroxQKzJScL78hqmC6g/z4IWkD+Imd+NHq25I5v1Cco2JA/o
	 FnZBOGlf753Tc4x3asT3ID+TMBwUI0q9uY1Cfy68IbI/39ELe/w+kipZnz1epPwHsi
	 jOwPzCmagHFq6tMnPYmb79xWl/tA+MfiEXAD3jIn78TfOKX7Uy2Wq/3knLU+ZrwyIv
	 josmf812wU03Up3nVP+FaOPKt++n+Afx3moLfGIS/2xSPO+dIaagWUOmNfwIHF+0AL
	 5NPpM4DlDD1nmQ9JwPzJ+goS97g3kbdBSbmhoo4tYBZuDbNUEPaWjZcRX5SaM8Rtfz
	 bJdxybvlMuteg==
Date: Fri, 25 Sep 2026 06:58:39 -0500
From: Rob Herring <robh@kernel.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Frank Li <Frank.li@oss.nxp.com>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 3/6] dt-bindings: connector: Add Toradex camera connector
Message-ID: <20260925115839.GA677989-robh@kernel.org>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
 <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
 <aqLaLmz7n31P6igy@SMW015318>
 <prwghb3ftrz5xd3hapxtlv2o2gm5xmuapnpz2h7fqulf75phqz@lk4yiaepormb>
 <aqLif2zrrsbYd5sM@SMW015318>
 <aqLk5UAv-j39Jxd3@francesco-nb>
 <20260918192447.GB1465432-robh@kernel.org>
 <178981707848.1761404.17065871878122418287@ping.linuxembedded.co.uk>
 <arDZoulyKIzVj-73@francesco-nb>
 <179023382707.1723501.12070631258057963152@ping.linuxembedded.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179023382707.1723501.12070631258057963152@ping.linuxembedded.co.uk>
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

On Thu, Sep 24, 2026 at 08:10:27AM +0100, Kieran Bingham wrote:
> Hi Francesco,
> 
> Quoting Francesco Dolcini (2026-09-21 08:15:46)
> > Hello Kieran,
> > 
> > On Sat, Sep 19, 2026 at 12:24:38PM +0100, Kieran Bingham wrote:
> > > Quoting Rob Herring (2026-09-18 20:24:47)
> > > > On Thu, Sep 10, 2026 at 07:12:05PM +0200, Francesco Dolcini wrote:
> > > > > On Thu, Sep 10, 2026 at 12:01:51PM -0500, Frank Li wrote:
> > > > > > On Thu, Sep 10, 2026 at 06:39:30PM +0200, Ernest Van Hoecke wrote:
> > > > > > > Hi Frank,
> > > > > > >
> > > > > > > Thanks for reviewing this so quickly.
> > > > > > >
> > > > > > > On Thu, Sep 10, 2026 at 11:26:22AM -0500, Frank Li wrote:
> > > > > > > > On Thu, Sep 10, 2026 at 05:37:59PM +0200, Ernest Van Hoecke wrote:
> > > > > > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > > >
> > > > > > > > > Toradex boards route the sideband signals of their 24-pin camera
> > > > > > > > > connectors to different GPIO controllers. Camera overlays which name
> > > > > > > > > those controllers directly must therefore be duplicated for each host
> > > > > > > > > board.
> > > > > > > > >
> > > > > > > > > Describe reset, power-down, detection and power-control as
> > > > > > > > > connector-local GPIO functions. This lets an accessory overlay remain
> > > > > > > > > independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> > > > > > > > > remain described separately because the GPIO nexus does not abstract
> > > > > > > > > them.
> 
> Will it be possible to extend this to add the mapping for MIPI data and
> clock lanes and regulator supplies?
> 
> I.e. does this do anything that would push us down a hole that stops us
> mapping those signals?
> 
> What do we need to do next to be able to map I2C/CSI/Regulators through
> a 'nexus' ?

A nexus only works on certain bindings. I2C is a bus and has child 
nodes, so it needs something different. CSI works using the graph 
binding, so we'd have to make the graph work thru the connector. Every 
binding has to be figured out.

Rob

