Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332D4C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 02:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWj+O9wP6CX5GzhqEIWSE6hUZrqSuPWLLbAKWjlUHOo=; b=HzoKA6cisaKfJH0+0J6IA4XZu2
	vG8rcmcb6W3Lcz95zmJgxK4bId0YGHui013/lkhO2xzcKxnOBVg47aDgG48uBNW7bmrBDHrKQOSiT
	B6QA0HyJNfPMPGA2Qr1pj7xjQoIWLqzYLvNQ2Babq/0BvHB5PE64v/dpLSa3MEVCq/YiKm/Qlqame
	eXJ7mPvthWJoPP5Uji79te6MJ9MZElgDC9KbOCM3Zzn0uBQqOpQpTVXNxRnRMWYlVp1UsjoMT8dgL
	A/OqsN1iHk+mSE+Wwcs711Kqut2ooim2scu8TtGT9oUUchEtJkiEfWc8OiDcPRWyaaN5eZddUQTrY
	lcpm8fOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz34t-00000001mVt-1xZo;
	Wed, 26 Aug 2026 02:09:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz34r-00000001mVT-0mzd;
	Wed, 26 Aug 2026 02:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aWj+O9wP6CX5GzhqEIWSE6hUZrqSuPWLLbAKWjlUHOo=; b=3OTRBGloEhp96UaMmW1aExChQl
	Msq9ofdkoTmqTXTdvGBdXv3ZlFxCxnpYbH7Cd0D4aPxcXXjTE5azaT/PWmg+Sul89cZJvHDmr7/5N
	fGEegSDdoNimpRt0e8XdsKrxYxc5IjJwbe1obB2MQnOoWZfVAR+1m5MFGMXjUVvHrC20=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wz34S-001SQz-Vl; Wed, 26 Aug 2026 04:08:56 +0200
Date: Wed, 26 Aug 2026 04:08:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, daniel@makrotopia.org,
	naseefkm@gmail.com, joey@tinyisr.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: phy: mediatek: add driver for EcoNet Fast
 Ethernet SoC PHYs
Message-ID: <e37d97cf-f4aa-499e-b372-21701f2e3782@lunn.ch>
References: <20260825180421.1804729-1-cjd@cjdns.fr>
 <177dc347-4cf9-48ca-97fe-b0f3cd46d8e3@lunn.ch>
 <4fa1ab31-cdcb-4488-b038-c5869966b6ec@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fa1ab31-cdcb-4488-b038-c5869966b6ec@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_190921_255325_79125E19 
X-CRM114-Status: GOOD (  38.19  )
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

On Wed, Aug 26, 2026 at 02:08:50AM +0200, Caleb James DeLisle wrote:
> 
> On 25/08/2026 21:40, Andrew Lunn wrote:
> > > Also provide support for the older EN7512 Fast Ethernet SoC PHYs found
> > > in EN751221 chips with do not have the MCM switch. That is chips which
> > > do not have a "G" in the name. As these PHYs bear the ID 03a2.9412
> > > which collides with MTK_GPHY_ID_MT7530 gigabit PHY, do not match them
> > > and instead rely on the user to override the PHY ID in the device tree
> > > if they wish to use this driver.
> > Is there a way to tell them apart using other registers?
> 
> 
> The reference code differentiates this PHY from the other because this one
> does not advertise gigabit capability. I sent it like this because the idea
> of a matcher made me nervous and this felt more conservative, but I'm open
> to guidance about what is the most appropriate solution.

If it is as simple as that, i suggest you detect it at runtime.

In the driver structure, you provide a match_phy_device()
function. This get called independent of what ID value you have in the
structure. So you first need to check if the ID matches. Then check
the 1G capability.

Ideally you want the code in the same driver, because module loading
happens based on the ID. I'm not sure user space will load two drivers
if they both indicate the same ID. Something you can experiment with.

> > > +	for (;;) {
> > It is unusual to do loops like this. Can it be turned into a do while
> > loop? And without looking deep into it, it is not clear if this is
> > endless if the hardware stops responding.
> 
> 
> You raise a good point in that it's hard to reason out the default exit
> scenario, and I will figure out how to improve that. I'm not sure I can
> actually get rid of the infinite loop without making the code worse, because
> the default exit condition needs to assign ret and goto the error out label.

Consider adding comments as well. Also consider replacing the infinite
loop with a bounded loop, and return -EIO if the it goes around the
loop too many times. What you are trying to avoid is on hardware error
a CPU constantly spinning until power off.

> > > +static int en751221_fephy_config_init(struct phy_device *phydev)
> > > +{
> > > +	struct econet_socphy_shared *shared = phy_package_get_priv(phydev);
> > > +	u16 l0r26_temp;
> > > +	int ret;
> > > +	int i;
> > > +
> > > +	if (!shared->phydev_p0) {
> > > +		phydev_err(phydev, "Port zero must be configured\n");
> > > +		return -EOPNOTSUPP;
> > > +	}
> > What is the issue here? Why must port 0 be first?
> It doesn't need to be configured first but it must be probed because these
> PHYs are not independent, they exist as a group and some configuration must
> be done on the first phy in the group. I will re-send with clarification in
> a comment.

Consider using phy_package_init_once() to configure the shared things
by the first PHY to probe, independent of what address it is.

	Andrew

