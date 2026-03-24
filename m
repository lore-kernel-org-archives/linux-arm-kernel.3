Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5930FE9A741
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2Hz1yOxyvLk9PND+a+O7YztgoEg7q/BSh75O/7XkQk=; b=07ncJPf3gi5ZoDxJFGp3irTXCb
	oUB02SLLvDlaGP9bNQiNkL2gAV/nx20cZrqEbQD8MnZh4e7ga5Kk8y/NzyeM8ZXV7LOYpDum6yB5a
	zC39/yFt4seLCMnldEoGziMlBnmfnXBm42xM+OI3jPoap317g9RKEONwCUdMlavDqDdH936G3INic
	m1Jz8HgLLa5QtEIl3U0xtNjR2nJcPh0vrIVkZc38ZzvRKAgqvWDiVPVc8LJ9bMBXjHD8hQd6bakQW
	C0/j1rR+Q459c8DZrjN7XiEPYLUVMvcS6o+7W+JG3mvvqi2v8/MBaaxoMB4HNI8GsZKKTkphiyFtm
	rK+DBsQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xqm-000000013sU-0dG7;
	Tue, 24 Mar 2026 09:15:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xqh-000000013rF-32Lm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k2Hz1yOxyvLk9PND+a+O7YztgoEg7q/BSh75O/7XkQk=; b=s5KFzkqEJpNEnLHyxY19i1HjRz
	oIU1ln9wgxsclooM8ffjWkVrEDW8zMltsHEJ4OQqNvuc1/psfQXl3c0g7VUSRqyV81+gIbw4l8fqf
	OzGVKboQYNViO1AJASXz+H1nSFrYkTN2hUe58om3GYUrZVOgJVXwzlQ1mwpF5atRIAi7K1Hl++fCK
	SH9LEd77cxIYw/sB52buLOmbdYsiHYYlYJEf1NHQPkcQAwRbkiveR28GQPsZCaoRR6ebnt1gT3HZ3
	s8HYK5pWwk6AH7pVLmYhg3L61yGtYaolS3x9bM6H5fPtJui7O2eUSbdOxOe+jYsRMjrt1ufMWrnus
	m8H3BunA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49582)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w4xqX-000000001cl-0bwB;
	Tue, 24 Mar 2026 09:14:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w4xqT-000000004wa-3z8U;
	Tue, 24 Mar 2026 09:14:41 +0000
Date: Tue, 24 Mar 2026 09:14:41 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 0/8] net: stmmac: improve PCS support
Message-ID: <acJWAZrvvSn3G_jQ@shell.armlinux.org.uk>
References: <abdYu864OmNWiWIW@shell.armlinux.org.uk>
 <ablpxwGks9m38fhM@shell.armlinux.org.uk>
 <absjNQ2s3Z5N2Zwo@oss.qualcomm.com>
 <abtE7sDT75I7uPnk@shell.armlinux.org.uk>
 <abvAuHFZzCFobO-V@shell.armlinux.org.uk>
 <7566c66b-2dda-4b29-b59e-4e4a7e159e21@oss.qualcomm.com>
 <abvy6nZyjyxUXMuf@shell.armlinux.org.uk>
 <bcab38a5-e7f7-47c9-ab9c-99294e095c22@oss.qualcomm.com>
 <abwSHGw39FTJGNb7@shell.armlinux.org.uk>
 <acGhQ0oui+dVRdLY@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acGhQ0oui+dVRdLY@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_021456_213788_E834C6CD 
X-CRM114-Status: GOOD (  62.60  )
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

