Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403CE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 08:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0MzmNftP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GqkpNSLH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mxkMuP/U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9/qG3hNPJNIGpwptQDGRFtRM3jaRgB/Z0bZ0bWRF/Y=; b=0MzmNftPNNjfibo4diCXfz2Pwi
	ILRx8d0z1JU2b48dnaU/jzTxQvZFuxFUCLz4JcyVYTXnhih5d4cmbwPEVWPkJIXZMyx/EuLr/9tou
	xrCHfmXrbvoEIe5iYLRZG9F8JC1R18uZMUqnEEechJEKJBw1MD+gIR48lw71na8evQSx78TjQUzfM
	gpdEkD3iM6Z41v5XxjfH6bC5V1SdTTiLjIBgy5vQxHd18ARFUgGCq1zViTX4Om9kggjIVNTluh/Rk
	qAB1HWT0Cb0L0Gw+YoNJBrRdko5ZWmEOHIItrDAPORN920ubM+9WAL02uqWTxcfBo9gc4sybwEM80
	QaU/yE9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRio-0000000BMEm-0t8k;
	Wed, 21 Oct 2026 08:30:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRin-0000000BMDc-0rXP
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 21 Oct 2026 08:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=e9/qG3hNPJNIGpwptQDGRFtRM3jaRgB/Z0bZ0bWRF/Y=; b=GqkpNSLHwU/X+A4d++0UFGAnNW
	RqWu0notMFtVD1bSE6ZfBJaHyhJm5JRUUBcDfRmB2iQ7gJ2vf7CvN3+Vf3a+aWpc/PuVolHVCKNRd
	EiIljqkZgA2QVPyIr4vBqmbBqrmmOiUHUEz9qzHuVnGL2k2TM1NuTkf2wyhDwUC0vmXtB4Ejl1HPq
	tgzp4ilgXpahecAY1FVG4lkp2P1xwgSa2+t0DWcGLR+GQZTPBRgKFAVkI8mS3kEAbs568uuOlIzNO
	wQSYBuEBGUjBYp0WGrPSqBGs4Fz1nS8LYGqG1PqhloTRlGbAqB5PbZwnNeIYBnvkyXLxs+qRbeM19
	avu5DcKA==;
