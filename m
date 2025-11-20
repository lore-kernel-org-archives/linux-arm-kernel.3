Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A83FCF64AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 09:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7sswFl5l2p4ZT3evZ9i3gc9xarSldWVyH7umhKc38wc=; b=qf/vPcvCDsB3OWJWjCCWO4lym8
	5qzrSegCqhWInKO7jBodx1zsaAnkq4x56EeHXGAa5N5/fLZbRFgey6nEoJenFswJRRgYt/a3dqlcI
	UojcibC8T7zu3Xah7MFG8Jf62kapwEAeKeTuLbCHye51iyX25dnCE174grWN0F/EkT2woeKfjaHpz
	AZwjsYgouzEqsv+R5RHwN7Jy821oOaTJAm/U0Ku82O8dW/NYWUSsl/FRkDniJd4/Lv77oDv8GV4mM
	SGpyjEs5rSnZFfBRgHdPPPimXqLEMmpA8ID9Kx/S/itF4PKELXmgNnvGD5jixv+9Vfwd1cBECJdzR
	jtadbhig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1FK-00000006S34-1IVk;
	Thu, 20 Nov 2025 09:46:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1FF-00000006S2Q-0bUX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 09:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7sswFl5l2p4ZT3evZ9i3gc9xarSldWVyH7umhKc38wc=; b=Lz0IPuPfFUD4WovXjBHEyMPMOQ
	xm6rjezioffBkDb++RJz8WeiwEl4r86o7ZJDjO0RsJDeFRVkrXzri7xJ9lKkUCdpglWTCx85P7TfU
	Q2zDgXQGw2xx0FkGNUJgViUOODSqxJfjnD0KkTrhmy8USf5IpRQrdFNlNSicvLZdTbymvxUL7ixrK
	Hr447VPZFNiuvO0kNJDe/tE2t0DhwpM9UQBzugIkItt6e+n54Q77ADyiTrTMBKHMNL2q3KPQcWcCh
	rZvn1HKkP4b+aHw0kiIsDOeaKskXW5zd1d3ETJ9GGWXyXnSy6wPuvwldhpJ+N3XDXxBb0bvQ2hnCg
	HxyCh/Hw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50818)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vM1F5-0000000062y-2Z0H;
	Thu, 20 Nov 2025 09:46:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vM1F1-000000004Hk-3fFC;
	Thu, 20 Nov 2025 09:46:15 +0000
Date: Thu, 20 Nov 2025 09:46:15 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 2/3] net: stmmac: qcom-ethqos: add rgmii
 set/clear functions
Message-ID: <aR7jZ4KkKE9nTsMh@shell.armlinux.org.uk>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
 <E1vLgSU-0000000FMrL-0EZT@rmk-PC.armlinux.org.uk>
 <b720570b-6576-41d7-a803-3d5524b685e4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b720570b-6576-41d7-a803-3d5524b685e4@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_014629_187527_A78D5077 
X-CRM114-Status: GOOD (  22.09  )
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

On Thu, Nov 20, 2025 at 10:42:04AM +0100, Konrad Dybcio wrote:
> On 11/19/25 12:34 PM, Russell King (Oracle) wrote:
> > The driver has a lot of bit manipulation of the RGMII registers. Add
> > a pair of helpers to set bits and clear bits, converting the various
> > calls to rgmii_updatel() as appropriate.
> > 
> > Most of the change was done via this sed script:
> > 
> > /rgmii_updatel/ {
> > 	N
> > 	/,$/N
> > 	/mask, / ! {
> > 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)\2,\s+|rgmii_setmask(\1|
> > 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)0,\s+|rgmii_clrmask(\1|
> > 		s|^\s+$||
> > 	}
> > }
> > 
> > and then formatting tweaked where necessary.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 187 +++++++++---------
> >  1 file changed, 89 insertions(+), 98 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index ae3cf163005b..cdaf02471d3a 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -137,6 +137,18 @@ static void rgmii_updatel(struct qcom_ethqos *ethqos, u32 mask, u32 val,
> >  	rgmii_writel(ethqos, temp, offset);
> >  }
> >  
> > +static void rgmii_setmask(struct qcom_ethqos *ethqos, u32 mask,
> > +			  unsigned int offset)
> > +{
> > +	rgmii_updatel(ethqos, mask, mask, offset);
> > +}
> 
> It's almost unbelieveable there's no set/clr/rmw generics for
> readl and friends

Consider what that would mean - such operations can not be atomic, but
users would likely not realise, which means we get a load of new
potential bugs. Not having these means that driver authors get to
code this up, and because they realise they have to do separate read
and write operations, it's more obvious that there may be races.

The phy_* accessors are different - these take the bus lock while they
operate, and thus are atomic.

> 
> [...]
> >  	/* Set DLL_EN */
> > -	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_DLL_EN,
> > -		      SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
> > +	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN,  SDCC_HC_REG_DLL_CONFIG);
> 
> double space
> 
> [...]
> 
> >  	/* Select RGMII, write 0 to interface select */
> > -	rgmii_updatel(ethqos, RGMII_CONFIG_INTF_SEL,
> > -		      0, RGMII_IO_MACRO_CONFIG);
> > +	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL,  RGMII_IO_MACRO_CONFIG);
> 
> and here
> 
> Everything else looks in tact

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

