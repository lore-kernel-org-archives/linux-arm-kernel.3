Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4F2C71151
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 13:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=twkhsV1zF0hL+QCGl5QNOY+ykroDooxraR5ZCGY5fWM=; b=rKns0ErlN7bTw3
	sj6HotWtfhfr3NJ/WCgWEXGDFj9yrrn4tUHqpyxXchN4ZzXTCLCJrgGyRnuab+M8Yc6CMuvCO9RNO
	ACyLuQmjXbjgDcztu+ZRVzpf1QHMQKpkt//lfbcDhwM4buUFR27r1UdQphrfW0pUqIDqTjxt6eddf
	0G7EEeLNC5pA1uTiaFu2vxnz3xI5aZV7oJLtLb3gXHwbxhAL8vyq8MzDGhUAeH8WCYQfiCHsHwB1A
	WK6HPMUMhRvLhox0WNuXftlDuHFTX3XeBXGwFWYQTYHCKOUpNgUyCUgKsvxMtYfiHKCDVIbCtBhQ7
	HtflW8ptZNrbjMfz5EXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ41O-0000000GRJG-0hDD;
	Fri, 13 Jun 2025 13:00:38 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3vl-0000000GQno-3J9P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 12:54:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=twkhsV1zF0hL+QCGl5QNOY+ykroDooxraR5ZCGY5fWM=; b=es8djR6vmm6TqtJIf58kZsllKp
	TzJmAZ2/GXq/4luB7VASVqpOdTNjmUPkZPjYIo/46HunuURSwxzibLkvBHzA2N04pV4VoNgxw7tEz
	OI4eiivibzdE0CYnkl7EDz57A2S9ANJUUPUf0+fAvvlfdIdqNVR5c9jVzwpzZqAQW+By7viRsMlaN
	JlH4U6dDN0c9ppdK0lZWJjHlkUu4GhkKE/3U3K0J7xDUtvjetOUG03C0QYigVF+yznKZPGVpNcUh7
	Ov4XQ+082tULqHZDQBDRXrGp/uiXZwj2YV0xBKWhlKyWNNhXjKmOY8WyNiQTocNk1DBm1k6RTAAIv
	sJCo7lHw==;
Received: from [122.175.9.182] (port=23246 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1uQ3uu-0000000DXDE-3J6J;
	Fri, 13 Jun 2025 08:53:57 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 079A91781C8F;
	Fri, 13 Jun 2025 18:23:43 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id DB65117882B2;
	Fri, 13 Jun 2025 18:23:42 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tfKVzeSMqLXe; Fri, 13 Jun 2025 18:23:42 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 8286E1781C8F;
	Fri, 13 Jun 2025 18:23:42 +0530 (IST)
Date: Fri, 13 Jun 2025 18:23:42 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Message-ID: <909024001.1496409.1749819222224.JavaMail.zimbra@couthit.local>
In-Reply-To: <cdcd54ff-ff67-4ad8-8aa7-baa711928242@linux.dev>
References: <20250610105721.3063503-1-parvathi@couthit.com> <20250610123245.3063659-7-parvathi@couthit.com> <cdcd54ff-ff67-4ad8-8aa7-baa711928242@linux.dev>
Subject: Re: [PATCH net-next v8 06/11] net: ti: prueth: Adds HW timestamping
 support for PTP using PRU-ICSS IEP module
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds HW timestamping support for PTP using PRU-ICSS IEP module
Thread-Index: 8LzCZ2vNfRRRUg8kt8zc1YlyHE5Drg==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.couthit.com: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_055449_909692_57C46406 
X-CRM114-Status: GOOD (  18.01  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag@marvell.com, m-karicheri2 <m-karicheri2@ti.com>, jacob e keller <jacob.e.keller@intel.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On 10/06/2025 13:32, Parvathi Pudi wrote:
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> PRU-ICSS IEP module, which is capable of timestamping RX and
>> TX packets at HW level, is used for time synchronization by PTP4L.
>> 
>> This change includes interaction between firmware and user space
>> application (ptp4l) with required packet timestamps. The driver
>> initializes the PRU firmware with appropriate mode and configuration
>> flags. Firmware updates local registers with the flags set by driver
>> and uses for further operation. RX SOF timestamp comes along with
>> packet and firmware will rise interrupt with TX SOF timestamp after
>> pushing the packet on to the wire.
>> 
>> IEP driver is available in upstream and we are reusing for hardware
>> configuration for ICSSM as well. On top of that we have extended it
>> with the changes for AM57xx SoC.
>> 
>> Extended ethtool for reading HW timestamping capability of the PRU
>> interfaces.
>> 
>> Currently ordinary clock (OC) configuration has been validated with
>> Linux ptp4l.
>> 
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> ---
>>   drivers/net/ethernet/ti/icssg/icss_iep.c      |  42 ++
>>   drivers/net/ethernet/ti/icssm/icssm_ethtool.c |  23 +
>>   drivers/net/ethernet/ti/icssm/icssm_prueth.c  | 443 +++++++++++++++++-
>>   drivers/net/ethernet/ti/icssm/icssm_prueth.h  |  11 +
>>   .../net/ethernet/ti/icssm/icssm_prueth_ptp.h  |  85 ++++
>>   5 files changed, 602 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_ptp.h
> 
> [...]
> 
>> @@ -732,9 +949,22 @@ int icssm_emac_rx_packet(struct prueth_emac *emac, u16
>> *bd_rd_ptr,
>>   		src_addr += actual_pkt_len;
>>   	}
>>   
>> +	if (pkt_info->timestamp) {
>> +		src_addr = (void *)PTR_ALIGN((uintptr_t)src_addr,
>> +					   ICSS_BLOCK_SIZE);
>> +		dst_addr = &ts;
>> +		memcpy(dst_addr, src_addr, sizeof(ts));
>> +	}
>> +
>>   	if (!pkt_info->sv_frame) {
>>   		skb_put(skb, actual_pkt_len);
>>   
>> +		if (icssm_prueth_ptp_rx_ts_is_enabled(emac) &&
>> +		    pkt_info->timestamp) {
>> +			ssh = skb_hwtstamps(skb);
>> +			memset(ssh, 0, sizeof(*ssh));
>> +			ssh->hwtstamp = ns_to_ktime(ts);
>> +		}
>>   		/* send packet up the stack */
>>   		skb->protocol = eth_type_trans(skb, ndev);
>>   		netif_receive_skb(skb);
> 
> Could you please explain why do you need to copy timestamp to a
> temporary variable if you won't use it in some cases? I believe these
> 2 blocks should be placed under the last if condition and simplified a
> bit, like
> 
> +		if (icssm_prueth_ptp_rx_ts_is_enabled(emac) &&
> +		    pkt_info->timestamp) {
> +			src_addr = (void*)PTR_ALIGN((uintptr_t)src_addr,
> +					   ICSS_BLOCK_SIZE);
> +			memcpy(&ts, src_addr, sizeof(ts));
> +			ssh = skb_hwtstamps(skb);
> +			ssh->hwtstamp = ns_to_ktime(ts);
> +		}
> 
> This will avoid useless copy when the packet will be dropped anyway, WDYT?

Yes, we can merge both the if conditions to make it simple.

We will address this in the next version.

Thanks and Regards,
Parvathi.

