Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2D3606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 17:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pzam3nto;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IeociuXp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PdL12cit1+z6d3jeLw0+naLR3nXNXmktozH9BnIvo4w=; b=pzam3nto0JkaPmfE3VleJ3RXfy
	k9Ugv8yycoCyKMp8xmWEm/V7T1idH2KuBXjH+pGvg23BMjxWBaASVkj3kBvGmw/tjvhiUBc6fTZq8
	MacYA/29jDEp+iRDTRweuSM2Y24745dV9yv//iVktd0P0yjtWKWt9a6ZXPaciBZ65nXLYBRTVAzHN
	xrBhB7XdrMbo66O/D1VIPy7KaM1luKUHecycs+g1PsE1rI8m9t1uBoGr6mFdmR2MC+WtuCrtEBZmv
	PgPRlMd470AiHAzqPE4xp8Cn6PDwpxj4ZiX9D9y5o1qfbFSW6bie/M6q+6cDTX8JDENATpOiuewW4
	YaJpqNUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDFQ-0000000AIo4-06G1;
	Tue, 20 Oct 2026 17:03:36 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDFN-0000000AInb-1Dhj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 17:03:34 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-917b78dfe30so51218416d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 10:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792515812; x=1793120612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdL12cit1+z6d3jeLw0+naLR3nXNXmktozH9BnIvo4w=;
        b=IeociuXp8r2tXz7GCbnxTRLmacNf51OM/ndUiJ5odWf+4q7TcIyDLBKW47s5/9TfzR
         es6m/nh6NY2F7sFpvZA2/fLKuKwzaZB5fsPxl5HAz/rXE2IIZbLEPseKTq2IuPPJrEX4
         ez37fYGr6MyGz3qU7gOFYS8w7D7JlNXv4XqaTYFC+J1osxe8BvPDcAqMDfCMiuh4022/
         Hl3VqvNomCbuRqhEmlDp8xTMBFCG5OBKvlLdVmLXu+48Suk0xOpF0LiKZHWRScLnzhhv
         g+UbQ3JCGWSBw7NXdoLNqQv3NOaQsqEIAH4OylqqF8tHr2AXjZYEkFILX00PHa4LzBOn
         f/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515812; x=1793120612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdL12cit1+z6d3jeLw0+naLR3nXNXmktozH9BnIvo4w=;
        b=xqXY0EsSDGMjKLwfwPGogAuMjMkVRnGxgQ5XDPVukzgB4tMcwF9j9h/+fn/afoyJIp
         LRYTTsgMpA3Mm7jKr66ftCvRG2nkYpngHjjGj5xEi3xC0qsBIhvgxZYLbKE2AOOkzYNy
         sZxKAxff0X1PAYvWhXeb3mu2utJVcQ3Vg719K3yYscuodNPDXt7jhT6YG/upJ6eotb2s
         rtVKp07v05/IBCEBcSQ5Speg0OejCPIg3Y50p8XEKGRLNu7S8fffk4pziMzesDq5jJcr
         EhPck0+HF7Ds7nYoNOTW4ARGxpCpZV9tfIUBecqM6tFec+HJ/S/1+f3z1W/G6OLx5L0q
         0mxQ==
X-Forwarded-Encrypted: i=1; AKwUvByWTqPSuep0I+Vj4yK0XraqCRaLu8i3xtA0kdESRtCLRHaPMVee4O63KXsym08OrMWGoDmgjIqLhaVbnEahAF7s@lists.infradead.org
X-Gm-Message-State: AFq9FYJjvBeAc5Z91Lq07R/GmZL4vPD/ard1aMAvdRBoOwPu1obdGWdQ
	7ZJgf/ngzbNbIJ6F1a2VPoArhrwtm67pDjhkEDrTr6i46y/9Dy1qVDps
X-Gm-Gg: AYBFou3IEDymEZHzDNUT2MVgIHe5buYzzn7yaI47EBaM+/5p92tImMdbUeEpoX9KZKt
	BvwccP+BFvyzXdJz65piQ0BXF9yIzWj2THRqPyhoXyvtukc/B2QNUGeFsICXOr0Cv6sgoEwjGGV
	4lKuN7fwp6IUvIR3XgsEgAY9FAXjwF9USWirljmtW+xC/ruN/S4yhRlfIUEu/dHxvwjhQjKjRhb
	pIjrGcfZHlDWtwtuE7ZC1saHUe0LODuJcEQHEUVrTK3Oe159KF4hjK6pXnooD0JRBiyViSQQUB3
	fdf4UPRXJUBR1fOJPza0yYkgRjPwXZfhO30FunivVmz+DkHujW4CquVcstuUfoPaxLXWs+aMEBS
	H9rV/i7etN7FjGcgs3tN1kCU/RW9xb6hkRPEzK5GGBteOBMV8L+/Uutb/CVslzS2F0KujIPzyV2
	4qI4KNxs3WGByUpSzdMe1PIU8NlKGC0rjNtGQuwP8A7S5RLc6AHISG+kpiHPhHCvcod6cM22YcN
	FQoNdlu4xujclEJIsVBQQ==
X-Received: by 2002:a05:620a:294c:b0:93f:26f6:6bab with SMTP id af79cd13be357-93f29ccce99mr1849718785a.18.1792515811784;
        Tue, 20 Oct 2026 10:03:31 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56c6e030sm31479985a.1.2026.10.20.10.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:03:30 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] iommu/sun50i: Report TLB invalidation timeouts from iotlb_sync_map
