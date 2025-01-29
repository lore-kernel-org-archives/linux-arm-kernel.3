Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF36C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 05:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lF+CIRph9PZhptroJNKOInSrSEFt7RGWkV6dkzmXep4=; b=FMsQb5Lwp7BODG
	kToCy6tgGQbtCqPcKjQMIwfFVyiIlFY3k8iyouF5Qua39pMCl22DGsxAF99Z5Qla347GD2vqfkWSJ
	NMZtiN6Sm9U9s77rV50ozLBhkVx0K3SbedyuTQXBe9V+G9qk5IgcAkPzJKBX1ckOkBZAYapnJTA2C
	N0E1URyEzCldG19/bSI4pQ3IjpqCDfV5zwpy3Dd5sRA7lXFoha31eK1sf2TtvnIWq4MxzVvwFTjT5
	yzoR9gpK3QMdBSLIHecJCkjEzG/qDRNAPD6GHU8P5slfkJi4Bz00hiVVGD7b8W31hjp62djJOeMV0
	r3tf6zITQ9qJ6uOV4OQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td0sY-00000006Mo7-1NuI;
	Wed, 29 Jan 2025 05:44:46 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td0rB-00000006MeB-2BVa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 05:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lF+CIRph9PZhptroJNKOInSrSEFt7RGWkV6dkzmXep4=; b=GmbAZpSQX64uePyjfW07O1zI5M
	7Qzfr7XG4LtpoVq+jGix0ruD+/TKAs7WQq3e/Axw/1CjfH5Y+TUXx0i7HFvk9tPdQ2a4D6vrhCVXH
	+ugD+HxFoOHgIRsdzFWfFIjK18A3kd7qZdPj2vN2mWh8C/q/RoEbQaFltNf7j6TZ7XgqxyD+QZxsb
	/mTIINNW/OoXdec2pk6mAuP+gxXjF1kcMDI78jwc4Ux5I9ZztuxeMfkCdDBVpmQxCYrMVTt57EH+7
	QBBZSsrqfvc8jqpaXljgzC5jMHlxniYUzHHn3a0ln+z86vg1wP3CjwUjM7BC8tLfKZn7bxlLx1vY9
	6MB/9abg==;
Received: from [122.175.9.182] (port=58282 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1td0r7-0007xu-0t;
	Wed, 29 Jan 2025 11:13:17 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 3535D17823F4;
	Wed, 29 Jan 2025 11:13:10 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 154061782431;
	Wed, 29 Jan 2025 11:13:10 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id m6r8Cg2k0lcC; Wed, 29 Jan 2025 11:13:09 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id BFFD317823F4;
	Wed, 29 Jan 2025 11:13:09 +0530 (IST)
Date: Wed, 29 Jan 2025 11:13:09 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Joe Damato <jdamato@fastly.com>
Message-ID: <1124259986.450336.1738129389588.JavaMail.zimbra@couthit.local>
In-Reply-To: <Z5QgNu9AOzRre91J@LQ3V64L9R2>
References: <20250124122353.1457174-1-basharath@couthit.com> <20250124134056.1459060-5-basharath@couthit.com> <Z5QgNu9AOzRre91J@LQ3V64L9R2>
Subject: Re: [RFC v2 PATCH 04/10] net: ti: prueth: Adds link detection, RX
 and TX support.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds link detection, RX and TX support.
Thread-Index: Id3fz+1DPwxTNAkjE+YT/LkbLXOzTA==
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
X-CRM114-CacheID: sfid-20250128_214321_607105_7FF90287 
X-CRM114-Status: UNSURE (   9.33  )
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
Cc: nm <nm@ti.com>, vigneshr <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, Rob Herring <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, prajith <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> On Fri, Jan 24, 2025 at 07:10:50PM +0530, Basharath Hussain Khaja wrote:
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
> 
> Looks like this patch was duplicated and posted twice ?

When I posted the patch first time I received a bounce back error.
So I was not sure if the patch got posted successfully or not so 
I have to re-sent. Sorry for the confusion.


Thanks & Best Regards,
Basharath.

