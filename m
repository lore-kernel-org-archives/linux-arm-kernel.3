Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6682CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6H1pSOS0tE8x4+w4j5sSTNSvLpOtXpis8kCsGfo1lcM=; b=GT0RbOjZtmDpN+7M70aGJVPLsO
	gSKXGpKnIHeyYo46wkR7pAgGDnZFxs9Wi528v/0O6o6MRb7ZxPO7A8/uoLRYkzao5NFtNRjIc/cob
	j9utFl+Bn6RURJR1W8FS6WUTNXu8VLs6wDurCSn/UILsgWsIjTkSox+xBt6OSYwKUffY7ovHdorFO
	NboPTgXoEXUaXWksLHahyNcYaRN1FHMqWAMbzbk8Nn7210HSRiHJiq+BNtFuyEjG8fp99032Syliq
	WofL65GFEljWvns4/0HXbL6CBwa5Mmdqfytg0uKxITxoLHo+uY3znLz5zwx8/7MmHw0J25cRc5I3f
	Aeil8tfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM46-0000000G3FE-0szz;
	Fri, 05 Sep 2025 02:20:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuHYL-0000000Ea6z-3AkI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 21:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6H1pSOS0tE8x4+w4j5sSTNSvLpOtXpis8kCsGfo1lcM=; b=KkMgZWe+XVf2JxNzPK4es8X5Pk
	08NY++duiwnRg15poUU2Xa53D+o5nE3vzxllBZdeJDRLTejJKchTMJIf3qjK5EyxV6ZpE1AZMFQR2
	UE2uvX8UmgWim2jW90temcr6HpOXtagXU9OIu3+sHOzxalUz5zBukXlR6r6H1zvPR+qfS4/waOn65
	Cm44rA5rJDq3iWf2cA6Fyv3Pz861y67zugaUaa6T+ZysZGg7YzULl5Mh4WcqmC0xWj3dR/fT0uffh
	tDEbUQc+fjqUV060l0CY6vBVs0P1i08ZCg04FpwjwQqJ13b8upZlbpdrUlgvX102c42IFL33cBIRk
	twajxq3A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35846)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uuHY7-000000002ZH-0ZPb;
	Thu, 04 Sep 2025 22:31:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uuHY2-000000001sE-2wEY;
	Thu, 04 Sep 2025 22:31:14 +0100
Date: Thu, 4 Sep 2025 22:31:14 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v2 2/3] net: stmmac: dwmac-renesas-gbeth: Use OF
 data for configuration
Message-ID: <aLoFIoqT2A2RmrfR@shell.armlinux.org.uk>
References: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904203949.292066-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aLn7XVnWmHv1Bfe2@shell.armlinux.org.uk>
 <CA+V-a8umpEzwO5XnFVNB-TkDtEh9K48OKqaDE_SwzGfXk+9qEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8umpEzwO5XnFVNB-TkDtEh9K48OKqaDE_SwzGfXk+9qEA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_143133_794297_3E21BD1C 
X-CRM114-Status: GOOD (  16.31  )
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

On Thu, Sep 04, 2025 at 10:10:32PM +0100, Lad, Prabhakar wrote:
> Hi Russell,
> 
> On Thu, Sep 4, 2025 at 9:49 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Thu, Sep 04, 2025 at 09:39:48PM +0100, Prabhakar wrote:
> > >       plat_dat->init = renesas_gbeth_init;
> > >       plat_dat->exit = renesas_gbeth_exit;
> > > -     plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> > > -                        STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
> > > -                        STMMAC_FLAG_SPH_DISABLE;
> > > +     plat_dat->flags |= gbeth->of_data->stmmac_flags;
> >
> > You include the first two flags in your new device. I would like to see
> > at least STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP always being set. The only
> > reason we have the STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is to avoid
> > changing existing behaviour and causing regressions. New stuff should
> > always set this.
> >
> Me confused, STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is set in the new
> device [0]. The reason STMMAC_FLAG_SPH_DISABLE flag being dropped in
> the new device is SPHEN=1 in MAC HW feature reg for the new device.

What I'm saying is I'd like to see:

	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
			   gbeth->of_data->stmmac_flags;

iow, it is set unconditionally, even if forgotten in a future patch.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

