Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71520FCC076
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 21:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddvZqQUFySIge6sJv5iAA04y8EBt1MEUfEfFLzy/f/A=; b=ZHdbZ+ZaZMLM56iTMb0L+jEPDs
	8xxRnWc8dfofdBVkTNZRLtyY3czwxZRa9tOVrJ239qVknN8v2eoeXxE8S8KeKRjop09wyqgc6HUv5
	DgWyEeU5/pcdJkrYkrziRVvPXJH45y3dIFNeRtqF4aYdGvjVSoe2lofeMsp0Hk5B+G/BBZXpw4yd6
	ik9CN77RSbeJ0WwZtYvEAkne0FcFRZz7cf1py/45wtcp8LkU5AhsvRbH6eatXpSaxIeqp1z7l2TMl
	zX54khtfHQK7oRqMxLvpm7xTNf8HRxGTB+Hx6a0ykRdr2tKUBJSU2xuDAuxphwjRfEzQP3uUmS+Ha
	ZQBt87Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyd1p-00000004Y8Z-2NhQ;
	Fri, 06 Mar 2026 21:48:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyd1m-00000004Y8B-3c5O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 21:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ddvZqQUFySIge6sJv5iAA04y8EBt1MEUfEfFLzy/f/A=; b=OsEZbJgdwKor4BpsKgEBLvh6Qh
	oEWSsMJ7pRpJBZmx8r05OzzaqEImRSo2uCsqNeOdsJVxI76RAA5mJ9f4TmSOzRQSQtVG3rAMFNMFO
	Yq2tfLG/mLXy1HG7D7i1FaG9htuCiSsNG3Ow61YfpA7SvOpP78ILzQHWdgXpSuMLij3D8adwAQX8s
	gPVtqFRdo01hOh7kKPVCSUIcSVPVnF9GEaydXiAF4zQ/SzhMzPX5v5U+Im6yKqbFtlGMmCxT5Grvh
	Ve5SnB4YYd+rCb3guzM2LzNXwPe6Dhvpcvs8r5Repa15QMe+wC7GcPk0ml0Xm4UYGBFMnpGqGjFER
	Y46i+AQA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52808)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vyd1d-000000001aV-1ocF;
	Fri, 06 Mar 2026 21:48:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vyd1Z-000000001kc-2mAV;
	Fri, 06 Mar 2026 21:47:57 +0000
Date: Fri, 6 Mar 2026 21:47:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next v2 0/7] net: stmmac: improve PCS support
Message-ID: <aatLjarGu_qdRkP2@shell.armlinux.org.uk>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
 <aandp3FYSJbwoZxo@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aandp3FYSJbwoZxo@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_134811_080394_CFEC4DAE 
X-CRM114-Status: GOOD (  38.84  )
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

On Fri, Mar 06, 2026 at 01:16:47AM +0530, Mohd Ayaan Anwar wrote:
> Hi Russell,
> On Wed, Mar 04, 2026 at 08:47:36AM +0000, Russell King (Oracle) wrote:
> > Resending this as the original RFC now conflicts with net-next.
> > 
> > This series is the next of the three part series sorting out the PCS
> > support in stmmac, building on part 2, which was posted yesterday:
> > 
> > 	net: stmmac: qcom-ethqos: further serdes reorganisation
> > 
> > Similar patches have been posted previously. This series does away with
> > the common SerDes PHY support, instead using a flag to indicate whether
> > 2500Mbps mode is supported (STMMAC_FLAG_SERDES_SUPPORTS_2500M.) At this
> > time, I have no plans to resurect the common SerDes PHY support - the
> > generic PHY layer implementations are just too random to consider that,
> > and I certainly do not want the extra work of fixing that.
> > 
> > I've also changed the last patch which prints warnings when qcom-ethqos
> > changes the PCS state - this will now indicate in a readable form
> > whether the ANE or SGMRAL bits have changed state, rather than having
> > to refer back to the definitions in the code or the databook.
> > 
> > I am hoping that - subject to this working for qcom-ethqos - we can
> > drop this last patch in the final submission, along with the
> > dwmac_ctrl_ane() and ethqos_pcs_set_inband() functions and associated
> > definitions. This will also mean that stmmac will finally be driving
> > the PCS correctly from a phylink point of view.
> > 
> 
> Apologies for the delay in sharing test results. I had some board issues
> to work through.
> 
> I applied your previous RFC series on top of the two qcom-ethqos/serdes
> cleanup series and have the following results to report for the QCS9100
> Ride R3 board (AQR115C PHY):
> 
>   - Link up at 2.5G, 1G, and 100M is fine (phylink logs below). The PCS
>     link takes a moment to stabilize, but after that it's stable.

