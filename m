Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1A0606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 08:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VkCZeBHV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CDf17+LI;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IcujbxiH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=; b=VkCZeBHVo5lcY7vbwbyjmObL5j
	GO5C4J5XpjZjIj4+QHd8EbNDrcWozSbVEAe8eBbRkZD/Nu7xVVLhACiiakoOFgPF06bVlCmcZeMYB
	DMSLLNtu4fcTLqpDjZM7HRPnaGcIJ85XZWsdnlcK66/9Sk/lm+At51tNGh/OpoHAHgE7UbGVcngEM
	3Ya9aV85Hbofd2cG1i3do4JCHvi3lCY7P2X0rAkWaQwmYMs5nu+24J0b/lLdXZnD5FiZkz5j/UOGw
	1RjdePkZNijWvgmHXYuvyj27Y5dbxj/nt6KC2o+Pp1CbaViWpXvrHpQqf5eZXIWUDn0m5FSwfLdKC
	hfGNVfEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRkZ-0000000BNZc-3oVA;
	Wed, 21 Oct 2026 08:32:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRkX-0000000BNXR-3JeC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 21 Oct 2026 08:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=; b=CDf17+LIpOwE7TpC9ORethpYA9
	dKAhlh1R5KPB5EEV4kdKm3h9wyeef4f2016kQ1ayw4d8TH0Zq2lpAAFWN0Iw1rPFLYzlg+T72++Xb
	cvQRqlX+gIR86FCjH/9kl+HQ24jKIXTGm/3MusicIKu8uf4d/nGOtzpnje8DTt47gZwkvrsLPwakY
	7C906F/3MiJzdkRq3g2FFvws82H4kE4iEQ38YGp1LeET4LqwiRzS9F5hIriNL6us9sG5JdpCML8DW
	9awub2JF8VbyJYlJrG27OlcaBEJLFNuZenyd7kYzGWL0e/IOgQmjZ6vZtY1zZN7LaZG/eiOeEiJWB
	r2eq7SNQ==;
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJRkT-00000005bKQ-1YKb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 08:32:40 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-cd63952c9f2so54635a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 01:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571555; x=1793176355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=IcujbxiH1vkx+wPluDrqbzUsEpNQCEbYAfWDSUN/bWh6HlF01y5Zba9t+PP9HKKiXQ
         AAl6bl+cujYLsX6EINaDpZ/aLGU2pZ3uigZwCsLs++Q6M/xGrVqTFKSf9yklwYshR2Yn
         oDSW7M8ypwkuS+1Ggc8Peig89jB1Htz1xZeWQ5jZwrV1iglX0KSct3f2UxC0WVTPbjxN
         s+d4l9jRXktFn8QOvw9LsLznQ5NZ99uswfVh8ySBGUHn+Ms7OOwFeT7dfpEnukfBPXFj
         mIyHgqxEwiB4hs/u3fZoi70ybSDNcxV+4DiKD435Ur4QKbG/U00TNHj3tqg6+CZIS24S
         A3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571555; x=1793176355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=dYbw20E1dowLH1bqTcrTQdiVv60V9U3wgBcLRou1Au8vj83LateDsEXMxz4Bmr8Xxf
         E378NHad2nez50pxbIDfhEAhLejWbtR7cZ+y1/s2siRgnSMtyxhzA2RGmXuR+C91ynsN
         TwebQZl737lMiUFzh8+VCzye498cFBN3Me3dJGnaZKlmwQGHZ4v5U73yQYylvrhxy0OF
         htsJHfPwY2H89vq1HPqQNAnpm6nwBfJygHuY4LjuwdpyD8RqRL2T65czqUdGLQDrc8Hc
         8rWw1We/4oHIXodl45Jr0G5J7e1wvvHPYyKcjbhCnj4vB+prgxMj62LyY1UvC4XVTBEF
         PpWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzPvADY/Wx+DBhFDoAFB30989n/sfFYXE3jNRTe0fEoMb4p2sIHUxF76wnfZoftKHHQ/Z50GlNWbiWNAsiybXR@lists.infradead.org
X-Gm-Message-State: AFq9FYJWL9ZaU9Lvw4fiianIByz6Qo6oyLUbz16x/N+Kjs5JEVNC4uss
	cZZkKevFyFxddJViBcr4b4zyqTB739VnjLfwezuEJEhtQrYHFmbu5QNw
X-Gm-Gg: AYBFou2TYrz/9c6j7o9wGd/AsefAtAh4STcVokSDi10G2UZjWdhazlxCvkXYtDJQeop
	3xEfwAKDLEJbbw9HbDIJ5PR+Xcltx7dHmKYCfFk9uZs5H5nK8RKgUj+91s5GSAZg0BeReoTReRs
	HVRtESCER2E3fhqE/zRn1pOe0+wFAnLn4xYoVMxR0vgdqQuSk34z5TH7PGC1zMK6rQ/h10+EAPJ
	IekWBmxs7VVFbr0e4b01aiXy3ULC4vr4J8/HoY21ktL6nNIv8l9u8q917Xkc/XzqfQ5ZJxlnup9
	5tGJkWqQlOpmV/eXQKSjSJ7cDtgXTFuVy3lIucwn0DayPvubrZDxWGHz7rCrMfDSKbBuyjoc8HZ
	WfWuIO8RRAzziCS81TfRkIiefXcgzQEIPfcIaXf/VfrpiIzkZA8U4Xz5dHZFPEf+Jk1nVX2ebMD
	K2jHekldlcpLz890OWHDFcgnRrH4p+5HH7505d5qDph+jpg1QLsuM5qyTw38HhanLNT1sg4WKma
	2+kue6TpgvKhOBEbPa4R3AhV/jUHZfeQqdTpHs6tsnb3ofIbo8PxkuSfOJ4IJHP6ZyC
X-Received: by 2002:a05:6a00:1786:b0:89f:3f60:cd81 with SMTP id d2e1a72fcca58-8a089d539cdmr1130152b3a.51.1792571555108;
        Wed, 21 Oct 2026 01:32:35 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:32:33 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v9 8/8] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Wed, 21 Oct 2026 16:30:11 +0800
Message-ID: <20261021083011.2170525-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_093237_606698_140D35D6 
X-CRM114-Status: GOOD (  12.26  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wandun Chen <chenwandun@lixiang.com>

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index e161c8b65e00..0e2ddc933b22 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -283,10 +283,10 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 }
 
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
-/* Exclude NOMAP regions from the vmcore. */
+/* Exclude NOMAP and NODUMP regions from the vmcore. */
 static bool crash_should_skip_region(struct memblock_region *reg)
 {
-	return memblock_is_nomap(reg);
+	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
 }
 
 unsigned int __weak arch_get_system_nr_ranges(void)
-- 
2.43.0


