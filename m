Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9B0CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02XK0aWcsbyJv7uQCLUfPYNpW5LcuCGsqkHjPzwoRqc=; b=NSu2+JoaRhmt1pSNukhY1MIA3B
	7rl1loI2bqZ2XAC5tw4m/NZ02E26LmLO66lniwiNy4aiilzJlBiK/Nm0v6yOLO22GKvmPZCarvBD6
	L7Tl1NEQsWHePz74RCbuG1xhmPw+xYyvYMGmgvHirMmo596dRgnoeHNyku3vE4IM+FqDhlPFlBeH8
	QzWLwAGIoPxRAzt9rpOvumUIuiXvlY7tZK2d+TuYmUEWiKG0BBhGUqyGEn0LYI42e7ywkYCwNCODP
	ucm8cDenQvxe/+zuYaYQNQY/No8Ogn/HYKxuTOqaYDS1WUri0eTuyWkgZ9rL0idj4vGXzfA011hzd
	qMYCICUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTUE-00000001v9s-1m5V;
	Wed, 22 Oct 2025 07:42:22 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTUB-00000001v8q-3BK8;
	Wed, 22 Oct 2025 07:42:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 48ED1C0B8BF;
	Wed, 22 Oct 2025 07:41:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 058D0606DC;
	Wed, 22 Oct 2025 07:42:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87690102F241B;
	Wed, 22 Oct 2025 09:42:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761118935; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=02XK0aWcsbyJv7uQCLUfPYNpW5LcuCGsqkHjPzwoRqc=;
	b=MDVGp1r63WmOq64jmekkj2mNKIHbs8gK1TGb34e0gPscoq9dNeHqWxN5JDVukN66yBPu2i
	eGSvf8Qtm3kmKeeUHL4nm2pbJCglwa6JYLmoGL1ofZh/6fcdt5zuCoqzvgQURNM7Bb/8b/
	QOqz2a3N7Ij0zLkxQRUIN+RVMn2dDBD3NUDtrpV4wRdpR6hN/git6lvfza+VrJr4sdq/57
	i1LWPlnHC2K0/kaPUR6MauG2ylML2CFrnC02YfK6uO9qZA33Ucsm46Pfi3AmDMIa5H1xqQ
	blzuMkZylIM6hhWAKueQv0cDGxw7XuOj36EFpGAMYJCZcNql1QqO1c66Vxx/MQ==
Message-ID: <2a9e1ecc-2f33-432b-bf77-e08ce7ccd0ce@bootlin.com>
Date: Wed, 22 Oct 2025 09:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH 2/2] net: airoha: add phylink support for GDM1
To: Christian Marangi <ansuelsmth@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251021193315.2192359-1-ansuelsmth@gmail.com>
 <20251021193315.2192359-3-ansuelsmth@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251021193315.2192359-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_004220_262106_CB89C334 
X-CRM114-Status: GOOD (  21.34  )
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

Hi Christian,

On 21/10/2025 21:33, Christian Marangi wrote:
> In preparation for support of GDM2+ port, fill in phylink OPs for GDM1
> that is an INTERNAL port for the Embedded Switch.
> 
> Rework the GDM init logic by first preparing the struct with all the
> required info and creating the phylink interface and only after the
> parsing register the related netdev.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 108 ++++++++++++++++++++---
>  drivers/net/ethernet/airoha/airoha_eth.h |   3 +
>  2 files changed, 99 insertions(+), 12 deletions(-)

You also need to select PHYLINK in Kconfig

> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index ce6d13b10e27..fc237775a998 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1613,6 +1613,8 @@ static int airoha_dev_open(struct net_device *dev)
>  	struct airoha_gdm_port *port = netdev_priv(dev);
>  	struct airoha_qdma *qdma = port->qdma;
>  
> +	phylink_start(port->phylink);
> +
>  	netif_tx_start_all_queues(dev);
>  	err = airoha_set_vip_for_gdm_port(port, true);
>  	if (err)
> @@ -1665,6 +1667,8 @@ static int airoha_dev_stop(struct net_device *dev)
>  		}
>  	}
>  
> +	phylink_stop(port->phylink);
> +
>  	return 0;
>  }
>  
> @@ -2813,6 +2817,17 @@ static const struct ethtool_ops airoha_ethtool_ops = {
>  	.get_link		= ethtool_op_get_link,
>  };
>  
> +static struct phylink_pcs *airoha_phylink_mac_select_pcs(struct phylink_config *config,
> +							 phy_interface_t interface)
> +{
> +	return NULL;
> +}
> +
> +static void airoha_mac_config(struct phylink_config *config, unsigned int mode,
> +			      const struct phylink_link_state *state)
> +{
> +}
> +
>  static int airoha_metadata_dst_alloc(struct airoha_gdm_port *port)
>  {
>  	int i;
> @@ -2857,6 +2872,55 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
>  	return false;
>  }
>  
> +static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
> +			       unsigned int mode, phy_interface_t interface,
> +			       int speed, int duplex, bool tx_pause, bool rx_pause)
> +{
> +}
> +
> +static void airoha_mac_link_down(struct phylink_config *config, unsigned int mode,
> +				 phy_interface_t interface)
> +{
> +}
> +
> +static const struct phylink_mac_ops airoha_phylink_ops = {
> +	.mac_select_pcs = airoha_phylink_mac_select_pcs,
> +	.mac_config = airoha_mac_config,
> +	.mac_link_up = airoha_mac_link_up,
> +	.mac_link_down = airoha_mac_link_down,
> +};
> +
> +static int airoha_setup_phylink(struct net_device *netdev)
> +{
> +	struct airoha_gdm_port *port = netdev_priv(netdev);
> +	struct device *dev = &netdev->dev;
> +	phy_interface_t phy_mode;
> +	struct phylink *phylink;
> +
> +	phy_mode = device_get_phy_mode(dev);
> +	if (phy_mode < 0) {
> +		dev_err(dev, "incorrect phy-mode\n");
> +		return phy_mode;
> +	}
> +
> +	port->phylink_config.dev = dev;
> +	port->phylink_config.type = PHYLINK_NETDEV;
> +	port->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> +						MAC_10000FD;
> +
> +	__set_bit(PHY_INTERFACE_MODE_INTERNAL,
> +		  port->phylink_config.supported_interfaces);
> +
> +	phylink = phylink_create(&port->phylink_config, dev_fwnode(dev),
> +				 phy_mode, &airoha_phylink_ops);
> +	if (IS_ERR(phylink))
> +		return PTR_ERR(phylink);
> +
> +	port->phylink = phylink;
> +
> +	return 0;
> +}
> +
>  static int airoha_alloc_gdm_port(struct airoha_eth *eth,
>  				 struct device_node *np, int index)
>  {
> @@ -2931,19 +2995,30 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
>  	port->id = id;
>  	eth->ports[p] = port;
>  
> -	err = airoha_metadata_dst_alloc(port);
> -	if (err)
> -		return err;
> +	return airoha_metadata_dst_alloc(port);
> +}
>  
> -	err = register_netdev(dev);
> -	if (err)
> -		goto free_metadata_dst;
> +static int airoha_register_gdm_ports(struct airoha_eth *eth)
> +{
> +	int i;
>  
> -	return 0;
> +	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
> +		struct airoha_gdm_port *port = eth->ports[i];
> +		int err;
>  
> -free_metadata_dst:
> -	airoha_metadata_dst_free(port);
> -	return err;
> +		if (!port)
> +			continue;
> +
> +		err = airoha_setup_phylink(port->dev);
> +		if (err)
> +			return err;
> +
> +		err = register_netdev(port->dev);
> +		if (err)
> +			return err;

The cleanup for that path seems to only be done if

  port->dev->reg_state == NETREG_REGISTERED

So if netdev registration fails here, you'll never destroy
the phylink instance :(

Maxime



