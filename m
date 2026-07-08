Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34136C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IuS9qPC4OBVkB/ud7M2ir3/wpprJ3sK1HjnAUV2Dc4=; b=47EHo6InGlH70hyIH8gdcuqPlZ
	Q1Y2+o0BnZowfwaRrrlASLyYWL/RyJpq8guHVnql7BhTtZaIoaB0t6b60u1/xk0L65DesWYsflKyH
	x5oCuibjTfqmh2lhADY/t2yFpgTVjwl51qaaWsHs/XKsvG+nMYHwsvE8kUA22oR8S5jOKnDDED1G5
	AsUtAFtHKm5M0s/6TL+SR4jvBthlppudAEHFHcPUnyGQQ83y3g9X53watqt4m2e/IhoC6WBaTMFPN
	Pkd6r5kXjBnIwjPnBil7yRaSVlBEbcJ20v91ahT5zUbmipg9hNGPBNWqWaKSjGu7ZZtu7v8cqVWnN
	Tbttx5Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTVO-0000000HNMR-3l4T;
	Wed, 08 Jul 2026 14:44:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTVM-0000000HNLl-3P3A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:44:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0687D1D14;
	Wed,  8 Jul 2026 07:44:00 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7C3003F7B4;
	Wed,  8 Jul 2026 07:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783521844; bh=uWS/sPdkOJugaAxTUZRNeodfhNhiiCyeDP95Fb2/glk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eVeXTBdrR69aocNc5HnMpOiR1i7e/ZvswVCE7qdqHLZY04mMbSRyY3k2mITJDTOIc
	 QTPEnnLRwlMb4oNO+7EG9JritmIHAEkIxFfg5xqjNCIz+L1N2Z4bd0DN1Ww2QoddG4
	 HoxHUuqAyMBfF1DJtq2yZTpOPJboMNQU9s2KTIUA=
From: Linu Cherian <linu.cherian@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linu Cherian <linu.cherian@arm.com>
Subject: [PATCH v2 1/6] arm64: cputype: Add Cortex-A520AE definitions
Date: Wed,  8 Jul 2026 20:13:26 +0530
Message-ID: <20260708144331.679816-2-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708144331.679816-1-linu.cherian@arm.com>
References: <20260708144331.679816-1-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_074404_888977_1AA21726 
X-CRM114-Status: GOOD (  10.35  )
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

Add cputype definitions for Cortex-A520AE.

The definition can be found in Cortex-A520AE TRM,
https://developer.arm.com/documentation/107726/0001/
as part of MIDR_EL1 bit descriptions.

This is going to be used in the bbml3 support list.

Signed-off-by: Linu Cherian <linu.cherian@arm.com>
---
 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 1b9f0cda1336..e41fae46426b 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -82,6 +82,7 @@
 #define ARM_CPU_PART_CORTEX_X1		0xD44
 #define ARM_CPU_PART_CORTEX_A510	0xD46
 #define ARM_CPU_PART_CORTEX_A520	0xD80
+#define ARM_CPU_PART_CORTEX_A520AE	0xD88
 #define ARM_CPU_PART_CORTEX_A710	0xD47
 #define ARM_CPU_PART_CORTEX_A715	0xD4D
 #define ARM_CPU_PART_CORTEX_X2		0xD48
@@ -176,6 +177,7 @@
 #define MIDR_CORTEX_X1	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X1)
 #define MIDR_CORTEX_A510 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A510)
 #define MIDR_CORTEX_A520 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A520)
+#define MIDR_CORTEX_A520AE MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A520AE)
 #define MIDR_CORTEX_A710 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A710)
 #define MIDR_CORTEX_A715 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A715)
 #define MIDR_CORTEX_X2 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X2)
-- 
2.43.0


