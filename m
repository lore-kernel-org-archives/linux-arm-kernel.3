Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFB1C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 15:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Ljq0x+gQrPocgCwIiLM0qy3E5K0xFGd262RGrsL+iU=; b=QNS387W1Ffj7/UNNJdMX9Xnore
	YF4He2duolHEtLYYOq0QQgdjgP0m18U+cvDbIhw69dHZ1FNCtHjsOejCHAT46rwGDrxSqNuW6dZw9
	ANMYfuxwQ4/rFs8KNmMhvH2zH3Mn2MCc688tnQpr/TZ0hdapgDuliatp0lHOD3aalvxyQf8sGCETb
	zfnyRw7/QtVTGQ6aH2lqxgvhmwuE7DTladoKrECQry1DiF5DQa4HdcfjswpZQ9Z/tMQZQpW0TahmE
	IEk83B/jCT3FCaBUlwJI1sLdXy3+kOvORnbR6WU8y7LCAL/IBus9m4HjtHJATszg7t9hGIOIhO68d
	anzvrNuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdWmi-000000095Wd-1XaC;
	Thu, 30 Jan 2025 15:48:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdWlO-000000095NN-2VY3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 15:47:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E45BA41C28;
	Thu, 30 Jan 2025 15:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A69C4CED2;
	Thu, 30 Jan 2025 15:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738252049;
	bh=entpPE/XLPTAVOjCVIGfmXrS7TW5SiMVBiEBoUBQ29w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNqhNetF+tuv+izOBYtId4d7tRJktDS290e2LBOm4cuIvpZ6A7E38D1G0SYYXcSeb
	 cbfc0TbNwZSvOERlqgXg8URWDnl6mi8Mp31xTLHfotUn9rbZ9vuLWxsC2q8jnvqPyH
	 efPv2J30V36odxeIFjJ1uDWqbsSqmoauwdBOALu3Y/2p44ccNLjI7DYvOFS0WRVOvT
	 vtGm9OsViLdQnCS4xO4b/bB9J7BRo4spcc3syfrZBZTBz9PUkhCNwh4lplMD9wrK6n
	 JaIC9wW9InxbK3UabzuKAkfjlzhg1gt2rwx4vyTzf9J/Kj4WYDk7YEKAoUQp8KBGho
	 LrO9SaR8Vyt9w==
Date: Thu, 30 Jan 2025 15:47:19 +0000
From: Simon Horman <horms@kernel.org>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC v2 PATCH 03/10] net: ti: prueth: Adds PRUETH HW and SW
 configuration
Message-ID: <20250130154719.GB13457@kernel.org>
References: <20250124122353.1457174-1-basharath@couthit.com>
 <20250124122353.1457174-4-basharath@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124122353.1457174-4-basharath@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_074730_769181_7009C1D5 
X-CRM114-Status: GOOD (  25.11  )
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

On Fri, Jan 24, 2025 at 05:53:46PM +0530, Basharath Hussain Khaja wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> Updates for MII_RT hardware peripheral configuration such as RX and TX
> configuration for PRU0 and PRU1, frame sizes, and MUX config.
> 
> Updates for PRU-ICSS firmware register configuration and DRAM, SRAM and
> OCMC memory initialization, which will be used in the runtime for packet
> reception and transmission.
> 
> DUAL-EMAC memory allocation for software queues and its supporting
> components such as the buffer descriptors and queue discriptors. These

nit: descriptors

> software queues are placed in OCMC memory and are shared with CPU by
> PRU-ICSS for packet receive and transmit.
> 
> All declarations and macros are being used from common header file
> for various protocols.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>

...

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c

...

