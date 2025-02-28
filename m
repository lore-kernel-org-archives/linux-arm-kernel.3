Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C54C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 00:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8YkUSgUJyyz9lrq7gtxuszWtm5nHi8ieFSmR1xycgY=; b=TYyk+gU9898zGWGvi19mmU8o7U
	XD0kxaMOl793pGHbMr497M7F9pl3cYE2xxG8ra436gsPLhcBMnnDglyycnbr7FtRcM3HbFklwEhTc
	F9bcm+CEo/dkH8w7zqp+sWQRSNf8+Jdi+8kMRxFG0MvWuP7XRi9RFagT3m6AlDrs7+pXA6NRyjkso
	Wp0ydKUrxRXoybplf5ze3BFDxnEpfTuleY9hxAHZRhhHhEvKZ98TjQc7m+hkPquYxGTVmVsgJINcH
	HFk68ELRlOFpCHqeDOrdxssIoEOQl7Dnw33Issk/cQNH8hnLThvXkCEYoSGZan2QHoFbyVakoRRl2
	AxN5jr+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnntk-00000009Efy-14rA;
	Fri, 28 Feb 2025 00:06:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnpg-00000009EC5-0EXz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 00:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C8YkUSgUJyyz9lrq7gtxuszWtm5nHi8ieFSmR1xycgY=; b=gBdZlsQs+VZBAHvrazy5uv0QAh
	FhAzeVBg9ePSZVo0xWfwq2yVJPqs3AaCsjAUXlNV1xUVXVD+1a7vqiK2XSalcs0QenaqxGz6zNgCk
	GDXplgBDHCJlwid/UuUelCUk4oV00kAnJ0AKC759Cw8GSSVc6bYXSIEHng2qT3SV9h7+NTqObWvTB
	BDiwfGm3JR3ocpOrGjRt73asEpNEAeoBb4SZCYxTF6o/ChYOy+Vuewwb1i1lyHAlIWhajv77yJR/O
	tjwT6rd/usaOVb7ovq/rmw2dU1Qemp2d5EUATjRQ0vIxLdrw0aCJBb3xIOGHkJ9b6/gXPOMQm6dq8
	KcIo5BLA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51146)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tnnpX-0000ME-0Y;
	Fri, 28 Feb 2025 00:02:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tnnpS-00008X-1H;
	Fri, 28 Feb 2025 00:02:10 +0000
Date: Fri, 28 Feb 2025 00:02:10 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 1/5] net: stmmac: call phylink_start() and
 phylink_stop() in XDP functions
Message-ID: <Z8D9AiZRPp_oyKi_@shell.armlinux.org.uk>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
 <E1tnfRe-0057S9-6W@rmk-PC.armlinux.org.uk>
 <92442281-9896-4271-a040-0c14331cb1d3@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92442281-9896-4271-a040-0c14331cb1d3@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_160224_094982_9F806FC1 
X-CRM114-Status: GOOD (  17.09  )
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

On Thu, Feb 27, 2025 at 11:27:57PM +0100, Andrew Lunn wrote:
> On Thu, Feb 27, 2025 at 03:05:02PM +0000, Russell King (Oracle) wrote:
> > Phylink does not permit drivers to mess with the netif carrier, as
> > this will de-synchronise phylink with the MAC driver. Moreover,
> > setting and clearing the TE and RE bits via stmmac_mac_set() in this
> > path is also wrong as the link may not be up.
> > 
> > Replace the netif_carrier_on(), netif_carrier_off() and
> > stmmac_mac_set() calls with the appropriate phylink_start() and
> > phylink_stop() calls, thereby allowing phylink to manage the netif
> > carrier and TE/RE bits through the .mac_link_up() and .mac_link_down()
> > methods.
> > 
> > Note that RE should only be set after the DMA is ready to avoid the
> > receive FIFO between the MAC and DMA blocks overflowing, so
> > phylink_start() needs to be placed after DMA has been started.
> 
> Sorry, i don't know enough about XDP to review this :-(

I suspect there aren't many people who could review it.

However, delving into the history, it seems that this commit was
responsible for introducing stmmac_xdp_{open,release}, thus
intrducing the fidding of the netif carrier which is prohibited
by phylink:

commit ac746c8520d9d056b6963ecca8ff1da9929d02f1
Author: Ong Boon Leong <boon.leong.ong@intel.com>
Date:   Thu Nov 11 22:39:49 2021 +0800

    net: stmmac: enhance XDP ZC driver level switching performance

but that commit was wrong for this very reason.

Didn't phylib used to not renegotiate the link if nothing changed
across a phy_stop()..phy_start() ?

I'm wondering whether my commit is in essence reverting this commit.


-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

