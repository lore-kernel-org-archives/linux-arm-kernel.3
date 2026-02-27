Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92C0FEFB5E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQYmtftgY0RX16tXlqwd88/gJleQAzTbD+On33MM1a8=; b=IOY1VAX7+mwTEqVXY9skSqCfby
	DSKEn010j6st2eDvALMBNx7qRA1ZCufn6nL5dj8+vcFTlOY5fCAHwamySKigwX1N7RFvtYFlFb4BM
	DQz3e9heTqFvLp/bbEU69b+ZOL8UnU7b0iFM0nrDgpSa1cZznh+GT7hL2FNfylevm117u8mxcG9tP
	O2/QLtmk/BFftxBACD2fweMev7r2i7dJz3jJGVStk8QGnwrJtP5elI1wH84O5LfvXCIWT+PwNwP9U
	Cf1FevFE7Yv9tk7L0nqr2SF4kVobXwa2lMY0r7J8Wu6khUJcAQcRUlOOcRmCM+LiKwScy8NcbpGnT
	oHB+5amg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzo9-00000008dRg-2S7B;
	Fri, 27 Feb 2026 15:31:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzo8-00000008dRU-1fSI;
	Fri, 27 Feb 2026 15:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
	bh=jQYmtftgY0RX16tXlqwd88/gJleQAzTbD+On33MM1a8=; b=G4N+d1sWuO/wq22KbhZZ3uhLXi
	G7ioPJz74PpZ3kd35/r/g5Yk5i64kvx3keWA+B4UFzN3RM/x8Aks/SoDQ7pVF9LRgzT7RZaSr6inH
	ZZWFwKqc9VjjJ8s1+bD7OaPH012xcR29V6QVOhgqTc2cEamyTdFGep/vab9+1ASSAGCA/URFx97w8
	qvW3c5HVopL0fDyXFT+LOp4vu5CN/xdXP2AEW9v1AS0SGItOUuJchgc5DE5kgT6aCPb65+ny660Rc
	oQzUIdteZG0arEX/eDPFBpkHuqWP4aajiNlj1cooGOHVLOENEOJdBih9FvW7RaVFMKXcdu4Gr7/PM
	zbkoM0EQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzo4-0000000DNNS-3ZmJ;
	Fri, 27 Feb 2026 15:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jQYmtftgY0RX16tXlqwd88/gJleQAzTbD+On33MM1a8=; b=oAWAh2ZiVjiMgVk8Slge/IOIaN
	A0iQ7hBunYzni7w8Ng0FoIrmJ8RE1VIdtUo/FVCZ2X1IfkDN4o6S1IHt4gZH4/V0V6uoOyInUr+pY
	u1Ewmr6fufghZoByBUwkrfeyFL0NP/FgUcfTtJfzTUYjRxatzEjr75ZBomUxHIxMwh1FK0yKC7ugj
	AU/gxAzceHRHqiHlaGJSD6u8YcoKG+f90jJ1XBABWgMtCVX0qKofWWS7b5489g2uas7cnJuogPSJM
	e09RC5oMf6AAhIwphJUFYAxFULfUqIQrc8lYFeGebgE0q9+aB/Wh0xxlwQQM3FBGza5npmdIitNtK
	5vQLIGtg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53922)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vvznw-0000000010A-2fKv;
	Fri, 27 Feb 2026 15:31:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vvzns-000000003B6-2IHF;
	Fri, 27 Feb 2026 15:30:56 +0000
Date: Fri, 27 Feb 2026 15:30:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 0/9] net: stmmac: qcom-ethqos: further serdes
 reorganisation
Message-ID: <aaG4sBQysN0Z94E3@shell.armlinux.org.uk>
References: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
 <aZ66uXCwGgH7B_A-@shell.armlinux.org.uk>
 <aaGgWUpM2A5y11Wh@vaman>
 <20260227152707.k5lobznug3xxxc7h@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260227152707.k5lobznug3xxxc7h@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_153109_164455_F675EDDE 
X-CRM114-Status: GOOD (  20.72  )
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

On Fri, Feb 27, 2026 at 05:27:07PM +0200, Vladimir Oltean wrote:
> Hi Vinod,
> 
> On Fri, Feb 27, 2026 at 07:17:05PM +0530, Vinod Koul wrote:
> > On 25-02-26, 09:02, Russell King (Oracle) wrote:
> > > Note: only 8 patches in this series, not 9 as the subject line says,
> > > as the set_clk_tx_rate() patch became part of the first series.
> > > 
> > > On Wed, Feb 25, 2026 at 09:00:41AM +0000, Russell King (Oracle) wrote:
> > > > This is part 2 of the qcom-ethqos series, part 1 has now been merged.
> > > > 
> > > > This part of the series focuses on the generic PHY driver, but these
> > > > changes have dependencies on the ethernet driver, hence why
> > > > it will need to go via net-next. Furthermore, subsequent changes
> > > > depend on these patches.
> > 
> > This lgtm, can we get signed tag so that we can pull this into phy tree
> > as well
> 
> I think this series is obsolete. It has been superseded in the netdev
> patchwork by:
> 
> [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further serdes reorganisation
> ├─>[PATCH RESEND2 net-next 1/8] net: stmmac: qcom-ethqos: move ethqos_set_serdes_speed()
> ├─>[PATCH RESEND2 net-next 2/8] phy: qcom-sgmii-eth: add .set_mode() and .validate() methods
> ├─>[PATCH RESEND2 net-next 3/8] net: stmmac: qcom-ethqos: convert to use phy_set_mode_ext()
> ├─>[PATCH RESEND2 net-next 4/8] phy: qcom-sgmii-eth: remove .set_speed() implementation
> ├─>[PATCH RESEND2 net-next 5/8] phy: qcom-sgmii-eth: use PHY interface mode for SerDes settings
> ├─>[PATCH RESEND2 net-next 6/8] phy: qcom-sgmii-eth: remove qcom_dwmac_sgmii_phy_interface()
> ├─>[PATCH RESEND2 net-next 7/8] phy: qcom-sgmii-eth: relax order of .power_on() vs .set_mode*()
> └─>[PATCH RESEND2 net-next 8/8] net: stmmac: qcom-ethqos: remove phy_set_mode_ext() after phy_power_on()
> 
> (with which it is only partially overlapping)
> 
> I guess you should give your Acks there as well.

No need. Looking at PW, it seems patch 7 has AI review issues, so will
need to be re-sent - although I can't fathom what the AI found in patch
7. I've already added Vinod's acks (since they were just resends to fix
botched sending, no actual changes in the patches themselves.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

