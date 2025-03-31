Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45948C36016
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 20:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwgUmQ/Ln+vl6Ggzqf2YmSZ7HB+LoNBmRfI1Y27KDkA=; b=W3FH4H61Xjg/usHPbipUZZG2me
	ivCEEPPXLcG4YhpFGR7030jrky1gQjimHFEhua0RXEVyfUwBwIQGyXbPleAPXm15dBK8lQ2xV8qXT
	pA3zD8J1L/ec4ivjFqGrQydV3mGmcSt5h/WE/l/9lSPAlLokfNWQrHiOoCoRE9jUZBNA20fDQIm0P
	+wUBmUX2STRyGP8bYltVR7n6/wdDk7PY8dOpmC/9eQGB/w1ltw+NqaKoqiFH9XPTsr1kYSuAuzOnl
	NampZVQlgQGAPoVr77LrzGqC7NmaikXCdI0steGCYKcl32FIiQAnvYEUYIrQtmpegMa426SXsn3CJ
	s0DqlnEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzLoM-00000001KRN-1PVl;
	Mon, 31 Mar 2025 20:32:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzLmY-00000001K3M-2fsK;
	Mon, 31 Mar 2025 20:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bwgUmQ/Ln+vl6Ggzqf2YmSZ7HB+LoNBmRfI1Y27KDkA=; b=Up4u0ZtG1+H47e4FsrNKSaV3o8
	3eDeJC82AW9n1sRD92fm7KDWTFxTlKyVYZkALIOZ8v3lqVlbgS4tKxO6tohdct1W0suaUXUPBw/vy
	nK+4MK+9EMi1TY9eDu0nvxRN4EbMm1sLlZQ3F3an+fF2Unme7J1RP2aW1qxVbw+U/yaqOgyRb9VER
	t7CcYkvNr02rp6F5f/P7MUBu0xpg7Yfk56v3d3IEvx15X2xJjSdunMDG9w8AvtwNWSCGR+LuXkJKw
	AvRUAYvC/r3H9c5G6KWGnYgiWy3Q/2qrZ6zZIlDzU6/LmAhDX3sjUVbomWh95H2aII31UVfXXTBBr
	wlHheixQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59730)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tzLmQ-0004lN-2S;
	Mon, 31 Mar 2025 21:30:46 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tzLmN-0001zI-1U;
	Mon, 31 Mar 2025 21:30:43 +0100
Date: Mon, 31 Mar 2025 21:30:43 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Da Xue <da@lessconfused.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Da Xue <da@libre.computer>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jakub Kicinski <kuba@kernel.org>, linux-amlogic@lists.infradead.org,
	Paolo Abeni <pabeni@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2] net: mdio: mux-meson-gxl: set 28th bit in eth_reg2
Message-ID: <Z-r7c1bAHJK48xhD@shell.armlinux.org.uk>
References: <20250331074420.3443748-1-christianshewitt@gmail.com>
 <17cfc9e2-5920-42e9-b934-036351c5d8d2@lunn.ch>
 <Z-qeXK2BlCAR1M0F@shell.armlinux.org.uk>
 <CACdvmAijY=ovZBgwBFDBne5dJPHrReLTV6+1rJZRxxGm42fcMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACdvmAijY=ovZBgwBFDBne5dJPHrReLTV6+1rJZRxxGm42fcMA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_133054_674242_CE8A9851 
X-CRM114-Status: GOOD (  28.31  )
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

On Mon, Mar 31, 2025 at 03:09:00PM -0400, Da Xue wrote:
> On Mon, Mar 31, 2025 at 9:55 AM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Mon, Mar 31, 2025 at 03:43:26PM +0200, Andrew Lunn wrote:
> > > On Mon, Mar 31, 2025 at 07:44:20AM +0000, Christian Hewitt wrote:
> > > > From: Da Xue <da@libre.computer>
> > > >
> > > > This bit is necessary to enable packets on the interface. Without this
> > > > bit set, ethernet behaves as if it is working, but no activity occurs.
> > > >
> > > > The vendor SDK sets this bit along with the PHY_ID bits. U-boot also
> > > > sets this bit, but if u-boot is not compiled with networking support
> > > > the interface will not work.
> > > >
> > > > Fixes: 9a24e1ff4326 ("net: mdio: add amlogic gxl mdio mux support");
> > > > Signed-off-by: Da Xue <da@libre.computer>
> > > > Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> > > > ---
> > > > Resending on behalf of Da Xue who has email sending issues.
> > > > Changes since v1 [0]:
> > > > - Remove blank line between Fixes and SoB tags
> > > > - Submit without mail server mangling the patch
> > > > - Minor tweaks to subject line and commit message
> > > > - CC to stable@vger.kernel.org
> > > >
> > > > [0] https://patchwork.kernel.org/project/linux-amlogic/patch/CACqvRUbx-KsrMwCHYQS6eGXBohynD8Q1CQx=8=9VhqZi13BCQQ@mail.gmail.com/
> > > >
> > > >  drivers/net/mdio/mdio-mux-meson-gxl.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/net/mdio/mdio-mux-meson-gxl.c b/drivers/net/mdio/mdio-mux-meson-gxl.c
> > > > index 00c66240136b..fc5883387718 100644
> > > > --- a/drivers/net/mdio/mdio-mux-meson-gxl.c
> > > > +++ b/drivers/net/mdio/mdio-mux-meson-gxl.c
> > > > @@ -17,6 +17,7 @@
> > > >  #define  REG2_LEDACT               GENMASK(23, 22)
> > > >  #define  REG2_LEDLINK              GENMASK(25, 24)
> > > >  #define  REG2_DIV4SEL              BIT(27)
> > > > +#define  REG2_RESERVED_28  BIT(28)
> > >
> > > It must have some meaning, it cannot be reserved. So lets try to find
> > > a better name.
> >
> > Indeed, that was my thoughts as well, but Andrew got his reply in
> > before I got around to replying!
> 
> The datasheets don't have much in the way of information about this
> register bit. The Amlogic GXL datasheet is notoriously inaccurate.
> 
> ETH_REG2 0XC8834558
> 29:28 R 0x1 reserved
> 
> It claims the bit is read only while the BSP hard codes the setting of
> this register. I am open to any name for this register bit.
> This is the only thing holding up distro netbooting for these very
> popular chip family.

Which interface mode do we think this affects?

As a suggestion, maybe call it:

REG2_<interfacemode>_EN

and possibly add a comment "This bit is documented as reserved, but
needs to be set so that <interfacemode> can pass traffic. This is
an unofficial name."

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

