Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D987ACA5FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTsRBC1y30K49/WiHZ0twj0lmBMnb1uUeNXQH4IyQ18=; b=B08yNWUy9cI4YURoml+Ae6E5l+
	ToH7slD8rktcxmFqUjxnJKFgrxuoaKOm/gRaX5vuSc5g6X37g4pqO1PMjAX4+h0B8FvJZdY9wiy1y
	G02NRJj7YPSK6v4mgFCdFX6hAuvSBmG6R6bt5cNZKjevLSdUjPW7gIdxHWR/q7cw4JOGSRa8kpJJx
	yjw2oFOsfTCEJlXL5/tjNCXF8Yk2QB4ljzRaC0TQCiIYNaiNk2AkBTYg0VQQ1DmMRMT7eeQdBP9un
	hmIozLPTWVX8niO8zj9//72h+GG/i0/boFK3m7LQObB1UXgQnKElG8XFNpoRXy6rkKFLJ9XCEIMOD
	7LfS8oQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJwl-00000009lfr-0M6B;
	Thu, 01 Oct 2026 16:47:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJwk-00000009lfV-19lU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:47:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CEE86021D;
	Thu,  1 Oct 2026 16:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F41241F000FF;
	Thu,  1 Oct 2026 16:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790873269;
	bh=xTsRBC1y30K49/WiHZ0twj0lmBMnb1uUeNXQH4IyQ18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lSGfvBUpgdrGNChtVsUti2z/cJcWjmoIJaYKfDBTqEFGR1ecsC3FK8Kst+5KikLqe
	 YVs765eRpJpOX6eg0K69hwYIwCfDgBOotsgdGvqj5f6Uwm5N2YSKyae0638FTAjRaS
	 iEtZi6KQwOBjB0iYeMQ+feYhzggZ4LiSqmSO+Ql3LUx/gszCP0R4EV5yam3F6CtAKF
	 /dOXxDXpu5O9twUlx2dnna7zohQnus22P+7PjWjoWzgoGFii3jIPBcJTFs6Y7SEv8v
	 1XAzr6CMURZwgk0ITWStl0WIeU6EoVF3Xi2GnovBbwj0QcuPT6oqwtiOFRUeBKI9o3
	 OyTthtDyjF5pA==
Date: Thu, 1 Oct 2026 17:47:42 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 14/15] tools: Synchronise the kernel esr.h
Message-ID: <ar6NXWzQ1rMb1aId@gremlin>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-14-3556644cd927@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-arm64-gcs-v21-14-3556644cd927@kernel.org>
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

On Wed, Sep 30, 2026 at 10:48:24PM +0100, Mark Brown wrote:
> To pick up definitions for GCS.
>
> Reviewed-by: Leonardo Bras <leo.bras@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

This seems to be out of date, with your series applied to next:

$ diff -u arch/arm64/include/asm/esr.h tools/arch/arm64/include/asm/esr.h
--- arch/arm64/include/asm/esr.h	2026-10-01 17:43:56.186852562 +0100
+++ tools/arch/arm64/include/asm/esr.h	2026-10-01 17:43:56.194056154 +0100
@@ -7,7 +7,6 @@
 #ifndef __ASM_ESR_H
 #define __ASM_ESR_H

-#include <asm/memory.h>
 #include <asm/sysreg.h>

 #define ESR_ELx_EC_UNKNOWN	UL(0x00)
@@ -131,7 +130,7 @@
  * Annoyingly, the negative levels for Address size faults aren't laid out
  * contiguously (or in the desired order)
  */
-#define ESR_ELx_FSC_ADDRSZ_nL(n)	((n) == -1 ? 0x29 : 0x2C)
+#define ESR_ELx_FSC_ADDRSZ_nL(n)	((n) == -1 ? 0x25 : 0x2C)
 #define ESR_ELx_FSC_ADDRSZ_L(n)		((n) < 0 ? ESR_ELx_FSC_ADDRSZ_nL(n) : \
 						   (ESR_ELx_FSC_ADDRSZ + (n)))

@@ -437,35 +436,6 @@
 #ifndef __ASSEMBLER__
 #include <asm/types.h>

-static __always_inline bool esr_trap_is_iabt(unsigned long esr)
-{
-	return ESR_ELx_EC(esr) == ESR_ELx_EC_IABT_LOW;
-}
-
-/* Always check for S1PTW *before* using this. */
-static __always_inline bool esr_dabt_is_write(unsigned long esr)
-{
-	return esr & ESR_ELx_WNR;
-}
-
-static __always_inline bool esr_dabt_is_cm(unsigned long esr)
-{
-	return esr & ESR_ELx_CM;
-}
-
-static __always_inline bool esr_abt_is_sea(unsigned long esr)
-{
-	switch (esr & ESR_ELx_FSC) {
-	case ESR_ELx_FSC_EXTABT:
-	case ESR_ELx_FSC_SEA_TTW(-1) ... ESR_ELx_FSC_SEA_TTW(3):
-	case ESR_ELx_FSC_SECC:
-	case ESR_ELx_FSC_SECC_TTW(-1) ... ESR_ELx_FSC_SECC_TTW(3):
-		return true;
-	default:
-		return false;
-	}
-}
-
 static inline unsigned long esr_brk_comment(unsigned long esr)
 {
 	return esr & ESR_ELx_BRK64_ISS_COMMENT_MASK;

--
Cheers, Lorenzo

