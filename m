Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D039DE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=490O8s9VEmB0J2SHHcgTWzPB3WQkRDuyRSlZkbVm8rk=; b=d6qCr5MPcLKq2TXk7BM2BMqwWo
	3wTm8WEzIHFPEd4jDbERMcWqlP3NwPbT2Si1zvisYTSxSgxpPXezuD//ZJxtcEfildouIwugP4+a5
	IEiFYuWjTgmsGLOcQcIr63XbNMs33QwtCpPgAW8k3sNBpXPOh9PM0if+CElNZfbU+pJNa/muP+BtG
	UlOIpQ7oRGg7yUaSVZSSWHIJysABEbo/3+pF+xWBlXRJIRB20N3aIPPmRinR3zMXqMG40YNns95UY
	KNWtxO7IMluq2K3MNs0m8eB1NhDMqgt2kvSmgpyOXcdg45pgt8lMJaN5XKx3QFYeRcc6E1vXLTYmt
	TdTUghaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9ep-000000050Qn-1TFZ;
	Tue, 07 Jan 2025 13:30:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9YC-00000004zYc-36hl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 13:23:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 120975C61FB;
	Tue,  7 Jan 2025 13:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3F4C4CED6;
	Tue,  7 Jan 2025 13:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736256195;
	bh=F0vo+yqr82MXK+Bq+lhmhLwnRvzNafAM1xPRuhI+YQs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bwV+6TJgnqx8Xiavvmd0/PBvgUQWFF5LKjbUCMCD2JbDtZSEEDBupEwFSgzZKTDGa
	 C5DsXZO8t1PACkI/ugQpy702izB8mpRuFrRd+Eijpnsqz+NzTNfCGQwber3oI0I8pk
	 wTQacQA5LjpAbiDu6s6g4+YBoZw4GF5BZvxYjYRZgaiSEN4Tew+RLHvZ2pThaYnFWi
	 t/ehDxwrMJmaDM/juYdJ6jhPg2rcMjsSWIs/zLROnBuiJk1Zf4nuvFqwA+IYgln3AQ
	 RuflzTYRrBJkxl4/9W8LW8SlrmuWYOmiZyLljcRklItv8p8DSn97Id2g7Dc2x/xruS
	 Nd5mfe/tt9lnQ==
Message-ID: <31bb8a3e-5a1c-4c94-8c33-c0dfd6d643fb@kernel.org>
Date: Tue, 7 Jan 2025 15:23:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 3/3] net: ti: icssg-prueth: Add Support for
 Multicast filtering with VLAN in HSR mode
To: MD Danish Anwar <danishanwar@ti.com>, Jeongjun Park
 <aha310510@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>,
 Lukasz Majewski <lukma@denx.de>, Meghana Malladi <m-malladi@ti.com>,
 Diogo Ivo <diogo.ivo@siemens.com>, Simon Horman <horms@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Larysa Zaremba <larysa.zaremba@intel.com>
References: <20250103092033.1533374-1-danishanwar@ti.com>
 <20250103092033.1533374-4-danishanwar@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250103092033.1533374-4-danishanwar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_052316_832655_978F3CEC 
X-CRM114-Status: GOOD (  18.30  )
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



On 03/01/2025 11:20, MD Danish Anwar wrote:
> Add multicast filtering support for VLAN interfaces in HSR offload mode
> for ICSSG driver.
> 
> The driver calls vlan_for_each() API on the hsr device's ndev to get the
> list of available vlans for the hsr device. The driver then sync mc addr of
> vlan interface with a locally mainatined list emac->vlan_mcast_list[vid]
> using __hw_addr_sync_multiple() API.
> 
> The driver then calls the sync / unsync callbacks.
> 
> In the sync / unsync call back, driver checks if the vdev's real dev is
> hsr device or not. If the real dev is hsr device, driver gets the per
> port device using hsr_get_port_ndev() and then driver passes appropriate
> vid to FDB helper functions.
> 
> This commit makes below changes in the hsr files.
> - Move enum hsr_port_type from net/hsr/hsr_main.h to include/linux/if_hsr.h
>   so that the enum can be accessed by drivers using hsr.
> - Create hsr_get_port_ndev() API that can be used to get the ndev
>   pointer to the slave port from ndev pointer to the hsr net device.
> - Export hsr_get_port_ndev() API so that the API can be accessed by
>   drivers using hsr.
> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>  drivers/net/ethernet/ti/icssg/icssg_prueth.c | 83 +++++++++++++++-----
>  drivers/net/ethernet/ti/icssg/icssg_prueth.h |  2 +
>  include/linux/if_hsr.h                       | 18 +++++
>  net/hsr/hsr_device.c                         | 13 +++
>  net/hsr/hsr_main.h                           |  9 ---

Should we be splitting hsr core changes into separate patch first,
then followed by a patch with icssg driver changes?

>  5 files changed, 97 insertions(+), 28 deletions(-)

-- 
cheers,
-roger


