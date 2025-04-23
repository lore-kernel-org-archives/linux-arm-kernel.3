Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E658C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zo+DVKTfgpKvj4K9tSKFopO1J/gdMlaPEanxjEe44Lo=; b=CqEx1ZZvvB8puhoTCa6XLnVWfN
	tiYH3eQeD8v5HcZ38y9LeAQDYshoiBMqdbfzx9LCGYkspGOToZP+DETqwdQQaPsj+b7dOQoxH+rjT
	00yhKBF62pBWJBXe/ydrUoCDdg5LPokO8XRY/XCA2jfXV15pU4DzOUqE6klvAjE5aR1CNOmMUpjKG
	kNh2zWD6el5I8Zqzr/a+qpSUZkgp7wAxSfX0kqo8ifCUi9DFq6lVWNU3n40jFJ7M4DZK2weOQ0W2i
	iEizIFWp905aNnA+VFkTorHJ9vt6egPXC0uSv8pel1YHiiJ2xipmZrwA7PZB41oF9LD08lzXKG2Fr
	4Sr9XDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eYs-0000000BV0z-0Qpg;
	Wed, 23 Apr 2025 18:11:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7cxW-0000000B7yG-1RPY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 16:28:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8EB0615EF;
	Wed, 23 Apr 2025 16:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699E4C4CEE2;
	Wed, 23 Apr 2025 16:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745425705;
	bh=kdP94eIJZ1neGLZtHe2F3rjqBkuRH5ZXNqlX5OwGt8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DnVX1vtiyoDpB6r0MdPt9zD67EwvDMSfIP7Xwy/vNTTQTBZ+kpj1fc8hWd2shDsd0
	 BkMn46PTivn0tuUvlPnSW1mRiQAsmh3/24qyw8jLvle4O+ZVXDJ3+gueTLFB6jW1rc
	 A6jf3mss6WPSLXGt+UoXH4qxtFD+LYCkLFguJ7o4zbEwn9a+aSv5FU/ltu4EB3PX36
	 BBFT4VacSCsSDES/EXfIENXA9jiKUMFiA6HXnPrlOQw6SWf7e3OTwa26YTQ4l9BYQk
	 fOyrcKqlAK7w7mIPXfbt2SNCG4vD0fFFqTsAfcEl5ALAAeytMPYULGM99StB0QA8xh
	 fF1Yte8QFVctw==
Date: Wed, 23 Apr 2025 17:28:16 +0100
From: Simon Horman <horms@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v5 05/11] net: ti: prueth: Adds ethtool support
 for ICSSM PRUETH Driver
Message-ID: <20250423162816.GD2843373@horms.kernel.org>
References: <20250414113458.1913823-1-parvathi@couthit.com>
 <20250414130237.1915448-6-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414130237.1915448-6-parvathi@couthit.com>
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

On Mon, Apr 14, 2025 at 06:32:31PM +0530, Parvathi Pudi wrote:
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
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>

...

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.h b/drivers/net/ethernet/ti/icssm/icssm_prueth.h

...

