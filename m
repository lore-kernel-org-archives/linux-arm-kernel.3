Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4882ED778B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 21:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UId/Vzt9Vm2GMBalR/x7lGAofZBiET9NUSj2/ZXMbKw=; b=YptUxzayS0H05PEdIdtBKBoxxr
	lbNCH0xz2wxZBRdaBuH1ilo/dUG0IE34ocRE3/rtLOIhK1bnAVHV7Qn3YK3Ez5p0yDpTG7zws80d0
	LFBCb6niHP3xsDEFwdwG3VspNMHvDnaHd4tulDJ7C4UYGw8wYqZHeokrFHh0EczfAQOXkWAhGxHfk
	t3HhelMydFSJEKjLMeYjDSCTYIpJtXCAeL7kNqDJ+HypjA9Tayz40ye2jUnjnWloNR+7qZlZ2uzdc
	zuZQxAR+qANdkd68JhSIEiNShJpW249MDi+h2MRt9FZRNf1TlBZkANLsUJpJ2UJcXcZIMw8RaDf1B
	f47IPAFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjOlh-00000009WHg-2Kzn;
	Fri, 23 Jan 2026 21:32:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjOle-00000009WHB-1nsd;
	Fri, 23 Jan 2026 21:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UId/Vzt9Vm2GMBalR/x7lGAofZBiET9NUSj2/ZXMbKw=; b=UUVNlVPj9g+71IhAhxMULD9ivp
	frh5NGpDhavuR+455fTIxq4AsTEpiUZgXVk0HasxdIi98K7k3RRP7N+iWhDyCxEh9lh11T4f9Ad/6
	PkHZeihli1kFmfs5qwHKvpHOI07TrNEtvK+ZiVmZWYLgSWU/ozx5M72kIR/jNtfHAXwDslutBShFe
	pDtmZQhMAitq6rtrK1c/pSRmDQKWohJzJiPduRvw6pp65OnOtiwP0qXgUQI70/XxvYTr+/9xdihQz
	SCxnjkqNlqsasxYT6+YN5G8i7Ydi2h2cdI7ifWwETuuMrq1coSffTwsc3dXpsHr9SK8DcpDFrtq8J
	hiXRr/4g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43970)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vjOlV-000000002YU-2dTD;
	Fri, 23 Jan 2026 21:32:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vjOlR-000000002QA-2jQL;
	Fri, 23 Jan 2026 21:32:21 +0000
Date: Fri, 23 Jan 2026 21:32:21 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS, BASE-X, and
 inband goodies
Message-ID: <aXPo5R1Q-qWG3r3l@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_133234_494386_52B47E04 
X-CRM114-Status: GOOD (  15.35  )
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

On Fri, Jan 23, 2026 at 07:05:00PM +0530, Mohd Ayaan Anwar wrote:
> 4. Switching from 1G to 2.5G - similar issues + a NULL pointer
> dereference. I am checking on the reason for it.

For the NULL pointer dereference, this is a bit weird, and may help to
point towards the issue.

> 	[ 1235.996004] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
> 	[ 1240.517716] qcom-ethqos 23040000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off/nolpi
> 	[ 1240.529470] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
> 	[ 1240.537642] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=00 phy=00
> 	[ 1240.546702] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
> 	[ 1240.555441] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010

> 	[ 1240.880168] Code: d63f0020 f9400e60 b4000040 f900081f (f9000ad3)

This code line disassembles to:

   0:   d63f0020        blr     x1
   4:   f9400e60        ldr     x0, [x19, #24]
   8:   b4000040        cbz     x0, 10 <.text+0x10>
   c:   f900081f        str     xzr, [x0, #16]
  10:   f9000ad3        str     x19, [x22, #16]

which, after comparing with my disassembly, the blr x1 is the call to
pcs_disable() inside phylink_pcs_disable() in this code:

        if (pcs_changed) {
                phylink_pcs_disable(pl->pcs);

                if (pl->pcs)
                        pl->pcs->phylink = NULL;

                pcs->phylink = pl;

and the failing store is the one for that last line of C code - in
other words, pcs = NULL.

This means that mac_select_pcs() returned NULL when being asked
"which PCS should be used for 2500base-X" ?

This suggests that the SerDes detection of support for 2500BASE-X
isn't working, meaning that stmmac_mac_select_pcs() ends up returning
NULL, rather than &priv->integrated_pcs->pcs.

That would only happen if:

                /* Only allow 2500Base-X if the SerDes has support. */
                ret = dwmac_serdes_validate(priv, PHY_INTERFACE_MODE_2500BASEX);
                if (ret == 0)
                        __set_bit(PHY_INTERFACE_MODE_2500BASEX,
                                  spcs->pcs.supported_interfaces);

fails, meaning we don't set that interface mode for the PCS.
dwmac_serdes_validate() calls phy_validate() for PHY_MODE_ETHERNET
with the PHY interface mode as the sub mode.

Patch 3 adds the required methods to phy-qcom-sgmii-eth.c to allow
phy_validate() to indicate whether this is supported or not:

        .validate       = qcom_dwmac_sgmii_phy_validate,

and its implementation is:

        int ret = qcom_dwmac_sgmii_phy_speed(mode, submode);

        return ret < 0 ? ret : 0;

where qcom_dwmac_sgmii_phy_speed() is:

        if (mode != PHY_MODE_ETHERNET)
                return -EINVAL;

        if (submode == PHY_INTERFACE_MODE_SGMII ||
            submode == PHY_INTERFACE_MODE_1000BASEX)
                return SPEED_1000;

        if (submode == PHY_INTERFACE_MODE_2500BASEX)
                return SPEED_2500;

        return -EINVAL;

So, this should be returning a positive integer (SPEED_2500), which
should cause phy_validate(serdes, PHY_MODE_ETHERNET,
PHY_INTERFACE_MODE_2500BASEX, NULL) to return success (zero). That
should result in PHY_INTERFACE_MODE_2500BASEX being set in
spcs->pcs.supported_interfaces, and thus &priv->integrated_pcs->pcs
being returned for PHY_INTERFACE_MODE_2500BASEX.

Is the particular hardware you're running this oopsing test on not
using a SerDes PHY? If that's the case, how does it switch between
2.5Gbps and 1Gbps data rate on the SerDes?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

