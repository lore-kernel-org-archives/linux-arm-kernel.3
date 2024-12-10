Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176B4E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTFT+9zxHZAYsd5at7fqwUdZUtL0uBlHOOcBL8Go5hg=; b=2lWo8XinYvDn2eqbfg/BBMtkDK
	Bj8jbOVwTRVYPSapaVt0oU9IDSpmA3046wupICtx4UpwdNO1dJCD+tlszhlACg0iSzrjxkrff6DE9
	uR5HGYR28YQrDIt2iXoCSFl9iHJwokx7c68X73cJCQD2bRN2EStkBQTvxIdhkuLj7ctyq2LeLhBkq
	8ip0uTiLvE8KSnafPQ0kxIMsakHjS1yv86OM5eE16+2py9POmpTzmZhvTS+yeKKfwbATw1QZO9kwp
	BLg2xI7qmWQvDl1Yqa0pzyafceDHeMFVOkj72+dKxzWV8txXuA0/F5hwStVhZwFumNHE6PKlCSRRj
	FeQ4cSWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0So-0000000BbLP-1lFZ;
	Tue, 10 Dec 2024 13:39:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0Rh-0000000Bb9b-2QXR;
	Tue, 10 Dec 2024 13:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JTFT+9zxHZAYsd5at7fqwUdZUtL0uBlHOOcBL8Go5hg=; b=Felk73iOHWeImqFqE1wd/6xiCQ
	B3JbqkHtRYmqA+R0jQbvEt6aX1fDNkuCBWAuLvNduTKPOYVM+B6OuzCfzmqEr8MCde9cyEeOsYXj1
	XB5EDdHe+tY4f1W0Wfl95hvJfE1NOievTDHjON28WntZWO610Hximxl8m8+Zg5Sbvhao=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tL0RR-00Fnwk-Ue; Tue, 10 Dec 2024 14:38:21 +0100
Date: Tue, 10 Dec 2024 14:38:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 6/9] net: mdio: Add Airoha AN8855 Switch
 MDIO Passtrough
Message-ID: <0523b9a2-0d77-4bb8-ac1e-f28b96eb36b2@lunn.ch>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-7-ansuelsmth@gmail.com>
 <5aec4a94-3cea-41a4-8500-71472fae51d4@lunn.ch>
 <67582eca.050a0220.3b9b85.2de4@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67582eca.050a0220.3b9b85.2de4@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_053837_616861_C02635A0 
X-CRM114-Status: GOOD (  29.20  )
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

On Tue, Dec 10, 2024 at 01:06:29PM +0100, Christian Marangi wrote:
> On Tue, Dec 10, 2024 at 02:53:34AM +0100, Andrew Lunn wrote:
> > > +static int an855_phy_restore_page(struct an8855_mfd_priv *priv,
> > > +				  int phy) __must_hold(&priv->bus->mdio_lock)
> > > +{
> > > +	/* Check PHY page only for addr shared with switch */
> > > +	if (phy != priv->switch_addr)
> > > +		return 0;
> > > +
> > > +	/* Don't restore page if it's not set to switch page */
> > > +	if (priv->current_page != FIELD_GET(AN8855_PHY_PAGE,
> > > +					    AN8855_PHY_PAGE_EXTENDED_4))
> > > +		return 0;
> > > +
> > > +	/* Restore page to 0, PHY might change page right after but that
> > > +	 * will be ignored as it won't be a switch page.
> > > +	 */
> > > +	return an8855_mii_set_page(priv, phy, AN8855_PHY_PAGE_STANDARD);
> > > +}
> > 
> > I don't really understand what is going on here. Maybe the commit
> > message needs expanding, or the function names changing.
> > 
> > Generally, i would expect a save/restore action. Save the current
> > page, swap to the PHY page, do the PHY access, and then restore to the
> > saved page.
> >
> 
> Idea is to save on extra read/write on subsequent write on the same
> page.
> 
> Idea here is that PHY will receive most of the read (for status
> poll) hence in 90% of the time page will be 0.
> 
> And switch will receive read/write only on setup or fdb/vlan access on
> configuration so it will receive subsequent write on the same page.
> (page 4)
> 
> PHY might also need to write on page 1 on setup but never on page 4 as
> that is reserved for switch.
> 
> Making the read/swap/write/restore adds 2 additional operation that can
> really be skipped 90% of the time.
> 
> Also curret_page cache is indirectly protected by the mdio lock.
> 
> So in short this function makes sure PHY for port 0 is configured on the
> right page based on the prev page set.
> 
> An alternative way might be assume PHY is always on page 0 and any
> switch operation save and restore the page.
> 
> Hope it's clear now why this is needed. Is this ok or you prefer the
> alternative way? 

Please think about naming. I'm not sure _restore_ is the correct name
for the function. Maybe select. And i suggest adding some comments to
explain what is going on, since it is not obvious from the code in
this file, you probably need to cross reference it with code in the
DSA driver as well.

	Andrew

