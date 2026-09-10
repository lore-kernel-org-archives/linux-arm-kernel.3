Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB9EC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 01:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xm/Gc1cC8N6IsTXyCFpfd0jD8c/83rvPSOAorHLZHHU=; b=vx3u1ok0y6cps3fKtc01kc0VlF
	HMZ3BSs4LnvcCBWuStOynMYLQ0pjcqw+ssuu1jA9nm0KmE1afIHpCYLaGsWdUoDwhLWgqmJOX7snp
	OYX63wCxaKxXKpho0++D6ij1tgYWmtDB5QEGhdn6NzCDRdYxJP9Pe1J4YzaftUOIQUNCU0VxFLERw
	Zr49Pgxbk5JLHMSfz6h92xz1DrFr7okd7WM+8mrF35me9icWazcBgMPnVecAW7XBdzqpUniMs8y22
	zCEcXOEvAIFzlZGh4e8nnAldc/+vTJwsiwQrh9HCCxXbXnPq+bwXzOoSu5n7SlwwZh6D1QYgxHqCX
	9yXSTwzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4U19-0000000DDkD-14Lk;
	Thu, 10 Sep 2026 01:55:59 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4U16-0000000DDjZ-0IUP;
	Thu, 10 Sep 2026 01:55:57 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1x4U0t-000000006Qn-0xnF;
	Thu, 10 Sep 2026 01:55:43 +0000
Date: Thu, 10 Sep 2026 02:55:38 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
	andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH net-next] net: phy: mediatek: support MT7530 PHYs on
 EN71221 MCM
Message-ID: <aqIOGgVujIKT7H2H@makrotopia.org>
References: <20260909213250.3184238-1-cjd@cjdns.fr>
 <aqHlfmYa249e3HRM@makrotopia.org>
 <7a3479c8-45cc-4b88-b111-c35d59f370e1@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a3479c8-45cc-4b88-b111-c35d59f370e1@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_185556_107343_A8B39A8A 
X-CRM114-Status: GOOD (  26.97  )
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

On Thu, Sep 10, 2026 at 01:26:14AM +0200, Caleb James DeLisle wrote:
> 
> On 10/09/2026 01:02, Daniel Golle wrote:
> > On Wed, Sep 09, 2026 at 09:32:50PM +0000, Caleb James DeLisle wrote:
> > > The EcoNet EN751221 multi-chip module implementation of the MT7530
> > > requires some additional configuration of the PHYs on startup.
> > > The reason for this is not known, but it is possible that it has
> > > to do with the fact that the EN751221 MCM implementation of the
> > > MT7530 runs at an abnormal PLL frequency (362.5Mhz).
> > > 
> > > Detect whether the MT7530 PHY is attached to the MDIO bus of an
> > > EcoNet EN751221 switch and if so, apply the necessary register
> > > updates.
> > > 
> > > Co-developed-by: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
> > > Signed-off-by: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
> > > Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> > > ---
> > >   drivers/net/phy/mediatek/mtk-ge.c | 61 +++++++++++++++++++++++++++++++
> > >   1 file changed, 61 insertions(+)
> > > 
> > > diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
> > > index 73d9b72f9d9e..42b06c40d703 100644
> > > --- a/drivers/net/phy/mediatek/mtk-ge.c
> > > +++ b/drivers/net/phy/mediatek/mtk-ge.c
> > > [...]
> > >   static int mt7530_phy_config_init(struct phy_device *phydev)
> > >   {
> > > +	int ret;
> > > +
> > > +	if (mt7530_phy_is_en751221_companion(phydev)) {
> > Please introduce a `.match_phy_device` operation for both, actual
> > MT7530 and EN751221, similar eg. to `ksz8051_match_phy_device` in
> > micrel.c.
> 
> Sounds good, since this will certainly collide with
> https://lore.kernel.org/netdev/20260827065930.2618729-2-cjd@cjdns.fr/ would
> you prefer them in the same patch, or as a patch set? If you'd like I can do
> this and the FE phy as a common patch set. Let me know what you prefer.

I'd do it one driver at a time, starting with mtk-ge.c, already adding
the .match_phy_device logic so it would also avoid binding the MT7530
driver to an ECONET_FEPHY.

The econet-fe-soc.c driver is much larger and may require more rounds
to make all bots and humans happy, so I'd not have the independently
useful mtk-ge.c changes depend on that.

Dumping the PHY register space and comparing it with MT7530 could also
help to indentify any better way than relying on the parent DT
compatible which *is* a bit of a stretch (but could well be
unavoidable, of course).

