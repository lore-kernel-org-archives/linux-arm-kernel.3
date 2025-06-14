Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29ADBC7114A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 18:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWVGJpxfZxK5NWqKsMehk6v+OXAVVCcYoYUm9xSLX/c=; b=mzYvPta7aq/uIUnl7E8t0F/Yei
	iwBKtEVroL+LabedZasY5YBQNtdS3MfKG3g+WeaiUnkiucn39nlPteKl08I6cVNy2qeAf8v1Lw3F5
	SdnfnH+zqP8SxPaRR0rjK/isPMgf053ayBdWeeCUdJ8x8OKytdmEtyBSuPwnz4CQ0SQjx9Vmcse+u
	SAEjsJQrBjHMTGmayogVG1LE5lcmuFGnyGaFvXE5xod6PJJ7cv/yCAQE6K65j6BY9PFVgvzvA+TbR
	A17s2C+L2GJyUB3X8nfvXLLnyvBmdx4TainCEWa+Dyh4o1Rt05kVO2XGI4bfjpN/n8jXhUxafJSku
	GgXYNFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVcD-00000001fGH-3TPV;
	Sat, 14 Jun 2025 18:28:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVYE-00000001eui-27Nf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 18:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LWVGJpxfZxK5NWqKsMehk6v+OXAVVCcYoYUm9xSLX/c=; b=AFnGMw0U82bkfJeUm1qa6MToAQ
	4DNM7+9jW6wRrHGrILCc1akHMwLWpcAODcTO4kRMTR8zKDpDDaMZACfuNkd8LMyjCxKq1f7SREwEg
	+59raP3R8l8vsFX4S0BUsQR9lpfnZgJ0EgZX+jCpxIzPe8vdoex1+W2CxPlyxTvU/1Sp2hYBbm00p
	hO6lLM/+m0qcJk1Irc5h5sXSvF3V33IotOT/w33bOwIRfEb+JmW00/eC6+48RLFHz3Wjl1aQkz9HY
	Sbp3rzOaw1HwVyg10QT6TpP/81H8WWkoVYRumO9m3jiyBFhQ2t6Gywb2pPDmUlAwjdtoeFgu1eBfB
	Drupz9fw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43052)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uQVW4-00027I-1a;
	Sat, 14 Jun 2025 19:22:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uQVW0-00031F-1O;
	Sat, 14 Jun 2025 19:22:04 +0100
Date: Sat, 14 Jun 2025 19:22:04 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <horms@kernel.org>
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
Message-ID: <aE29zFKp5PLAM5pP@shell.armlinux.org.uk>
References: <E1uPkbO-004EyA-EU@rmk-PC.armlinux.org.uk>
 <20250614153512.GQ414686@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614153512.GQ414686@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_112422_550726_854E5073 
X-CRM114-Status: GOOD (  16.63  )
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

On Sat, Jun 14, 2025 at 04:35:12PM +0100, Simon Horman wrote:
> On Thu, Jun 12, 2025 at 05:16:30PM +0100, Russell King (Oracle) wrote:
> > Add ethqos_pcs_set_inband() to improve readability, and to allow future
> > changes when phylink PCS support is properly merged.
> > 
> > Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> > Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sa8775p-ride-r3
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thanks Russell,
> 
> The nit below notwithstanding this looks good to me.
> 
> Reviewed-by: Simon Horman <horms@kernel.org>
> 
> > ---
> >  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index e30bdf72331a..2e398574c7a7 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -622,6 +622,11 @@ static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
> >  	}
> >  }
> >  
> > +static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
> > +{
> > +	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, 0, 0);
> 
> FWIIW, I would have gone for the following, as all the type of
> three of the trailing parameters is bool.
> 
> 	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, false, false);

So the original code:

            stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 0, 0, 0);
            stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
            stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
            stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);

While one could convert the last two arguments to true/false, I'd prefer
leaving them as is, as less change means less chance to introduce a bug.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

