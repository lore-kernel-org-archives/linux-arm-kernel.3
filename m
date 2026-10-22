Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F9B606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 16:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CbO2heiY;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yr9iOnNx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=68+IeagKgDrW1nl1tCiiDqs5Zxn2UgVcp46ojvUcCbA=; b=CbO2heiY0YQYOgHkyYKJmOs7Xk
	SDm3zmjF/RpfqyCSdpNei4sIuIGPvv27zEuv/MWNlOx8XiHVAMfVkfkQJpwNDE3UbutzX2i1r30nH
	0/Dmbif+HJPCb8kJeT6fGm/0s5gcTJx7yyMbD4eEWdBtsJ0MPn6AZoUaSJU9QhZSYe9JMjv7MlWhY
	93YrbuZGYf907Spow/kKMc8xEHHHKXOBal83M5vWG4rssxEdMtYB0F98Qzom87p0y26YCJ9yUFLJD
	uqW7uEqC+aW3iX0ZIW2cogx7az7SrrwKOeUvQEHSw2NJFmZuCIf/j5bOclipwgjXwDgetgKZRCCS9
	NvnL2cqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvjr-0000000EV06-0VeG;
	Thu, 22 Oct 2026 16:33:59 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvjp-0000000EUye-0DDb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 16:33:58 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-91ba8fcc684so585876d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 09:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792686835; x=1793291635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=68+IeagKgDrW1nl1tCiiDqs5Zxn2UgVcp46ojvUcCbA=;
        b=Yr9iOnNxjfN4BCW8w7CT+FPXYE1lATEoG5Edzyw+LMaiUjyXcZeuxngtfxS1sdOhfa
         nfmrWLp7YQVlDZKw77eaQG0MKF923sqsdaw7LlvCWwxNx3tdWLBKOZdaTIQT87DUzbgM
         kD5PyqSRHvTWhEVI73tqa2OzXqUZD85ixEkSPDT1fOxXxmc5b0HOnTSPbuWReFVS3sMK
         1HL37mR92A2E3Bsk7DjS153OO+a9Im5pW7Zo6g/HFlhPEafsc1l91JdT9YJT0fMOLtdR
         kfsKRi6m7gQJw0Z7NFdfsyxibn6waQ+scNXdAXzZypWcVgg78NystHcvTrCahrO3I7QJ
         z6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792686835; x=1793291635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=68+IeagKgDrW1nl1tCiiDqs5Zxn2UgVcp46ojvUcCbA=;
        b=2M1ukKtYl+36rR0gY27POPgvAMb06zhq9U+rHSVEjZXcx+NcPqL5YMYDlHkahPWlSV
         XJsOCVRZ4VSMQ21ZtOi8S6KVPnd5Rfzxyn5m960mkbRZGf8sSb5sYE2bXMHn5+muPwkf
         WxgL0PLQgaC7GJ+UTZQqsNWdrZUpm4ZpFd3dJ3oJ7zX+RHs+ZLsK5Eq38R+2pB7Dm1hC
         cif/jwWcRWv6FJXLtib5k5MUdbjhCwTIOamy5yRwbs3GPzO5lNJzHtLa3hOHq+e0fVfw
         M0lsDSFrqC6MrhJGsUgXLr3LtYb7ob35vqOTq0w5mtTnNVT18pU1MYIi+7jaydMwC68p
         w63Q==
X-Forwarded-Encrypted: i=1; AKwUvBxMaoortMUgENg3ZT0fesI0lW9F6l50B853+ZZCysw34R4u97e6dMF9SVNVZ2baRl2I6OERSXo7FhaExr6GsGqR@lists.infradead.org
X-Gm-Message-State: AFq9FYJ5KQ6lxAFdc+dVLGRPGjZSfbU5IlFXLGa8NHUTCWISSkvUkq2U
	+NED3tAioQrwbDiftbF3ojeD4kOXvQm3QZ29Ay7gKRbbs8A+MPJ5vDvA
