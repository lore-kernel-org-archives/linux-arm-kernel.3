Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1888EC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 14:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ec9enzUiM0ECB71k2jPIbo6/PXbHn1wYHpxcdYYq++E=; b=VGvT+YZjjLDukueZLnNmGDQT5W
	sPvkrUKy5EfYI8J57QtMs7b1V/FPzfSqALKcYTOF5wm3YmQSDIaYKKbgiGD2t7GnNAGutfiQu43DC
	934XG4CaPsiD11G9SuD1J0E/nBNIy6SaWiLjB/m4El1pSuUQ8+ctV/PcK6BpmhqtMB4GuGg+GUS96
	b23uQq0g+9lJkc1znC+XL1z9rk4sIGaHjuJCvHQs2bwokX5kQoAvylCaCC7kd9YBkjeaKj1rIrTlb
	QjYzvUwyKBRmNelEhU7iK2ynHeBTje9c+wFCOghJ+BBWDurqielgCHGCKuPas+l388DaDOPBWAbtp
	WafAwhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0LUJ-000000093fA-1OeG;
	Thu, 03 Apr 2025 14:24:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0LME-000000092Jj-2m7n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 14:15:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65B3F1C00;
	Thu,  3 Apr 2025 07:15:52 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0BB683F59E;
	Thu,  3 Apr 2025 07:15:46 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	shameerali.kolothum.thodi@huawei.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	huangxiaojia2@huawei.com,
	akpm@linux-foundation.org,
	surenb@google.com,
	robin.murphy@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 3/3] Documentation/arm64: reflects FEAT_MTE_TAGGED_FAR description
Date: Thu,  3 Apr 2025 15:15:35 +0100
Message-Id: <20250403141535.23496-4-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403141535.23496-1-yeoreum.yun@arm.com>
References: <20250403141535.23496-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_071550_745488_70039C4B 
X-CRM114-Status: GOOD (  10.09  )
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

When FEAT_MTE_TAGGED_FAR feature is supported, the value of address bits
[63:60] is preserved on synchronous tag check fault.

This patch reflects the above feature in the documentation.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 Documentation/arch/arm64/tagged-pointers.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/arch/arm64/tagged-pointers.rst b/Documentation/arch/arm64/tagged-pointers.rst
index 81b6c2a770dd..73c59a9c7a63 100644
--- a/Documentation/arch/arm64/tagged-pointers.rst
+++ b/Documentation/arch/arm64/tagged-pointers.rst
@@ -60,11 +60,12 @@ that signal handlers in applications making use of tags cannot rely
 on the tag information for user virtual addresses being maintained
 in these fields unless the flag was set.
 
-Due to architecture limitations, bits 63:60 of the fault address
-are not preserved in response to synchronous tag check faults
-(SEGV_MTESERR) even if SA_EXPOSE_TAGBITS was set. Applications should
-treat the values of these bits as undefined in order to accommodate
-future architecture revisions which may preserve the bits.
+If FEAT_MTE_TAGGED_FAR (Armv8.9) is supported, bits 63:60 of the fault address
+are preserved in response to synchronous tag check faults (SEGV_MTESERR)
+otherwise not preserved even if SA_EXPOSE_TAGBITS was set.
+Applications should interpret the values of these bits based on
+the support for the 'mte_far' hwcap. If the support is not present,
+the values of these bits should be considered as undefined otherwise valid.
 
 For signals raised in response to watchpoint debug exceptions, the
 tag information will be preserved regardless of the SA_EXPOSE_TAGBITS
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


