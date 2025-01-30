Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02113C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 11:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+McScTp9Xu8fT5jiDs9SNfKbeTnPRaQvzfdR6bD+nM=; b=r9ov+/VFq3WDy2lF6Kn1Fz0y8I
	ye2DA6exKai9o8jx0iqy9hkX4VjS+labgpXGdVNoeKEEtN71oZNobHGVqqAo2g4Qb4axQoX9dgS6E
	6IRS00onxDYnLrhAVsBVXryiD+/3dyD6vEizZtBmZ+qy2YSyNrAi58cmo25v7LdsyVpH+rpipfAId
	GZJIVI3AF+uQ+DOKC326CUXhU/l6Sxp9zEzFJBVwjpOJ0+9Cw5O+ylyQchuGAbP1TaavB8usQ5DoK
	exRL+EZG+jMJuHPOEt7F+TqpVPHmspRzF2Fmy8MFRDmccTIUAah0yqVPWQ1iboW3cgD0plh/BMMSz
	uH8YkElw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdSx5-00000008j0p-0grK;
	Thu, 30 Jan 2025 11:43:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdSvj-00000008iqu-2sCq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 11:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C2ADA5C5F01;
	Thu, 30 Jan 2025 11:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA076C4CED2;
	Thu, 30 Jan 2025 11:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738237314;
	bh=zGGDx72jO5SaCwxhGo8Hf3CSZMZACAKlKE/UujYgRPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DVeS/PJ55W7IvF7P3tKbosmE6FOorkc/HwVcjgBKE4RcehzsLYuFEEyhFjAjOfEk+
	 oUKNhRM7zYp5izAXKmJUjv75tJFPy1TY9pDc1Vys0MhJpf/j3lMvEytBz5+/fpjqiB
	 kMPTGT/slnYOqvCvAciwcdpFNK/phdbPXTQYX61PrAQBqREcwO96j67r0P56dB9HcH
	 qWdGIY9lpZDpPY+ZRhIu1N2GaeGEKA2G89E4dQUovpHs+54lzsLNL5m1sXqLm8Eg88
	 1BxQngOUNnhBo+iAXFBUnJ8DC6hmPbUcWLLTiPsUnKYl/NoPF2hFnOB8TmSLQOzxdW
	 ONG2Y1kM3Thgw==
Date: Thu, 30 Jan 2025 11:41:45 +0000
From: Simon Horman <horms@kernel.org>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC v2 PATCH 02/10] net: ti: prueth: Adds ICSSM Ethernet driver
Message-ID: <20250130114145.GM113107@kernel.org>
References: <20250124122353.1457174-1-basharath@couthit.com>
 <20250124122353.1457174-3-basharath@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124122353.1457174-3-basharath@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_034155_816866_D30608B0 
