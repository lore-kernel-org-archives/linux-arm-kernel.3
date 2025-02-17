Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD09C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 23:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4zZA+SHhnpmJYDOp0NswBWcZOVtoN7RDeuxjfGWwYM=; b=4Dpy5xo6wTVIgq+mFIs44oeEOP
	WTqvRGiGTQQMiLG+Ys0iftW291c66wbE7VYxQZLL2olb6Jk8ue9po3b8OSdlMj+qfSq14JE0aNfrH
	gZ5dc4hPtLDHSjf1x+MMIi0fArYb6yTMv/HM2XGnWkqAm8Excbbb98hM+4l8D39DrYEJTuiAaL1Gx
	+8iyY5d4qziNkWoYjbZW2slp99DhC6PQa8vVpwNjRGAQEaKzB4B4McAPDZY92dg0WD5GOdCSXwLKo
	4R7UvSzYKrG2yGINeBsU9aQvKoe0Uu6wjmYSO0MeAXSrWOgBvD8nIyAyAS+WFPaXJC7sCxKteNE/H
	j5aYAvTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkASk-00000006Egv-2OpZ;
	Mon, 17 Feb 2025 23:23:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkARG-00000006EVq-2YWb;
	Mon, 17 Feb 2025 23:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=z4zZA+SHhnpmJYDOp0NswBWcZOVtoN7RDeuxjfGWwYM=; b=NESdsBBLeV/I0kXm45xJYp1bTL
	oWkZIdEUuBRoCa45X0wQa6fuOpZrM5lGjcanXPnllxXNH6pTn1/m/7yaJSbv+O7Ymg8dAVt6f6Wfy
	bTaDLLNYsjGRf6lT0m/MGUsLjIfJH8mjAgK522uHle1UDz8LcWyCv9GGcplS0nfP5EJExAltRINzo
	559KURpSKhEvCcEG6EkJCXOKVEhh1HF/8QUJ+jAMhz8We6zWJ8UKFVmvqyELxtyrh+n7v4aMZoSpb
	zbBToIGKwNOQVgqeJzR0WJabFApK02ghl42zyjJ6ciFTq1R2nXF2o6jG0J5tRuff5bcvWFqPSewg1
	TGBaTskA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58678)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tkAQk-0008Gn-2z;
	Mon, 17 Feb 2025 23:21:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tkAQb-0006c4-02;
	Mon, 17 Feb 2025 23:21:29 +0000
Date: Mon, 17 Feb 2025 23:21:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Furong Xu <0x1207@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Serge Semin <fancer.lancer@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add glue layer for Sophgo
 SG2044 SoC
Message-ID: <Z7PEeGmNvlYD33rZ@shell.armlinux.org.uk>
References: <20250216123953.1252523-1-inochiama@gmail.com>
 <20250216123953.1252523-4-inochiama@gmail.com>
 <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
 <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
 <js3z3ra7fyg4qwxbly24xqpnvsv76jyikbhk7aturqigewllbx@gvus6ub46vow>
 <24eecc48-9061-4575-9e3b-6ef35226407a@lunn.ch>
 <Z7NDakd7zpQ_345D@shell.armlinux.org.uk>
 <rsysy3p5ium5umzz34rtinppcu2b36klgjdtq5j4lm3mylbqbz@z44yeje5wgat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rsysy3p5ium5umzz34rtinppcu2b36klgjdtq5j4lm3mylbqbz@z44yeje5wgat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_152210_653281_F78B2D73 
X-CRM114-Status: GOOD (  27.00  )
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

On Tue, Feb 18, 2025 at 06:50:24AM +0800, Inochi Amaoto wrote:
> On Mon, Feb 17, 2025 at 02:10:50PM +0000, Russell King (Oracle) wrote:
> > On Mon, Feb 17, 2025 at 02:25:33PM +0100, Andrew Lunn wrote:
> > > > I am not sure all whether devices has this clock, but it appears in
> > > > the databook. So I think it is possible to move this in the core so
> > > > any platform with these clock can reuse it.
> > > 
> > > Great
> > > 
> > > The next problem will be, has everybody called it the same thing in
> > > DT. Since there has been a lot of cut/paste, maybe they have, by
> > > accident.
> > 
> > Tegra186: "tx"
> > imx: "tx"
> > intel: "tx_clk"
> > rk: "clk_mac_speed"
> > s32: "tx"
> > starfive: "tx"
> > sti: "sti-ethclk"
> > 
> 
> The dwc-qos-eth also use clock name "tx", but set the clock with
> extra calibration logic.

Yep, that's what I meant by "Tegra186" above.

> > so 50% have settled on "tx" and the rest are doing their own thing, and
> > that horse has already bolted.
> > 
> 
> The "rx" clock in s32 also uses the same logic. I think the core also
> needs to take it, as this rx clock is also mentioned in the databook.

The "rx" clock on s32 seems to only be set to 125MHz, and the driver
seems to be limited to RGMII.

This seems weird as the receive clock is supposed to be supplied by the
PHY, and is recovered from the media (and thus will be 2.5, 25 or
125MHz as determined by the PHY.) So, I'm not sure that the s32 "rx"
clock is really the clk_rx_i clock supplied to the DWMAC core.

Certainly on stm32mp151, it states that ETH_RX_CLK in RGMII mode will
be 2.5, 25 or 125MHz provided by the PHY, and the clock tree indicates
that ETH_RX_CLK in RGMII mode will be routed directly to the clk_rx_i
input on the DWMAC(4) core.

> > I have some ideas on sorting this out, and I'm working on some patches
> > today.
> 
> Great, Could you cc me when you submit them? So I can take it and
> change my series.

Will do - I'm almost at that point, I have three other cleanup patches
I will be sending before hand, so I'll send those out and then this
series as RFC.

The only platform drivers I've left with a call to rgmii_clock() are
sti, imx (for imx93 only as that does extra fiddling after setting the
clock and I'm not sure if there's an ordering dependency there) and
the rk platforms.

Five platforms converted, three not, and hopefully your platform can
also use the helper as well!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