> +static void icssm_prueth_mii_init(struct prueth *prueth)
> +{
> +	struct regmap *mii_rt;
> +	u32 rxcfg_reg, rxcfg;
> +	u32 txcfg_reg, txcfg;
> +
> +	mii_rt = prueth->mii_rt;
> +
> +	rxcfg = PRUSS_MII_RT_RXCFG_RX_ENABLE |
> +		PRUSS_MII_RT_RXCFG_RX_DATA_RDY_MODE_DIS |
> +		PRUSS_MII_RT_RXCFG_RX_L2_EN |
> +		PRUSS_MII_RT_RXCFG_RX_CUT_PREAMBLE |
> +		PRUSS_MII_RT_RXCFG_RX_L2_EOF_SCLR_DIS;
> +
> +	/* Configuration of Port 0 Rx */
> +	rxcfg_reg = PRUSS_MII_RT_RXCFG0;
> +
> +	regmap_write(mii_rt, rxcfg_reg, rxcfg);
> +
> +	/* Configuration of Port 1 Rx */
> +	rxcfg_reg = PRUSS_MII_RT_RXCFG1;
> +
> +	rxcfg |= PRUSS_MII_RT_RXCFG_RX_MUX_SEL;
> +
> +	regmap_write(mii_rt, rxcfg_reg, rxcfg);
> +
> +	txcfg = PRUSS_MII_RT_TXCFG_TX_ENABLE |
> +		PRUSS_MII_RT_TXCFG_TX_AUTO_PREAMBLE |
> +		PRUSS_MII_RT_TXCFG_TX_32_MODE_EN |
> +		(TX_START_DELAY << PRUSS_MII_RT_TXCFG_TX_START_DELAY_SHIFT) |
> +		(TX_CLK_DELAY_100M << PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_SHIFT);
> +
> +	/* Configuration of Port 0 Tx */
> +	txcfg_reg = PRUSS_MII_RT_TXCFG0;
> +
> +	regmap_write(mii_rt, txcfg_reg, txcfg);
> +
> +	txcfg	|= PRUSS_MII_RT_TXCFG_TX_MUX_SEL;

nit: a space seems more appropriate than a tab before '|='

> +
> +	/* Configuration of Port 1 Tx */
> +	txcfg_reg = PRUSS_MII_RT_TXCFG1;
> +
> +	regmap_write(mii_rt, txcfg_reg, txcfg);
> +
> +	txcfg_reg = PRUSS_MII_RT_RX_FRMS0;
> +
> +	/* Min frame length should be set to 64 to allow receive of standard
> +	 * Ethernet frames such as PTP, LLDP that will not have the tag/rct.
> +	 * Actual size written to register is size - 1 per TRM. This also
> +	 * includes CRC/FCS.
> +	 */
> +	txcfg = (((PRUSS_MII_RT_RX_FRMS_MIN_FRM - 1) <<
> +			PRUSS_MII_RT_RX_FRMS_MIN_FRM_SHIFT) &
> +			PRUSS_MII_RT_RX_FRMS_MIN_FRM_MASK);
> +
> +	/* For EMAC, set Max frame size to 1528 i.e size with VLAN.
> +	 * Actual size written to register is size - 1 as per TRM.
> +	 * Since driver support run time change of protocol, driver
> +	 * must overwrite the values based on Ethernet type.
> +	 */
> +	txcfg |= (((PRUSS_MII_RT_RX_FRMS_MAX_SUPPORT_EMAC - 1) <<
> +			   PRUSS_MII_RT_RX_FRMS_MAX_FRM_SHIFT)	&
> +			   PRUSS_MII_RT_RX_FRMS_MAX_FRM_MASK);
> +
> +	regmap_write(mii_rt, txcfg_reg, txcfg);
> +
> +	txcfg_reg = PRUSS_MII_RT_RX_FRMS1;
> +
> +	regmap_write(mii_rt, txcfg_reg, txcfg);
> +}

...

> @@ -377,6 +705,70 @@ static int icssm_prueth_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	pruss = pruss_get(prueth->pru0 ? prueth->pru0 : prueth->pru1);
> +	if (IS_ERR(pruss)) {
> +		ret = PTR_ERR(pruss);
> +		dev_err(dev, "unable to get pruss handle\n");
> +		goto put_pru;
> +	}
> +	prueth->pruss = pruss;
> +
> +	ret = pruss_cfg_ocp_master_ports(prueth->pruss, 1);
> +	if (ret) {
> +		dev_err(dev, "couldn't enabled ocp master port: %d\n", ret);
> +		goto put_pruss;
> +	}

FTR, I applied this patch set on top of the patch at the link below
so that pruss_cfg_ocp_master_ports() is present.

- [PATCH v2 1/1] soc: ti: PRUSS OCP configuration
  https://lore.kernel.org/all/20250108125937.10604-2-basharath@couthit.com/

  ...

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.h b/drivers/net/ethernet/ti/icssm/icssm_prueth.h

...

> +/**
> + * struct prueth_queue - Information about a queue in memory

struct prueth_queue_info

> + * @buffer_offset: buffer offset in OCMC RAM
> + * @queue_desc_offset: queue descriptor offset in Shared RAM
> + * @buffer_desc_offset: buffer descriptors offset in Shared RAM
> + * @buffer_desc_end: end address of buffer descriptors in Shared RAM
> + */
> +struct prueth_queue_info {
> +	u16 buffer_offset;
> +	u16 queue_desc_offset;
> +	u16 buffer_desc_offset;
> +	u16 buffer_desc_end;
> +} __packed;

...

