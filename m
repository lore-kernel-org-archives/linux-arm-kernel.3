Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF213C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EP5ciUrJhx2qjL/YTEW+Ro+6nfUBpD7HupJKLYyZ5WU=; b=JpMCUXvePf3yK+ZhKjKkiIsKVf
	v6uQ5fDRFnzga7Nj2C1JZGjGz8IscIwRCQtfU0s/EhYu3jDYoVWd5W3CF+9T+MsKZ8RdhWxgiTnIi
	Ky4lXLu03bToxhlXwn2JSwvWYviMYhQ03UMikkl7rKJO2KjhWAsnPuZQ+fQ1467v2t4/KylSfvXpn
	RuaGn4YezZs+6G7sXqBAMloJM/xuwJUQIhLNtpuCtrQsxUkg7DLucIkJayrQK64VMvLokw0BY4YyL
	MsM/HUcmUrsCUgNrvzM2+7AuiEu4JY0ahm3S4VlSyD/aHXWS+eD/ceSlp7nx9NIoRI7MCaDG0Tybi
	gahnWH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQBM-000000094Sr-1siK;
	Mon, 12 May 2025 10:14:48 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPRQ-00000008vdA-1kRY;
	Mon, 12 May 2025 09:27:21 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a108684f90so2501189f8f.1;
        Mon, 12 May 2025 02:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747042039; x=1747646839; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EP5ciUrJhx2qjL/YTEW+Ro+6nfUBpD7HupJKLYyZ5WU=;
        b=AAIvTGgABgzDiIhuJQT0lAACt91zuo9NbwoD+425098K+EaM+sUPWew/aI22QScOo6
         XPogmldVL0XSAOkAd3nbPgMwJsBvv8Fkv2ngWyks87tH9MGDIfnhkvZqP4/J9+7c8mrS
         00zbkcT2wdnE5KEeHSCeuSShJrSUivsLFdl736NmEGzkSNHNhDnVV+t2VJiCe4NJ1ARx
         YP7FHmg/26aA5z/53OlZjPm1DI5kAePzlm4LCzkg7sl4ZY+tTtd280jDJU3SO0zs4Vcd
         FtfDyxoKZsholEpIJh74QS/Lv7VzpOISYsZN2Wic33/h5+JIlyBU1j55oxh46jgaXTAP
         fIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747042039; x=1747646839;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EP5ciUrJhx2qjL/YTEW+Ro+6nfUBpD7HupJKLYyZ5WU=;
        b=ctrhSLl7vJ7Pe7UDM5IIksDBHKxAA0GJ7D6ObGowGLVEH+5j+1ReJWNfHXl02rkLdh
         vLrrY5EQHlUIW49bBv8QPfd6O5VtW1yi0yN3L5G9uqixk2JZQ1Cg9zNzc96EPfXoiUd2
         TEHRVMtZrwrrAye/0abfniJg5+vUxdJ1mcxPDXBppu7dkfuSWJgy0ItTX94UvIn6sias
         muyMxLyn9V0c2DyrrI8WQCAnJnS6V0C/8POz+vChtGhul4gi6RYXOsCb38GrEt6pRBZS
         Xw1L6iMjc9O2XBEWatKfr0m3HyRj/b7dRUw1etaRVPO4SEKB76Roa3A7dF6EyraqHYsI
         g98Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMneQXKzXpeO85uhM+fy8t4hB8uAX6TPd7roR0Y7/j5Nyuw2pE6GMz+bgSTpEuxW9REgafjZkUhWP0EKGyJSiO@lists.infradead.org, AJvYcCXj0pdSED6yTn7V1LDRk+kT0XtWuN24ryR/7aIz6MK7LLl+kJ13zNHvgp642dr9BQAzXLy1qOz1aww8q+PfTZU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp/lmgsXkSwzJWEqwN24/2szfg5PwE2kCoL6c5d2y/xVo2HHYt
	lhJB/nG3oVGrESNm9Ti3rsnGo6oi7xqh/ReThGbPhmUrkb+c+Sw4
