Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B72C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNmdJN37NZqdExozvrPc3D/V5Bhinf/QkSvmOvjESQc=; b=VZ7jLfL53DVs7xyKco3xP7Xp/K
	DhxfwGRxBFW+kLFxJ9lbNxmszeLO1fJ00NwPGjkvqFpX1/AMz0xXF2y1N26qcy7hEquITel3LTwNE
	bWdP1jILHtR/0eid3HuZJZ2/4D/BRgkX2A2Oyb43pTBe1stawY05lHa1c68Y2B5v578is+opgbrvk
	49OnRuAeuQTktGEfk/YrbER8FklOKGyxiHuvdtYo8f7KDmvyOmWK7qxeUMllb0BbBiCuWJua36Vcx
	m6O1NT/AVxFIW9RS706YWhtgtKVMx7MmybKpym7JuPBwH2ypB18rs5GsihmVfo7e/R77dSaV2afOG
	C4QP4lEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndo-00000002KTJ-29r8;
	Thu, 09 Jul 2026 12:14:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndm-00000002KQL-3Fhu
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 09 Jul 2026 12:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MNmdJN37NZqdExozvrPc3D/V5Bhinf/QkSvmOvjESQc=; b=coK5HR9zQDhSRvoXHvZ2A4Rpws
	T4eQbSBrzMZjI+fQrsKQ02bOgUAyrgvXUEuHXzvbN67rCqzGKlHZM3aZbvRmQQ0F98LEcYqW48zzk
	7MRLNizU5mrr+1NmeXkpSN4onJZC47r8Ok+MWX5Rj2rpIDYvSq4YSjdZwO4rnIdd0QfrqPD1uc7dD
	K4606AVuGnprVLrj7jLVwOweWeYXiqFFmeHua0ogYCD4kN8JJT8pjD1VIKoAmD6qT2oaTGjsJydj1
	65VWeGhHig/Bduj9NhpS+zqLTmXKvxLlYxRLR3C0YIZ5kW5Nq6gnssqzWuxghw0zXUScqgW/koJw6
	rMEvbgVQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whndg-00000009Bjx-1oSu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F7E11476;
	Thu,  9 Jul 2026 05:13:51 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C124C3F66F;
	Thu,  9 Jul 2026 05:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599235; bh=aiBod/nxWphtSep0IXx2NcxzuZ5Hh73/QR9HrWUAnVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lYXjoFp6kTdup93jcNFX3KC2RYN5bgXjIPYCqW0OzpcPq9XmlnossyjBI65ukSWlm
	 pYIuj7w5poLwVz/6l/te9pZnWyRW8gs7SdTzqWIm3TSy1UQi6Z0uXZFaoH26b4M7Lu
	 Ot8wsok+ns711cnz1eqEAxHg1npAkcaYuTcZ7eno=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com
Subject: [RFC PATCH 01/36] arm64: ptrace: Remove INIT_PSTATE_EL2
Date: Thu,  9 Jul 2026 13:12:58 +0100
Message-Id: <20260709121333.23507-2-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_131401_793657_C5EB4838 
X-CRM114-Status: UNSURE (   7.19  )
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

Last user of INIT_PSTATE_EL2 has gone with ae4b7e38e9a9 ("arm64: Allow
sticky E2H when entering EL1"), so remove it.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/ptrace.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index 39582511ad72..f7dc5fb9427d 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -18,8 +18,6 @@
 
 #define INIT_PSTATE_EL1 \
 	(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT | PSR_MODE_EL1h)
-#define INIT_PSTATE_EL2 \
-	(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT | PSR_MODE_EL2h)
 
 #include <linux/irqchip/arm-gic-v3-prio.h>
 
-- 
2.34.1


