Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F24CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 10:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5H/X2O6VAth3+1IJiZ1jVADDRZOBh553gExnuinE6g=; b=BvDTFwbjbduBT/4zh6eAqsaYA3
	V00IlSANcaTSL69rn0xTgnGgFJwZkpfREV7tc8+Z7+8CtAMeTHN+ivY18ffp0mg09H2GOhBgnI/lT
	abAdNgToNkgsBXhejVTn7il7irUZiPwTBj8XORXYkTne7Qa1BFN60Jc5+1ddUEWBmN4sFdtYK/V1M
	iONe6DAAD3N6UBS/pxmyGKY9xXInCWHK6iIebEaS2oRrrQwihai/utzEOYlBENQLMCqj8ss/ohNIQ
	2UI654AQTRntsRf/kRkDueyZ2rXfCKv3vEBCp9QRkXRmijo3clsznEnhvpaXzpgQrzaqMw9WspAzA
	qtXKGQIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsxo-00000005zGg-2xxV;
	Thu, 23 Oct 2025 10:54:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsxl-00000005zFd-2sdr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 10:54:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=P5H/X2O6VAth3+1IJiZ1jVADDRZOBh553gExnuinE6g=; b=Pf30+2tgWHWff05MLYY0zw/0+w
	abhcaYZwkQ0qPJr4E85uSPGBRk37p6qmfNoCVIxrBYfZCf8tOmpPEQJbblRJoZOCPOLObmbV/wvPO
	uoVUr+lEphTXs9FQ9lp7Ty3ukn6EbY+cuU9CjUwYcdbXM9lcSfZCHvb7pS1TaajOqUYOdcmb+bYnz
	23KRqaGwo77hReiEZUy5NBKDJvqtwSIfQ1zPJk1uwJSjCpWFbhzIpKvfPO7VnLWUwHPzkGWDIPQmA
	lfcHw/CMNhIUXbIa7hewF4ETVeKLDIjTMnFGgcBAxt0qt06glhbgO9iD1tDuu+Dd8dPEB+vOLzwXm
	PevYaXlA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45430)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vBsxV-000000006Cw-1WVS;
	Thu, 23 Oct 2025 11:54:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vBsxQ-000000001cU-0p2n;
	Thu, 23 Oct 2025 11:54:12 +0100
Date: Thu, 23 Oct 2025 11:54:12 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Rohan G Thomas <rohan.g.thomas@intel.com>,
	"Ng, Boon Khai" <boon.khai.ng@altera.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v3 1/3] net: stmmac: vlan: Disable 802.1AD tag
 insertion offload
Message-ID: <aPoJVOUe-ASx1GmV@shell.armlinux.org.uk>
References: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
 <20251017-qbv-fixes-v3-1-d3a42e32646a@altera.com>
 <aPI5pBXnh5X7OXtG@shell.armlinux.org.uk>
 <e45a8124-ace8-40bf-b55f-56dc8fbe6987@altera.com>
 <1abbcd93-6144-440c-90d9-439d0f18383b@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1abbcd93-6144-440c-90d9-439d0f18383b@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_035433_731152_63F78AB2 
X-CRM114-Status: GOOD (  20.15  )
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

On Thu, Oct 23, 2025 at 09:01:20AM +0530, G Thomas, Rohan wrote:
> Hi Russell,
> 
> On 10/18/2025 7:26 AM, G Thomas, Rohan wrote:
> > Hi Russell,
> > 
> > On 10/17/2025 6:12 PM, Russell King (Oracle) wrote:
> > > On Fri, Oct 17, 2025 at 02:11:19PM +0800, Rohan G Thomas via B4 Relay wrote:
> > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > index 650d75b73e0b0ecd02d35dd5d6a8742d45188c47..dedaaef3208bfadc105961029f79d0d26c3289d8 100644
> > > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > @@ -4089,18 +4089,11 @@ static int stmmac_release(struct net_device *dev)
> > > >    static bool stmmac_vlan_insert(struct stmmac_priv *priv, struct sk_buff *skb,
> > > >    			       struct stmmac_tx_queue *tx_q)
> > > >    {
> > > > -	u16 tag = 0x0, inner_tag = 0x0;
> > > > -	u32 inner_type = 0x0;
> > > > +	u16 tag = 0x0;
> > > >    	struct dma_desc *p;
> > > 
> > > #include <stdnetdevcodeformat.h> - Please maintain reverse christmas-
> > > tree order.
> > 
> > Thanks for pointing this out. I'll fix the declaration order in the next
> > revision.
> > 
> > > 
> > > I haven't yet referred to the databook, so there may be more comments
> > > coming next week.
> > > 
> > 
> > Sure! Will wait for your feedback before sending the next revision.
> 
> Just checking in — have you had a chance to review the patch further? Or
> would it be okay for me to go ahead and send the next revision for
> review?

I've checked my version of the databook, and the core version that has
VLINS/DVLAN and my databook doesn't cover this. So I'm afraid I can't
review further.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

