Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F0D10A88FB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 18:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ji45NUWbwmYmtJWis87trG6dXs16U0uRXqDBTnsy5d4=; b=FXInVjsK1v1GSyl58dpvW5hiJz
	bfkzNs62GfZuzeSvbeJu5BOBz/CJe0cv4d1yO13hUNTDWYyPdT5iGlTPblLyG2tO7K6uXtxnSHcDy
	BpSTIs2bGxF3y+T3zWZx2erBqBPcqcRTCdmWyoYuKWaou/as1WE11CWGE4NmHN7vRF9+F7P2olasN
	ovE2I45LJDHsowfNmD8DtfIEfGAKzgALIEJNjz0MI3E6i7HsP+r0nyLps6j/vrV8PXKrtLTo/dAJu
	rgTLXvjFxJVbf0blKjtjiI7Uk+ByD2Jfn8fhKVnh339lQA7MZtCAtYnRKDAB3oGLVtv7Logo1YRFb
	BtlJFxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pBp-000000060dX-0NbH;
	Thu, 26 Mar 2026 18:12:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pBm-000000060d1-1VBP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 18:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ji45NUWbwmYmtJWis87trG6dXs16U0uRXqDBTnsy5d4=; b=mAWrfpvOlFfajgP5bFr/ohHOiA
	1QPBL3YZnDhT3I0lLAI2A8ejzh1khwXIIIlePLo6ivYWUVBAGAQy6A2GU1zBq5zM1kgnU1ILI/7aT
	6+bckNXZKZfbJrK+n5XOCoOxHpWJwkcBYCUd8Py71xIDe2hKglU2ktIDZA62zvZq4GzIFu+Z42HZf
	4tD/jRwlnJmeiVEMZbzZDyxj2F3YdFmBbLa9BCXi3otIaZb1H+xuGGgTjvazJhCCtIbuLplgyZwGm
	zOMVqdlpSrwJxH6wuXq+dbMDonDyugML57jeQwYfois/7z+HMwrPJM4W3foKfQI8eEMy3WOE3WilH
	SXgUClFw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53576)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w5pBg-0000000059C-218X;
	Thu, 26 Mar 2026 18:12:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w5pBe-000000007Fq-2PgA;
	Thu, 26 Mar 2026 18:12:06 +0000
Date: Thu, 26 Mar 2026 18:12:06 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 03/15] net: stmmac: qcom-ethqos: eliminate
 configure_func
Message-ID: <acV29ruRVy_fcwDq@shell.armlinux.org.uk>
References: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
 <E1w51Xs-0000000DwVV-2bnh@rmk-PC.armlinux.org.uk>
 <20260326180453.GU111839@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326180453.GU111839@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_111214_399634_32201FA9 
X-CRM114-Status: GOOD (  14.14  )
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

On Thu, Mar 26, 2026 at 06:04:53PM +0000, Simon Horman wrote:
> On Tue, Mar 24, 2026 at 01:11:44PM +0000, Russell King (Oracle) wrote:
> > Since ethqos_fix_mac_speed() is called via a function pointer, and only
> > indirects via the configure_func function pointer, eliminate this
> > unnecessary indirection.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> ...
> 
> > @@ -623,14 +627,6 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
> >  	ethqos_pcs_set_inband(ethqos, interface == PHY_INTERFACE_MODE_SGMII);
> >  }
> >  
> > -static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
> > -				 int speed, unsigned int mode)
> > -{
> > -	struct qcom_ethqos *ethqos = priv;
> > -
> > -	ethqos->configure_func(ethqos, interface, speed);
> > -}
> > -
> >  static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
> >  {
> >  	struct qcom_ethqos *ethqos = priv;
> 
> Hi Russell,
> 
> FYI, AI generated review reports that the comment in ethqos_clks_config()
> that references ethqos_fix_mac_speed() should also be updated.

Also already noted (yesterday).

I do keep an eye on patchwork for my own patches - I have a firefox tab
permanently open for my patches in patchwork:

https://patchwork.kernel.org/project/netdevbpf/list/?submitter=165511

Thanks anyway.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

