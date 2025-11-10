Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443AECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXiqQF+gRk3kPg1EvMqNubQuZrzlTUWKCjIloAq55N0=; b=yyQD+KULTkrCS91v0k9vW9yBDf
	mxjrXnLIiBkzp/0tllETooB/HcGBe2sIXcnC7+dIW3UmBYoZuw2Psgwm8XOvoyB1BtH99vOIzRgcg
	Rc7zItFjf3k+X+mzhqK2dxos0QFIOn5JIfTnl2F9BvcG39gAZAhfM7b23i3QSwFlTYutopzHYcpId
	GadbzE61IPRTFXjXk919ZvLKWUPUUjm7mPxu0Ci/jmL6sOApleblXHPyURlCy1LD6363XN0bTYThu
	5EUuiQLFRZKz+xLlmv8tSldfywhCxHVk/pCey7cMjGLIs1pZEc8CNugrEFVQZtu7+VZlevihQWRd2
	Bg21bP/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ89-00000005K2U-1B0X;
	Mon, 10 Nov 2025 11:32:17 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ87-00000005Jzo-0EOj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BXiqQF+gRk3kPg1EvMqNubQuZrzlTUWKCjIloAq55N0=; b=pDrF6cLeTCBmb+vrjvWrBZGzCh
	j2OEaki+U0AGtnO/6EIrPvOv8SB9P5T7XyS/0EIoX0iT2SKqdRzEl7ZipPJux3/lvqPy/Vc1W5Rnd
	3B6DfdopI6k66SIy1xe7ylFBDM/yaHXQSdHv6wtIhFKQnsV0S/okw4iaY+nzYbZs35eKIWk2iLQXB
	FIE2ziVItfHgns0cAzl8/oNB0RCNDxZQQ8uWOv4EdY6+jeNZJKWgTBYUaHOlEBmkVRB5ZGcN1ChqF
	jYWBs+YlQPkSG3UHN1IAte5J0RU6Le2S/3RLkQIYlmonmb18dv/9iVPTivG+uVEQkVzA2DSBxFhhH
	5DcWbWgg==;
Received: from [122.175.9.182] (port=59601 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vIQ7P-0000000Dy5b-3VRO;
	Mon, 10 Nov 2025 06:31:32 -0500
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id EB1751A45041;
	Mon, 10 Nov 2025 17:01:20 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10032)
 with ESMTP id ZbCz9p0DjiJh; Mon, 10 Nov 2025 17:01:19 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 58D7B1A4505E;
	Mon, 10 Nov 2025 17:01:19 +0530 (IST)
X-Virus-Scanned: amavis at couthit.local
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10026)
 with ESMTP id y5mx4F2JezO3; Mon, 10 Nov 2025 17:01:19 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 370341A45041;
	Mon, 10 Nov 2025 17:01:19 +0530 (IST)
Date: Mon, 10 Nov 2025 17:01:19 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: parvathi <parvathi@couthit.com>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, 
	danishanwar <danishanwar@ti.com>, rogerq <rogerq@kernel.org>, 
	pmohan <pmohan@couthit.com>, basharath <basharath@couthit.com>, 
	afd <afd@ti.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	pratheesh <pratheesh@ti.com>, Prajith Jayarajan <prajith@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>
Message-ID: <1945451921.12277.1762774279163.JavaMail.zimbra@couthit.local>
In-Reply-To: <1336430040.1005.1760615639799.JavaMail.zimbra@couthit.local>
References: <20251014124018.1596900-1-parvathi@couthit.com> <20251014124018.1596900-2-parvathi@couthit.com> <ff651c3d-108b-48f8-b69b-fb0b522edd4e@lunn.ch> <1336430040.1005.1760615639799.JavaMail.zimbra@couthit.local>
Subject: Re: [PATCH net-next v3 1/3] net: ti: icssm-prueth: Adds helper
 functions to configure and maintain FDB
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.233]
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC138 (Linux)/9.0.0_ZEXTRAS_20240927)
Thread-Topic: icssm-prueth: Adds helper functions to configure and maintain FDB
Thread-Index: n9boZ3kHorfViJim7wqUTYIC+ep2RPQ2l15B
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
X-CRM114-CacheID: sfid-20251110_033215_182482_CFF53870 
X-CRM114-Status: UNSURE (   7.57  )
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

> Hi,
> 
>>> +void icssm_prueth_sw_fdb_tbl_init(struct prueth *prueth)
>>> +{
>>> +	struct fdb_tbl *t = prueth->fdb_tbl;
>>> +
>>> +	t->index_a = (struct fdb_index_array_t *)((__force const void *)
>>> +			prueth->mem[V2_1_FDB_TBL_LOC].va +
>>> +			V2_1_FDB_TBL_OFFSET);
>> 
>> We have
>> 
>>> +#define V2_1_FDB_TBL_LOC          PRUETH_MEM_SHARED_RAM
>> 
>> and existing code like:
>> 
>> void __iomem *sram_base = prueth->mem[PRUETH_MEM_SHARED_RAM].va;
>> 
>> so it seems like
>> 
>> t->index_a = sram_base + V2_1_FDB_TBL_OFFSET;
>> 
>> with no needs for any casts, since sram_base is a void * so can be
>> assigned to any pointer type.
>> 
>> And there are lots of cascading defines like:
>> 
>> /* 4 queue descriptors for port 0 (host receive). 32 bytes */
>> #define HOST_QUEUE_DESC_OFFSET          (HOST_QUEUE_SIZE_ADDR + 16)
>> 
>> /* table offset for queue size:
>> * 3 ports * 4 Queues * 1 byte offset = 12 bytes
>> */
>> #define HOST_QUEUE_SIZE_ADDR            (HOST_QUEUE_OFFSET_ADDR + 8)
>> /* table offset for queue:
>> * 4 Queues * 2 byte offset = 8 bytes
>> */
>> #define HOST_QUEUE_OFFSET_ADDR          (HOST_QUEUE_DESCRIPTOR_OFFSET_ADDR + 8)
>> /* table offset for Host queue descriptors:
>> * 1 ports * 4 Queues * 2 byte offset = 8 bytes
>> */
>> #define HOST_QUEUE_DESCRIPTOR_OFFSET_ADDR       (HOST_Q4_RX_CONTEXT_OFFSET + 8)
>> 
>> allowing code like:
>> 
>>	sram = sram_base + HOST_QUEUE_SIZE_ADDR;
>>	sram = sram_base + HOST_Q1_RX_CONTEXT_OFFSET;
>>	sram = sram_base + HOST_QUEUE_OFFSET_ADDR;
>>	sram = sram_base + HOST_QUEUE_DESCRIPTOR_OFFSET_ADDR;
>>	sram = sram_base + HOST_QUEUE_DESC_OFFSET;
>> 
> 
> Sure, we will check the feasibility and come back.
> 

We have updated the code to use sram_base + offset directly without any casts,
added the __iomem attribute to the structure, and modified the usage of its
members at all related places accordingly. With these modifications sparse is
able to check all such accesses.

We will post these changes in the next version for review.

Thanks and Regards,
Parvathi.

