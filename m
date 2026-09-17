Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA50CC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4vyh6guG/2BWaZ+fOFZHWv7En7iGTAIr7WoSiqIrAM=; b=o+CMCizARtvtydfX22DEo5PXNB
	e0iYUq8VlrO0O+gP2RmqEDLEltIyd0eNVYYY8ZDBGigvrQzWzFFsIFx9ko8K89eHHTpNYCATPnRTp
	OqJsp9wHKxzgoky0w0CWEI0jgoEURI7b7gxf6W6qtChdtUrgQAkm9vob6lVlJF5L4gxn+zcdEXXQ0
	dNfNTOpyZbasRY3KRq1bWZb0D6g15yNOin/F8S2zAt+X0yeghnMZDZ6+HTZq2MELX2pYb5iyHQ5ih
	HaaQuFqL3gi1WygnJBvk2il2WY337dp+TRtKxQgqhgsAdkq+feiDSsobALuhBxLXODQv2MJf2E35P
	kJryTK0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DQP-0000000BaZ8-2SNu;
	Thu, 17 Sep 2026 14:49:21 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DQN-0000000BaY1-1iE7;
	Thu, 17 Sep 2026 14:49:20 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1x7DQ5-000000008HR-1vZr;
	Thu, 17 Sep 2026 14:49:01 +0000
Date: Thu, 17 Sep 2026 15:48:58 +0100
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
Subject: Re: [PATCH v5 net-next] net: phy: mediatek: support MT7530 PHYs on
 EN71221 MCM
Message-ID: <aqv92pZsobVEdipZ@makrotopia.org>
References: <20260915113427.113296-1-cjd@cjdns.fr>
 <aqkwYd5dTmHDCIW9@makrotopia.org>
 <2a7edfd0-b784-4b60-b9f9-769fe00286b7@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a7edfd0-b784-4b60-b9f9-769fe00286b7@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_074919_445690_822B1BC6 
X-CRM114-Status: GOOD (  14.68  )
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

On Tue, Sep 15, 2026 at 02:01:29PM +0200, Caleb James DeLisle wrote:
> On 15/09/2026 13:47, Daniel Golle wrote:
> > On Tue, Sep 15, 2026 at 11:34:27AM +0000, Caleb James DeLisle wrote:
> > > @@ -135,6 +199,23 @@ static struct phy_driver mtk_gephy_driver[] = {
> > >   		 */
> > >   		.config_intr	= genphy_no_config_intr,
> > >   		.handle_interrupt = genphy_handle_interrupt_no_ack,
> > > +		.match_phy_device = mt7530_phy_match,
> > > +		.suspend	= genphy_suspend,
> > > +		.resume		= genphy_resume,
> > > +		.read_page	= mtk_phy_read_page,
> > > +		.write_page	= mtk_phy_write_page,
> > > +	},
> > > +	{
> > > +		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530),
> > I'd suggest to actually use phy_id and phy_id_mask assigned by the
> > PHY_ID_MATCH_EXACT macro by calling genphy_match_phy_device() in your
> > match functions above instead of open-coding the ID match.
> > Or drop PHY_ID_MATCH_EXACT from *both* drivers.
> 
> I suppose the latter is easier because then I don't have to re-think
> mt7530_is_gphy() which would be lying if it wasn't actually checking ID is
> MTK_GPHY_ID_MT7530.
> 

I would have preferred to call genphy_match_phy_device() in your match
functions instead of open-coding phy_id_compare() which is best
reached via genphy_match_phy_device() in this situation -- that would
express the code intent in the most obvious way imho.

