Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0A6CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCWmDjb6QlG0p+c+DVYWjWo/iZPdmAjXivYJpRn3Www=; b=na34rQMZsBNsmMK/bWHV2BPZzW
	Ipxo0dIoSM6yRca7LSNYPE7Zlf9dWiFA1kQ4to2oLUQT53EZlv0e6IXfsqx9mt3SIWMa8y0s6e9hQ
	2oY3pjLINp407X2G3ElwcReGf6i+VOoDaZ9U/hfuLXI0XGiVPaIuaHDZS9IZ7rprTw4J5LIJA8xOL
	eEOOx2jXlBFH6Wx1p0lxJHJFEMRnN2HuYnJPsr8fVZsL6rutJSl1QoP+D4umAk2B8/gaxZGxACvJo
	pkaY7V6PIcfVO48/XVSZnjjiMuMva/OsW9gB7pqi0Rtaf2oTVGQJin2yJYFDNzTleZU2tvt2okHpg
	5OPOkBVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLgp-00000001t2r-1nrN;
	Tue, 19 May 2026 14:44:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLgn-00000001t1m-0o8i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rCWmDjb6QlG0p+c+DVYWjWo/iZPdmAjXivYJpRn3Www=; b=UxP3EnTXxgtqiLyO0j4jiXK+NF
	EU6OLNwwlvHtcjqoclJfxvCoA1h6pbAPM1q+VNa+ZHb/Uvhs+ZCbITckPgUTWAenGn+RjN2lXGlC8
	w8/9ghAFMAOOGOK35jwI5llS/TMI8nz2dBovv3zks337aXEUukzUvrxrL28JHPg2bWLI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wPLgc-003gPV-1R; Tue, 19 May 2026 16:44:46 +0200
Date: Tue, 19 May 2026 16:44:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Paul Gerber <paul.gerber@tq-group.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add initial device tree for
 TQMa8MPQS with i.MX8MP
Message-ID: <a59c05b3-aacf-4f36-a172-0fa3eb74ba0c@lunn.ch>
References: <20260505063346.1799500-1-alexander.stein@ew.tq-group.com>
 <20260505063346.1799500-2-alexander.stein@ew.tq-group.com>
 <710ae855-0f44-4b2d-8afe-415b30afd37e@lunn.ch>
 <5102480.31r3eYUQgx@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5102480.31r3eYUQgx@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_074457_227783_2E69CA05 
X-CRM114-Status: GOOD (  10.52  )
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

On Tue, May 19, 2026 at 04:11:05PM +0200, Alexander Stein wrote:
> Am Dienstag, 5. Mai 2026, 17:02:12 CEST schrieb Andrew Lunn:
> > > +/* GBE1 */
> > > +&fec {
> > > +	pinctrl-names = "default";
> > > +	pinctrl-0 = <&pinctrl_fec>;
> > > +	phy-mode = "rgmii-id";
> > > +	phy-handle = <&ethphy3>;
> > > +	fsl,magic-packet;
> > 
> > One of my FAQs: Has WoL been tested?
> 
> Well, I can "wake" the system per WoL. But resume stucks after CPUs are up

So probably not a networking problem, somebody elses problem, so this
is O.K. for me :-)

Thanks
	Andrew

