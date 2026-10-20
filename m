Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B529A606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yI+Dpz7R;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=UUTH5gVF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LRGHN8ntoxFrPJWrn1Xk1SCNt11RbrFeIIOupsDSQM=; b=yI+Dpz7RL4FMxvf9KL2nDoDJl4
	06t9iDJEdzFux7RNdiNSCnZ9mpAT9Kh206prPdsnCC1qtK2Rh8UPcnA+F6W6bfsXJ0FtzAZhwXmK+
	+2Lu/+izQPDhudMlltr+RSxTrshydXoZIV1oqNAxCD8XKflf0ygv27GOznbdoO3l2C+nfgcb992yY
	TarHZgl90aoE9b9H3Mm+lEZgEaUVQK/ORsOsVpAWq8h8pesahiesRnn/+p/2sLjsXPttOYzDOjcOd
	iwtYntynf1oHhdAMwizET2+BQVqzX3+2R7Rv3b8qqbKWuFJ32jej4e7B4CD4ASC6rdsYRENsM3blm
	joKM59uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAyS-00000009yDG-39cR;
	Tue, 20 Oct 2026 14:37:56 +0000
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.77.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAyQ-00000009yCp-2leB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792507074; x=1824043074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5LRGHN8ntoxFrPJWrn1Xk1SCNt11RbrFeIIOupsDSQM=;
  b=UUTH5gVFrcKwlLKb+vRMmKOVaauwFAhZ5ScNkb2iQRCV6Imiiae3Yzrr
   BvZPJzCE62dlsyQk5fF8bj5As5xgrW2m1VJBJi33cy5QO8Pyv9UWOq01W
   ZufAcxn2fLJOB/xifYi1Nww1qb2Szuzs3jTbKnjpCttkault3zZ2pktru
   XOsjrJpSrnQXYgQrTXQjqteWO8WjO/mBq8vFv+KzZKTKA5esuda8bJSRr
   z7nwcUjHwy3pqbWLGbVda4JJt4hBzCKsb7CTA4rFq2oCjlPSRdRUEme12
   DVhIg8EGYh1+frlwwFlCbAI/1O0/wKfg1JXhtZ3+0tmedeZ+zKma8xHdd
   g==;
X-CSE-ConnectionGUID: ECEm+QCsSqCyXSgn9k7Kuw==
X-CSE-MsgGUID: zvOFRcvFQQSX/LtWEJd9qg==
X-IronPort-AV: E=Sophos;i="6.27,168,1787011200"; 
   d="scan'208";a="31743108"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:37:49 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:11916]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.1:2525] with esmtp (Farcaster)
 id a382078a-ae68-482a-a6ab-df5e639d8f90; Tue, 20 Oct 2026 14:37:49 +0000 (UTC)
X-Farcaster-Flow-ID: a382078a-ae68-482a-a6ab-df5e639d8f90
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 20 Oct 2026 14:37:48 +0000
Received: from dev-dsk-avivb.amazon.com (172.19.102.34) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Tue, 20 Oct 2026 14:37:47 +0000
From: Aviv Bakal <avivb@amazon.com>
To: <sashal@kernel.org>, <patches@lists.linux.dev>, <stable@vger.kernel.org>
CC: <robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH AUTOSEL 6.18] perf/arm-cmn: Add workarounds for CMN-S3 on Graviton5
Date: Tue, 20 Oct 2026 17:37:45 +0300
Message-ID: <179250706537.3484860.18363532452101434862@amazon.com>
In-Reply-To: <20261019135441.1420968-145-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org> <20261019135441.1420968-145-sashal@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EX19D031UWC002.ant.amazon.com (10.13.139.212) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_073754_770361_4091141C 
X-CRM114-Status: UNSURE (   4.58  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -11.9 (-----------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Please drop this from AUTOSEL -- it's new-silicon enablement, and its
parent commit 56603c28d916 isn't in 6.18.y, so the static_assert in
arm-cmn.c would fail.

Thanks,
Aviv