Received: from mail-pz2-x0b.google.com ([2607:f8b0:4864:3b::b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJRif-00000005b2B-39sU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 08:30:49 +0000
Received: by mail-pz2-x0b.google.com with SMTP id 41be03b00d2f7-cd66d7e32baso44299a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 01:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571443; x=1793176243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9/qG3hNPJNIGpwptQDGRFtRM3jaRgB/Z0bZ0bWRF/Y=;
        b=mxkMuP/UQTnyd6tPIhvSCP3dwPC1gb1N7zqK/+gpX/53U3H+jH1KGCG9bB6obkslUl
         aQ2+RZ7927JrPX0VdF/QgMkIRtzHNxvTLLFvVtdgooIibtPPjTssV0Ej+hBvtmv7MsKO
         r0nffS8cpcxv8ycDyg4eh4+v69Pck4r76xGCYHzmzFRV5UrPK6an0+Fvh7a9RjLJM222
         B7eUiE8E/IuTsSofOjcWUuijsCz++dvGztiNi4/THp63tFXWtPkYUUDhpDQtqZqOUsmS
         oVU/11i4b2hai4LySYCfspbOhmWpPIBYl6wWQvWYoZrgrcqO/bU7Afi6cp7vDVc4leva
         DrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571443; x=1793176243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e9/qG3hNPJNIGpwptQDGRFtRM3jaRgB/Z0bZ0bWRF/Y=;
        b=GPQ4whfeCdwOOuMla5h3nh89PHag88bz7ywzhJ7Mt7frktapbJede9LLR1q18ielPv
         Gx0SbfD+vmUbTCbYhLTPk8rLVpeBHLY/4fpTIegUPjxukUxR/wHkNXAXtNYA3EUugzzX
         GWf38duLnRmAu6nC8vPTIduj22lngB3hI6nS6cqF0al6EagkK1iXoSWtmR8buem6lLUT
         en/57E6N9V60qV74UWRNLqLWhFpagQTfSeq63Un5azyx7h1KY/yGRzOWhAvH6dY0rtnJ
         d8TB2/HDrDt/1nn/SRb9GtXCCgot9mP0ipJp2zdzEpk02MOT7/n5ocZhXlSsnTot5rfv
         RO6A==
X-Forwarded-Encrypted: i=1; AKwUvBxsoHHi3NHqwGYPUmu3s4frYVRUiO8AsItSfRdIhhk7eu+6q/kU+sW3vUHOKYAzj29YOLHlWhnzjBIlZ9coCb3/@lists.infradead.org
X-Gm-Message-State: AFq9FYIdG0XjFs252C9RlEgqtiVQ/f21HtQwZmYzTkopsAeJkZHO53nX
	zD6UVRJgEf8Bk/jtXlfBv3KH2K1OcKF2dJUOFRScUNL/Bb6IaBwA3pn4
X-Gm-Gg: AYBFou3gqfPz1TEH0s9bkHGpPYabxH3WpOWKJFw0wbVIzPfmfFNhGYicIsh0o2NschK
	Ac+ni21p2eDkDfP1OrF8lNrlhmj1F6odAqPEg335b0kWF25HI1jAGXh/TTShZ48hv7iOJ+3XWDf
	5OEj7e31mGSH9SDUnMCXt++vr7w3Zcn0Tju+albbw1SrUQdP+UQmHmLJRg0ZeYnQVL59jdw2kFF
	ADsEeI9UuFTScJRWKl9m+Y0AdKUjmn69tWwesOLYAE1lCFtzYIa4DXh3DLfrAgzrQ6UBhLo+ibc
	BgSpY29IAekod+0pG7eCdsQ6xjkKFVFw8wbtXzW75pToj1WNWRDb5wz0hPCC9plmyH+37ZBZQBE
	iNGGl4Uuo85w7u4QNzwSXStnwBVONDRIA+ZEgwkLLiryu0gqmbNPTsa7n3C+oyEURSv3IsAUL97
	5+SkAgY2CAssVFIwv+3NIhyMJIJWxVKrEBAROeBlf2JN7E39Lq2J2XQEUarrjd2mrLdmddcwEaa
	nJPiN2XIHPPQQLdtKRZpw+X8xhdkJq7ixIcZ+UmjqGtQJHwx/vGLHrSrDu0f0NYwEqZ
X-Received: by 2002:a05:6a00:a204:b0:874:708d:b620 with SMTP id d2e1a72fcca58-8a089d13a97mr1238939b3a.30.1792571443298;
        Wed, 21 Oct 2026 01:30:43 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:30:42 -0700 (PDT)
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
Subject: [PATCH v9 1/8] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Wed, 21 Oct 2026 16:30:04 +0800
Message-ID: <20261021083011.2170525-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_093046_042510_D960144C 
X-CRM114-Status: GOOD (  13.90  )
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

Replace walk_system_ram_res() with for_each_mem_range(). A later patch
introduces MEMBLOCK_NODUMP in memblock, the reserved-memory regions
marked with MEMBLOCK_NODUMP can be excluded from the vmcore by walking
memblock.

for_each_mem_range() iterates memblock.memory, which is freed after
init unless ARCH_KEEP_MEMBLOCK is selected. riscv needs ARCH_KEEP_MEMBLOCK
to filter reserved memory from the vmcore, so extend its condition
(ACPI || KEXEC) with CRASH_DUMP. arm64 and loongarch already select
ARCH_KEEP_MEMBLOCK unconditionally.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/riscv/Kconfig                     |  2 +-
 arch/riscv/kernel/machine_kexec_file.c | 31 ++++++++++----------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e7891a2a89da..e21d0bab77ee 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -58,7 +58,7 @@ config RISCV
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_ARCH_DATA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
-	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC
+	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC || CRASH_DUMP
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 26cd2a8bd0cd..808e872f4063 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,39 +37,32 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
-{
-	unsigned int *nr_ranges = arg;
-
-	(*nr_ranges)++;
-	return 0;
-}
-
 unsigned int arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
+	u64 i;
+	phys_addr_t start, end;
 
-	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
 
 	return nr_ranges;
 }
 
-static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
+int arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	struct crash_mem *cmem = arg;
+	u64 i;
+	phys_addr_t start, end;
 
-	cmem->ranges[cmem->nr_ranges].start = res->start;
-	cmem->ranges[cmem->nr_ranges].end = res->end;
-	cmem->nr_ranges++;
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
 
 	return 0;
 }
 
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
-}
-
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 				 unsigned long cmdline_len)
 {
-- 
2.43.0


