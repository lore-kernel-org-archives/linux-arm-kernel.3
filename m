Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B63C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6tG7DmcQsOy3fNpzer8WC6jS/cIHjiZHCGYBVK+j+k=; b=IR2kGNHLN8UhBanVjCE5cUF6wG
	k11E1LEsHHyxredrtrE3H8gJpNXb5rhGKg8p9Gi13LhgtuQySAPKrvlwt0d+kdzHJxiX/BqeLqq0i
	re0CHAw8aiYfJwBLJMfod6zPFocnKaFXX6aV8vkWCGZ7PVsF4lyF/8VnD6x/+VJfnOwRxYbbWcaJs
	pQz8lPu6PGq5NTHYLNu8UHrZMzw4BNMAcNLDEq7fJvlH8Aj1MJwc/bcTyUMjUgmWlSNJ6CCMr2A4m
	7u2z+ZGJeIzxmTksMqzBJBPV1op3Y43rsuoXNPTVuA7d2vaP+xWfdNQz57NmMOqtQ/gJWoqc8UJWV
	QVKgKXSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneN-00000002LKL-0B0z;
	Thu, 09 Jul 2026 12:14:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whne4-00000002KkW-3q8j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36B083597;
	Thu,  9 Jul 2026 05:14:20 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 799423F915;
	Thu,  9 Jul 2026 05:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599264; bh=eCiuFPe3uWRguOkYsJdAZ5Zn+EyUcuOR1WhGBxv4Mlo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y+bolX4mzfsFgnl0dxWPi68ED46kjJ+cmrekFFF69wBa1l/Z6R1lF+z6pqV/NQgQ/
	 QM70e2qdWZHaDaTaonfSB3jIreDO1Me9ItctGOISZplM2wqvKdl8esD/2VmadSAgRP
	 SsiwNT1aju7OeEORuXnUFyNDriwgBr3uFn0JfFGY=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com
Subject: [RFC PATCH 21/36] arm64: Kconfig: Remove CONFIG_ARM64_DEBUG_PRIORITY_MASKING
Date: Thu,  9 Jul 2026 13:13:18 +0100
Message-Id: <20260709121333.23507-22-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051425_497500_4561925B 
X-CRM114-Status: UNSURE (   7.07  )
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

Last users of CONFIG_ARM64_DEBUG_PRIORITY_MASKING have gone, so remove
it.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/Kconfig | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919..e36dc4831200 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2334,17 +2334,6 @@ config ARM64_PSEUDO_NMI
 
 	  If unsure, say N
 
-if ARM64_PSEUDO_NMI
-config ARM64_DEBUG_PRIORITY_MASKING
-	bool "Debug interrupt priority masking"
-	help
-	  This adds runtime checks to functions enabling/disabling
-	  interrupts when using priority masking. The additional checks verify
-	  the validity of ICC_PMR_EL1 when calling concerned functions.
-
-	  If unsure, say N
-endif # ARM64_PSEUDO_NMI
-
 config RELOCATABLE
 	bool "Build a relocatable kernel image" if EXPERT
 	select ARCH_HAS_RELR
-- 
2.34.1