X-Gm-Gg: ASbGncuUB+c5RVJrYKNz4ZnkmT5X97/XW4kBHbW+Dtd3Q78hnP2wRSErqr7DSixYe+T
	bzrZoox1vYhjxixJQF2tWn7LDTYIuSmy2+y5V0R/2/1s+NklaJNSOGAzYE273ydZl/Nr903glmX
	KNZnkeFB9vMDx8/1JL+8nhpuRjcsG8mDadmvhkneOLrsynEYbz3nbmamnUBh+VIv3XBBqUITHzF
	snAZtE0i7GQPZWCABQVcImWXJ+X0ZFpHVGCfiYVmLcNvAKjKT67iBjD7IK+0JpqZ2sF4SCkZbB/
	PxJfn+bpBwdTMpXPtIzKhoiQPCfA065t8uObZPaLeieRtwu5o9bCA/PLlKdlVat434gNBxDkAyi
	H+WuvZqg=
X-Google-Smtp-Source: AGHT+IEIx2dngjb6axDv4lWuQJCqhwKHcwmf+wk9ypXMGeGlR42a1KIrb2TLCO+LYY/WGRgWY7SQ1Q==
X-Received: by 2002:a05:6000:430d:b0:3a0:b378:a4eb with SMTP id ffacd0b85a97d-3a1f6487e1amr9306477f8f.40.1747042038492;
        Mon, 12 May 2025 02:27:18 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d96csm11933224f8f.69.2025.05.12.02.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 02:27:17 -0700 (PDT)
Message-ID: <6821bef5.5d0a0220.319347.d533@mx.google.com>
X-Google-Original-Message-ID: <aCG-8mJYlQoa_4ls@Ansuel-XPS.>
Date: Mon, 12 May 2025 11:27:14 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [net-next PATCH v4 11/11] net: airoha: add phylink support for
 GDM2/3/4
References: <20250511201250.3789083-1-ansuelsmth@gmail.com>
 <20250511201250.3789083-12-ansuelsmth@gmail.com>
 <aCG9q6i7HomgilI6@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCG9q6i7HomgilI6@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_022720_460735_838A3AD7 
X-CRM114-Status: GOOD (  37.64  )
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

