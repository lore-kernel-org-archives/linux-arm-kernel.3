Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3EBE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rt0/m2Ur3xOciFGnYgCU4bKBYglBzbBymgd9Uo9+dy8=; b=Wmj/BeTIbS1rM/xo0dtOmf9Xn2
	GJwaVTO/Al7CBOXrzTIxUrgUI3W1J0ajk5mSw9oAyyv3iI0itpfU7DGXLnfIX2QtdWfHo6cnoDDPh
	iOTto9fPVF2z6XyuMJaR4n+NlEHcSTmVtSOhrtgm4YebdmqA/dSHUN1JVhO3eiS16uT9Ct8ciIimi
	FkCntNqhU3VtDbr7efw9HDfjxPnRDdw/pwC2cqV9DfkfbB175psnbf8CS9E8BX+nT3G5HAu2Y8PqN
	iAJMZQ5WLK3HHGLJy5xtDDEh466XFUnP0LY6NpGzyvtYzUGuV+wUJhID6GeKyN25uzza+UIQmXoYz
	wh4uxzvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8Lt-00000004h0B-3NNz;
	Tue, 07 Jan 2025 12:06:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8DA-00000004erM-416B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Rt0/m2Ur3xOciFGnYgCU4bKBYglBzbBymgd9Uo9+dy8=; b=KqBecdSB8IPGU3TLqYufcE250X
	L8FjFnrCvCmlwFzsHJsSPeLZnFEyAjY/CqcY/tdqZcI5BDjHtx0Sfcqd8rRNpx++b6wLAeYLCobcz
	ga/vcKx/Td9Tk2Wz6kFF4+X7NOXMmhXtxdDVX7yHEC4QAXgIOry3SWOXLskF8m+47nQBiR8GNfetZ
	b/+3k5DjNDNdfV+iX/C80SZEa8OLqnwTE9QHUKGebd1RFADCNBKxv+7GSKNRWiDM08F3aj1IPvA/8
	RkAQ53VOxwGg14bEjWtHv0T0cVe9fR6RyUmOBZLoFJObCvivZ+VCeFojq9z4rRPnehF7qjiORvNDC
	7dsLtgew==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33040)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tV8Cy-0007Li-2x;
	Tue, 07 Jan 2025 11:57:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tV8Cu-0005G3-0o;
	Tue, 07 Jan 2025 11:57:12 +0000
Date: Tue, 7 Jan 2025 11:57:12 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 03/17] net: stmmac: use correct type for
 tx_lpi_timer
Message-ID: <Z30WmPpMp_BRgrOI@shell.armlinux.org.uk>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAE-007VWv-UW@rmk-PC.armlinux.org.uk>
 <20250107112851.GE33144@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107112851.GE33144@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_035729_280642_80CC8384 
X-CRM114-Status: GOOD (  24.06  )
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

On Tue, Jan 07, 2025 at 11:28:51AM +0000, Simon Horman wrote:
> On Mon, Jan 06, 2025 at 12:24:58PM +0000, Russell King (Oracle) wrote:
> > The ethtool interface uses u32 for tx_lpi_timer, and so does phylib.
> > Use u32 to store this internally within stmmac rather than "int"
> > which could misinterpret large values.
> > 
> > Since eee_timer is used to initialise priv->tx_lpi_timer, this also
> > should be unsigned to avoid a negative number being interpreted as a
> > very large positive number.
> > 
> > Also correct "value" in dwmac4_set_eee_lpi_entry_timer() to use u32
> > rather than int, which is derived from tx_lpi_timer, even though
> > masking with STMMAC_ET_MAX will truncate the sign bits. u32 is the
> > value argument type for writel().
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> ...
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 9a9169ca7cd2..b0ef439b715b 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -111,8 +111,8 @@ static const u32 default_msg_level = (NETIF_MSG_DRV | NETIF_MSG_PROBE |
> >  				      NETIF_MSG_IFDOWN | NETIF_MSG_TIMER);
> >  
> >  #define STMMAC_DEFAULT_LPI_TIMER	1000
> > -static int eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> > -module_param(eee_timer, int, 0644);
> > +static unsigned int eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> > +module_param(eee_timer, uint, 0644);
> >  MODULE_PARM_DESC(eee_timer, "LPI tx expiration time in msec");
> >  #define STMMAC_LPI_T(x) (jiffies + usecs_to_jiffies(x))
> >  
> 
> Hi Russell,
> 
> now that eee_timer is unsigned the following check in stmmac_verify_args()
> can never be true. I guess it should be removed.
> 
>         if (eee_timer < 0)
>                 eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> 

Thanks for finding that. The parameter description doesn't seem to
detail whether this is intentional behaviour or not, or whether it is
"because someone used int and we shouldn't have negative values here".

I can't see why someone would pass a negative number for eee_timer
given that it already defaults to STMMAC_DEFAULT_LPI_TIMER.

So, I'm tempted to remove this.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

