Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53407C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 08:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vUvp0ttX3lOxjdOrvZsKvJKNpHHNusfF6naBdS8j1E8=; b=HRROneMkQSAQENSxCGhKwUXSfu
	VJSquEQDqhaTI59Q2kqogQa9N8HMcRgvMos6mAQiIdU5LQq7WzzELdhCSBAzww80lAlCZhS3nGRId
	U8cD4KnqhUs9Y+IGCdJ4KqicURs3EyScgmeWRO3+loQD0Jla/mkDRnwl95OblZa+lYrFpCzWBRmDL
	hFYTrMNZUeyTmTFoQ9yXOSTwYdjK5vj7ePJkWprQsG9KdR8T1WNAZ9Lr9bpI+utPRW8v7Yhtm/HAn
	4re9v/w7COEm4JXzXrWDvpmCbaauzqAeEOR1m2UbM21Ccn7nf+zN6Hg5c4pZMzJKJopzSu9ss7weE
	c7VrWhVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQCN-00000008RdA-3PT4;
	Thu, 30 Jan 2025 08:46:55 +0000
Received: from mail.cybercitadel.pl ([57.128.173.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQB2-00000008RQs-31cV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 08:45:33 +0000
Received: by mail.CyberCitadel.pl (Postfix, from userid 1002)
	id 9C41A4F2EA; Thu, 30 Jan 2025 09:40:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=CyberCitadel.pl;
	s=mail; t=1738226497;
	bh=vUvp0ttX3lOxjdOrvZsKvJKNpHHNusfF6naBdS8j1E8=;
	h=Date:From:To:Subject:From;
	b=vjmJ6QQlgxRh4baQFHIsbx3LSUKnKC8aB6kIxIhFMkqDs+vUKqnFCpz5lJZIiXoaJ
	 hnhjrwQbqx0OtuWJFqR6ymZ/hTxP1iMc5ldP9G2h2V9c+tekZpz7r/qEYXCi2bsk4s
	 nSn3hZ8+X1++txQllhOBb0+EdSBVZq9awOMWQTRUvHOQx7u54m22+Db39fc4n1gDAl
	 6h+J++sDzFACWlExd/0zNy8smsXg9+yyxaIPk9ZqPSRhKpSc6EoMzcHlzc8drIETWZ
	 fTEhTPqESeYGAvmaV7k0zVED2rqkpflixkbZqiDM8E0nyEMKCCTtLEzfb/fDYxj9bT
	 odlop0Ll36U1A==
Received: by mail.CyberCitadel.pl for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 08:40:22 GMT
Message-ID: <20250130084500-0.1.d8.2dapf.0.ln79fd63pm@CyberCitadel.pl>
Date: Thu, 30 Jan 2025 08:40:22 GMT
From: "Marek Kucharski" <marek.kucharski@cybercitadel.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.CyberCitadel.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_004532_891754_9C6BE0B4 
X-CRM114-Status: UNSURE (   2.74  )
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

Dzie=C5=84 dobry,

Czy jest mo=C5=BCliwo=C5=9B=C4=87 nawi=C4=85zania wsp=C3=B3=C5=82pracy z =
Pa=C5=84stwem?

Z ch=C4=99ci=C4=85 porozmawiam z osob=C4=85 zajmuj=C4=85c=C4=85 si=C4=99 =
dzia=C5=82aniami zwi=C4=85zanymi ze sprzeda=C5=BC=C4=85.

Pomagamy skutecznie pozyskiwa=C4=87 nowych klient=C3=B3w.

Zapraszam do kontaktu.


Pozdrawiam
Marek Kucharski

