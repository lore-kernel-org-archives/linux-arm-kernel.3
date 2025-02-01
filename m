Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7404FC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 13:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ignVEcjhumkNWLSzWdrUkiSSRf394BaswWlvkQv+aUo=; b=RlmuoJ216t0nPq
	a6hVEGZye66oL0HehL6Gq8f7jFxPkRltuwPyIDYhf+yco32nVQQM6Wy2fGSUlCKyCgxxoDKUOpd+M
	F4D7gyj+VuTbsBlXSwPsnrDTRA5jy0jT8pb9bCV9XHmO0H5kxLmESXVMRxIkYKSVon1MALo7jrHqe
	L6ENqJs6WPuR3zwHBAl6rV21cqASYZLqMJ4nRMogo6L7UWkm7Db63U8/fivGs0N9R0aaCzB8qB1la
	bmL1Rre7gGp/oS5YHujtsH9K8zubaAc3uSSoF0gYsly+BNBcq0kHeBXGIDyJ0PO+xG2YF69qFXTFD
	sdfEZhUOTXw++kp8DqvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teDhw-0000000ChB0-0t7i;
	Sat, 01 Feb 2025 13:38:48 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teDgb-0000000Ch5N-2XR2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 13:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ignVEcjhumkNWLSzWdrUkiSSRf394BaswWlvkQv+aUo=; b=ez3DHy4KvAJgkV+spv6PnEQj+K
	It4gQV8SxJehtWK+a30RStICulPGttI43KrRK448pYZDZ0cay1MwVVUuq7khFC9XGMOVjwMZn87P0
	jlRT3PEOH1Y9EH2eEaTE74mAg7iMmocBn0Gqxc+mxyOkNA43B0uaFuT9WhxfuEkNDz7JUQ099wkfG
	Fa0pPPtDYCb32OWn58HSrhK/F2eYqYpN8/j7uvgNIWk1KFCop24G2f2ZQuNgX4cwq6DfzyHVp/673
	KP8LFfJd74Vn41Sg2QYoYn4wkc++OQQv60vliyDCoUWmwY237/+veog2/6YS2v3VLiSDjDSnCHbrF
	+sgDYoLw==;
Received: from [122.175.9.182] (port=53335 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1teDgX-000449-16;
	Sat, 01 Feb 2025 19:07:21 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 8BBA31781C56;
	Sat,  1 Feb 2025 19:07:14 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 6680D1782035;
	Sat,  1 Feb 2025 19:07:14 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vcwGzKvUinVz; Sat,  1 Feb 2025 19:07:14 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 244AA1781C56;
	Sat,  1 Feb 2025 19:07:14 +0530 (IST)
Date: Sat, 1 Feb 2025 19:07:14 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: horms <horms@kernel.org>
Message-ID: <1490509701.481776.1738417034035.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250130164515.GC13457@kernel.org>
References: <20250124122353.1457174-1-basharath@couthit.com> <20250124123707.1457639-5-basharath@couthit.com> <20250130164515.GC13457@kernel.org>
Subject: Re: [RFC v2 PATCH 04/10] net: ti: prueth: Adds link detection, RX
 and TX support.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds link detection, RX and TX support.
Thread-Index: epeD2E8g/Zc/D2XENrr3GLP0/2oqEg==
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
X-CRM114-CacheID: sfid-20250201_053725_668624_9C2B672B 
X-CRM114-Status: GOOD (  18.47  )
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
Cc: nm <nm@ti.com>, vigneshr <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, Rob Herring <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, prajith <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


> On Fri, Jan 24, 2025 at 06:07:01PM +0530, Basharath Hussain Khaja wrote:
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> Changes corresponding to link configuration such as speed and duplexity.
>> IRQ and handler initializations are performed for packet reception.Firmware
>> receives the packet from the wire and stores it into OCMC queue. Next, it
>> notifies the CPU via interrupt. Upon receiving the interrupt CPU will
>> service the IRQ and packet will be processed by pushing the newly allocated
>> SKB to upper layers.
>> 
>> When the user application want to transmit a packet, it will invoke
>> sys_send() which will inturn invoke the PRUETH driver, then it will write
>> the packet into OCMC queues. PRU firmware will pick up the packet and
>> transmit it on to the wire.
>> 
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>> ---
>>  drivers/net/ethernet/ti/icssm/icssm_prueth.c | 599 ++++++++++++++++++-
>>  drivers/net/ethernet/ti/icssm/icssm_prueth.h |  46 ++
>>  2 files changed, 640 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> 
> ...
> 
>> +/**
>> + * icssm_emac_ndo_start_xmit - EMAC Transmit function
>> + * @skb: SKB pointer
>> + * @ndev: EMAC network adapter
>> + *
>> + * Called by the system to transmit a packet  - we queue the packet in
>> + * EMAC hardware transmit queue
>> + *
>> + * Return: success(NETDEV_TX_OK) or error code (typically out of desc's)
>> + */
>> +static int icssm_emac_ndo_start_xmit(struct sk_buff *skb,
>> +				     struct net_device *ndev)
> 
> I think the return type of this function should be netdev_tx_t
> rather than int to match the signature of ndo_start_xmit
> in struct net_device_ops.
> 
> Flagged by W=1 build with clang-19
> (-Wincompatible-function-pointer-types-strict).
> 

We will change the return type in the next version.

> ...
> 
>>  static const struct net_device_ops emac_netdev_ops = {
>>  	.ndo_open = icssm_emac_ndo_open,
>>  	.ndo_stop = icssm_emac_ndo_stop,
>> +	.ndo_start_xmit = icssm_emac_ndo_start_xmit,
>>  };
>>  
>>  /* get emac_port corresponding to eth_node name */
> 
> ...
> 
>> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.h
>> b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
> 
> ...
> 
>> @@ -76,6 +82,32 @@ struct prueth_queue_info {
>>  	u16 buffer_desc_end;
>>  } __packed;
>>  
>> +/**
>> + * struct prueth_packet_info - Info about a packet in buffer
>> + * @start_offset: start offset of the frame in the buffer for HSR/PRP
>> + * @shadow: this packet is stored in the collision queue
>> + * @port: port packet is on
>> + * @length: length of packet
>> + * @broadcast: this packet is a broadcast packet
>> + * @error: this packet has an error
>> + * @sv_frame: indicate if the frame is a SV frame for HSR/PRP
>> + * @lookup_success: src mac found in FDB
>> + * @flood: packet is to be flooded
>> + * @timstamp: Specifies if timestamp is appended to the packet
> 
> nit: @timestamp
> 

We will address this in the next version.

>> + */
>> +struct prueth_packet_info {
>> +	bool start_offset;
>> +	bool shadow;
>> +	unsigned int port;
>> +	unsigned int length;
>> +	bool broadcast;
>> +	bool error;
>> +	bool sv_frame;
>> +	bool lookup_success;
>> +	bool flood;
>> +	bool timestamp;
>> +};
> 
> ...

Thanks & Best Regards,
Basharath

