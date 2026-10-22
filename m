Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E345606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 06:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=32CtVTre;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=o89fCFpI;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nl7TGnJ1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6hyPiRO1YLgh5z7vpK+8rbMGtfzuaM8kNLxgiQL1q1o=; b=32CtVTreV3e7Y5N39bFGOS3o+Y
	dQU/Eila9ttM4J5pSJvfzq3cOsz47n5UafoAeeNWk3E7ptEPkKCTqaqdnzUGr29bSZDajVw12HnVq
	/4xD5OzC7Xi/ZmgyiJ0NCx9ejiDdquCTdh6aI6zly0v8vZRm876g4Qv85Pf47eQzey/QFcxcuP/NF
	gKXcyQzDC85PiW0tOPc15wxGsp3uTjvRtrQcqelY2iVdDcAdvfHG3JvyOXMzIz47b+lDOO+MvYJD0
	O23kNKbDaQ7zjkMGLRRHyL0us3JJxrPhGPYdy8zAi+8q0zSC6g8t6fNq6TTchYZm8tAigialSk3DG
	ZJYa531g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmZc-0000000DVKH-1atH;
	Thu, 22 Oct 2026 06:46:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmZa-0000000DVJf-00a7
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 06:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=6hyPiRO1YLgh5z7vpK+8rbMGtfzuaM8kNLxgiQL1q1o=; b=o89fCFpIfRVcC4tUzgQMkVhB6o
	wu2/ChaRhEmAfx8kk6illgp68xC0B0XIeamJ91ksuE3oD4miERoSsiIzSUefL1I5XiIYe5/mkypk+
	catOx4vCS1cZwwb14hdBMZQ27aejaOSHkRnDUDT7G6P8b3b/xWdnMZYyPRObiba9TAvxujy9PCR7+
	v746Sor5TYhbbdGwpkqwvcMvizaHhGNmb7zBJ6LZpLMWseqViQi3laVaRWZgH/ofge1N5OgHdoOuv
	GEVVn52vm12ZFJEIGt/Kj7oJB3Xejkxtu6To7vCnaaqoZ3QagDjWS8Ifr1uPleHl9Ec5Al7ZFI8Ua
	TU/jQ42g==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJmZW-00000006Whw-2MhE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 06:46:44 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48b001cd92bso824515f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 23:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651601; x=1793256401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hyPiRO1YLgh5z7vpK+8rbMGtfzuaM8kNLxgiQL1q1o=;
        b=nl7TGnJ1s/u4JwGU4WGeYJ/gJ+LcOScLWJiKhr0JKc+GfPdChOs986Zf/fUs+vgxvH
         swUEWvvtxfhaksVQ/CHNiXcnX2cuBwBlV/v3hOZlTp1KBYtx/w1d/VEmTOwMWjVDhSlv
         Sj9UMt/2zyMOXOIzDIBy6SD+XxQid5rTzfsFv2mc9pp19//jj4gVX/TjXMFGP40bOq1d
         za73bCVCq/u0U5bv3ZCWTewHC2iUjLX7Ld5NHUV1vJOkVSWAgbUK66AtSsBI1pejKQ1Q
         SPaoP4uNf5ra6vyN8/HNpqhp4nYD/tg+3eqychbn29JlRKSWjAKYswmtLnN1SngCSa2q
         eGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651601; x=1793256401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hyPiRO1YLgh5z7vpK+8rbMGtfzuaM8kNLxgiQL1q1o=;
        b=SEg+L7I0fsb7QsV5GLaeIM4+HtDBzAiYu4JuGdNII+VfXdvzhFVJrk0lHP7egrB5ju
         uC4VTpaSKNfComN/b4sYilpM7vyUfGi3kG1yAe/8J06kTw1rah17p6/aLL4+6CYTi1Gl
         pdfcM5kNxo8xs2Zv0hA8FNUwt1k+sonoJc+FG4O9Yvs8sgiYnwEjUK3m9+4YalvvNTh7
         OFs4IN7OadtbwLdQavVdbsuyG6P7Te2kv57Lma9QAepmrN+hWxMEx3tx9KIUD9M/LPlp
         99dzhAlVg22eGolTfeSsh0qBMajhnj2qrug8VUlbkTYn+ZUNqfMY6Lr96QpAl9vdFwA5
         z84Q==
X-Forwarded-Encrypted: i=1; AKwUvBzWiKede13KOrwXRPPzy7XFmDngGxspxwf9E4HYNaTBgZ2WvAvr4dwqeVhY1Bt4meXzXxF+YjPPTc100czwzb98@lists.infradead.org
X-Gm-Message-State: AFq9FYJOWKNy35xvYutnLjrwN2A5Ygy0pOntAXVdzGUbqFZc8icyL2f9
	vVEltET2o6yCyVhhHfG1JzgqEJXf16XuPJTyCgmGCc6bAt+Ya8Q61XfU
