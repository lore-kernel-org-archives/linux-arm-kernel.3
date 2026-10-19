Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9401B6079D45
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 15:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AozimXbZ;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sJYCDYPY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Meq30BGUrGHp6xcOF0w5JprFYd5g2Y2UtUcpUpaVjGQ=; b=AozimXbZxDc0xvd5n7/E7KkrZa
	jVsfuo+CCft27MtPJsGeI8+BrcKHLUZ0NdQudc4RnEvCp4cTslfy1R3Gkdxu5aX4MVgHNiMD1/uE1
	H3LVelUywooT2yAab0LC+cSU5jBokeMo//uDsVuZt5a0+l+htr2jdxdxuCJKBeQ5BJSy43gTBWivv
	Bn85xmc4/skl4p8U7YTfzlGmt4J4SphqXPAEUnp7qr1sk5kfFhsWCDSuYIFjJbgGdsRxsBChL1Oll
	jm6guWZH18ZZ/yQhK1Cog5fTD0l9vtX+g0mn8O213R6gYwZMEZKXAHbznLFZG7W4Cu1cfym4iVEbi
	3elnO1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoqF-00000007nQH-3x7D;
	Mon, 19 Oct 2026 14:59:59 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoqD-00000007nPi-2qOs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 14:59:58 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-48af5a07314so1359968f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 07:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792421995; x=1793026795; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Meq30BGUrGHp6xcOF0w5JprFYd5g2Y2UtUcpUpaVjGQ=;
        b=sJYCDYPYguJm89clBUcZgSJQogvjD/gub6kmF1/zNAs1t2HcXpf7QSoLNlBwAK8/JF
         v4anXqbe+MkCK8yRhSyTNt4GOJ6gQRVKxo3N1VeI6lhEvqEepG+7f2o+G6OsCT4K+nFc
         iqIxU1s58Sbfn/0kB2oDORw4JIk5A4fYNioep0NG3/z2uCWWkWikk1R4sh5qPzCuPo3b
         FbR6yF6KPplXeG2s8et1ekAjOxoEBQ4xynmTU3Xz1150iJdmkbbeSNghHqKvThT7bTXP
         rrBpzcKTiX2G+THk4avbvNjdh/1qRFo81Q03XHQclIBUuOPvVwFUbBToDZ6Nwt7rodLi
         oZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421995; x=1793026795;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Meq30BGUrGHp6xcOF0w5JprFYd5g2Y2UtUcpUpaVjGQ=;
        b=JOR+HQhCPBSYBeEoCm38njDWB6JC5OW9qj3DB59496iGKi20pHBkpdzwUcEoS5jSIr
         /ajMZzZa5x3Jy1x4ak2Qki/+hbGXUEwzK0O+rZd2bk8A/zjH7ghp1ANshWFjvC9Ka1Ge
         x31OazuxcigrUeMN1uEpOvmrVzPf1gd1O2WN6hQmdsSbM4xoA/CMnMRZ4mYTj8IEF4Cu
         GUdMu2yxcb5YlX6k47vwZ/B/l0nTF6cKQtIHq/dEuBHmvSNJgveaw6Ri54LBx3hG3Fk3
         mrBNhyDkrPHJF6rXA2K3c7UeUkfdQVF4f4DMChc2fKBux2UEfB6N+XxXRF+hHSsmbcv1
         kMjg==
X-Forwarded-Encrypted: i=1; AKwUvBwyTQuDOHYhrUHP/bd3Sn6cwksxKDQeiOg6n6gJ2/XX1/lVlrRLjGqBzYkmQLcwrvv/oPYEt2jUCODNbUfKzsQ7@lists.infradead.org
X-Gm-Message-State: AFq9FYJa5sMflirMpkyPMgPWmAdff17zZkxxO9zUqlGbDwfg55m+2772
	gKiIcWB/WR/OY1j7tX8rUU1HNKT6FlpFOUcurwoGvWMGwzaxkyVG3R82/DwsSqqF0Y9nPGAQYNE
	kzg7/SQkgkRpO3yknjIS9kQ==
