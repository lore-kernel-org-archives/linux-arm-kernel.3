Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE460CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 07:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=RoAcOqMbQb/sKh+pOpBGe8rcIw8emxb/ba/Fm3mtDD4=; b=bcZJFbfaorL5m1Y4UfZYGeP8Uz
	cdxaKFeob9q0DedSFnWLusIBf5PnV7A/lgMA21J0Hg+RHXpLOVvNPBg+bctT5T421yCMQLkbftvRY
	mxlpHexPI4ZVj9xFFmtjn7T24EbcHP5YFypyBC9RVxxVViFnB5lD1VWloOXoAGLy/UVEbOQ/vqQN+
	ZezqsXlZLQ+BWCfNp6tRsu2vW1fq0ooZNS58MqHbqsTDQKfMienRcjXCllF9TAotTYMfqxEpqOBTt
	NEwUOgAR/X+2ReAFxI4M9WVMpeEn5+wximZZQYQ1q3BeQno7sebdZ8wSPC2kepAhRVzUQ68jTyeWC
	YkPawZqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eeT-00000006wUS-1Tu4;
	Fri, 17 Oct 2025 07:13:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eeQ-00000006wTq-2LA2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 07:13:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C92ED48ED7;
	Fri, 17 Oct 2025 07:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56956C4CEE7;
	Fri, 17 Oct 2025 07:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760685201;
	bh=tvVfnDJ6NF8vFYie8uN0GL4TS+uvObuCORTe3WGz69s=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=VeV4k+2fYMcfUp3Q/DBU1cqJxpT17SBR25TOMKgACvoVzVEknEwk+EI8SRC4MQO/k
	 Bd4qCi1Bt0+1cRk/N+7VhWWLBNij0IRgskAiEPcGkAl9KhvWko4f8/8kez9KlksUWp
	 KVkBjZY33gYBPJRxvgO//R2bUhwMElQrklj25YAs=
Subject: Patch "arm64: cputype: Add Neoverse-V3AE definitions" has been added to the 6.12-stable tree
To: catalin.marinas@arm.com,gregkh@linuxfoundation.org,james.morse@arm.com,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,ryan.roberts@arm.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Fri, 17 Oct 2025 09:13:19 +0200
In-Reply-To: <20251016111208.3983300-2-ryan.roberts@arm.com>
Message-ID: <2025101719-lethargy-brunch-e56f@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_001322_660780_56D11D8C 
X-CRM114-Status: GOOD (  12.80  )
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


This is a note to let you know that I've just added the patch titled

    arm64: cputype: Add Neoverse-V3AE definitions

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-cputype-add-neoverse-v3ae-definitions.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-186003-greg=kroah.com@vger.kernel.org Thu Oct 16 13:12:49 2025
From: Ryan Roberts <ryan.roberts@arm.com>
Date: Thu, 16 Oct 2025 12:12:05 +0100
Subject: arm64: cputype: Add Neoverse-V3AE definitions
To: stable@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>
Message-ID: <20251016111208.3983300-2-ryan.roberts@arm.com>

From: Mark Rutland <mark.rutland@arm.com>

[ Upstream commit 3bbf004c4808e2c3241e5c1ad6cc102f38a03c39 ]

Add cputype definitions for Neoverse-V3AE. These will be used for errata
detection in subsequent patches.

These values can be found in the Neoverse-V3AE TRM:

  https://developer.arm.com/documentation/SDEN-2615521/9-0/

... in section A.6.1 ("MIDR_EL1, Main ID Register").

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
[ Ryan: Trivial backport ]
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/include/asm/cputype.h |    2 ++
 1 file changed, 2 insertions(+)

--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -93,6 +93,7 @@
 #define ARM_CPU_PART_NEOVERSE_V2	0xD4F
 #define ARM_CPU_PART_CORTEX_A720	0xD81
 #define ARM_CPU_PART_CORTEX_X4		0xD82
+#define ARM_CPU_PART_NEOVERSE_V3AE	0xD83
 #define ARM_CPU_PART_NEOVERSE_V3	0xD84
 #define ARM_CPU_PART_CORTEX_X925	0xD85
 #define ARM_CPU_PART_CORTEX_A725	0xD87
@@ -180,6 +181,7 @@
 #define MIDR_NEOVERSE_V2 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V2)
 #define MIDR_CORTEX_A720 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A720)
 #define MIDR_CORTEX_X4 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X4)
+#define MIDR_NEOVERSE_V3AE	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V3AE)
 #define MIDR_NEOVERSE_V3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V3)
 #define MIDR_CORTEX_X925 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X925)
 #define MIDR_CORTEX_A725 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A725)


Patches currently in stable-queue which might be from ryan.roberts@arm.com are

queue-6.12/arm64-cputype-add-neoverse-v3ae-definitions.patch
queue-6.12/mm-thp-fix-mte-tag-mismatch-when-replacing-zero-filled-subpages.patch
queue-6.12/arm64-errata-apply-workarounds-for-neoverse-v3ae.patch

