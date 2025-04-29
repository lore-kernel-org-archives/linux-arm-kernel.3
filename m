Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448D2C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 10:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oT8jmdKRD53dK1OsOJGBSBEwoTPzjwLFCjZkXjFpL0w=; b=L5WWqB7Gde9bi3
	G9yghDAOZBdR0t1wfwNpJoeCAFlzPDYFHVcUJsYNDxCV4LBxY7w6fL8tySJCvIQeuzRRot38SCcWp
	BH9YDEXhD6LF4xDFXFiScd1RW2C//oVTaLhxWYD3OCsJMwak1lDXvRRJ8pTTNQlj2J9XsZj3oM5a7
	Ev+KzymnN/r3Fyfh9a702Xd5tfT1Vff7V9a+zaucAuZqfyu7JbYjAZWDHvazy8Yk0t8RCjBN33GZA
	pSTfrWAwNw1paJjq1ZnMj48YOT44fFFaG34U7bewmjghIuEULKncIq4j0vypFDdWivSTrQyi/ddsb
	g/cyavRIn9tRxcSQI5PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hv6-00000009FsG-074G;
	Tue, 29 Apr 2025 10:10:32 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hpu-00000009EiD-3g87
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 10:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oT8jmdKRD53dK1OsOJGBSBEwoTPzjwLFCjZkXjFpL0w=; b=0JOzSXfqdcMYGwC0bPRPLnnAcf
	PCwW6kpNicsWBKSdKcaD29OYqQG3kreVd+vU8ncE8bDZufHD3/huCJRuajpikIbr/zacfgk6YYDv6
	Yg34PKJjMp2V3I5yNfTcd8VRGbhf13g3JMoHcy6p6vHXNh2b/MPs9ZR7v9ZGS6hZXALr8xT3Boloe
	vvAi3f3QXTgo3UWC8xw/FAd/Zfi3rWyPp24XIfWiNEtZZdOpPdaHcjhFPKEcmnXDD10H6g45EG9Uo
	usiMcM79UHCrk8AOuBNWRit2KTMmiFiwu1pLlK/+PwBEuLr3vb2slyshnWvu/GCbqjfooCLz00Xvg
	Sw+o+dVQ==;
Received: from [122.175.9.182] (port=32794 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u9hpq-000000008U8-2FW1;
	Tue, 29 Apr 2025 15:35:06 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 58E801783FDC;
	Tue, 29 Apr 2025 15:34:54 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 48A6D178245B;
	Tue, 29 Apr 2025 15:34:54 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qr0AbpeTHHwl; Tue, 29 Apr 2025 15:34:54 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 108DD1782431;
	Tue, 29 Apr 2025 15:34:54 +0530 (IST)
Date: Tue, 29 Apr 2025 15:34:53 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: kuba <kuba@kernel.org>
Message-ID: <663252690.1172927.1745921093992.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250424191600.50d7974c@kernel.org>
References: <20250423060707.145166-1-parvathi@couthit.com> <20250423072356.146726-7-parvathi@couthit.com> <20250424191600.50d7974c@kernel.org>
Subject: Re: [PATCH net-next v6 06/11] net: ti: prueth: Adds HW timestamping
 support for PTP using PRU-ICSS IEP module
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds HW timestamping support for PTP using PRU-ICSS IEP module
Thread-Index: rMCkv9aSBafPeayIWiLctpQIplkvYA==
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
X-CRM114-CacheID: sfid-20250429_030510_939160_A75C1B02 
X-CRM114-Status: UNSURE (   1.96  )
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

> On Wed, 23 Apr 2025 12:53:51 +0530 Parvathi Pudi wrote:
>> +static inline void icssm_prueth_ptp_ts_enable(struct prueth_emac *emac)
>=20
> Also do not use "inline" for functions which are not called from
> the fast path. Basically no "inline" unless you can measure real
> perf impact.

We will review and remove =E2=80=9Cinline=E2=80=9D keyword in the next vers=
ion.

Thanks and Regards,
Parvathi.