Has it always taken a moment to stabilise? Note that the ANE changes
will trigger a re-exchange of SGMII in-band, which is why you see
the PCS link go down and back up after the "ANE 0->1" message.

I do notice:

	qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter

which is a symptom that a clock is missing. There's been some recent
patches merged into net-next which changes this:

2cd70e3968f5 net: stmmac: Defer VLAN HW configuration when interface is down
bd7ad51253a7 net: stmmac: Fix VLAN HW state restore
e38200e361cb net: stmmac: Improve double VLAN handling
35dfedce442c net: stmmac: Fix error handling in VLAN add and delete paths

please indicate whether you have these applied.

>   - No data path issues at these speeds either.

Great.

>   - The warning ("PCS configuration changed from phylink by glue;
>     ANE 0 -> 1") is observed when the link comes up at 1G/100M.

That's currently expected, because phylink thinks we're using PHY
mode (where it's in charge of reading the PHY and telling the MAC
what's going on) rather than using inband. This is something that
will need to be addressed later.

>   - I did find one issue: the data path breaks when the link speed
>     changes from 2.5G to 1G or 100M. Notably, this is not consistently
>     reproducible, and the issue persists even after *dropping* this
>     series and the two qcom-ethqos/serdes cleanup series, so it appears
>     to be pre-existing. I am trying to debug this separately.

I think you added some debug between the logs that you've provided
below, which I'll take as not significant.

I think what's happening is the PHY's SGMII exchange times out, but
because you're enabling SGMII with AN at the PCS, the PCS is wanting
that to complete, and that never happens. I suspect if you unplug and
replug the cable after its switched into 1G mode, it may work. However,
I need to check whether AQR115C does this "AN bypass" thing.

That said, as we're using outband mode, phylink will call
phy_config_inband() with LINK_INBAND_DISABLE. This should disable
inband mode at the PHY, but from your logs I see evidence that it
hasn't. I think that may be because the AQR needs something more than
writing the VEND1_GLOBAL_CFG_* registers for that to take effect.

One of the hacks I have locally for an AQR113C on a SFP module which
uses 10GBASE-R with rate matching is the following in
aqr_gen4_config_init() to allow it to work with MACs that only support
up to 2.5G:

        phy_set_bits_mmd(phydev, MDIO_MMD_VEND1, MDIO_CTRL1, MDIO_CTRL1_LPOWER);
        mdelay(10);
        phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x31a, 2);
        phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_CFG_10M,
                      VEND1_GLOBAL_CFG_AUTONEG_ENA |
                      VEND1_GLOBAL_CFG_SERDES_MODE_SGMII);
        phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_CFG_100M,
                      VEND1_GLOBAL_CFG_AUTONEG_ENA |
                      VEND1_GLOBAL_CFG_SERDES_MODE_SGMII);
        phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_CFG_1G,
                      VEND1_GLOBAL_CFG_AUTONEG_ENA |
                      VEND1_GLOBAL_CFG_SERDES_MODE_SGMII);
        phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_CFG_2_5G,
                      VEND1_GLOBAL_CFG_AUTONEG_ENA |
                      VEND1_GLOBAL_CFG_SERDES_MODE_OCSGMII);
        phy_clear_bits_mmd(phydev, MDIO_MMD_VEND1, MDIO_CTRL1,
                           MDIO_CTRL1_LPOWER);

I have this immediately after "priv->wait_on_global_cfg = true;"

This reprograms the vendor provisioning so that we use 2500BASE-X
for 2.5G and SGMII for 1G and below with AN enabled. Note placing
the PHY into low-power mode while doing this - this causes firmware
to re-read when exiting low-power mode. I wonder if that's required
in aqr_gen2_config_inband() - but that will cause the link to go
down.

Note that VEND1_GLOBAL_CFG_AUTONEG_ENA enables inband signalling on
the link.

With the above, you should be able to test various scenarios with
the PHY - and changing your provisioned 10M configuration will likely
get 10M speeds working.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

