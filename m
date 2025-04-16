Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C09C369C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFa5MOXYGJZnzNbwECy71J6eIeVb1vzSBjf/DthoAfQ=; b=xyCbQrd5igqrpQMi8pEfZJwU2Z
	EnLG1EisKysk7A92Bd3zABciZLkgxuEXwI4T4OXbpPlKRYTBJUYdnMBJbhZJOLlK849xj9PncaotT
	on1+tcsbggUwBlK7Emn50fzkMLVYtPIGGBd3KkxEuPEoFIo3Jt6da4V4IhYkIIx+UHC2cfi8lyAJv
	3wwqNkiGU8hBbShtjyWnBf1IrJgEoBZpss0zfdh/5yBweUHx0ziyLKaYz9BGQFRnRTzEr8PsO/EdK
	I0W0xVMtDopS7XCCFyQBYJFhQ/3THcbkqEw6Oze5tf20OXezI2iOGusUCr02bJUDeeB1PlJFO7RWJ
	Lo7PRxaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u503d-00000009AEC-1Cyd;
	Wed, 16 Apr 2025 10:31:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4yss-00000008wk4-2nPq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 09:16:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E44642B60;
	Wed, 16 Apr 2025 09:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DD6C4CEE2;
	Wed, 16 Apr 2025 09:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744795002;
	bh=hY7p3m5X0OOft3dhhs3uhZGYBnQpfn9DlIDiE50gYNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uaUqEwxsykjInJ62sBQ3icULCRHLAodwkEXAyOvS613sBBl8V4XwJieKRR70ZNSRo
	 sORxELLDb1lvsUeUtfYiZkKEe8CY+EAZP06AL9mkCFhE9DoooapeaccHXYZrhHEMsg
	 qb2P6bHCitt0DwDuimqyL9TQ1C2IswUiSQipaUsZSeazpYM7zplz2muGRbtavhGTco
	 GG4r96fbMsyV2Jloo+7nHDHbtlSHGjYxG9WY2DBqz56xjOy/miriXUhr9flsjmRUgv
	 A6JT2MXZ6p8URA+lrTJ1TPTzca+pn4i0Hh2y/Y51506TjfwfJ9kuSRMlICXH6GMTnl
	 L5UALTB4jBGWQ==
Date: Wed, 16 Apr 2025 10:16:32 +0100
From: Simon Horman <horms@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v5 02/11] net: ti: prueth: Adds ICSSM Ethernet
 driver
Message-ID: <20250416091632.GM395307@horms.kernel.org>
References: <20250414113458.1913823-1-parvathi@couthit.com>
 <20250414113458.1913823-3-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414113458.1913823-3-parvathi@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_021642_740748_2E769934 
