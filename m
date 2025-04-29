Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB75C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 10:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pRJpXxtXspf00/o6/ugq1hIMvacha4Xn4cBWyKfWYus=; b=ouJJzZTDKnEYmf
	Qdik8GJCUCYHLEjaC3SfxNb1glmI9HuWxP9Ij0wxsQmYk9igQYwMEndOn5rbCbHMPEb8hE/4iaV1t
	Sw/6AGwFaww/I1xgBQTlt0qwHsfUdaF6nlncajMNAWbDFiNwCZg+2qOzxa2AaqJ8AQF3aUgPF4hbo
	eEfK1tlzWh7iEZoHZNxl+R5XAIF1Ihu9+Ap4BviQM9sFWjfBs9kj+wBB9vPFwKkpxJdyHC+YXn8NW
	Q+Hgc8MWJ0/kYruHalNai9CMLLLxvl6A9Zjb39KYKVfLbCGnxAvvCGn82Wk+BV2co7hfxhWf3ewWQ
	32KL+/GkFJ5UhQ3cyhJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9i0n-00000009Gse-3wo5;
	Tue, 29 Apr 2025 10:16:25 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hra-00000009F3x-19os
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 10:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=pRJpXxtXspf00/o6/ugq1hIMvacha4Xn4cBWyKfWYus=; b=Bx3WWgVLQvkl4QFHw+dWoUCys4
	V8X70gKZz38WfqR9qD2N+N8vRNonmLt87sBOhMhsn7XEEDfiEhyVGGRYrs05GSejf/kv5x4KJBVew
	0fv512iiizW1yXEhqddx+osiDVy5xb0lMglMn/8rEcojA7UnmYB4T0l4oE5LMq12KO6wLbUozVjMt
	urNXDmhtMgENuVB5XU8yCZpb+JPv94Eq2N17MVYfJnuzmeKnzDU6zRg2/iZoNL932WcY74puK/zgY
	URJm2bsZfExkCW2A6Hnglp4CaFyEWSxN7L2uVNXTIaRuP2z4N12VnYVxfWJZLKOD35fy4jYCYi/W1
	GmpKZZlw==;
Received: from [122.175.9.182] (port=52071 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u9hrW-0000000005m-07gL;
	Tue, 29 Apr 2025 15:36:50 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 3793E1783FDC;
	Tue, 29 Apr 2025 15:36:44 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 0FF47178245B;
	Tue, 29 Apr 2025 15:36:44 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CbIv-kPgtkN5; Tue, 29 Apr 2025 15:36:43 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id BB52B1782431;
	Tue, 29 Apr 2025 15:36:43 +0530 (IST)
Date: Tue, 29 Apr 2025 15:36:43 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: kuba <kuba@kernel.org>
Message-ID: <619030056.1172946.1745921203564.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250424191741.55323f28@kernel.org>
References: <20250423060707.145166-1-parvathi@couthit.com> <20250423072356.146726-6-parvathi@couthit.com> <20250424191741.55323f28@kernel.org>
Subject: Re: [PATCH net-next v6 05/11] net: ti: prueth: Adds ethtool support
 for ICSSM PRUETH Driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds ethtool support for ICSSM PRUETH Driver
Thread-Index: aOSvrMwlP2wLYvNaXDGDtXazpxI8Zw==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_030654_345776_B124A323 
X-CRM114-Status: UNSURE (   6.94  )
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
Cc: nm <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, pabeni <pabeni@redhat.com>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On Wed, 23 Apr 2025 12:53:50 +0530 Parvathi Pudi wrote:
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> Changes for enabling ethtool support for the newly added PRU Ethernet
>> interfaces. Extends the support for statistics collection from PRU internal
>> memory and displays it in the user space. Along with statistics,
>> enable/disable of features, configuring link speed etc.are now supported.
>> 
>> The firmware running on PRU maintains statistics in internal data memory.
>> When requested ethtool collects all the statistics for the specified
>> interface and displays it in the user space.
>> 
>> Makefile is updated to include ethtool support into PRUETH driver.
> 
> drivers/net/ethernet/ti/icssm/icssm_prueth.h:229: warning: Function parameter or
> struct member 'stormprev_counter_bc' not described in 'port_statistics'
> drivers/net/ethernet/ti/icssm/icssm_prueth.h:229: warning: Function parameter or
> struct member 'stormprev_counter_mc' not described in 'port_statistics'
> drivers/net/ethernet/ti/icssm/icssm_prueth.h:229: warning: Function parameter or
> struct member 'stormprev_counter_uc' not described in 'port_statistics'
> drivers/net/ethernet/ti/icssm/icssm_prueth.h:229: warning: Function parameter or
> struct member 'cs_error' not described in 'port_statistics'
> drivers/net/ethernet/ti/icssm/icssm_prueth.h:229: warning: Excess struct member
> 'stormprev_counter' description in 'port_statistics'
> 

We will address this in the next version.

>> +static const struct {
>> +	char string[ETH_GSTRING_LEN];
>> +	u32 offset;
>> +} prueth_ethtool_stats[] = {
>> +	{"txBcast", PRUETH_STAT_OFFSET(tx_bcast)},
>> +	{"txMcast", PRUETH_STAT_OFFSET(tx_mcast)},
>> +	{"txUcast", PRUETH_STAT_OFFSET(tx_ucast)},
>> +	{"txOctets", PRUETH_STAT_OFFSET(tx_octets)},
>> +	{"rxBcast", PRUETH_STAT_OFFSET(rx_bcast)},
>> +	{"rxMcast", PRUETH_STAT_OFFSET(rx_mcast)},
>> +	{"rxUcast", PRUETH_STAT_OFFSET(rx_ucast)},
>> +	{"rxOctets", PRUETH_STAT_OFFSET(rx_octets)},
>> +
>> +	{"tx64byte", PRUETH_STAT_OFFSET(tx64byte)},
>> +	{"tx65_127byte", PRUETH_STAT_OFFSET(tx65_127byte)},
>> +	{"tx128_255byte", PRUETH_STAT_OFFSET(tx128_255byte)},
>> +	{"tx256_511byte", PRUETH_STAT_OFFSET(tx256_511byte)},
>> +	{"tx512_1023byte", PRUETH_STAT_OFFSET(tx512_1023byte)},
>> +	{"tx1024byte", PRUETH_STAT_OFFSET(tx1024byte)},
>> +	{"rx64byte", PRUETH_STAT_OFFSET(rx64byte)},
>> +	{"rx65_127byte", PRUETH_STAT_OFFSET(rx65_127byte)},
>> +	{"rx128_255byte", PRUETH_STAT_OFFSET(rx128_255byte)},
>> +	{"rx256_511byte", PRUETH_STAT_OFFSET(rx256_511byte)},
>> +	{"rx512_1023byte", PRUETH_STAT_OFFSET(rx512_1023byte)},
>> +	{"rx1024byte", PRUETH_STAT_OFFSET(rx1024byte)},
>> +
>> +	{"lateColl", PRUETH_STAT_OFFSET(late_coll)},
>> +	{"singleColl", PRUETH_STAT_OFFSET(single_coll)},
>> +	{"multiColl", PRUETH_STAT_OFFSET(multi_coll)},
>> +	{"excessColl", PRUETH_STAT_OFFSET(excess_coll)},
> 
> Do not dump into ethtool -S what's reported via standard stats.

This is to align with firmware internal statistics layout. We will
review and address this in the next version.


Thanks and Regards,
Parvathi.

