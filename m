Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44903C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 02:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qA4m6DCOArLayVAbec09aU3PcIMpxg1cem7TNbTS7z4=; b=iiBYwyFadRqcsUDMmY2BQ7A7tj
	jVP6mre05ACeZ0DooH80ElXJYdUkTdrxNAsCHCry9l6gd7+XGweT5CBu4PhaUs7HFAOPMWhS9IikJ
	zdKkv+9vqGnPOkDqd7U1bNhwH6cRZACWFoPOaiNYwttj7ZnvMB1cW6KeRmgM0TFMtCdJlMf9lYsVv
	Q8rkkRE7lNQAyRTm7dbOWU83keSTUhgeBtHq++kXyrARms+g5j2Ih2Ufnk2+Cff5MAyMd2McwoQtP
	5Bcz1YM+FI7RuQeKMtGeH+Z5eXL9kB/+A4yPxUT+h+KRIW1NuGqYh3ir/go3etKI6FM60zuYGZWE5
	2zCkpXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x724Y-0000000ATuj-0U1B;
	Thu, 17 Sep 2026 02:42:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x724V-0000000ATu3-1i8Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 02:42:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5F8E1476;
	Wed, 16 Sep 2026 19:41:53 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7E1B3F882;
	Wed, 16 Sep 2026 19:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789612917; bh=FDZmO2UK3xOGgN+H/EPemPxpu+0UPh7BPuSq4qS3/uA=;
	h=From:To:Cc:Subject:Date:From;
	b=IRlnP6IxCzG+JXlTpQ/Ukq2S6WUlYBQK5GLqLiLjJZzEXZh2EosQJxCcvcMtmvn4x
	 TTYcHW025RsNFFBvUT9TlEMf7234DedHd4dhOcvh6FBe5yAl7xgyw/AbbEtA7JCcqs
	 oNCOBgH+17Dqcd9QhkUzda7BtTQ/3aMJAhtgs4To=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/cpufeature: Drop redundant define(ID_AA64MMFR0..._SUPPORTED_LPA2)
Date: Thu, 17 Sep 2026 08:11:52 +0530
Message-ID: <20260917024152.3660794-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_194159_569412_F9E17CD6 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

ID_AA64MMFR0_EL1_TGRAN_2_SUPPORTED_LPA2 is always defined as 0x3. Hence any
defined() test on the macro always going to be evaluated as true. Hence the
very test itself is redundant and can be dropped off safely.

Although similar defined(ID_AA64MMFR0_EL1_TGRAN_LPA2) test is retained back
as the macro does depend on the configured granule size.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v7.2-rc3

 arch/arm64/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9a22df0c5120..e3be220ae45b 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1904,7 +1904,7 @@ static bool has_nv1(const struct arm64_cpu_capabilities *entry, int scope)
 		  is_midr_in_range_list(nv1_ni_list)));
 }
 
-#if defined(ID_AA64MMFR0_EL1_TGRAN_LPA2) && defined(ID_AA64MMFR0_EL1_TGRAN_2_SUPPORTED_LPA2)
+#if defined(ID_AA64MMFR0_EL1_TGRAN_LPA2)
 static bool has_lpa2_at_stage1(u64 mmfr0)
 {
 	unsigned int tgran;
-- 
2.43.0


