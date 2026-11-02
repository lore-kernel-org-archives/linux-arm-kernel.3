Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DA8606B5C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I+AvaN4D;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E2BUc6im
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=I6wt0qCogvuBKigmh2JCg/spsby2CoXz9wPbiqsiJUk=; b=I+AvaN4Dko704tM8jf4zPizT54
	eU9tASHGy9U6xTNpS4baqJXEhjECiIbTEI4CgNGZSb/8e8FKB/w/3w/yOGyMfgEtsvU6fx51S4kMO
	oOO7owkVDyhr4uY46U0FTuBuvWGP7v3hz6F3VopvVv6pXfzKV0GwN8tCnaFWUg8NgoBR2rcrMlAo1
	hoS5nVgaA3yMX1fjZdqizoo4N43SKe0T5oqbhWgfHGlKueJzMP9VnjRH+Rjw+/rR5dpLP5vE/Hyxi
	p7/bmLLbIxft5z5aqwM6WT4c7+9gL0JfzTKDzMnRDfmylpL0pFHF+T5LqC/aL1kHtWNgtE01CErg3
	iZt+jBAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsoG-0000000GkcV-1HI5;
	Mon, 02 Nov 2026 14:14:52 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsoC-0000000GkXm-3fnW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:14:51 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-48af4046a3bso3052324f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 06:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793628886; x=1794233686; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6wt0qCogvuBKigmh2JCg/spsby2CoXz9wPbiqsiJUk=;
        b=E2BUc6imOtu0LTjOVhX/ZWEGHnp6N0+R+mA2mXG31D/f3yzfaaSXGKiKkPqNlXXImk
         nGKz5IsFWlMtZWfz2me8m05Ea17OjFQ+O1A1kJIbcL7/xqAr2eFt1+A8oC3srvEsZG9f
         aPKJ5ishvW4Ch2itgTtSYzhBgW4+4m92lokyN4yX9H0Mc8+Y34tOu/E405QcnS09i2gq
         lEgwaJ9HVtO8y3zE5rvJVa03EFa/KEcxh14A7rX7IzxoAnuyFKpahm7pHAgkKf0bWD85
         ketM4f7rgNs2Ihjlo9nC+KU6uAcf5N0aaFEZg+2JhAU1Z/MTssD6RdGqdz7Bk86UH7F8
         lVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628886; x=1794233686;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6wt0qCogvuBKigmh2JCg/spsby2CoXz9wPbiqsiJUk=;
        b=MrRmuezihmH8JfaybLwR5oRrVQdCuM8wMGnmYIIoZsAQXGnIWuScKJ7mi2oZR22ALq
         xpmPXfT3nqwTia/q+41awDPWJUpehLj1ToHP9H/867qRMpYUcgQqrcTJNbNA8s0KNb77
         j4+qX8CEVVfXs+D6wDYzcDtMgMig/+HMSR+4TwhKyWUcNrRsagziwvKhGxVBs8CRkAWs
         R35axuDY7g0npfGLH5caglTQKq4bOgHK9CAWyq9wzJXTih2ciQEU3HQBo8qeKjjrI6Zw
         K1FEvNatfiJMUa1di12yPO1XV4AqZKhfWhE/o9twII7fLf/0vgGlhebiybDq9fcaoYoV
         L0rg==
X-Forwarded-Encrypted: i=1; AKwUvBxIe1XIuI1SUM/G3zBnVGt3Ki6NtncTEjWKX4ppTnc7w7XnNLqjYCm0wHObuQbN7oPDOX6rOexsGRRsEPwtgjLX@lists.infradead.org
X-Gm-Message-State: AFq9FYJodnclW+D14VAFkMbBap85w+t6za9L65q2Gqp3Cn3Th/TtEu4M
	AWOCPtHkJRUwfH7kv2Qfef2cuP1WKvblXof1X4P2q4MwYj3FO7jtlBc0IcmmICU0ttt3q8TQxP7
	hV/inZEEluT428TOaZAjE0s0vdQ==
