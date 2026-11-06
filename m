Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026B8606A929
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UiwyhYzv;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YTnrqTvp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mTZ0g/OW6bu+fEj7cWkXua+TJ8iDpzumwowuwu98h78=; b=UiwyhYzvq6Rma5NRYLvHzbP93z
	6FU7ZNyS5Y/iQ2ED8CwP90xGJCT/MEjPDeAjYUexkIomsh9bNFCYbhcVPPr3T1Tdj4BT1/FJKTs92
	dnZaR0fES+bvSGYTHKTjhAgC5N1Y/cxoQ0SUPkXtn3T6xmtRe8N+JCldx5XUBBI68o1qDbPJ+n8ul
	M1MhJaaEqhK5TUARkvJ21a3OOPaNzUNoZl2IJ47zoH9ulZAC2lDRvk24JtLyrvlInFeTe4yHlbgew
	0+MU1A4n+3/aHV7ItxA4/+HVzk6Yh47hIjHbI0R0rAAHsdvCNZwc56oMr7oJcyfT+yQQ3B0Nj4Tfb
	5hJKe+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIIa-0000000CAqN-0STN;
	Fri, 06 Nov 2026 11:40:00 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIIW-0000000CApU-220S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:39:59 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=EKMXTx2vpiPIJLSsvUsSLP2IlFMynyqwRwz2o9btAEY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793965195; v=1; x=1794569995;
 b=YTnrqTvphs/spjLFs58+EmifQlsXsHzkjgdjAJ3eU+SG2Mw9qyK1Ijbijwh+VPgDvTgrhyjT
 8GJJ+lyAYE4/OrzpQBRr1Va/DohYudu0rn/RDqUtRCzP1SVe/7OaZHPLEIloebqkAX4C7QbdP1g
 /A5uCyMBB8dZ/oTsE3URu2+o=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 06d15aaf5ce9462d;
	Fri, 06 Nov 2026 11:39:54 +0000
X-Mizu-Trace-ID: 06d15aaf5ce9462d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bfca2a2af4so2813e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 03:39:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBylhPg8An1BlfMaarLYNSJ2URoZPOSTIP7vyb9I6PXRNyZjS37giBRcjWV9lF/kBJcY2NbBnVJ9197s8r+taP9c@lists.infradead.org
X-Gm-Message-State: APuU4Z90hNBZUY8K0nwD2YCSxVXcmzevyeqNDSmnSXT+2/0szf5ZhaMb
	8gImjoV4eGLXszp2IIATKtUUEkLOP6gUhpSz62Fqt3ebpB09hMOlJ1UOuWtlU4mVAnj9/AIRd5h
	EdciHocRrK+r/uYVcoLmq21UHYsGv+Ckbt8KuZORH
X-Received: by 2002:ac2:4f13:0:b0:5bf:f1ea:16cb with SMTP id
 2adb3069b0e04-5c00641eea8mr70154e87.4.1793965189940; Fri, 06 Nov 2026
 03:39:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu> <20261105-hyp-pool-and-map-v2-2-44a6ca90190b@cs.columbia.edu>
In-Reply-To: <20261105-hyp-pool-and-map-v2-2-44a6ca90190b@cs.columbia.edu>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 6 Nov 2026 11:39:13 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzSKwuu6L8f0-=1s2XakCXJnM-k89XpagcwjSx6LX6wHA@mail.gmail.com>
X-Gm-Features: AclHuK_vcUGWgqA69ZP0FaHZ948pJbQiiig001SQ8BB8nTw7GVezSPYMrN2-Fbw
Message-ID: <CA+EHjTzSKwuu6L8f0-=1s2XakCXJnM-k89XpagcwjSx6LX6wHA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] KVM: arm64: Check the host stage-2 PGD allocation
 for NULL
To: xuheng@cs.columbia.edu
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_033956_659147_1E97514E 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Xuheng,

On Thu, 05 Nov 2026 22:59:49 +0000, Xuheng Li <xuheng@cs.columbia.edu> wrote:
[...]
> The pool is sized so that this allocation, the first one made from it,
> cannot fail, so nothing in mainline reaches this path once the pool
> size is computed correctly.  Return NULL early anyway, so that a
> mis-sized pool makes initialisation fail cleanly.

Could you drop this patch? Once patch 1 is in nothing reaches it, and
before patch 1 pKVM init fails earlier on those machines.

The guest-side twin, guest_s2_zalloc_pages_exact(), is reachable, and
[1] fixes it by checking the PGD's alignment in __pkvm_init_vm().

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261105075606.367005-2-fuad.tabba@linux.dev/