Date: Tue, 20 Oct 2026 13:03:11 -0400
Message-ID: <20261020170324.1223144-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_100333_342354_E3D71A20 
X-CRM114-Status: GOOD (  14.83  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sun50i_iommu_iotlb_sync_map() invalidates the TLB and PTW cache entries
around a newly mapped range, as the IOMMU can otherwise keep using stale
entries for it (see commit e563cc0c787c ("iommu/sun50i: Implement
.iotlb_sync_map")). When an invalidation times out, it only prints a
warning and the callback still returns 0, so iommu_map() reports success
for a mapping that the IOMMU may not be using yet.

Since commit fa4c4507099f ("iommu: Allow .iotlb_sync_map to fail and
handle s390's -ENOMEM return"), iommu_map() unmaps the range and fails
when .iotlb_sync_map() returns an error. Return the result of the
invalidations, after still issuing all of them and restoring auto
gating. The page fault handler keeps ignoring it. The unmap path is not
changed, as .iotlb_sync() and .flush_iotlb_all() cannot report a
failure.

Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
This was found with a static analysis tool from ongoing, not yet
published research, and confirmed by code inspection. It has not been
reproduced on hardware; a timeout is not expected on working hardware.
Compile-tested only (ARCH=arm64 defconfig with SUN50I_IOMMU=y, W=1).

 drivers/iommu/sun50i-iommu.c | 42 ++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index be3f1ce696ba2..74ca3625ae25c 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -298,8 +298,8 @@ static void sun50i_table_flush(struct sun50i_iommu_domain *sun50i_domain,
 	dma_sync_single_for_device(iommu->dev, dma, size, DMA_TO_DEVICE);
 }
 
-static void sun50i_iommu_zap_iova(struct sun50i_iommu *iommu,
-				  unsigned long iova)
+static int sun50i_iommu_zap_iova(struct sun50i_iommu *iommu,
+				 unsigned long iova)
 {
 	u32 reg;
 	int ret;
@@ -313,10 +313,12 @@ static void sun50i_iommu_zap_iova(struct sun50i_iommu *iommu,
 					reg, !reg, 1, 2000);
 	if (ret)
 		dev_warn(iommu->dev, "TLB invalidation timed out!\n");
+
+	return ret;
 }
 
-static void sun50i_iommu_zap_ptw_cache(struct sun50i_iommu *iommu,
-				       unsigned long iova)
+static int sun50i_iommu_zap_ptw_cache(struct sun50i_iommu *iommu,
+				      unsigned long iova)
 {
 	u32 reg;
 	int ret;
@@ -329,29 +331,36 @@ static void sun50i_iommu_zap_ptw_cache(struct sun50i_iommu *iommu,
 					reg, !reg, 1, 2000);
 	if (ret)
 		dev_warn(iommu->dev, "PTW cache invalidation timed out!\n");
+
+	return ret;
 }
 
-static void sun50i_iommu_zap_range(struct sun50i_iommu *iommu,
-				   unsigned long iova, size_t size)
+static int sun50i_iommu_zap_range(struct sun50i_iommu *iommu,
+				  unsigned long iova, size_t size)
 {
+	int ret;
+
 	assert_spin_locked(&iommu->iommu_lock);
 
 	iommu_write(iommu, IOMMU_AUTO_GATING_REG, 0);
 
-	sun50i_iommu_zap_iova(iommu, iova);
-	sun50i_iommu_zap_iova(iommu, iova + SPAGE_SIZE);
+	/* Issue all invalidations even if one of them times out. */
+	ret = sun50i_iommu_zap_iova(iommu, iova);
+	ret = sun50i_iommu_zap_iova(iommu, iova + SPAGE_SIZE) ?: ret;
 	if (size > SPAGE_SIZE) {
-		sun50i_iommu_zap_iova(iommu, iova + size);
-		sun50i_iommu_zap_iova(iommu, iova + size + SPAGE_SIZE);
+		ret = sun50i_iommu_zap_iova(iommu, iova + size) ?: ret;
+		ret = sun50i_iommu_zap_iova(iommu, iova + size + SPAGE_SIZE) ?: ret;
 	}
-	sun50i_iommu_zap_ptw_cache(iommu, iova);
-	sun50i_iommu_zap_ptw_cache(iommu, iova + SZ_1M);
+	ret = sun50i_iommu_zap_ptw_cache(iommu, iova) ?: ret;
+	ret = sun50i_iommu_zap_ptw_cache(iommu, iova + SZ_1M) ?: ret;
 	if (size > SZ_1M) {
-		sun50i_iommu_zap_ptw_cache(iommu, iova + size);
-		sun50i_iommu_zap_ptw_cache(iommu, iova + size + SZ_1M);
+		ret = sun50i_iommu_zap_ptw_cache(iommu, iova + size) ?: ret;
+		ret = sun50i_iommu_zap_ptw_cache(iommu, iova + size + SZ_1M) ?: ret;
 	}
 
 	iommu_write(iommu, IOMMU_AUTO_GATING_REG, IOMMU_AUTO_GATING_ENABLE);
+
+	return ret;
 }
 
 static int sun50i_iommu_flush_all_tlb(struct sun50i_iommu *iommu)
@@ -409,12 +418,13 @@ static int sun50i_iommu_iotlb_sync_map(struct iommu_domain *domain,
 	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
 	struct sun50i_iommu *iommu = sun50i_domain->iommu;
 	unsigned long flags;
+	int ret;
 
 	spin_lock_irqsave(&iommu->iommu_lock, flags);
-	sun50i_iommu_zap_range(iommu, iova, size);
+	ret = sun50i_iommu_zap_range(iommu, iova, size);
 	spin_unlock_irqrestore(&iommu->iommu_lock, flags);
 
-	return 0;
+	return ret;
 }
 
 static void sun50i_iommu_iotlb_sync(struct iommu_domain *domain,

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0


