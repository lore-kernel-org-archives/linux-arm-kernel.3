Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE88CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 12:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wckBC5c3hxxozy+99Tfp2OGtxZAPUj+u4sggN2dYdKM=; b=xjXalhkxCzEtBR6gfZqLcpwykV
	kvgtZcgnrqHq+4d0BmL7d3yQx+kvVEq2go7rF17gqalBC7DJuPPiZKhfHMR5jXaZiQ+JFH0UTRQgi
	WETJamnhJJwA30W5+u2jq5RBC+Qe4EDKT+DXB197SsyLe9Opl0oGUoLN9oK3FOGxLcp5Tooro0yAb
	tyPCXAWRaIehY1UAZa3ZJ8AFcETa7L3b4gAuLBjlhCG1R/7GUq3pKlgor/Lx9jw6Nw6MyoNLCdfRG
	/QuYbOtuWzLfPlh8iGVPhZ7spC1+RRy1Zr6pibpZD2mfrZE2S8tEWERpHZhZ5kc8umsbQOeW4lgOh
	lgyRrBlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZT4W-0000000Flzy-1Fvt;
	Tue, 16 Jun 2026 12:39:16 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZT4T-0000000Flw2-1GcI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 12:39:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wckBC5c3hxxozy+99Tfp2OGtxZAPUj+u4sggN2dYdKM=; b=eK+jspATY35msdfbuS2bfO/vxH
	OZuCLaX+VbPQhCNfNtpbJrTL++QtTQhLKXAFZzNzTHQ/6c58GsivezfOCQxXFrdFTq0DeYk0REgZu
	keS/0lhiHJE/08PPtO7MdVfKV00ZaU7AiZLYpv48lk5TH2Fx/EfNFORQ8MkYNKJQ0A/uEMhy9p5Ql
	nvZc24kPzEv6QaRK5f2JOQudf0+cmAjgFV02yv9kS0xMqN967tMqcB87dIKmEPPJWCFGT+MtBPSuv
	WDM+hEfxUMNWpAoH5DBUQNbD3Ie+zP3VkdaS/lIMiZQR7LsFGMkgBdhvaF4M0mm1BoaS9XgY0od08
	l95aaJOQ==;
Received: from [115.246.246.98] (port=64590 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <parvathi@couthit.com>)
	id 1wZT3k-0000000At2L-2NQa;
	Tue, 16 Jun 2026 08:38:28 -0400
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id BBE2119A7F6F;
	Tue, 16 Jun 2026 18:08:20 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10032)
 with ESMTP id I02UczKp5CFk; Tue, 16 Jun 2026 18:08:19 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 4213E19A7F69;
	Tue, 16 Jun 2026 18:08:19 +0530 (IST)
X-Virus-Scanned: amavis at couthit.local
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 0To_K82wJQZa; Tue, 16 Jun 2026 18:08:19 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 25E6F19A7F6F;
	Tue, 16 Jun 2026 18:08:19 +0530 (IST)
Date: Tue, 16 Jun 2026 18:08:19 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Parvathi Pudi <parvathi@couthit.com>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	pabeni <pabeni@redhat.com>, danishanwar <danishanwar@ti.com>, 
	rogerq <rogerq@kernel.org>, pmohan <pmohan@couthit.com>, 
	afd <afd@ti.com>, basharath <basharath@couthit.com>, 
	arnd <arnd@arndb.de>, linux-kernel <linux-kernel@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	pratheesh <pratheesh@ti.com>, j-rameshbabu <j-rameshbabu@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	m-malladi <m-malladi@ti.com>, krishna <krishna@couthit.com>, 
	mohan <mohan@couthit.com>
Message-ID: <358063548.1400426.1781613499101.JavaMail.zimbra@couthit.local>
In-Reply-To: <20260615135600.655e4be4@kernel.org>
References: <20260611123636.376577-1-parvathi@couthit.com> <20260611123636.376577-4-parvathi@couthit.com> <20260615135600.655e4be4@kernel.org>
Subject: Re: [PATCH net-next 3/3] net: ti: icssm-prueth: Support duplicate
 HW offload feature for HSR and PRP
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.183]
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC148 (Mac)/9.0.0_ZEXTRAS_20240927)
Thread-Topic: icssm-prueth: Support duplicate HW offload feature for HSR and PRP
Thread-Index: kRQq2cZyjwWaZc+5ja0kIgdhxnV0YQ==
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_053913_508472_E414F12E 
X-CRM114-Status: UNSURE (   7.95  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On Thu, 11 Jun 2026 18:03:28 +0530 Parvathi Pudi wrote:
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> In HSR and PRP modes each outgoing frame must be sent on both PRU slave
>> ports.
>> 
>> Previously the driver was writing the frame into each port's transmit queue
>> independently after updating the tags resulting in performing two OCMC
>> buffer copy operations.
>> 
>> Frame duplicate offloading is implemented with a common shared queue
>> between the two ports. The driver writes the frame once into OCMC RAM,
>> each port reads from the shared queue and replicates the transmission to
>> both PRU ports, synchronising between PRU ports are maintained within
>> firmware with appropriate handling.
>> 
>> For HSR the driver inspects the encapsulated ethertype in the HSR tag.
>> PTP frames (ETH_P_1588) are sent on the directed port only to avoid double
>> duplication and all other HSR frames are duplicated to both ports.
>> VLAN-tagged HSR frames are handled by advancing past the 4-byte VLAN header
>> before reading the HSR tag.
>> 
>> For PRP the driver checks the 6-byte RCT trailer for the ETH_P_PRP suffix
>> to identify redundancy-tagged frames. Frames without an RCT are sent on the
>> originating port only.
> 
> Warning: drivers/net/ethernet/ti/icssm/icssm_prueth.h:113 struct member
> 'host_recv_flag' not described in 'prueth_packet_info'
> 

We will address this in the next version.

> Please note that net-next will be closed for the next two weeks.

Also noted regarding the net-next closure. We will post the updated series
once the tree reopens.

Thanks and Regards,
Parvathi.

