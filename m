Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202C3FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGePfy8u6XKnqNUhFzanr27OG7V/M5+n+RUzQR7Fr4s=; b=AGRPa+P7LoUMKq2KRM9C+m7hN2
	+zbPS4C4LKlHzA9kdiIIgezxqRweHkTxaDk9FIpxhS/mi2UjBRIOKIwbvjK0QHRQBi2VPhZCdH5Yh
	MtyobE5gZiPGI+dVrLaEatjhDCJX/E/YZXjz+v2X19/nk84Z0bwrB0pwo7ZiPqn1YZTCjGOSb+Tt/
	EqeutLphkr7jqFbYIU5MTnSVga73rpzf4IoTGQhrjvRaEp9pu0ZoIGCtmJQs1PjAQiCWeQ4u/pDpy
	FjFEeLLdhjTXhrAMQCUkYifjkhJGWoAASvkxZ4jbt7EcChRUyy1CiWb4ZRMr4R8YwUggYuL/6Fgwg
	oxOfVGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHKM-0000000GSQh-3r3U;
	Mon, 27 Apr 2026 08:28:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHKK-0000000GSPq-3RWz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:28:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77D0544401;
	Mon, 27 Apr 2026 08:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8ECBC2BCB8;
	Mon, 27 Apr 2026 08:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777278504;
	bh=ozzuj0X/PtzwBrR765l0/YzAmLPg8mI7Pw/GI5p4YRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qABbb+zS7pJg/PB72zJd5lhhRbJrAX0d22Sr/Hon2QDiDKCdOJgHXXcIwcwGOa+Xc
	 oUqh0nZidU1Andz/gCaMgXjodzgyDBYSyLQYXoFsl8WRR5XTp7Ke8nl+FF14OicnAg
	 Uc5u+ZM34NrCkin0Bhylbg4GHgTQK0f7EDSf3Ece9R0prnWq6yC0KeSAyTtljVIxC7
	 i0Kld02dkRTPJoTh55kxnMRZd5J+OrOMMB80Gk+CPmLgXGgm+PwPM1g40Wl4y3dFAQ
	 kiFi2BtcM9bAAkAC4PLWmhmwxbGh7JTg9CsMGjL09Z+pQSgIWcXxGU3MYtxpaD8j13
	 Hddm8tWpOlGIw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [RFC PATCH v4 02/11] coco: guest: arm64: Fix a typo in the ARM_CCA_GUEST Kconfig help string ("and" -> "an").
Date: Mon, 27 Apr 2026 13:57:56 +0530
Message-ID: <20260427082805.931832-3-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427082805.931832-1-aneesh.kumar@kernel.org>
References: <20260427082805.931832-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_012824_874712_2328E446 
X-CRM114-Status: GOOD (  11.00  )
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

Fix a typo in Kconfig file.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/arm-cca-guest/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/arm-cca-guest/Kconfig b/drivers/virt/coco/arm-cca-guest/Kconfig
index 5f7f284dae1a..d295146bd92a 100644
--- a/drivers/virt/coco/arm-cca-guest/Kconfig
+++ b/drivers/virt/coco/arm-cca-guest/Kconfig
@@ -8,7 +8,7 @@ config ARM_CCA_GUEST
 	select TSM_REPORTS
 	select AUXILIARY_BUS
 	help
-	  The driver provides userspace interface to request and
+	  The driver provides userspace interface to request an
 	  attestation report from the Realm Management Monitor(RMM).
 	  If the DA feature is supported, it also register with TSM framework.
 
-- 
2.43.0


