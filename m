Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53281CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E74n/a585dzmh+odW/Yv2yjCpqCIySDsqIox9AI675c=; b=Ofo1lC4zRiF+QTX+GYlFUW0XyY
	DbfaADVJJKf+y+IaGboy5kQUByTrAV4TAY9pnQXTusmT+p5O3B6KWNfJCdPNaSHV0SRCjMSuEFE95
	Z1DLTNK3ouHM2DqctRgb00uOj0jHuXX2thPzKcwabGXrt9wo8mUw+6gRodVcgNPPbuiqK5WClda6o
	VD4w8wPJhoTr9D6yiSE8fxTRKLJXW/K4GVvK43aTOYiZBowYcb7nwsL7Bp6Xl9O898j8WYyWp7W4n
	EAOSORwbxctxjyFzTCoO46X8b1Gay6E+3ny+ic321eAwZVTQmW05qRyRCTksNQu2RbascR1VEwFt8
	7zQA1/7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGTe-00000009Akh-1jMd;
	Thu, 01 Oct 2026 13:05:34 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGTb-00000009AgO-42ki
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=E74n/a585dzmh+odW/Yv2yjCpqCIySDsqIox9AI675c=; b=Pwd3UC7TA9DGbEQrx/7md01VwS
	S8hBT1gQhIO/g5YUHQuz6uVFvaahYNULmcLIJ6ItEUMgOJHVXqGVNMmh9MTt0EB2HYbJiKWSa/mHq
	HAL2aDlWafyi1CDoycKBoq7k0HBF21HyOLIISyj7H3sdLbjQVKaR+LBywkAs5l8wb4UHUEQix0jLV
	TTbSEIPzlf2D94iOorNi5+K+2z6+9ai4KXTQglHfk8OpgT08YBqXahgFP7ntOvqgE2bbVceYUqYIA
	ZgT51kdH/YujqJ9Xp1MLab1q0nq2IrM6mcnmeraZmYf0uaMJ+6GGvmjMXCUlKeJ7Yo69BF4O1pR9x
	5yhaYEvA==;
Received: from [115.246.246.98] (port=22290 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <parvathi@couthit.com>)
	id 1xCGSs-00000000ueE-46Zm;
	Thu, 01 Oct 2026 09:04:47 -0400
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 67ACB1A088B7;
	Thu,  1 Oct 2026 18:34:41 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10032)
 with ESMTP id qMbZjH0l6Zkd; Thu,  1 Oct 2026 18:34:38 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id EA8E01A088B8;
	Thu,  1 Oct 2026 18:34:37 +0530 (IST)
X-Virus-Scanned: amavis at couthit.local
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Sy_dgeVU7mng; Thu,  1 Oct 2026 18:34:37 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id C257F1A088B7;
	Thu,  1 Oct 2026 18:34:37 +0530 (IST)
Date: Thu, 1 Oct 2026 18:34:37 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Simon Horman <horms@kernel.org>
Cc: parvathi <parvathi@couthit.com>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, 
	danishanwar <danishanwar@ti.com>, rogerq <rogerq@kernel.org>, 
	pmohan <pmohan@couthit.com>, afd <afd@ti.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, haokexin@gmail.com, 
	basharath <basharath@couthit.com>, arnd <arnd@arndb.de>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	pratheesh <pratheesh@ti.com>, j-rameshbabu <j-rameshbabu@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	m-malladi <m-malladi@ti.com>, krishna <krishna@couthit.com>, 
	mohan <mohan@couthit.com>
Message-ID: <1915284322.492671.1790859877701.JavaMail.zimbra@couthit.local>
In-Reply-To: <20260925163914.721071-1-horms@kernel.org>
References: <20260921134343.200426-2-parvathi@couthit.com> <20260925163914.721071-1-horms@kernel.org>
Subject: Re: [PATCH net-next v4 1/3] net: ti: icssm-prueth: Add HSR and PRP
 HW offload mode support for AM57xx, AM437x and AM335x
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.233]
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC150 (Linux)/9.0.0_ZEXTRAS_20240927)
Thread-Topic: icssm-prueth: Add HSR and PRP HW offload mode support for AM57xx, AM437x and AM335x
Thread-Index: BMmG18KeQ7ZcShIZhHAYI6SOGT3rpQ==
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
X-CRM114-CacheID: sfid-20261001_060532_100725_0E6ED1FF 
X-CRM114-Status: GOOD (  11.99  )
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

> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at:
> https://sashiko.dev/#/patchset/20260921134343.200426-4-parvathi@couthit.com?part=1
> ---
> net: ti: icssm-prueth: Add HSR and PRP HW offload mode support for AM57xx,
> AM437x and AM335x
> 
> This commit extends the ICSSM PRUETH driver to support HSR and PRP redundancy
> protocols on compatible TI SoCs. It enables dynamically switching PRU ethernet
> ports from dual-EMAC mode into HSR/PRP slave modes via firmware reconfiguration.
> 
>> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> [ ... ]
>> +static int icssm_prueth_hsr_port_link(struct net_device *ndev,
>> +				      struct net_device *hsr_ndev)
>> +{
> [ ... ]
>> +free_hsr:
>> +	prueth->eth_type = prev_mode;
>> +
>> +	spin_lock_irqsave(&prueth->addr_lock, flags);
>> +
>> +	prueth->hsr_dev = NULL;
>> +	prueth->hsr_members &= ~all_slaves;
> 
> [Severity: High]
> Can this rollback improperly destroy the state for the already-linked first
> port alongside the failing second port?
> 
> If the second port fails to transition to HSR/PRP mode, the free_hsr error
> path clears the hsr_members mask for all ports by applying ~all_slaves.
> 
> Because the first port was successfully enrolled into the HSR bridge in a
> previous invocation, it remains an active slave in the networking stack's
> view. By wiping its membership state here, the driver drastically
> desynchronizes its internal state from the kernel.
> 
> Would it be safer to only clear the bit for the specific port that is
> failing to link?
> 

We will address this in the next version.

Thanks and Regards,
Parvathi.

