Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07498E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 16:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzR/wMuf1nnyhOUGoFlXNXtnpWcAtaCPW+hwUeyzxTc=; b=uqSta8CQqMJAUMjabKiSlSo5FM
	b0PxZPmKO/SdC4E29klj1Pddbr1RFiWU726XrzpmNRF9HdUPEHnvC3lWHjRxkoDblRIrs/+B5mXnM
	LJzk8EoSRMcP7SNnLRmW1FuYez1t3YR4XcMrcunbPkYr07lAPBg7IbNXJvZSH/ckFVUjZNl3ywiIZ
	nA/7ejj+0QLx0H7aR7TzosnGMdSbgdIlPdgxr/EYCX6EKZpuDoVzKpQTIKPUJyC4CwVLB9lQ0q/wH
	VFgU+l62DZqdXlOB5F1iItkqYahYUoC/GRh/VqC8d5hYoQVU3vmojSnkJWAfsb+CLx4CZ2WztxlRN
	0Vl7mFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVv04-0000000CahZ-40IE;
	Thu, 09 Jan 2025 16:03:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuwy-0000000CZp9-11qc;
	Thu, 09 Jan 2025 16:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pzR/wMuf1nnyhOUGoFlXNXtnpWcAtaCPW+hwUeyzxTc=; b=uY95dm5IbEO+lZ/23kUPcLn0me
	vj53OxQCxDOZLeTmmmXdHJNiicpSNuHU+LTtw18kblwwKJ0xPK74hPe6UBQCRRGxR59YjYNjzZtiZ
	lHM3fZm8hJO5B82TcpMRi8UWvlGCTcKHm8dxAydn8WeYDcvB11sNd9ZzJTD2ZH1LCcyo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVuwk-002wO9-6i; Thu, 09 Jan 2025 16:59:46 +0100
Date: Thu, 9 Jan 2025 16:59:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC PATCH 02/10] net: ti: prueth: Adds ICSSM Ethernet driver
Message-ID: <5ba6bbf2-52e4-49d0-b6e2-134fb25ebe4c@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com>
 <20250109105600.41297-3-basharath@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109105600.41297-3-basharath@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_080000_289831_2EB2B220 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, krishna@couthit.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, rogerq@kernel.org, ssantosh@kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, parvathi@couthit.com, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> +	emac->phy_node = of_parse_phandle(eth_node, "phy-handle", 0);
> +	if (!emac->phy_node) {
> +		dev_err(prueth->dev, "couldn't find phy-handle\n");
> +		ret = -ENODEV;
> +		goto free;
> +	}
> +
> +	ret = of_get_phy_mode(eth_node, &emac->phy_if);
> +	if (ret) {
> +		dev_err(prueth->dev, "could not get phy-mode property err %d\n",
> +			ret);
> +		goto free;
> +	}
> +
> +	/* connect PHY */
> +	emac->phydev = of_phy_connect(ndev, emac->phy_node,
> +				      &icssm_emac_adjust_link, 0, emac->phy_if);
> +	if (!emac->phydev) {
> +		dev_dbg(prueth->dev, "couldn't connect to phy %s\n",
> +			emac->phy_node->full_name);
> +		ret = -EPROBE_DEFER;
> +		goto free;
> +	}

of_phy_get_and_connect() will simplify this.

> +	/* remove unsupported modes */
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_10baseT_Half_BIT);
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_10baseT_Full_BIT);

It only does 100Mbps?

> +	if (of_property_read_bool(eth_node, "ti,no-half-duplex")) {

Is this becasue 100baseT_Half is broken in some versions of the
hardware?

> +		phy_remove_link_mode(emac->phydev,
> +				     ETHTOOL_LINK_MODE_100baseT_Half_BIT);
> +	}
> +
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_Pause_BIT);
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_Asym_Pause_BIT);

Is this really needed? I've not checked, but if you don't call
phy_support_sym_pause() or phy_support_asym_pause(), i would of
expected phylib to default to no pause?

> +static const struct of_device_id prueth_dt_match[];

Please avoid forward references. If you need the match table, define
it here.

	Andrew

