Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDC8C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAyMBo36j0x78o2+E3q7sU4e8s++FwCVRfI6VgYXeMk=; b=jJuII9s57+dK6R5z6+wVRZB95z
	d0mJkSIhlGEuc6D9pQE2Z9y7BKZa8l18gxxCWSyYd0Ikod0uD/A0CqpdCQAoXMvR6BmXUc9WUoZVI
	+3S6bDIg6NKAeC0q0RnNMT6yD+rJRLA+d2O01Wgb0PouGbd9VeSQEkwsn3kuxdg2/c5WhGMPTiwwP
	LnPq9pI8ZrB6gT2xsAZbbjpazedmYxm6lwj6i5O8iB/Z/PCl3of96mNK/VaGVEy7E+ERe/aeuZLlm
	XICa04Le7wqQ6HjFdgIv5vYJJfqyVc5PBiJw6VgX9eqCdVhwbPqktkxAL794PJdj/K+OMknuaEEKT
	uB9sr6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLO-000000054wu-2kai;
	Mon, 16 Jun 2025 17:10:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBgF-00000004ofH-08Vf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 15:23:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7982649D3A;
	Mon, 16 Jun 2025 15:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC8BC4CEED;
	Mon, 16 Jun 2025 15:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750087406;
	bh=DzAYX/OSHec4aneSP3rKdKZMDvBVK1lYEdX+ohzC8Z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p4bSIrFatcQ42d88MaNSql4q5Dcs587b0VzQUEpNUgOZlHk+NN8C1yA1R7fPrwy+C
	 78egzc9WK0QVzESvoMXRWSr0heoUW+1Cfc7Wqe4zx6sAym65yTvUPGQXZcvJ40NapN
	 XenE3xQPdDEEliVJItbTX4Q6tmazd2OK2OtpkZfd7ZgVskQL1cuqSPWNm3em/l9Pf9
	 sK5qZHWclWBSvkQo5B8tr8c0b3JtZVj36rX6tMEp5Ai9D/o/e2RRIcnMRPO8w6yWTa
	 17dwO7u1Fs358bBpZcN8RxasCUeYIrfZDjv8V8GXoz2uS+ga3f6qDn9kCdkshrKQEu
	 n7ytYrKkWv0IA==
Date: Mon, 16 Jun 2025 16:23:21 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: add
 ethqos_pcs_set_inband()
Message-ID: <20250616152321.GD6918@horms.kernel.org>
References: <E1uPkbO-004EyA-EU@rmk-PC.armlinux.org.uk>
 <20250614153512.GQ414686@horms.kernel.org>
 <aE29zFKp5PLAM5pP@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aE29zFKp5PLAM5pP@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_082327_122450_AD8686D8 
X-CRM114-Status: GOOD (  18.96  )
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

On Sat, Jun 14, 2025 at 07:22:04PM +0100, Russell King (Oracle) wrote:
> On Sat, Jun 14, 2025 at 04:35:12PM +0100, Simon Horman wrote:
> > On Thu, Jun 12, 2025 at 05:16:30PM +0100, Russell King (Oracle) wrote:
> > > Add ethqos_pcs_set_inband() to improve readability, and to allow future
> > > changes when phylink PCS support is properly merged.
> > > 
> > > Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> > > Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sa8775p-ride-r3
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > 
> > Thanks Russell,
> > 
> > The nit below notwithstanding this looks good to me.
> > 
> > Reviewed-by: Simon Horman <horms@kernel.org>
> > 
> > > ---
> > >  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 13 +++++++++----
> > >  1 file changed, 9 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > index e30bdf72331a..2e398574c7a7 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > @@ -622,6 +622,11 @@ static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
> > >  	}
> > >  }
> > >  
> > > +static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
> > > +{
> > > +	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, 0, 0);
> > 
> > FWIIW, I would have gone for the following, as all the type of
> > three of the trailing parameters is bool.
> > 
> > 	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, false, false);
> 
> So the original code:
> 
>             stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 0, 0, 0);
>             stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
>             stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
>             stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
> 
> While one could convert the last two arguments to true/false, I'd prefer
> leaving them as is, as less change means less chance to introduce a bug.

Sure. No objections on my side.

