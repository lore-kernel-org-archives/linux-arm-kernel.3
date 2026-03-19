Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1841090237
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PKfHh7lpDmvXp/AacCSQ4DXliViadOMLA1Saz6vuQM=; b=HsXyGCrkqFSCBM7d/bp/i1a3tN
	NYNcqLKZTLmzs9j8RpYd7VwsAvmB61Np9OX/dKoSjwtaVZXXYqIRudcsqRThr9tFh50emvqK8LBXf
	/cpvYJlKyOZvsHZsFgDY5SrTuYvmGCudQsCCvbIT8u0AGsufenT4uC9YDxyHMmeh7Ny10YXYRjA4C
	m2DO1N/EGTOa940fvnP50yD8ZFIBlRw7Y9ylJ5veT9hXyRDdzkTXNuI8MUTkHvOLOyyl4hW4ve5Ut
	VffXLZl5cBpJrwd2+yDAeWGMV3H8JBSONmGMsrdnRUPfemOsJSI+e0FPKOs73zAyX0KFMemUpEp3O
	TPJzXBBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3F2B-0000000AsL3-32eR;
	Thu, 19 Mar 2026 15:11:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3F29-0000000AsK2-0v1b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9PKfHh7lpDmvXp/AacCSQ4DXliViadOMLA1Saz6vuQM=; b=aMU5hgi1JmyBFGBjGXz8h6GZ97
	qYwyqthq0k4Ie4XVz0Hlae3+6315exn9CIHZElJ2p8VCpxl2xKmcH+w4AnFTPGKg3iTz87AwMcRSj
	FGG3vbB6iCtpNc550JNthzmkcgwcjQFf00NEatZGff38mF4Xh/0pRCuIVpL/BPAYvRgRQkl1JBumc
	hwNUdMIq7KTa8qejhtlF2HzWMqXc7yfq8XjQxCKEozzTiwCWPPeOYUe4b+csipMMjRAy1MM5DsY1d
	aoL3AROYLqPzi5JhFgMHtmSIKoiNWoIer31sAiKsvXIR6kgJaEVxIxDIwYF13JTHfmuGasC2KYHJC
	r/4lZR/A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59324)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w3F20-000000004tn-0xA2;
	Thu, 19 Mar 2026 15:11:28 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w3F1w-000000008E5-2ekr;
	Thu, 19 Mar 2026 15:11:24 +0000
Date: Thu, 19 Mar 2026 15:11:24 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
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
Message-ID: <abwSHGw39FTJGNb7@shell.armlinux.org.uk>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com>
 <abdYu864OmNWiWIW@shell.armlinux.org.uk>
 <ablpxwGks9m38fhM@shell.armlinux.org.uk>
 <absjNQ2s3Z5N2Zwo@oss.qualcomm.com>
 <abtE7sDT75I7uPnk@shell.armlinux.org.uk>
 <abvAuHFZzCFobO-V@shell.armlinux.org.uk>
 <7566c66b-2dda-4b29-b59e-4e4a7e159e21@oss.qualcomm.com>
 <abvy6nZyjyxUXMuf@shell.armlinux.org.uk>
 <bcab38a5-e7f7-47c9-ab9c-99294e095c22@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcab38a5-e7f7-47c9-ab9c-99294e095c22@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_081137_270086_A07F2520 
X-CRM114-Status: GOOD (  38.08  )
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