On Mon, May 12, 2025 at 11:21:47AM +0200, Lorenzo Bianconi wrote:
> > Add phylink support for GDM2/3/4 port that require configuration of the
> > PCS to make the external PHY or attached SFP cage work.
> > 
> > These needs to be defined in the GDM port node using the pcs-handle
> > property.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.c  | 155 +++++++++++++++++++++-
> >  drivers/net/ethernet/airoha/airoha_eth.h  |   3 +
> >  drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
> >  3 files changed, 169 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> > index 16c7896f931f..3be1ae077a76 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/of_net.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/tcp.h>
> > +#include <linux/pcs/pcs.h>
> >  #include <linux/u64_stats_sync.h>
> >  #include <net/dst_metadata.h>
> >  #include <net/page_pool/helpers.h>
> > @@ -79,6 +80,11 @@ static bool airhoa_is_lan_gdm_port(struct airoha_gdm_port *port)
> >  	return port->id == 1;
> >  }
> >  
> > +static bool airhoa_is_phy_external(struct airoha_gdm_port *port)
> > +{
> > +	return port->id != 1;
> > +}
> > +
> >  static void airoha_set_macaddr(struct airoha_gdm_port *port, const u8 *addr)
> >  {
> >  	struct airoha_eth *eth = port->qdma->eth;
> > @@ -1613,6 +1619,17 @@ static int airoha_dev_open(struct net_device *dev)
> >  	struct airoha_gdm_port *port = netdev_priv(dev);
> >  	struct airoha_qdma *qdma = port->qdma;
> >  
> > +	if (airhoa_is_phy_external(port)) {
> > +		err = phylink_of_phy_connect(port->phylink, dev->dev.of_node, 0);
> 
> nit: even if it is not strictly required, in order to align with the rest of the
> codebase, can you please stay below 79 columns?
> 
> > +		if (err) {
> > +			netdev_err(dev, "%s: could not attach PHY: %d\n", __func__,
> > +				   err);
> 
> same here
> 
> > +			return err;
> > +		}
> > +
> > +		phylink_start(port->phylink);
> > +	}
> > +
> >  	netif_tx_start_all_queues(dev);
> >  	err = airoha_set_vip_for_gdm_port(port, true);
> >  	if (err)
> > @@ -1665,6 +1682,11 @@ static int airoha_dev_stop(struct net_device *dev)
> >  		}
> >  	}
> >  
> > +	if (airhoa_is_phy_external(port)) {
> > +		phylink_stop(port->phylink);
> > +		phylink_disconnect_phy(port->phylink);
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > @@ -2795,6 +2817,115 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
> >  	return false;
> >  }
> >  
> > +static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
> > +			       unsigned int mode, phy_interface_t interface,
> > +			       int speed, int duplex, bool tx_pause, bool rx_pause)
> 
> ditto.
> 
> > +{
> > +	struct airoha_gdm_port *port = container_of(config, struct airoha_gdm_port,
> > +						    phylink_config);
> 
> ditto.
> 
> > +	struct airoha_qdma *qdma = port->qdma;
> > +	struct airoha_eth *eth = qdma->eth;
> > +	u32 frag_size_tx, frag_size_rx;
> > +
> > +	if (port->id != 4)
> > +		return;
> > +
> > +	switch (speed) {
> > +	case SPEED_10000:
> > +	case SPEED_5000:
> > +		frag_size_tx = 8;
> > +		frag_size_rx = 8;
> > +		break;
> > +	case SPEED_2500:
> > +		frag_size_tx = 2;
> > +		frag_size_rx = 1;
> > +		break;
> > +	default:
> > +		frag_size_tx = 1;
> > +		frag_size_rx = 0;
> > +	}
> > +
> > +	/* Configure TX/RX frag based on speed */
> > +	airoha_fe_rmw(eth, REG_GDMA4_TMBI_FRAG,
> > +		      GDMA4_SGMII0_TX_FRAG_SIZE_MASK,
> > +		      FIELD_PREP(GDMA4_SGMII0_TX_FRAG_SIZE_MASK,
> > +				 frag_size_tx));
> > +
> > +	airoha_fe_rmw(eth, REG_GDMA4_RMBI_FRAG,
> > +		      GDMA4_SGMII0_RX_FRAG_SIZE_MASK,
> > +		      FIELD_PREP(GDMA4_SGMII0_RX_FRAG_SIZE_MASK,
> > +				 frag_size_rx));
> > +}
> > +
> > +static const struct phylink_mac_ops airoha_phylink_ops = {
> > +	.mac_link_up = airoha_mac_link_up,
> > +};
> > +
> > +static int airoha_setup_phylink(struct net_device *dev)
> > +{
> > +	struct airoha_gdm_port *port = netdev_priv(dev);
> > +	struct device_node *np = dev->dev.of_node;
> > +	struct phylink_pcs **available_pcs;
> > +	phy_interface_t phy_mode;
> > +	struct phylink *phylink;
> > +	unsigned int num_pcs;
> > +	int err;
> > +
> > +	err = of_get_phy_mode(np, &phy_mode);
> > +	if (err) {
> > +		dev_err(&dev->dev, "incorrect phy-mode\n");
> > +		return err;
> > +	}
> > +
> > +	port->phylink_config.dev = &dev->dev;
> > +	port->phylink_config.type = PHYLINK_NETDEV;
> > +	port->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> > +						MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD |
> > +						MAC_5000FD | MAC_10000FD;
> 
> over 79 columns
> 
> > +
> > +	err = fwnode_phylink_pcs_parse(dev_fwnode(&dev->dev), NULL, &num_pcs);
> > +	if (err)
> > +		return err;
> > +
> > +	available_pcs = kcalloc(num_pcs, sizeof(*available_pcs), GFP_KERNEL);
> 
> I guess you can use devm_kcalloc() and get rid of kfree() here.
>

I forgot to answer to this in the previous revision. No devm can't be
used there available_pcs is just an array allocated for phylink_config.

Phylink then copy the data in it and doesn't use it anymore hence it
just needs to be allocated here and doesn't need to stay till the driver
gets removed.

> > +	if (!available_pcs)
> > +		return -ENOMEM;
> > +
> > +	err = fwnode_phylink_pcs_parse(dev_fwnode(&dev->dev), available_pcs,
> > +				       &num_pcs);
> > +	if (err)
> > +		goto out;
> > +
> > +	port->phylink_config.available_pcs = available_pcs;
> > +	port->phylink_config.num_available_pcs = num_pcs;
> > +
> > +	__set_bit(PHY_INTERFACE_MODE_SGMII,
> > +		  port->phylink_config.supported_interfaces);
> > +	__set_bit(PHY_INTERFACE_MODE_1000BASEX,
> > +		  port->phylink_config.supported_interfaces);
> > +	__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> > +		  port->phylink_config.supported_interfaces);
> > +	__set_bit(PHY_INTERFACE_MODE_USXGMII,
> > +		  port->phylink_config.supported_interfaces);
> > +
> > +	phy_interface_copy(port->phylink_config.pcs_interfaces,
> > +			   port->phylink_config.supported_interfaces);
> > +
> > +	phylink = phylink_create(&port->phylink_config,
> > +				 of_fwnode_handle(np),
> > +				 phy_mode, &airoha_phylink_ops);
> > +	if (IS_ERR(phylink)) {
> > +		err = PTR_ERR(phylink);
> > +		goto out;
> > +	}
> > +
> > +	port->phylink = phylink;
> > +out:
> > +	kfree(available_pcs);
> > +
> > +	return err;
> > +}
> > +
> >  static int airoha_alloc_gdm_port(struct airoha_eth *eth,
> >  				 struct device_node *np, int index)
> >  {
> > @@ -2873,7 +3004,23 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
> >  	if (err)
> >  		return err;
> >  
> > -	return register_netdev(dev);
> > +	if (airhoa_is_phy_external(port)) {
> > +		err = airoha_setup_phylink(dev);
> 
> This will re-introduce the issue reported here:
> https://lore.kernel.org/netdev/5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr/
> 

I'm confused about this. The suggestion wasn't that register_netdev
might fail and I need to destroy phylink? Or the linked patch was merged
and I need to rebase on top of net-next?

I didn't include that change to not cause conflicts but once it's merged
I will rebase and include that fix.

> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	err = register_netdev(dev);
> > +	if (err)
> > +		goto free_phylink;
> > +
> > +	return 0;
> > +
> > +free_phylink:
> > +	if (airhoa_is_phy_external(port))
> > +		phylink_destroy(port->phylink);
> > +
> > +	return err;
> >  }
> >  
> >  static int airoha_probe(struct platform_device *pdev)
> > @@ -2967,6 +3114,9 @@ static int airoha_probe(struct platform_device *pdev)
> >  		struct airoha_gdm_port *port = eth->ports[i];
> >  
> >  		if (port && port->dev->reg_state == NETREG_REGISTERED) {
> > +			if (airhoa_is_phy_external(port))
> > +				phylink_destroy(port->phylink);
> > +
> >  			unregister_netdev(port->dev);
> >  			airoha_metadata_dst_free(port);
> >  		}
> > @@ -2994,6 +3144,9 @@ static void airoha_remove(struct platform_device *pdev)
> >  			continue;
> >  
> >  		airoha_dev_stop(port->dev);
> > +		if (airhoa_is_phy_external(port))
> > +			phylink_destroy(port->phylink);
> > +
> >  		unregister_netdev(port->dev);
> >  		airoha_metadata_dst_free(port);
> >  	}
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
> > index 53f39083a8b0..73a500474076 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.h
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> > @@ -498,6 +498,9 @@ struct airoha_gdm_port {
> >  	struct net_device *dev;
> >  	int id;
> >  
> > +	struct phylink *phylink;
> > +	struct phylink_config phylink_config;
> > +
> >  	struct airoha_hw_stats stats;
> >  
> >  	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
> > diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
> > index d931530fc96f..54f7079b28b0 100644
> > --- a/drivers/net/ethernet/airoha/airoha_regs.h
> > +++ b/drivers/net/ethernet/airoha/airoha_regs.h
> > @@ -357,6 +357,18 @@
> >  #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
> >  #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
> >  
> > +#define REG_GDMA4_TMBI_FRAG		0x2028
> > +#define GDMA4_SGMII1_TX_WEIGHT_MASK	GENMASK(31, 26)
> > +#define GDMA4_SGMII1_TX_FRAG_SIZE_MASK	GENMASK(25, 16)
> > +#define GDMA4_SGMII0_TX_WEIGHT_MASK	GENMASK(15, 10)
> > +#define GDMA4_SGMII0_TX_FRAG_SIZE_MASK	GENMASK(9, 0)
> > +
> > +#define REG_GDMA4_RMBI_FRAG		0x202c
> > +#define GDMA4_SGMII1_RX_WEIGHT_MASK	GENMASK(31, 26)
> > +#define GDMA4_SGMII1_RX_FRAG_SIZE_MASK	GENMASK(25, 16)
> > +#define GDMA4_SGMII0_RX_WEIGHT_MASK	GENMASK(15, 10)
> > +#define GDMA4_SGMII0_RX_FRAG_SIZE_MASK	GENMASK(9, 0)
> > +
> >  #define REG_MC_VLAN_EN			0x2100
> >  #define MC_VLAN_EN_MASK			BIT(0)
> >  
> > -- 
> > 2.48.1
> > 



-- 
	Ansuel