X-Received: from wmbf3.prod.google.com ([2002:a05:600c:5943:b0:4a1:fa1d:83c3])
 (user=snehalreddy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:628d:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4ac185bd243mr235882325e9.17.1793628886221;
 Mon, 02 Nov 2026 06:14:46 -0800 (PST)
Date: Mon,  2 Nov 2026 14:14:42 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261102141444.1830221-1-snehalreddy@google.com>
Subject: [PATCH v3 0/2] KVM: arm64: Support FFA_MEM_RECLAIM2 in host handler
From: Snehal Koukuntla <snehalreddy@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Snehal Koukuntla <snehalreddy@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_061448_964121_B8017679 
X-CRM114-Status: GOOD (  11.29  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Arm Firmware Framework for Arm A-profile (FF-A) v1.3 BET0
specification (DEN0140 rev K) [1] introduces the optional
FFA_MEM_RECLAIM2 (0xC4000091) ABI.

Reclaiming large memory regions with the existing FFA_MEM_RECLAIM ABI
can take significant time, or relies on a stateful time-slicing
mechanism in the Relayer. FFA_MEM_RECLAIM2 allows an Owner to reclaim
exclusive access to a subset of pages from a shared or lent memory
region by passing an array of constituent memory region descriptors in
its TX buffer along with a starting descriptor byte offset and initial
page index. The Relayer returns the number of 4K pages reclaimed in
that invocation without maintaining intermediate transaction state.

On a Pixel board (pKVM, 16K pages, EL3 SPMC), reclaiming a single 16K
range drops from 1.3us to 0.7us (~45% faster) by avoiding
FFA_MEM_RETRIEVE_REQ/RX_RELEASE (~0.6us), and single-call
FFA_MEM_RECLAIM2 stays faster across small range counts (1.3us vs 1.9us
at 16 ranges; 2 calls break even). Up to 64MiB (4096 ranges), batching
256 descriptors/call adds 15 preemption points, capping each EL2/EL3
call at ~11us while keeping total SMC time within 5%.

This series adds the FFA_MEM_RECLAIM2 function ID definition and
implements host proxy support in the pKVM nVHE FF-A handler, unsharing
the reclaimed pages in the host stage-2 page tables upon a successful
reclaim response from EL3/SPMD.

With the FF-A v1.3 specification now at BETA (1.3 BET0), drop the RFC
tag so the series can be considered for merging.

This series is based on v7.4-rc1.

Changes in v3:
- Drop RFC tag now that FF-A v1.3 BET0 (DEN0140 rev K) is released
- Update specification references and links to DEN0140 rev K (1.3 BET0)
- Add benchmark numbers to the cover letter and Patch 2 commit message
- Collect Vincent's Reviewed-by on Patch 2
- Rebase on v7.4-rc1
- Link to v2: https://lore.kernel.org/r/20261016082341.4030770-1-snehalreddy@google.com

Changes in v2:
- Mark as RFC until the FF-A v1.3 specification reaches BETA (Sudeep)
- Rename FFA_FN64_MEM_RECLAIM2 to FFA_MEM_RECLAIM2 (sashiko)
- Check total_pages against the sum of constituent pg_cnt (Vincent)
- Simplify the flags and offset alignment checks (Vincent)
- Rebase on latest kvmarm/next
- Link to v1: https://lore.kernel.org/r/20260921164748.2958578-1-snehalreddy@google.com

[1] https://support.arm.com/documentation/den0140/k

Snehal Koukuntla (2):
  firmware: arm_ffa: Add FFA_MEM_RECLAIM2 function ID
  KVM: arm64: Support FFA_MEM_RECLAIM2 in host handler

 arch/arm64/kvm/hyp/nvhe/ffa.c | 126 ++++++++++++++++++++++++++++++++++
 include/linux/arm_ffa.h       |   1 +
 2 files changed, 127 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.317.g454f8302e1-goog