X-Received: from wrus7.prod.google.com ([2002:a5d:6a87:0:b0:48e:1449:1f6c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:60cc:0:b0:48d:f14a:9177 with SMTP id ffacd0b85a97d-48e07fb9180mr11409788f8f.56.1792421995213;
 Mon, 19 Oct 2026 07:59:55 -0700 (PDT)
Date: Mon, 19 Oct 2026 15:59:49 +0100
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261019145949.1922019-1-vdonnefort@google.com>
Subject: [PATCH kvmtool] arm64: THPs for systems with pages bigger than 4K
From: Vincent Donnefort <vdonnefort@google.com>
To: will@kernel.org, julien.thierry.kdev@gmail.com
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, oliver.upton@linux.dev, 
	suzuki.poulose@arm.com, alexandru.elisei@arm.com, andre.przywara@arm.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_075957_765564_CABF7757 
X-CRM114-Status: GOOD (  13.50  )
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
X-Spam-Status: No, score=-26.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The THP support imposes an alignment of the memslot userspace address to
the size of a THP (PMD_SIZE). To do so, kvmtool overallocates the RAM
size and aligns it. However it assumes PMD_SIZE is 2MiB, which is only
true on 4KiB page systems.

Use a huge-page size, based on the system page size. This value can be
massive for a 64KiB page system, so skip the alignment if we couldn't
even install one THP.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arm64/kvm.c b/arm64/kvm.c
index 36b3284e4a92..2c01dc32fa9a 100644
--- a/arm64/kvm.c
+++ b/arm64/kvm.c
@@ -18,6 +18,8 @@
 
 #include <asm/image.h>
 
+#define HUGEPAGE_SIZE (PAGE_SIZE * (PAGE_SIZE / 8UL))
+
 static struct arm64_image_header *kernel_header;
 
 struct kvm_ext kvm_req_ext[] = {
@@ -35,20 +37,23 @@ bool kvm__arch_cpu_supports_vm(void)
 
 void kvm__init_ram(struct kvm *kvm)
 {
-	u64 phys_start, phys_size;
+	u64 phys_start, phys_size, ram_alloc_align = SZ_64K;
 	void *host_mem;
 	int err;
 
 	/*
-	 * Allocate guest memory. We must align our buffer to 64K to
-	 * correlate with the maximum guest page size for virtio-mmio.
-	 * If using THP, then our minimal alignment becomes 2M.
-	 * 2M trumps 64K, so let's go with that.
+	 * Allocate guest memory. We must align our buffer to 64K to correlate
+	 * with the maximum guest page size for virtio-mmio. If using THP, then
+	 * our minimal alignment trumps 64K, so let's go with that.
 	 */
 	kvm->ram_size = kvm->cfg.ram_size;
 	kvm->arch.ram_alloc_size = kvm->ram_size;
-	if (!kvm->cfg.hugetlbfs_path)
-		kvm->arch.ram_alloc_size += SZ_2M;
+	if (!kvm->cfg.hugetlbfs_path) {
+		if (kvm->ram_size >= HUGEPAGE_SIZE)
+			ram_alloc_align = HUGEPAGE_SIZE;
+
+		kvm->arch.ram_alloc_size += ram_alloc_align;
+	}
 
 	if (kvm->cfg.arch.guest_memfd)
 		kvm->arch.ram_alloc_start = mmap_guest_memfd(kvm,
@@ -63,7 +68,7 @@ void kvm__init_ram(struct kvm *kvm)
 		    kvm->arch.ram_alloc_size, errno);
 
 	kvm->ram_start = (void *)ALIGN((unsigned long)kvm->arch.ram_alloc_start,
-					SZ_2M);
+					ram_alloc_align);
 
 	if (!kvm->cfg.arch.guest_memfd) {
 		madvise(kvm->arch.ram_alloc_start, kvm->arch.ram_alloc_size,

base-commit: f67bc0bdae9433a9cfd05e65ea2c1bb6102566d9
-- 
2.56.0.176.g3575e65682-goog