X-Gm-Gg: AYBFou1+8fuoO8y5nSAkA3zrM0z+yfz/0siKR8OIi/Fpi0saklV9ubAVEPgtigJBQBw
	WTv3r3BDtoDPBF5HDIVaZhKjCpoQQ5fNcRJzgBYUVJa8D2q4+FB0Adakm6xOkyBkzwv0v2x2vat
	7bN0kBaYkaL7UrIXPI44XS1Wi60Y1ujEJGRPqTBmwgA5VBtTvHRj5IUV2//HBY+dSIhOclBwlCg
	4haSbI0xt9tdzN6bhQ55EXmKBG7Xvl7GBQoySy4fL4SEot0C6oUv5QYPteGshAL1xfsINa8C1+Y
	BfUMFJg0fMHeOR2zF2jl8Uv1ITxXWHpLoLCX2lu/kjdwIC2yxEu5VRFkfKHk/DhuqW74/ErTcS4
	F26si8zDbyhfF+4d56LsIOVIpd8zrNtVidDn0HeQ9ISyB4gzHXOI98KRs+EhLci50dMxKsy64fr
	KxufwgfcA5l51ks56YqI2QLjxNAH3K+OecKKN28lrh5YY3X/zoWI20hb1p/Eegt0ngSLQWOLD5j
	ZM8/DPbsQWfaDiRBNW+kzZm1ya8LbLzbJuTH4iAoqrymQ5Yt+hBz5MG1N3RQjWlA4EdYG7t7Rvq
	oBDPopazTrt0IinShAQ4c252
X-Received: by 2002:a05:6214:2026:b0:91b:5d3a:4fcc with SMTP id 6a1803df08f44-91c12f57cd8mr99901036d6.57.1792686834990;
        Thu, 22 Oct 2026 09:33:54 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c36f0abedsm1511396d6.3.2026.10.22.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:33:54 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>,
	Robin Murphy <robin.murphy@arm.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] iommu/apple-dart: Report TLB flush failures from iotlb_sync_map
Date: Thu, 22 Oct 2026 12:33:40 -0400
Message-ID: <20261022163350.23743-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_093357_101333_67E5AF1F 
X-CRM114-Status: GOOD (  13.10  )
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

apple_dart_iotlb_sync_map() flushes the TLBs of every DART the domain
is attached to after a new mapping has been written. The
invalidate_tlb() callbacks return -ETIMEDOUT when the busy bit does not
clear in time, but apple_dart_domain_flush_tlb() drops the result and
the callback always returns 0, so iommu_map() reports success although
the flush did not complete.

Since commit fa4c4507099f ("iommu: Allow .iotlb_sync_map to fail and
handle s390's -ENOMEM return"), iommu_map() unmaps the range and fails
when .iotlb_sync_map() returns an error. Return the error from
apple_dart_domain_flush_tlb(), after still flushing every DART of the
domain.

Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
The unmap path is not changed, as .iotlb_sync() and
.flush_iotlb_all() cannot report a failure.

 drivers/iommu/apple-dart.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index b160fb464c5f..1119769f9f51 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -494,9 +494,9 @@ static int apple_dart_hw_reset(struct apple_dart *dart)
 	return dart->hw->invalidate_tlb(&stream_map);
 }
 
-static void apple_dart_domain_flush_tlb(struct apple_dart_domain *domain)
+static int apple_dart_domain_flush_tlb(struct apple_dart_domain *domain)
 {
-	int i, j;
+	int i, j, ret = 0;
 	struct apple_dart_atomic_stream_map *domain_stream_map;
 	struct apple_dart_stream_map stream_map;
 
@@ -506,8 +506,11 @@ static void apple_dart_domain_flush_tlb(struct apple_dart_domain *domain)
 		for (j = 0; j < BITS_TO_LONGS(stream_map.dart->num_streams); j++)
 			stream_map.sidmap[j] = atomic_long_read(&domain_stream_map->sidmap[j]);
 
-		stream_map.dart->hw->invalidate_tlb(&stream_map);
+		/* Flush every DART even if one of them fails. */
+		ret = stream_map.dart->hw->invalidate_tlb(&stream_map) ?: ret;
 	}
+
+	return ret;
 }
 
 static void apple_dart_flush_iotlb_all(struct iommu_domain *domain)
@@ -524,8 +527,7 @@ static void apple_dart_iotlb_sync(struct iommu_domain *domain,
 static int apple_dart_iotlb_sync_map(struct iommu_domain *domain,
 				     unsigned long iova, size_t size)
 {
-	apple_dart_domain_flush_tlb(to_dart_domain(domain));
-	return 0;
+	return apple_dart_domain_flush_tlb(to_dart_domain(domain));
 }
 
 static phys_addr_t apple_dart_iova_to_phys(struct iommu_domain *domain,

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0


