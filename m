Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA43D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 08:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UJOY4vyMUgMeRHjwRhsFcjDSVBFr2F3TlIQIYfkWik=; b=09+95CEvglfAK5ymB8L9j1U1JB
	TynkSE1r5tByo4k7b6z2B765xkNVoSBjFozvOgkpJkxJFbFCg//14oSwBHXhijpXCKXqsSq6SOV8U
	adS8h0snfonxj05atoqbH+Dd8woCb1gM2YYrzxsb11JR5WO0/eB8eRFn1nBzXdJ2NVRzNzYSVF2c8
	XheDZv8KR91SRH/Z6EdtqdC3CJx+JVS+J8JOksRKjdsGO0buYSdGy0wIZwg28G8pEhQc7+Ni2R3po
	9oZepuLjc/PoKLyOpqrIsKfYMVorzeMGE60xWoQO5HBX5liuhSm3pFRh1qtjx4mcX1Sq3pgGttige
	SXuiqHqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiNx-00000006K6e-2DiM;
	Wed, 03 Dec 2025 08:38:53 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiNv-00000006K4x-0oby
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 08:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3UJOY4vyMUgMeRHjwRhsFcjDSVBFr2F3TlIQIYfkWik=; b=Rd9YY+WJnkxZJ4szjNo9H3w9Hg
	lZZg8qD/BQJE4U0gCU0JMwOdkyrzMe7G1jpjuMrDobq6u/8eoX+NACWFBa/X0LGCVpNACm6ctC+yZ
	l++U/Gaohk2rjIJdA6i5ei4wpzlIeL9f/J894uapoRRpgULf8DlOqJp58dZ/mOKNRJbP1NQsSunp3
	OINyr1rG3b49G+FexMn4E+2HzXnyAW9g/xOcv9ArLfjA/ucxoMtaXCCIwfqZRh1Sya+19dy8PUcBk
	JOpA1OWEwk9dFTYJbJal+ARUWd+RrgRbbcOXcaGvEhU28//Tgmiz3vruaET1Kz4zLCIGr4z6tQht9
	Gdtw9rxg==;
Received: from [122.175.9.182] (port=19588 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vQiNE-00000001cuJ-1GlG;
	Wed, 03 Dec 2025 03:38:08 -0500
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id E10851A655AA;
	Wed,  3 Dec 2025 14:08:01 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 6Qm2ZRSK-WP5; Wed,  3 Dec 2025 14:08:00 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 21AB71A6575D;
	Wed,  3 Dec 2025 14:08:00 +0530 (IST)
X-Virus-Scanned: amavis at couthit.local
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10026)
 with ESMTP id vRFxtNWMYZmL; Wed,  3 Dec 2025 14:08:00 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 0580E1A655AA;
	Wed,  3 Dec 2025 14:08:00 +0530 (IST)
Date: Wed, 3 Dec 2025 14:07:59 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Parvathi Pudi <parvathi@couthit.com>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	pabeni <pabeni@redhat.com>, rogerq <rogerq@kernel.org>, 
	pmohan <pmohan@couthit.com>, basharath <basharath@couthit.com>, 
	afd <afd@ti.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	ALOK TIWARI <alok.a.tiwari@oracle.com>, horms <horms@kernel.org>, 
	pratheesh <pratheesh@ti.com>, j-rameshbabu <j-rameshbabu@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>, 
	danishanwar <danishanwar@ti.com>
Message-ID: <483862293.84606.1764751079970.JavaMail.zimbra@couthit.local>
In-Reply-To: <20251201141638.00a986dd@kernel.org>
References: <20251126163056.2697668-1-parvathi@couthit.com> <20251126163056.2697668-3-parvathi@couthit.com> <20251201141638.00a986dd@kernel.org>
Subject: Re: [PATCH net-next v8 2/3] net: ti: icssm-prueth: Add switchdev
 support for icssm_prueth driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.233]
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC138 (Linux)/9.0.0_ZEXTRAS_20240927)
Thread-Topic: icssm-prueth: Add switchdev support for icssm_prueth driver
Thread-Index: kayInG6VeUWfAgSoHuPqaRDLltmknw==
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
X-CRM114-CacheID: sfid-20251203_003851_282475_8B5A73C2 
X-CRM114-Status: UNSURE (   6.04  )
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

> On Wed, 26 Nov 2025 21:57:13 +0530 Parvathi Pudi wrote:
>> + */
>> +static void icssm_prueth_sw_switchdev_event_work(struct work_struct *work)
>> +{
>> +	struct icssm_prueth_sw_switchdev_event_work *switchdev_work =
>> +		container_of(work,
>> +			     struct icssm_prueth_sw_switchdev_event_work, work);
> 
> Consider using shorter type names.
> 

We will address this in the next version.

>> +	struct prueth_emac *emac = switchdev_work->emac;
>> +	struct switchdev_notifier_fdb_info *fdb;
>> +	struct prueth *prueth = emac->prueth;
>> +	int port = emac->port_id;
>> +
>> +	rtnl_lock();
>> +
>> +	/* Interface is not up */
>> +	if (!emac->prueth->fdb_tbl) {
>> +		rtnl_unlock();
> 
> Are you not leaking the device reference here?
> 

We will address this in the next version.

Thanks and Regards,
Parvathi.