X-CRM114-Status: GOOD (  25.33  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, basharath@couthit.com, kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, s.hauer@pengutronix.de, prajith@ti.com, rogerq@kernel.org, jacob.e.keller@intel.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Apr 14, 2025 at 05:04:49PM +0530, Parvathi Pudi wrote:
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
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>

...

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c

...

> +static int icssm_prueth_probe(struct platform_device *pdev)
> +{
> +	struct device_node *eth0_node = NULL, *eth1_node = NULL;
> +	struct device_node *eth_node, *eth_ports_node;
> +	enum pruss_pru_id pruss_id0, pruss_id1;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np;
> +	struct prueth *prueth;
> +	int i, ret;
> +
> +	np = dev->of_node;
> +	if (!np)
> +		return -ENODEV; /* we don't support non DT */
> +
> +	prueth = devm_kzalloc(dev, sizeof(*prueth), GFP_KERNEL);
> +	if (!prueth)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, prueth);
> +	prueth->dev = dev;
> +	prueth->fw_data = device_get_match_data(dev);
> +
> +	eth_ports_node = of_get_child_by_name(np, "ethernet-ports");
> +	if (!eth_ports_node)
> +		return -ENOENT;
> +
> +	for_each_child_of_node(eth_ports_node, eth_node) {
> +		u32 reg;
> +
> +		if (strcmp(eth_node->name, "ethernet-port"))
> +			continue;
> +		ret = of_property_read_u32(eth_node, "reg", &reg);
> +		if (ret < 0) {
> +			dev_err(dev, "%pOF error reading port_id %d\n",
> +				eth_node, ret);
> +		}
> +
> +		of_node_get(eth_node);

Hi Roger, Parvathi, all,

I feel that I'm missing something obvious here.
But I have some questions about the reference to eth_node
taken on the line above.

> +
> +		if (reg == 0) {
> +			eth0_node = eth_node;

If, while iterating through the for loop above, we reach this point more
than once, then will the reference to the previously node assigned to
eth0_node be leaked?

> +			if (!of_device_is_available(eth0_node)) {
> +				of_node_put(eth0_node);
> +				eth0_node = NULL;
> +			}
> +		} else if (reg == 1) {
> +			eth1_node = eth_node;

Likewise here for eth1_node.

> +			if (!of_device_is_available(eth1_node)) {
> +				of_node_put(eth1_node);
> +				eth1_node = NULL;
> +			}
> +		} else {
> +			dev_err(dev, "port reg should be 0 or 1\n");

And, perhaps more to the point, is the reference to eth_node leaked if
we reach this line?

> +		}
> +	}
> +
> +	of_node_put(eth_ports_node);
> +
> +	/* At least one node must be present and available else we fail */
> +	if (!eth0_node && !eth1_node) {
> +		dev_err(dev, "neither port0 nor port1 node available\n");
> +		return -ENODEV;
> +	}
> +
> +	if (eth0_node == eth1_node) {

Given the if / else if condition in the for loop above,
I'm not sure this can ever occur.

> +		dev_err(dev, "port0 and port1 can't have same reg\n");
> +		of_node_put(eth0_node);
> +		return -ENODEV;
> +	}
> +
> +	prueth->eth_node[PRUETH_MAC0] = eth0_node;
> +	prueth->eth_node[PRUETH_MAC1] = eth1_node;
> +
> +	if (eth0_node) {
> +		prueth->pru0 = pru_rproc_get(np, 0, &pruss_id0);
> +		if (IS_ERR(prueth->pru0)) {
> +			ret = PTR_ERR(prueth->pru0);
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev, "unable to get PRU0: %d\n", ret);
> +			goto put_pru;
> +		}
> +	}
> +
> +	if (eth1_node) {
> +		prueth->pru1 = pru_rproc_get(np, 1, &pruss_id1);
> +		if (IS_ERR(prueth->pru1)) {
> +			ret = PTR_ERR(prueth->pru1);
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev, "unable to get PRU1: %d\n", ret);
> +			goto put_pru;
> +		}
> +	}
> +
> +	/* setup netdev interfaces */
> +	if (eth0_node) {
> +		ret = icssm_prueth_netdev_init(prueth, eth0_node);
> +		if (ret) {
> +			if (ret != -EPROBE_DEFER) {
> +				dev_err(dev, "netdev init %s failed: %d\n",
> +					eth0_node->name, ret);
> +			}
> +			goto put_pru;
> +		}
> +	}
> +
> +	if (eth1_node) {
> +		ret = icssm_prueth_netdev_init(prueth, eth1_node);
> +		if (ret) {
> +			if (ret != -EPROBE_DEFER) {
> +				dev_err(dev, "netdev init %s failed: %d\n",
> +					eth1_node->name, ret);
> +			}
> +			goto netdev_exit;
> +		}
> +	}
> +
> +	/* register the network devices */
> +	if (eth0_node) {
> +		ret = register_netdev(prueth->emac[PRUETH_MAC0]->ndev);
> +		if (ret) {
> +			dev_err(dev, "can't register netdev for port MII0");
> +			goto netdev_exit;
> +		}
> +
> +		prueth->registered_netdevs[PRUETH_MAC0] =
> +			prueth->emac[PRUETH_MAC0]->ndev;
> +	}
> +
> +	if (eth1_node) {
> +		ret = register_netdev(prueth->emac[PRUETH_MAC1]->ndev);
> +		if (ret) {
> +			dev_err(dev, "can't register netdev for port MII1");
> +			goto netdev_unregister;
> +		}
> +
> +		prueth->registered_netdevs[PRUETH_MAC1] =
> +			prueth->emac[PRUETH_MAC1]->ndev;
> +	}
> +
> +	if (eth1_node)
> +		of_node_put(eth1_node);
> +	if (eth0_node)
> +		of_node_put(eth0_node);
> +	return 0;
> +
> +netdev_unregister:
> +	for (i = 0; i < PRUETH_NUM_MACS; i++) {
> +		if (!prueth->registered_netdevs[i])
> +			continue;
> +		unregister_netdev(prueth->registered_netdevs[i]);
> +	}
> +
> +netdev_exit:
> +	for (i = 0; i < PRUETH_NUM_MACS; i++) {
> +		eth_node = prueth->eth_node[i];
> +		if (!eth_node)
> +			continue;
> +
> +		icssm_prueth_netdev_exit(prueth, eth_node);
> +	}
> +
> +put_pru:
> +	if (eth1_node) {
> +		if (prueth->pru1)
> +			pru_rproc_put(prueth->pru1);
> +		of_node_put(eth1_node);
> +	}
> +
> +	if (eth0_node) {
> +		if (prueth->pru0)
> +			pru_rproc_put(prueth->pru0);
> +		of_node_put(eth0_node);
> +	}
> +
> +	return ret;
> +}
> +
> +static void icssm_prueth_remove(struct platform_device *pdev)
> +{
> +	struct prueth *prueth = platform_get_drvdata(pdev);
> +	struct device_node *eth_node;
> +	int i;
> +
> +	for (i = 0; i < PRUETH_NUM_MACS; i++) {
> +		if (!prueth->registered_netdevs[i])
> +			continue;
> +		unregister_netdev(prueth->registered_netdevs[i]);
> +	}
> +
> +	for (i = 0; i < PRUETH_NUM_MACS; i++) {
> +		eth_node = prueth->eth_node[i];
> +		if (!eth_node)
> +			continue;
> +
> +		icssm_prueth_netdev_exit(prueth, eth_node);
> +		of_node_put(eth_node);
> +	}
> +
> +	pruss_put(prueth->pruss);
> +
> +	if (prueth->eth_node[PRUETH_MAC0])
> +		pru_rproc_put(prueth->pru0);
> +	if (prueth->eth_node[PRUETH_MAC1])
> +		pru_rproc_put(prueth->pru1);
> +}

...