On Thu, Mar 19, 2026 at 02:50:29PM +0100, Konrad Dybcio wrote:
> On 3/19/26 1:58 PM, Russell King (Oracle) wrote:
> > On Thu, Mar 19, 2026 at 11:09:33AM +0100, Konrad Dybcio wrote:
> >> On 3/19/26 10:24 AM, Russell King (Oracle) wrote:
> >>> On Thu, Mar 19, 2026 at 12:35:58AM +0000, Russell King (Oracle) wrote:
> >>>> On Thu, Mar 19, 2026 at 03:42:05AM +0530, Mohd Ayaan Anwar wrote:
> >>>>> [    8.650486] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
> >>>>
> >>>> Please look into this first - with the MDIO bus operating at
> >>>> who-knows-what frequency, this could make reading from the PHY
> >>>> unreliable.
> >>>
> >>> My guess is clk_get_rate(priv->plat->stmmac_clk) is returning zero,
> >>> which means we don't know the rate of the CSR clock.
> >>>
> >>> From what I can see in drivers/clk/qcom/gcc-qcs404.c and
> >>> drivers/clk/qcom/gcc-sdx55.c, this looks like this case - the
> >>> struct clk_branch makes no mention of any clock rate, nor does it
> >>> have any parent. From what I can see, neither of these drivers
> >>> specify any rates for any of their clocks, which likely means that
> >>> clk_get_rate() will be zero for all of them.
> >>>
> >>> Sadly, when I designed the clk API, I didn't think that people would
> >>> be stupid enough not to implement the API properly, more fool me.
> >>>
> >>> Under the old code, we would've used STMMAC_CSR_20_35M, which means
> >>> we're assuming that the CSR clock is between 20 and 35MHz, even
> >>> though the value is zero. Is that the case? If it's higher than
> >>> 35MHz, then you've been operating the MDIO bus out of IEEE 802.3
> >>> specification, which can make PHY access unrealible.
> >>>
> >>> In any case, please fix your clock drivers.
> >>
> >> I'm not 100% sure the currently-passed AXI clock is what we want
> >> there and the docs aren't super helpful.. is there a synopsys-name
> >> for it? What rates would you expect it to run at?
> > 
> > There is no easy answer to that - it depends on the bus interfaces
> > and whether the CSR (register) clock is separate.
> > 
> > The likely possible names are hclk_i (for AHB master), aclk_i (for
> > AXI master), or clk_csr_i.
> > 
> > It does state that the CSR clock should have a minimum frequency of
> > 25MHz to allow all statistics to be properly collected.
> > 
> > The rate of the CSR clock needs to be known, as selecting the divider
> > for generating MDC within IEEE 802.3 specifications is rather
> > fundamental. You may find something there which hints at what rate
> > the dwmac's CSR clock runs at.
> 
> If it's either AXI or AHB, in both cases their direct parent is controlled
> by an entity external to Linux and their rates may change at runtime,
> based on aggregated needs of the bus. They're defined as levels/corners
> (abstract term for a hidden volt+freq combo).
> 
> It may be that the operating range for the EMAC removes that variability,
> but with no concrete evidence and just anecdotal experience, that's only
> the case for the AHB clock

The important thing is that the MDC doesn't exceed the max clock
frequency for the PHY and any other device connected to the MDIO
bus. IEEE 802.3 specifies a max frequency of 2.5MHz (minimum period
for MDC shall be 400 ns). Some PHYs can operate in excess of this,
but one would need to confirm that all devices on the MDIO bus
supports higher frequencies before using them. In the kernel, we
generally err on the side of caution and stick to IEEE 802.3.

There are two ways to achieve the divider value with stmmac.

1. if priv->plat->csr_clk is set to a value other than -1, this
   configures the hardware divisor (for "normal" cores, it takes
   STMMAC_CSR_* constants that can be found in include/linux/stmmac.h)

2. otherwise, the rate of priv->plat->stmmac_clk is used as the CSR
   clock value, which is the reference clock for the divider that
   generates the MDC clock, and an appropriate divider is selected.
   Given the available dividers, it works out at between 1.25MHz for
   a CSR clock of just over 20MHz and 2.47MHz for 800MHz. (I have a
   patch which documents the ranges for each of the STMMAC_CSR_xxx
   values.)

Note that the dividier constants are not the actual divider itself,
as can be seen in include/linux/stmmac.h

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