On Tue, Mar 24, 2026 at 01:53:31AM +0530, Mohd Ayaan Anwar wrote:
> Hi,
> On Thu, Mar 19, 2026 at 03:11:24PM +0000, Russell King (Oracle) wrote:
> > On Thu, Mar 19, 2026 at 02:50:29PM +0100, Konrad Dybcio wrote:
> > > On 3/19/26 1:58 PM, Russell King (Oracle) wrote:
> > > > On Thu, Mar 19, 2026 at 11:09:33AM +0100, Konrad Dybcio wrote:
> > > >> On 3/19/26 10:24 AM, Russell King (Oracle) wrote:
> > > >>> On Thu, Mar 19, 2026 at 12:35:58AM +0000, Russell King (Oracle) wrote:
> > > >>>> On Thu, Mar 19, 2026 at 03:42:05AM +0530, Mohd Ayaan Anwar wrote:
> > > >>>>> [    8.650486] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
> > > >>>>
> > > >>>> Please look into this first - with the MDIO bus operating at
> > > >>>> who-knows-what frequency, this could make reading from the PHY
> > > >>>> unreliable.
> > > >>>
> > > >>> My guess is clk_get_rate(priv->plat->stmmac_clk) is returning zero,
> > > >>> which means we don't know the rate of the CSR clock.
> > > >>>
> > > >>> From what I can see in drivers/clk/qcom/gcc-qcs404.c and
> > > >>> drivers/clk/qcom/gcc-sdx55.c, this looks like this case - the
> > > >>> struct clk_branch makes no mention of any clock rate, nor does it
> > > >>> have any parent. From what I can see, neither of these drivers
> > > >>> specify any rates for any of their clocks, which likely means that
> > > >>> clk_get_rate() will be zero for all of them.
> > > >>>
> > > >>> Sadly, when I designed the clk API, I didn't think that people would
> > > >>> be stupid enough not to implement the API properly, more fool me.
> > > >>>
> > > >>> Under the old code, we would've used STMMAC_CSR_20_35M, which means
> > > >>> we're assuming that the CSR clock is between 20 and 35MHz, even
> > > >>> though the value is zero. Is that the case? If it's higher than
> > > >>> 35MHz, then you've been operating the MDIO bus out of IEEE 802.3
> > > >>> specification, which can make PHY access unrealible.
> > > >>>
> > > >>> In any case, please fix your clock drivers.
> > > >>
> > > >> I'm not 100% sure the currently-passed AXI clock is what we want
> > > >> there and the docs aren't super helpful.. is there a synopsys-name
> > > >> for it? What rates would you expect it to run at?
> > > > 
> > > > There is no easy answer to that - it depends on the bus interfaces
> > > > and whether the CSR (register) clock is separate.
> > > > 
> > > > The likely possible names are hclk_i (for AHB master), aclk_i (for
> > > > AXI master), or clk_csr_i.
> > > > 
> > > > It does state that the CSR clock should have a minimum frequency of
> > > > 25MHz to allow all statistics to be properly collected.
> > > > 
> > > > The rate of the CSR clock needs to be known, as selecting the divider
> > > > for generating MDC within IEEE 802.3 specifications is rather
> > > > fundamental. You may find something there which hints at what rate
> > > > the dwmac's CSR clock runs at.
> > > 
> > > If it's either AXI or AHB, in both cases their direct parent is controlled
> > > by an entity external to Linux and their rates may change at runtime,
> > > based on aggregated needs of the bus. They're defined as levels/corners
> > > (abstract term for a hidden volt+freq combo).
> > > 
> > > It may be that the operating range for the EMAC removes that variability,
> > > but with no concrete evidence and just anecdotal experience, that's only
> > > the case for the AHB clock
> > 
> > The important thing is that the MDC doesn't exceed the max clock
> > frequency for the PHY and any other device connected to the MDIO
> > bus. IEEE 802.3 specifies a max frequency of 2.5MHz (minimum period
> > for MDC shall be 400 ns). Some PHYs can operate in excess of this,
> > but one would need to confirm that all devices on the MDIO bus
> > supports higher frequencies before using them. In the kernel, we
> > generally err on the side of caution and stick to IEEE 802.3.
> > 
> > There are two ways to achieve the divider value with stmmac.
> > 
> > 1. if priv->plat->csr_clk is set to a value other than -1, this
> >    configures the hardware divisor (for "normal" cores, it takes
> >    STMMAC_CSR_* constants that can be found in include/linux/stmmac.h)
> > 
> > 2. otherwise, the rate of priv->plat->stmmac_clk is used as the CSR
> >    clock value, which is the reference clock for the divider that
> >    generates the MDC clock, and an appropriate divider is selected.
> >    Given the available dividers, it works out at between 1.25MHz for
> >    a CSR clock of just over 20MHz and 2.47MHz for 800MHz. (I have a
> >    patch which documents the ranges for each of the STMMAC_CSR_xxx
> >    values.)
> > 
> > Note that the dividier constants are not the actual divider itself,
> > as can be seen in include/linux/stmmac.h
> > 
> 
> As noted by Konrad, the AXI and AHB clock rates are indeed unknown to
> the Linux kernel:
> [    7.739389] [DBG] priv->plat->stmmac_clk rate = 0
> [    7.739391] [DBG] priv->plat->pclk rate = 0
> 
> Additionally, here's what I found (focusing on QCS9100 Ride R3, but
> most of this should be applicable to all qcom-ethqos consumers):
> 
> 1. clk_csr_i is connected to the SLV_AHB clock, named "pclk" in the
>    devicetree. This is the source for the MDC. The "stmmaceth" clock,
>    provided by AXI, is used for data transfers. It appears that the
>    devicetree gets it in reverse as per the stmmac clock
>    documentation added by Russell, i.e., the right order would be:

The documentation wasn't generated with some special knowledge, but by
comparing the stmmac code with the databook and trying to work out what
is going on. I would suggest not changing the DT description at the
moment.

It seems to me that the original intention was for "stmmac_clk" to be
the "application clock", but then the Imagination Technologies
Pistachio board came along, and "pclk" was added for possibly the slave
interface - and thus pclk would really be more what CSR clock would be.

However, the code that derives the CSR clock divider wasn't changed,
and continued to use stmmac_clk.

So now we're stuck with an utter mess, and there is no way now to work
out exactly what was the case - I can find no documentation for this
Pistachio board let alone the SoC. Hence:

    There is confusion around stmmac_clk and pclk which can't be easily
    resolved today as the Imagination Technologies Pistachio board that
    pclk was introduced for has no public documentation and is likely now
    obsolete. So the origins of pclk are lost to the winds of time.

I haven't put much thought into whether this can be solved in some way.
One passing throught is to basically deprecate the existing clock names
and replace them with "application" and "csr-clock" which are the terms
used in the databook.

However, there's a couple of tables in the "Host (System Interface)
Clock" section in the databook which gives the clocking for the various
different configurations - the application clock is fairly easy to
understand, but the CSR clock is quite complex as it depends on the
master and slave interface configurations, as well as whether the
designer selected the "use different clock for CSR" option.

> 2. However, even with the correct naming, clk_get_rate() would return
>    0 for both clocks since they are firmware-managed.
> 
> 3. For GCC_EMAC0_SLV_AHB_CLK, the hardware documentation mentions the
>    range of 50 - 100 MHz. I am trying to check if there's any chance
>    of it turboing to a higher rate. For now, I think we can assume
>    this to be the working range.
> 
> In view of this, would setting priv->plat->clk_csr to
> STMMAC_CSR_60_100M from the glue layer be correct?

For the patch which I haven't submitted yet where I worked out the
resulting ranges gives the following for this entry:

        { CSR_F_60M,  STMMAC_CSR_60_100M },     // /42  1.43 - 2.38

So, the divider is 42, which gives a range up to 2.38MHz with the
100MHz input. At 50MHz, the MDIO clock will be 1.19MHz which is a
little slow but 802.3 doesn't give a minimum rate. It will just
take longer to access the PHY.

The important thing is that the MDIO clock isn't too fast, as that
will result in corrupted transfers. That said, some PHYs support
faster MDIO clocks than 802.3 specifies, but in general it is a
good idea that MACs stick to the 802.3 spec especially when they
don't know what PHY (or indeed other MDIO devices) will be
connected.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

