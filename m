Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15511C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 17:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYsz00y8QAdPl5/2ZJOPuA+CJghZCXNAP0Lb4iHuHdo=; b=QkEwaX2MmCADE5CFwb46E5ZP1s
	J1w14Dj0M+0hHfMvMfHl6G/8Mv3kpvQPvPajvIZLxmHZN9peXYnoFXaAWs7983gSeVndVyFf5V/vx
	WBwsf3vUcScc0xnWTKshO/rHuw1eSpv8WnpHrRvM5oq65LpR6rwsdR65jCKeCpk41LgSbrmCTMWIK
	Oo3puKWUzzhSXTkQPEPvPo66Vj25NvBbzCFwDgNc8fPon63f9NDokRrSubkqqtKZQorMe5iCesDCl
	bdFQ7BmregAh2R0p0p9jkkQNMZsz1eNgS2hJsAuexNT3S2Zqg5PXDPDLD6XoI8SImIp5UKZsl87DI
	J+Tker8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYHM-00000009GrQ-2BV2;
	Thu, 30 Jan 2025 17:24:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYG2-00000009Gl6-2XZI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:23:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35CFBA41FBA;
	Thu, 30 Jan 2025 17:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F4AC4CED2;
	Thu, 30 Jan 2025 17:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738257793;
	bh=yH4FEbQVXyMxFaB7hk1ruwl/3FyAw8z0JzuE+B/DXpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=upySuXt69EgxtJcJBjPKJLKq/sT++GHdJLl2ro5gBbZNK4U64HWApRXSLxfb8eFw0
	 CI/IjFGVut8N3OHewG3MvKiRmcSfSNNZ5ykiHjTTGmeYvMj9VBh5/2BZ1n2iVT7nRk
	 +EI23txGIo3cN3lTDEqeHccBBtQHqfvwuULpBtGjEi0XC4aivzW02RTO80hTOgADBc
	 wbX9ocvq5U3cJU64lLn7bWeQyrWuXI050ij/SsZRqm8NAzJfMoTZk8rUqPfzOJTngl
	 +g8cdyMfWtmFvIENKtDO8EOaaMMMKJtNs7wz+mFGikGXV2YXP/9TUsiVK8Mo47P7TW
	 GabRao+AJ+L0Q==
Date: Thu, 30 Jan 2025 17:23:04 +0000
From: Simon Horman <horms@kernel.org>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC v2 PATCH 05/10] net: ti: prueth: Adds ethtool support for
 ICSSM PRUETH Driver
Message-ID: <20250130172304.GD13457@kernel.org>
References: <20250124122353.1457174-1-basharath@couthit.com>
 <20250124134056.1459060-6-basharath@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124134056.1459060-6-basharath@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_092314_769578_C7A5C892 
X-CRM114-Status: GOOD (  16.44  )
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

On Fri, Jan 24, 2025 at 07:10:51PM +0530, Basharath Hussain Khaja wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> Changes for enabling ethtool support for the newly added PRU Ethernet
> interfaces. Extends the support for statistics collection from PRU internal
> memory and displays it in the user space. Along with statistics,
> enable/disable of features, configuring link speed etc.are now supported.
> 
> The firmware running on PRU maintains statistics in internal data memory.
> When requested ethtool collects all the statistics for the specified
> interface and displays it in the user space.
> 
> Makefile is updated to include ethtool support into PRUETH driver.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>

...

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_ethtool.c b/drivers/net/ethernet/ti/icssm/icssm_ethtool.c

...

