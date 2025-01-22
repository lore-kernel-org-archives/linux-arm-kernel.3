Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21448C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 13:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5sSXsNbKlOVO1rVxHF9g5oZKI9cP2dp7dJVKqJoqmKw=; b=llyvhO5z7G38ty
	NpXutUFJwxFelBRDafJJ/o2RI2GgTh3nfx9OWXYU+QutKZ0nAcfBHRnQrGAtjRnXrFh6L5UuZfIf9
	8Q7zJGvEBEr+knxRZFcyWygliuNpW0SoqikdyyqIjpAPYj2tq0p9nha4/nKT198bkyirZCnBYUiqT
	SeF+e/HeFIlI8kCTXDPRdLCl/7UGzZcxeypMrE+FQx2NoiWwptl5PCTNlMCM3A+hJGT8ZX93Oohxz
	jMqyIo/9FhYJEMg9OfLRZ7vJlppN4W+ILLKAAuKbMWJDzfk7iLSZUlmV0i7Fw8vFbZLZrX3aNdMne
	IaigUpEVPu+990r1RYBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taalo-0000000AGw8-1QuE;
	Wed, 22 Jan 2025 13:27:48 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taakV-0000000AGjz-1kIB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 13:26:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5sSXsNbKlOVO1rVxHF9g5oZKI9cP2dp7dJVKqJoqmKw=; b=SaQvURVweuvJgwVC5odAl8eXZ7
	8+4StJGNUPY/AGK819SWCPqNyffcWe6+co9PAT8B9A6wNZsnQvTbzkL2dJHRHrpcYW6ZjoHFDj6vp
	peP3k/buB+jYd7kFWV3+qvUEvzEXT5TQNzMnYj2gVB2/HxkLO2PqVHq9yeLQdYqt8gF8irCU4V+Cq
	5nSI9c+JIR5R7F7DlsqIJG7acv51sazF91TjyPUKOU+EgaLaEjQnwXkuzzVWGzZpTOv4pt110OBGg
	axEzaoEj4L9BlA+NGfoR/b9FrPtYIRFOH1UC9tC5hOC7VQzYMwHsRPfcaC5IksUGjU0qNre+X6bK6
	Zui+nLUQ==;
Received: from [122.175.9.182] (port=52596 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1taakR-00053S-1X;
	Wed, 22 Jan 2025 18:56:23 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 2C0F81781C74;
	Wed, 22 Jan 2025 18:56:15 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 0C1951783FED;
	Wed, 22 Jan 2025 18:56:15 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id imthwkGCwxge; Wed, 22 Jan 2025 18:56:14 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id B924E1781C74;
	Wed, 22 Jan 2025 18:56:14 +0530 (IST)
Date: Wed, 22 Jan 2025 18:56:14 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <1556294138.382514.1737552374554.JavaMail.zimbra@couthit.local>
In-Reply-To: <7870d1e4-074f-4dc5-aae5-ac5fc725cc43@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com> <20250109105600.41297-2-basharath@couthit.com> <7870d1e4-074f-4dc5-aae5-ac5fc725cc43@lunn.ch>
Subject: Re: [RFC PATCH 01/10] dt-bindings: net: ti: Adds device tree
 binding for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: dt-bindings: net: ti: Adds device tree binding for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Thread-Index: 7/757csu1vp/TbaDoZJV2PkPCfrayg==
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
X-CRM114-CacheID: sfid-20250122_052627_485188_1900DE8F 
X-CRM114-Status: UNSURE (   6.64  )
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


>> +          ti,no-half-duplex:
>> +            type: boolean
>> +            description:
>> +              Disable half duplex operation on ICSSM MII port.
> 
> I already asked this in the next patch, but why have this property? Is
> it because the hardware is broken? Or is this some sort of policy?
> Policy should not be in DT, DT describes the hardware, not the policy
> of how you use the hardware.
> 

This series of patches enables support for full-duplex only. Support for 
half-duplex will be added in subsequent revisions. We will clean it up in
the next version.

Thanks & Best Regards,
Basharath

