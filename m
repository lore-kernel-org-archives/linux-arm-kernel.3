Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8C2C88E65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QENNJ1C/9bp51Hw4Qjp/fjmJil25pjX5ub1GnfuYzU=; b=IrBoJUqbXcCiMqkiZ0zFob4uAZ
	IpjIwqE1HbsVLsZCk2Drh1ddBHIf0hTBMENLy/o41mzh2SAcaVlWb/A8hdOPJF2Tzpz+9Uqr82YTl
	vz7KEq/4yQm0r+/RaEkMyqw+HcNAy4/cE3sar2U//2r6DlKKZg94W2VKw96MBr7DlQu18L8xtb3f3
	PJZe+DZqh/0JARqAbUO2wB4XwDpMdsHwBr/rMWpucihDJ72HnWq79ALfbWJhyL2nWtLTECCAjxs1c
	/atmoJEhLbwIHE5e2iGn63R43p2qY8yWfOB3mCjC75u3OTY4ltWRa54bacnasRPUPCN/EzMAgVsWB
	4v20CBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pT-0000000366K-1hZm;
	Mon, 14 Sep 2026 10:22:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63or-000000035Rc-3Wgd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:21:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C092F1C2B;
	Mon, 14 Sep 2026 03:21:45 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3DF4B3F7B4;
	Mon, 14 Sep 2026 03:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381309; bh=SHDNExfmMe5iYH86VWxWXdysyBt+DG/iYtbhNpIMfv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I+tqZhIBPduxVo2v4ZMZ84kuPLD9oWdJlgjAooo65ifTwM2Q9SRLCdWdqwhZF/Tu9
	 +JVfPL6U2H0zs3Lw22hnyzayV3is0SaW+hbhDgmd7PDCnBRGJksrb50/Q/O38TCZai
	 EXzpW1wm6VlzpVLV3xfo+zbgeX2IyVp/vT6dq8EE=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 15/38] arm64: Kconfig: Remove CONFIG_ARM64_DEBUG_PRIORITY_MASKING
Date: Mon, 14 Sep 2026 11:20:39 +0100
Message-Id: <20260914102102.68597-16-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032149_922057_A7C22A89 
X-CRM114-Status: UNSURE (   7.33  )
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
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/Kconfig | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..2738637ccb92 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2390,17 +2390,6 @@ config ARM64_PSEUDO_NMI
 
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