> +static const struct {
> +	char string[ETH_GSTRING_LEN];
> +	u32 offset;
> +} prueth_ethtool_stats[] = {
> +	{"txBcast", PRUETH_STAT_OFFSET(tx_bcast)},
> +	{"txMcast", PRUETH_STAT_OFFSET(tx_mcast)},
> +	{"txUcast", PRUETH_STAT_OFFSET(tx_ucast)},
> +	{"txOctets", PRUETH_STAT_OFFSET(tx_octets)},
> +	{"rxBcast", PRUETH_STAT_OFFSET(rx_bcast)},
> +	{"rxMcast", PRUETH_STAT_OFFSET(rx_mcast)},
> +	{"rxUcast", PRUETH_STAT_OFFSET(rx_ucast)},
> +	{"rxOctets", PRUETH_STAT_OFFSET(rx_octets)},

Hi Roger, Basharath, all,

There seems to be some overlap between the above and struct rtnl_link_stats64.

Please implement those stats which are present in struct rtnl_link_stats64
using ndo_get_stats64 and omit them from your implementation of
get_ethtool_stats.

IOW, get_ethtool_stats() is for extended stats, whereas is for standard
stats ndo_get_stats64().  And standard stats should not be presented to the
user as extended stats.

Link: https://docs.kernel.org/networking/statistics.html#notes-for-driver-authors

> +	{"tx64byte", PRUETH_STAT_OFFSET(tx64byte)},
> +	{"tx65_127byte", PRUETH_STAT_OFFSET(tx65_127byte)},
> +	{"tx128_255byte", PRUETH_STAT_OFFSET(tx128_255byte)},
> +	{"tx256_511byte", PRUETH_STAT_OFFSET(tx256_511byte)},
> +	{"tx512_1023byte", PRUETH_STAT_OFFSET(tx512_1023byte)},
> +	{"tx1024byte", PRUETH_STAT_OFFSET(tx1024byte)},
> +	{"rx64byte", PRUETH_STAT_OFFSET(rx64byte)},
> +	{"rx65_127byte", PRUETH_STAT_OFFSET(rx65_127byte)},
> +	{"rx128_255byte", PRUETH_STAT_OFFSET(rx128_255byte)},
> +	{"rx256_511byte", PRUETH_STAT_OFFSET(rx256_511byte)},
> +	{"rx512_1023byte", PRUETH_STAT_OFFSET(rx512_1023byte)},
> +	{"rx1024byte", PRUETH_STAT_OFFSET(rx1024byte)},

Similarly, the above, along with rxOverSizedFrames and rxUnderSizedFrames
below seem to be RMON (RFC 2819) statistics. So I think they should
be handled by implementing get_rmon_stats().

> +
> +	{"lateColl", PRUETH_STAT_OFFSET(late_coll)},
> +	{"singleColl", PRUETH_STAT_OFFSET(single_coll)},
> +	{"multiColl", PRUETH_STAT_OFFSET(multi_coll)},
> +	{"excessColl", PRUETH_STAT_OFFSET(excess_coll)},

And likewise, the section above and below seem to overlap
with Basic IEEE 802.3 MAC statistics which I believe
should be handled by implementing get_eth_mac_stats()

> +
> +	{"rxMisAlignmentFrames", PRUETH_STAT_OFFSET(rx_misalignment_frames)},
> +	{"stormPrevCounterBC", PRUETH_STAT_OFFSET(stormprev_counter_bc)},
> +	{"stormPrevCounterMC", PRUETH_STAT_OFFSET(stormprev_counter_mc)},
> +	{"stormPrevCounterUC", PRUETH_STAT_OFFSET(stormprev_counter_uc)},
> +	{"macRxError", PRUETH_STAT_OFFSET(mac_rxerror)},
> +	{"SFDError", PRUETH_STAT_OFFSET(sfd_error)},
> +	{"defTx", PRUETH_STAT_OFFSET(def_tx)},
> +	{"macTxError", PRUETH_STAT_OFFSET(mac_txerror)},
> +	{"rxOverSizedFrames", PRUETH_STAT_OFFSET(rx_oversized_frames)},
> +	{"rxUnderSizedFrames", PRUETH_STAT_OFFSET(rx_undersized_frames)},
> +	{"rxCRCFrames", PRUETH_STAT_OFFSET(rx_crc_frames)},
> +	{"droppedPackets", PRUETH_STAT_OFFSET(dropped_packets)},
> +
> +	{"txHWQOverFlow", PRUETH_STAT_OFFSET(tx_hwq_overflow)},
> +	{"txHWQUnderFlow", PRUETH_STAT_OFFSET(tx_hwq_underflow)},
> +	{"vlanDropped", PRUETH_STAT_OFFSET(vlan_dropped)},
> +	{"multicastDropped", PRUETH_STAT_OFFSET(multicast_dropped)},
> +};

...