X-Gm-Gg: AYBFou3ig8a74+VcEsfuTK42Gfd9RkLhrdtOPUMtotEbriHURVNej7ThZOApTyapzue
	qxyu4gku0CNk3CdA6FMYG4b3MKMUOnqWPZr6XLcep59Rd51LE4HT7Uk40BQCzpAgel0luwJQl6B
	+VXLloGUWRHFtTk65O/GAICbofVR34K6GvZBGGgdGDEN22/cVBd0ftmqqCVnaAGZuUbw4JntCEA
	XGlWcATbbnhlQMp13p+rxraaQ2rSWfse95fh28XKvYWGSnKEJ3V8ZCu1kWXfzCNDiU1g0MGO2UG
	Rn7RxLKF3pOWQtdYlECl0fr990MTJ0vPW9stzRrVtcT/Fs09+Zahzh9gqzX2iuLS8XrIhFLLpWS
	06Nln7ay37bJMVizBWlUabPPgOWw9M/2GOHKE4sikDQzkycq+eT/vyC5wi4z65SQTZWFqc262x9
	m+SvmKQ7kJwspL1w2Ol3ko2nGALUVaWLiH6V8d264MJNEswa+2ofxF1Iy4I73LnlzG0Hpk9Ldpu
	yIWyydqdc5xNYnN3g082Wxg8XsrqdG8YV1QATgwnhYEC2kn8bD6AuN154xVhoB/HeZjGd9Wp6fM
	FKG8PAarJ+JE6/lKueiw9jhEn3LbtJZq0FRMCI2qhPCnMlbZq0Gtao/o67WmgNaAs1UG0vXhQDd
	nDLm7ROQQSGihmLfbhzUBEVx8/kLjq7osTz9Rln32pfcEfS6f07332cB3VSuxkN3M
X-Received: by 2002:a5d:64e4:0:b0:48b:118e:7454 with SMTP id ffacd0b85a97d-48e264bd971mr9315929f8f.31.1792651600585;
        Wed, 21 Oct 2026 23:46:40 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm10215624f8f.22.2026.10.21.23.46.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 23:46:39 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] KVM: arm64: Preserve level IRQ re-pending
Date: Thu, 22 Oct 2026 08:46:25 +0200
Message-Id: <20261022064628.4206-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_074643_156233_E65CB0DA 
X-CRM114-Status: GOOD (  15.18  )
X-Spam-Score: 0.8 (/)
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
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A guest can set a level interrupt pending again while handling it. The
GIC records Active and Pending and delivers the interrupt after
deactivation. KVM instead drops the second pending state for both the
GICv2 and GICv3 backends.

The VGIC keeps software pending state outside the LR because commit
67b5b673ad4d stopped placing Pending and Active together for level
interrupts. When the LR is folded, KVM cannot distinguish the pending
state used to populate the LR from a later ISPENDR write. This series
records the later write and preserves it across deactivation. The last
patch adds a two-vCPU GICv3 selftest.

The awkward case, and the reason for the RFC, is a write from another
vCPU while the interrupt remains in an LR. KVM cannot know whether the
write preceded or followed the guest ack. This series preserves the
write. A pre-ack write can therefore cause one extra delivery, while a
post-ack write is no longer lost.

The exact alternative is to stop and synchronize the target vCPU
before applying such a write, as the active-state accessors do. Is the
conservative replay acceptable here, or should ISPENDR pay that
synchronization cost?

The issue was reproduced with Zephyr, NuttX and RT-Thread guests. On a
Raspberry Pi 400 host with a GIC-400, each GICv2 guest handled the SPI
once before the fix and twice afterwards. A direct GIC-400 register
test also delivered the interrupt twice. With a QEMU TCG GICv3 host
running KVM, the new selftest failed before the fix and passed
afterwards. Existing vgic_irq and kvm-unit-tests GIC cases passed on
both versions. Those runtime tests used 8623551a424d.

The series applies without conflicts to kvmarm/next at dd0bc00e3e92.
The modified VGIC objects pass an arm64 GCC 14 W=1 build there, and the
selftest builds natively on arm64. GICv5 does not use the LR path
changed here. I have not tested a mapped physical interrupt or VFIO.

Karl Mehltretter (3):
  KVM: arm64: vgic-v2: Don't drop pending writes to active level IRQs
  KVM: arm64: vgic-v3: Don't drop pending writes to active level IRQs
  KVM: selftests: arm64: Test pending writes to active level IRQs

 arch/arm64/kvm/vgic/vgic-mmio.c              |   9 ++
 arch/arm64/kvm/vgic/vgic-v2.c                |  13 ++-
 arch/arm64/kvm/vgic/vgic-v3.c                |  13 ++-
 include/kvm/arm_vgic.h                       |   1 +
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 101 +++++++++++++++++++
 5 files changed, 131 insertions(+), 6 deletions(-)


base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
-- 
2.39.5 (Apple Git-154)


