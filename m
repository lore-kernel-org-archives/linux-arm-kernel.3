Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9472CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 23:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQKUAMPoIwrktr4i5u0UpH17K+mwmsURe5fGAuWEu10=; b=UPFBnCppXg5q0t1WEL0sHlZP3f
	Fu7Q/ch+uBVCIKyb4pCdth6Nv7hoi3pUcHtVNkX0JnNNzGFpHAm3VOQEDM8BGZlo9PI6i71Vzpx2J
	EwnI0MMmLir/9BYtpKu1+8WmhCISGnozF3ouqg0jINXonL0/RSI+wtZUzAtHzgi8b3ZIIWDl4Ead3
	9r4HbZ7Tp5QZRoPN/eGTK6s2jMf2ywLSb+CjVyN/Z+e4dlfpxDXGWVUBSEWRACkFqQntmpBM4WaPp
	Wv5jYriJwUZhEwsoWyNRIenRGd2gLeqT6k9sYDv0KyVJj4gluBjPKJP1IC2n82k63WirUJ8CNTn6Y
	u1RfmgtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDWvc-0000000ExRP-0RM1;
	Mon, 27 Oct 2025 23:47:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDWvZ-0000000ExR1-1cNZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 23:47:06 +0000
Received: from pendragon.ideasonboard.com (85-76-17-108-nat.elisa-mobile.fi [85.76.17.108])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4250211DD;
	Tue, 28 Oct 2025 00:45:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761608715;
	bh=YYHUzAcEn48hxpCkP434f80Wc8cJl1AevXLmPQTIRD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1fDhPjXRoI6Z2EtHsqCOXN3Ss2/tf/XCQwabUASDvat+W0b/6C/kQSDIe4Ac/LtX
	 sEpsbxgtzteiPSSdw8Vfp63aBPrJv5/KH7kGw0TyCwUTGmwEnOmesZtTVX/6UTmqci
	 03IqR5ayiEfeCPFtkTSWLsfkDkwWiJ6bZdKhlEKU=
Date: Tue, 28 Oct 2025 01:46:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <20251027234648.GC24987@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <aP-ML-A_h13pXY2d@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aP-ML-A_h13pXY2d@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_164705_587139_66E902D6 
X-CRM114-Status: GOOD (  28.12  )
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

On Mon, Oct 27, 2025 at 03:13:51PM +0000, Russell King (Oracle) wrote:
> On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
> > Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> > (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> > devices produces an interrupts storm. Disable EEE support to fix it.
> 
> We've finally got to the bottom of what's going on here. Please try
> this patch (it's building locally, but will take some time because
> I'd wound the tree back to 6.13 and 6.14, so it's going to be a full
> rebuild.) Thus, there may be compile bugs remaining.

I've applied it on top of 

I've started with a branch based on v6.18-rc3 plus "[PATCH net-next 0/5]
net: stmmac: more cleanups" ([1]) and "[PATCH net-next v2 0/6] net: add
phylink managed WoL and convert stmmac" ([2]) to make the patch apply
cleanly.

[1] https://lore.kernel.org/all/aO_HIwT_YvxkDS8D@shell.armlinux.org.uk/
[2] https://lore.kernel.org/all/aPnyW54J80h9DmhB@shell.armlinux.org.uk/

The base branch exhibits the interrupt storm issue. The patch
unfortunately doesn't fix it.

> This uncovered a latent bug in Emanuele's case - the TI PHY drivers
> report EEE capabilities despite not being capable which also needs
> fixing. The patch below will stop stmmac enabling EEE by default on
> PHYs described in firmware, which is the behaviour the driver used
> to have.
> 
> If we decide that EEE should be enabled by default, then we'll need
> to revert this change. However, given Oleksij's recent input, I'm
> wondering whether EEE should default to disabled given the issues
> with Tq. The suggestion there is that many PHYs get it wrong and thus
> are incompatible with each other when EEE is enabled.
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index fd5106880192..c18690a6804f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1208,6 +1208,24 @@ static int stmmac_init_phy(struct net_device *dev)
>  	return 0;
>  }
>  
> +static bool stmmac_has_fw_phy(struct stmmac_priv *priv)
> +{
> +	struct fwnode_handle *fwnode;
> +
> +	fwnode = priv->plat->port_node;
> +	if (!fwnode)
> +		fwnode = dev_fwnode(priv->device);
> +
> +	if (!fwnode)
> +		return false;
> +
> +	fwnode = fwnode_get_phy_node(fwnode);
> +	if (fwnode)
> +		fwnode_handle_put(fwnode);
> +
> +	return !!fwnode;
> +}
> +
>  static int stmmac_phylink_setup(struct stmmac_priv *priv)
>  {
>  	struct stmmac_mdio_bus_data *mdio_bus_data;
> @@ -1270,7 +1288,7 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
>  		/* All full duplex speeds above 100Mbps are supported */
>  		config->lpi_capabilities = ~(MAC_1000FD - 1) | MAC_100FD;
>  		config->lpi_timer_default = eee_timer * 1000;
> -		config->eee_enabled_default = true;
> +		config->eee_enabled_default = !stmmac_has_fw_phy(priv);
>  	}
>  
>  	config->wol_phy_speed_ctrl = true;

-- 
Regards,

Laurent Pinchart

