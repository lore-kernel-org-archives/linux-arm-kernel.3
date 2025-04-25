Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB26C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 02:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=duJUc6479EOOMTdyEfJ7lQGux7Arzc3gr2MsXYU1hoU=; b=q3MC0Z2HwOyS1l
	AIoeItQl1vSp4MD3OUChQJCnROoB331LBduQmhBxPXQW1/zg+/bvE8ry36gf7IkabnHcCwgtYiZyk
	wg1kaEZmSy41eFg1yiNUfkiOIb/tEOSxKz+jKCdEKxyDSI2+PB8a4xvfhOeQDk4zPqo2cRe/eckMe
	uG021ZkIcgd/S/vXpgAlToAOGT7bBTP2wMnlh8/YGcYN0JIRv2WyqJwMUZbr/z3+Bz+M3NXGNPS47
	EKaRW98b9s012urAYWAWLy+OtkP7oFITsTcbK6DEbjCage31F14xxsedcG7rfs41cdANX5C9OWQ7/
	VOtWPVu26Aj1HeVs/A/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88im-0000000Fm2U-21Yn;
	Fri, 25 Apr 2025 02:23:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88dN-0000000FlMy-2JYq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 02:17:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C429168463;
	Fri, 25 Apr 2025 02:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A9CC4CEE8;
	Fri, 25 Apr 2025 02:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745547463;
	bh=rnde/5LKcrXee61FnkPpAl7VxLLLULNpXCvsaDr67Oo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MP4CseuyCo8bNn2ZW4hcPWDWOtViWj1ZG+QwEYuIVYqgqkLG/LKego/Vl3SVMQYCN
	 9tvkWHtXY2lQ0vrTzzCk0PmCac9260ag0nlNHIz1d5JAK4FLmrZK1UOQqwH9+/yUJ4
	 6dfFcPjv6POUuo9r9q93DOuA2JeAfLBiqIfIZStEj27UuQHwyYQq9nN4Qk25UqHGMc
	 kD8eDJP00j6tc9gEpLOIbg8eRtY3/MhoJEKYaobcjMrZDFLHRJzxtYwu/jALChEXh9
	 70RRTQPCvvH3NHc54/AnbLJhbHCcAq6vASxhqtoSm/JeXjnrOgmenKgFnmbH7LRGpu
	 kKhh/tMhTrgYw==
Date: Thu, 24 Apr 2025 19:17:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v6 05/11] net: ti: prueth: Adds ethtool support
 for ICSSM PRUETH Driver
Message-ID: <20250424191741.55323f28@kernel.org>
In-Reply-To: <20250423072356.146726-6-parvathi@couthit.com>
References: <20250423060707.145166-1-parvathi@couthit.com>
	<20250423072356.146726-6-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, basharath@couthit.com, pabeni@redhat.com, richardcochran@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, s.hauer@pengutronix.de, prajith@ti.com, rogerq@kernel.org, jacob.e.keller@intel.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, 23 Apr 2025 12:53:50 +0530 Parvathi Pudi wrote:
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

drivers/net/ethernet/ti/icssm/icssm_prueth.h:229: warning: Function parameter or struct member 'stormprev_counter_bc' not described in 'port_statistics'
drivers/net/ethernet/ti/icssm/icssm_prueth.h:229: warning: Function parameter or struct member 'stormprev_counter_mc' not described in 'port_statistics'
drivers/net/ethernet/ti/icssm/icssm_prueth.h:229: warning: Function parameter or struct member 'stormprev_counter_uc' not described in 'port_statistics'
drivers/net/ethernet/ti/icssm/icssm_prueth.h:229: warning: Function parameter or struct member 'cs_error' not described in 'port_statistics'
drivers/net/ethernet/ti/icssm/icssm_prueth.h:229: warning: Excess struct member 'stormprev_counter' description in 'port_statistics'

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
> +
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
> +
> +	{"lateColl", PRUETH_STAT_OFFSET(late_coll)},
> +	{"singleColl", PRUETH_STAT_OFFSET(single_coll)},
> +	{"multiColl", PRUETH_STAT_OFFSET(multi_coll)},
> +	{"excessColl", PRUETH_STAT_OFFSET(excess_coll)},

Do not dump into ethtool -S what's reported via standard stats.

