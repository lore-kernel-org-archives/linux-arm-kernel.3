Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12156E9A054
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 19:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPP/cIarqO1P9h9eWlYa372Rs/GIxWfK5Giq5Q6Jtr8=; b=Ml1kFWQCSgpmXOltMa5NKXyGdy
	NyIQG1b57WwLs0eIILV3lNSLg+AUDGpvG3/CSvOYrxt5cWs4zvqvcBJSxJ+Vt8a3ekFgwcek5Em7b
	zgBItorwTrYOYue5SV2js7HXS1JoMyV4hOq3vEWqGNHTNAJ7Y35HJ4Rq7kMhtQY8BA1ElWs6S3RlD
	rQ750rQx+KAi2gxaaoY4VK0QOl8nZL7CtYYucvwP1Ufpuzli/K/kZdpEaP1G0Yo27JfFr7h8k4a5K
	jur2ub2LgPCwjO1ZNw/EiGf9kcWnvxiCV7xI5RAvebJKVUbtyLckA99JEZ7M0PSQQJ8R90C55E3xB
	DazNpGKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9eO-0000000Bq7C-3QVr;
	Thu, 19 Feb 2026 19:25:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9eM-0000000Bq6h-1zIM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 19:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dPP/cIarqO1P9h9eWlYa372Rs/GIxWfK5Giq5Q6Jtr8=; b=o14AFEFWgr4pXheJHwdZbvcLVX
	H7IWEeMLSvtYiqinwiXG68B+CxFS5PshaScxPl5Kc/wg4ZXrMcK+OZsRvuW/O2pNbPNPZLTEZvTe5
	YL2XTPxup0UUF0P34vmXe3UZkj/ZChdsE+KslfVEM7eS/hb1UNw//4S/P0dpenrlFIvPfR/DZDZBo
	ceRP++HlA46ZXqXNlGFBfDAq4MMA/Mo5LV3WHNSBPe9n3DE0QRAUAxTTsTx5vFd4r8xAtKEiTHHqv
	yI1ViidDr/qHM031HgJ4BqBvEUVNNd7LAtsMkce2iVxNSkQMoXFXjWMMtpq8vrEeC10MX+W9ikSKm
	wisGstpA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46806)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vt9e9-000000001EC-0CuB;
	Thu, 19 Feb 2026 19:25:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vt9e5-000000003ZS-1kp1;
	Thu, 19 Feb 2026 19:25:05 +0000
Date: Thu, 19 Feb 2026 19:25:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linusw@kernel.org>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] net: stmmac: restore pinctrl when driver remove.
Message-ID: <aZdjke4eOwF-wTZO@shell.armlinux.org.uk>
References: <20260218083618.67805-1-christophe.roullier@foss.st.com>
 <20260218083618.67805-3-christophe.roullier@foss.st.com>
 <aZV-b6TdLMdI8dm4@shell.armlinux.org.uk>
 <CAD++jLnF=8MvW4CbXmPZR=w8tAUZiL9M3N73WB++DaYYwhToDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnF=8MvW4CbXmPZR=w8tAUZiL9M3N73WB++DaYYwhToDQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_112522_520510_54BF4EE2 
X-CRM114-Status: GOOD (  33.62  )
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

On Thu, Feb 19, 2026 at 08:11:13PM +0100, Linus Walleij wrote:
> On Wed, Feb 18, 2026 at 9:55 AM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Wed, Feb 18, 2026 at 09:36:17AM +0100, Christophe Roullier wrote:
> > > when system suspend or unbind, need to set pins
> > > to low power state to save IO power consumption.
> > >
> > > Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > index 067b17f03cd09..3d4f0e4cb53fb 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > @@ -8071,6 +8071,9 @@ void stmmac_dvr_remove(struct device *dev)
> > >       mutex_destroy(&priv->lock);
> > >       bitmap_free(priv->af_xdp_zc_qps);
> > >
> > > +     /* Select sleep pin state */
> > > +     pinctrl_pm_select_sleep_state(dev);
> > > +
> >
> > I'm not convinced this is correct, there's nothing to match it in the
> > probe function, except what the driver model core does. However, the
> > driver model core also doesn't clean up the state if probe fails.
> 
> I think it looks right, if this state is indeed for the sleep state of the
> device pins, and this is what you want to happen at remove().
> 
> The non-cleanup of the pin states is a (maybe ugly) feature: there
> is an "init" and a "default" state. If the "init" state does not exist the
> "default" state is selected in the dd.c call.
> 
> These states are just some values in dev->pins, allocated with
> devm_kzalloc(), and devm_pinctrl_get() for e.g. dev->pins->p,
> so IIUC this will befree:ed on driver detach,
> also if the probe() fails, at least that is what the original devres
> design document says
> Documentation/driver-api/driver-model/devres.rst
> 
> There is really no other cleanup that can happen: there is no
> before-default-or-init state we can revert to (that would be the
> power-on values), so there are just these states in some pointers
> that could be accessed by e.g. pinctrl_pm_select_sleep_state()
> that get free:ed up, and muxing and pin config that happened
> in the pin control hardware just stays around.

What we seem to end up with is that on probe failure, we set the pins
to init or default state. However, on remove, it's up to the driver to
decide whether to put the pins into sleep state or not.

Shouldn't a driver be consistent, and place the pins into the same
state in both these scenarios?

Conversely, I'm slightly worried that putting pins into sleep state
when we're not powering down may be bad if they're allowed to then
float, which could cause the PHY to interfere on the network.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