> @@ -108,6 +114,119 @@ struct prueth_packet_info {
>  	bool timestamp;
>  };
>  
> +/**
> + * struct port_statistics - Statistics structure for capturing statistics
> + *			    on PRUs
> + * @tx_bcast: Number of broadcast packets sent
> + * @tx_mcast:Number of multicast packets sent
> + * @tx_ucast:Number of unicast packets sent
> + *
> + * @tx_octets:Number of undersized frames rcvd
> + *
> + * @rx_bcast:Number of broadcast packets rcvd
> + * @rx_mcast:Number of multicast packets rcvd
> + * @rx_ucast:Number of unicast packets rcvd
> + *
> + * @rx_octets:Number of Rx packets
> + *
> + * @tx64byte:Number of 64 byte packets sent
> + * @tx65_127byte:Number of 65-127 byte packets sent
> + * @tx128_255byte:Number of 128-255 byte packets sent
> + * @tx256_511byte:Number of 256-511 byte packets sent
> + * @tx512_1023byte:Number of 512-1023 byte packets sent
> + * @tx1024byte:Number of 1024 and larger size packets sent
> + *
> + * @rx64byte:Number of 64 byte packets rcvd
> + * @rx65_127byte:Number of 65-127 byte packets rcvd
> + * @rx128_255byte:Number of 128-255 byte packets rcvd
> + * @rx256_511byte:Number of 256-511 byte packets rcvd
> + * @rx512_1023byte:Number of 512-1023 byte packets rcvd
> + * @rx1024byte:Number of 1024 and larger size packets rcvd
> + *
> + * @late_coll:Number of late collisions(Half Duplex)
> + * @single_coll:Number of single collisions (Half Duplex)
> + * @multi_coll:Number of multiple collisions (Half Duplex)
> + * @excess_coll:Number of excess collisions(Half Duplex)
> + *
> + * @rx_misalignment_frames:Number of non multiple of 8 byte frames rcvd
> + * @stormprev_counter:Number of packets dropped because of Storm Prevention

nit: It looks like the documentation of @stormprev_counter should
     be replaced by documentation of:
     @u32 stormprev_counter_bc;
     @u32 stormprev_counter_mc;
     @u32 stormprev_counter_uc;

> + * @mac_rxerror:Number of MAC receive errors
> + * @sfd_error:Number of invalid SFD
> + * @def_tx:Number of transmissions deferred
> + * @mac_txerror:Number of MAC transmit errors
> + * @rx_oversized_frames:Number of oversized frames rcvd
> + * @rx_undersized_frames:Number of undersized frames rcvd
> + * @rx_crc_frames:Number of CRC error frames rcvd
> + * @dropped_packets:Number of packets dropped due to link down on opposite port
> + *
> + * @tx_hwq_overflow:Hardware Tx Queue (on PRU) over flow count
> + * @tx_hwq_underflow:Hardware Tx Queue (on PRU) under flow count
> + *
> + * @u32 cs_error: Number of carrier sense errors

nit: @cs_error

     i.e. remove "u32 "

Documentation nits flagged by ./scripts/kernel-doc -none

> + * @sqe_test_error: Number of MAC receive errors
> + *
> + * Above fields are aligned so that it's consistent
> + * with the memory layout in PRU DRAM, this is to facilitate easy
> + * memcpy. Don't change the order of the fields.
> + *
> + * @vlan_dropped: Number of VLAN tagged packets dropped
> + * @multicast_dropped: Number of multicast packets dropped
> + */
> +struct port_statistics {
> +	u32 tx_bcast;
> +	u32 tx_mcast;
> +	u32 tx_ucast;
> +
> +	u32 tx_octets;
> +
> +	u32 rx_bcast;
> +	u32 rx_mcast;
> +	u32 rx_ucast;
> +
> +	u32 rx_octets;
> +
> +	u32 tx64byte;
> +	u32 tx65_127byte;
> +	u32 tx128_255byte;
> +	u32 tx256_511byte;
> +	u32 tx512_1023byte;
> +	u32 tx1024byte;
> +
> +	u32 rx64byte;
> +	u32 rx65_127byte;
> +	u32 rx128_255byte;
> +	u32 rx256_511byte;
> +	u32 rx512_1023byte;
> +	u32 rx1024byte;
> +
> +	u32 late_coll;
> +	u32 single_coll;
> +	u32 multi_coll;
> +	u32 excess_coll;
> +
> +	u32 rx_misalignment_frames;
> +	u32 stormprev_counter_bc;
> +	u32 stormprev_counter_mc;
> +	u32 stormprev_counter_uc;
> +	u32 mac_rxerror;
> +	u32 sfd_error;
> +	u32 def_tx;
> +	u32 mac_txerror;
> +	u32 rx_oversized_frames;
> +	u32 rx_undersized_frames;
> +	u32 rx_crc_frames;
> +	u32 dropped_packets;
> +
> +	u32 tx_hwq_overflow;
> +	u32 tx_hwq_underflow;
> +
> +	u32 cs_error;
> +	u32 sqe_test_error;
> +
> +	u32 vlan_dropped;
> +	u32 multicast_dropped;
> +} __packed;

...

The above notwithstanding, it seems based on comment's elsewhere in this
thread that there will be another revision of this patchset. Let patchwork
know about that.

pw-bot: changes-requested

