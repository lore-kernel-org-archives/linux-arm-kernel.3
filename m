Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372B2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 04:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LbKaZt3PZy/b+dDsqfeQRYjFKfmtaOUDDKUZ3AteySM=; b=vHTpMIEnKvTqiqTun3UQdLqJq2
	F4U5Q/8o5TSQEWjxl/+Yzht/tTxY3XCC3Xl4/oinHGBFXewIaJrz7Npk8bFcO60UVWTPts3fdhr7P
	PMaqD5KG3Dd/uDZWUG7yYvQb//yCo7+YeFy72I6c3ny4edvG/P2KQAwYFhuwDUVEl7lpyZx77ViaK
	fDjv5mfDnEGSzYK6IrA17018dOKUnucoaLuaGzEKsjaIGi5rq2aFlC2nmb2nkKxubw0OYEyBX8F22
	8z76aXR+cs0Q4ZueeIv2Ux6tdA79muFl2X5pjw/DZMGK98cjd3w7+OclYqltZUB34ktTLNHXSq35M
	2vRm8Epg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKrws-0000000ACVf-3PLn;
	Tue, 10 Dec 2024 04:34:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKrvp-0000000ACMY-0Pp1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 04:33:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 684D2113E;
	Mon,  9 Dec 2024 20:33:35 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.48.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 841DD3F58B;
	Mon,  9 Dec 2024 20:33:04 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64/Kconfig: Drop EXECMEM dependency from ARCH_WANTS_EXECMEM_LATE
Date: Tue, 10 Dec 2024 10:02:57 +0530
Message-Id: <20241210043257.715822-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_203309_178564_02271DFA 
X-CRM114-Status: GOOD (  10.38  )
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

ARCH_WANTS_EXECMEM_LATE indicates subscribing platform's preference for
EXECMEM late initialisation without creating a new dependency. Hence this
just drops EXECMEM dependency while selecting ARCH_WANTS_EXECMEM_LATE.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.13-rc1

Changes in V2:

- Dropped generic EXECMEM config changes per Catalin
- Updated the commit message as required

Changes in V1:

https://lore.kernel.org/all/20241209031251.515903-1-anshuman.khandual@arm.com/

 arch/arm64/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5479c8b454c..b146372bc365 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -113,7 +113,7 @@ config ARM64
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
 	select ARCH_WANT_LD_ORPHAN_WARN
-	select ARCH_WANTS_EXECMEM_LATE if EXECMEM
+	select ARCH_WANTS_EXECMEM_LATE
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
 	select ARCH_HAS_UBSAN
-- 
2.30.2


