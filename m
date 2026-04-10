Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6507DE99055
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 08:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdOnR/1mCgonR7f2wP3H5JqrF/rCMapSujGWUMtD9/A=; b=rJekfFV9HIChh1RC9i94Ixwprg
	5LxosdvVKxwJZ1OQER9+1lY1QNKBW8OCZYfnoM7Pk2yI03ETZnZNtxyCdfv+lgbcQ56cfAbEY4ST0
	JN53I8ZrJuqp83w1JYBL2tLIcywYojiiKOjQ3foEsWAdUsY6ogIrgBk/DrEd0mBtVK0LbAKonHg8N
	fVycv0n1AnR/gxOzckVTUsUpfBKbaj83pg/0RHcAP03L4q9hTf6iFgIj5Fshcb22U5x4hxd0urZ4i
	cOyays7ZVy2svg175VQ/CQyckfRuJs/w/zpdbIqSWyJ0DWOL8DF/XOYZKRH1QL7Pp4OKcWCQI/AGn
	VofKKKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7PH-0000000Bqvk-0MY7;
	Fri, 10 Apr 2026 08:40:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7PE-0000000Bqug-303U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 08:40:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZdOnR/1mCgonR7f2wP3H5JqrF/rCMapSujGWUMtD9/A=; b=rqmqyPCMlvW3KvDYDz3/ETNIAh
	G+ESQPCwbBnKWQSJh+ewTI/voRE6d3Ofr1iTuT3bDkAk27P35fRCtsFZbsndaH/5R0K66REmgJSa9
	6DVG3w9ciTeMT7N2D8gBgu388hIIZw6pNykZbUBWSDiL7IR0aL2hPrX8lB4FFeNyxkZ34crCfawWq
	ET2uU1utHtMx1ISS5KHV4cXaCRdUmtsF7xMSq6W4rlj8YdqvT2Z4amTnf9HBxDn9tiMn2tvOV0lU9
	fP2Wv8AVO7k6NoEkFKJOMMsTBV69KWgM7sywkLGQu709m6YCrVMKL6osnzUr1As2obFMhYf3OddEf
	Nyrg83EA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45482)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wB7P7-000000004e2-341K;
	Fri, 10 Apr 2026 09:39:53 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wB7P4-000000005UF-3z5f;
	Fri, 10 Apr 2026 09:39:50 +0100
Date: Fri, 10 Apr 2026 09:39:50 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH RFC net-next 02/10] net: stmmac: rename dev_id to userver
Message-ID: <adi3Vks-N0a83ylE@shell.armlinux.org.uk>
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
 <E1wAPBR-0000000F7ju-1fD9@rmk-PC.armlinux.org.uk>
 <CAMdnO-+TK65AxjTsDd017Mhop+VC3Xf8jtfaTXYpE6wBNZOt4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMdnO-+TK65AxjTsDd017Mhop+VC3Xf8jtfaTXYpE6wBNZOt4g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_014000_762115_23F00072 
X-CRM114-Status: GOOD (  18.81  )
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

On Thu, Apr 09, 2026 at 04:07:42PM -0700, Jitendra Vegiraju wrote:
> Hi Russell,
> 
> On Wed, Apr 8, 2026 at 2:27 AM Russell King (Oracle)
> <rmk+kernel@armlinux.org.uk> wrote:
> >
> > The Synopsys Databook and several implementation TRMs identify bits
> > 15:8 of the version register in dwmac v3.xx and v4.xx as "userver".
> > We even print its value with "User ID". Rather than using "dev_id",
> > use "userver" instead.
> >
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/hwif.c | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> > index 3774af66db48..830ff816ab4f 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> > @@ -15,7 +15,7 @@
> >
> >  struct stmmac_version {
> >         u8 snpsver;
> > -       u8 dev_id;
> > +       u8 userver;
> >  };
> From the XGMAC databook that I have access to bits(15:8) identify the
> DEVID field of MAC_version register.
> The userver field is from bits(23:16) of the same register. This is a
> customer defined field (configured with coreConsultant).
> Currently stmmac doesn't care about bits(23:16).

Thanks for the additional information.

I don't have any XGMAC documentation, but this indicates that it differs
between XGMAC and previous cores - GMAC and GMAC4 cores, 15:8 are
documented as userver, and 31:16 are marked as reserved.

Note that the dev_info() also prints 15:8 as "User ID" not "Device ID".

To confirm, is the XGMAC version register at offset 0x20 ? Later GMAC
cores moved it to 0x110.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