X-CRM114-Status: GOOD (  22.95  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, krishna@couthit.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, rogerq@kernel.org, ssantosh@kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, parvathi@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jan 24, 2025 at 05:53:45PM +0530, Basharath Hussain Khaja wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> Updates Kernel configuration to enable PRUETH driver and its dependencies
> along with makefile changes to add the new PRUETH driver.
> 
> Changes includes init and deinit of ICSSM PRU Ethernet driver including
> net dev registration and firmware loading for DUAL-MAC mode running on
> PRU-ICSS2 instance.
> 
> Changes also includes link handling, PRU booting, default firmware loading
> and PRU stopping using existing remoteproc driver APIs.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>

...

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c

...

> +static int icssm_emac_set_boot_pru(struct prueth_emac *emac,
> +				   struct net_device *ndev)
> +{
> +	const struct prueth_firmware *pru_firmwares;
> +	struct prueth *prueth = emac->prueth;
> +	const char *fw_name;
> +	int ret;
> +
> +	pru_firmwares = &prueth->fw_data->fw_pru[emac->port_id - 1];
> +	fw_name = pru_firmwares->fw_name[prueth->eth_type];
> +	if (!fw_name) {
> +		netdev_err(ndev, "eth_type %d not supported\n",
> +			   prueth->eth_type);
> +		return -ENODEV;
> +	}
> +
> +	ret = rproc_set_firmware(emac->pru, fw_name);
> +	if (ret) {
> +		netdev_err(ndev, "failed to set PRU0 firmware %s: %d\n",
> +			   fw_name, ret);
> +		return ret;
> +	}
> +
> +	ret = rproc_boot(emac->pru);
> +	if (ret) {
> +		netdev_err(ndev, "failed to boot PRU0: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * icssm_emac_ndo_open - EMAC device open
> + * @ndev: network adapter device
> + *
> + * Called when system wants to start the interface.
> + *
> + * Return: 0 for a successful open, or appropriate error code
> + */
> +static int icssm_emac_ndo_open(struct net_device *ndev)
> +{
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	int ret;
> +
> +	ret = icssm_emac_set_boot_pru(emac, ndev);
> +	if (ret)
> +		netdev_err(ndev, "failed to boot PRU: %d\n", ret);

Hi Roger, Basharath, all,

icssm_emac_set_boot_pru() already logs errors, including the one above.
So this log seems unnecessary to me.

Also, should an error be returned here?  If so, it looks like
icssm_emac_set_boot_pru() should release resources allocated by
rproc_set_firmware() if rproc_boot() fails.

> +
> +	/* start PHY */
> +	phy_start(emac->phydev);
> +
> +	return 0;
> +}

...

> +static int icssm_prueth_netdev_init(struct prueth *prueth,
> +				    struct device_node *eth_node)
> +{
> +	struct prueth_emac *emac;
> +	struct net_device *ndev;
> +	enum prueth_port port;
> +	enum prueth_mac mac;
> +	int ret;
> +
> +	port = icssm_prueth_node_port(eth_node);
> +	if (port == PRUETH_PORT_INVALID)
> +		return -EINVAL;
> +
> +	mac = icssm_prueth_node_mac(eth_node);
> +	if (mac == PRUETH_MAC_INVALID)
> +		return -EINVAL;
> +
> +	ndev = devm_alloc_etherdev(prueth->dev, sizeof(*emac));
> +	if (!ndev)
> +		return -ENOMEM;
> +
> +	SET_NETDEV_DEV(ndev, prueth->dev);
> +	emac = netdev_priv(ndev);
> +	prueth->emac[mac] = emac;
> +	emac->prueth = prueth;
> +	emac->ndev = ndev;
> +	emac->port_id = port;
> +
> +	/* by default eth_type is EMAC */
> +	switch (port) {
> +	case PRUETH_PORT_MII0:
> +		emac->pru = prueth->pru0;
> +		break;
> +	case PRUETH_PORT_MII1:
> +		emac->pru = prueth->pru1;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	/* get mac address from DT and set private and netdev addr */
> +	ret = of_get_ethdev_address(eth_node, ndev);
> +	if (!is_valid_ether_addr(ndev->dev_addr)) {
> +		eth_hw_addr_random(ndev);
> +		dev_warn(prueth->dev, "port %d: using random MAC addr: %pM\n",
> +			 port, ndev->dev_addr);
> +	}
> +	ether_addr_copy(emac->mac_addr, ndev->dev_addr);
> +
> +	/* connect PHY */
> +	emac->phydev = of_phy_get_and_connect(ndev, eth_node,
> +					      icssm_emac_adjust_link);
> +	if (!emac->phydev) {
> +		dev_dbg(prueth->dev, "PHY connection failed\n");
> +		ret = -EPROBE_DEFER;

Perhaps I misunderstand things, but if this occurs then
presumably icssm_prueth_netdev_init() will be called again.
And for each time this occirs another ndev will be allocated
by devm_alloc_etherdev(), each of which will only be freed
once the device is eventually torn-down.

I wonder if it would be better to free ndev here.
Which I think would imply using a non-mdev allocation for symmetry.

Similarly for resources allocated in the caller icssm_prueth_probe().

> +		goto free;
> +	}
> +
> +	/* remove unsupported modes */
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_10baseT_Full_BIT);
> +
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_10baseT_Half_BIT);
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_100baseT_Half_BIT);
> +
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_Pause_BIT);
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_Asym_Pause_BIT);
> +
> +	ndev->netdev_ops = &emac_netdev_ops;
> +
> +	return 0;
> +free:

nit: This doesn't free anything.

> +	prueth->emac[mac] = NULL;
> +
> +	return ret;
> +}

...

