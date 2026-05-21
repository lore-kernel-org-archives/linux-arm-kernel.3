Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2437DCD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 21:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/fWdBi3lEWqAo5CRxVaCXmu8gWoMPqZQtnPYtc6jRHg=; b=Y5OFZTW1rxcMThysF/tAloGGK6
	gPbVsPamolyxXkMRYHOCPiCtPG/LojD9LHQFtKCmisPE9ZzxYiFwEWcq40Ub7PbxyQKhrxSmBoO00
	xAZW05FVVESXQtaZrEusvikQlZGmT+3Gu6ygDBi3fSTK5KJU6vRpsUBmdboV5Jf9M1ez7yIKAuWVv
	WOtqauOGhr49kbfpsVyIuvYV+gl8ho4nFlsr+EQXlmgSp/iq+MOPF2mmbRWE56dC3ar0Ke/f0KfAB
	SbPDjeCZiPVNczyno0Jk9EcSWf0uJRYmDT0Rr73syO70cjUk9fQpk4Ox+NlmRkWInNGE0b0YH7X6W
	wtkWEHTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQAeY-000000096BP-2xOq;
	Thu, 21 May 2026 21:10:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQAeV-000000096AP-2PHe;
	Thu, 21 May 2026 21:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/fWdBi3lEWqAo5CRxVaCXmu8gWoMPqZQtnPYtc6jRHg=; b=UwbC+UtxHegdmoiMGuK7H2ZegJ
	gowd2UeuB3T4g5zw9IYrOOmjZnb1IfCcuFz1eMDzhzjZmFgB2F+lN1fH8rquU0yZh1M2kd8fGtzs1
	YH724ORu3o52LfrMRGRUses9Cm3tUrqbdx2me3fSHioHP0trY+NiJOKe0tsslIxKEADkPsqcFX3O5
	3LM0ewlk1asRIg90LoOfQplhWtgQdK6ZWiII8rjWcuZIe9L/Y2XrpZoCqoYWwYkWI5YLaUFwOBNUz
	B7tqF1ERsPqlVYeWAIA/bQrMYSSwJftlACEqcnCeojWGM7SWHgfNaBUZxuwEG/B9niys/nwsmCrwa
	av7HKPBA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQAe0-00000002x1R-1lYx;
	Thu, 21 May 2026 21:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=/fWdBi3lEWqAo5CRxVaCXmu8gWoMPqZQtnPYtc6jRHg=; b=VHS8L7ypYhBmB3Ap6+zpqNRR8/
	fa1efYwrtgDBEZPBSJMwlYaVXuXVdr7/PavL21JOxRNnZVVSrcxe894JAXviHL7Ko0AEPtoBpILbx
	z4RV2y2vL8DR0hu8j4Y3Ct3LMogv13JRMTbHF6wc+Isg1WBJeNMppGKAz2BBChzYqkW5s4XUKrcXY
	8H8pXWxBq73s7xwSGZn1ooqIhF3ou2Ktkdy+ZNCavUnTbNSeDAIBUiIx402/JPQIgiFVYbJVkUSEc
	JBUln3X72PclkRlIfeib9CVWbzfwMywRqqWTgQMEVllb4mzeX3gIVKuku/pr0B4vZcv6WZNqZI4Yi
	RKaiTUrA==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH] ARM: rockchip: keep reset control around
Date: Thu, 21 May 2026 23:09:15 +0200
Message-ID: <20260521210915.2331176-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_220951_121332_353EFB14 
X-CRM114-Status: GOOD (  14.23  )
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

Do not put the reset control, retain exclusive control over it.
After turning on a CPU, the corresponding reset line must stay
deasserted.

This also avoids calling reset_control_put() before workqueues
are operational.

Fixes: 78ebbff6d1a0 ("reset: handle removing supplier before consumers")
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Tested-by: Steven Price <steven.price@arm.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/mach-rockchip/platsmp.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchip/platsmp.c
index f432d22bfed8..f659d894bfae 100644
--- a/arch/arm/mach-rockchip/platsmp.c
+++ b/arch/arm/mach-rockchip/platsmp.c
@@ -34,6 +34,7 @@ static int ncores;
 
 static struct regmap *pmu;
 static int has_pmu = true;
+static struct reset_control *cpu_rstc[4];
 
 static int pmu_power_domain_is_on(int pd)
 {
@@ -64,9 +65,11 @@ static struct reset_control *rockchip_get_core_reset(int cpu)
 static int pmu_set_power_domain(int pd, bool on)
 {
 	u32 val = (on) ? 0 : BIT(pd);
-	struct reset_control *rstc = rockchip_get_core_reset(pd);
+	struct reset_control *rstc;
 	int ret;
 
+	rstc = pd < ARRAY_SIZE(cpu_rstc) ? cpu_rstc[pd] : ERR_PTR(-EINVAL);
+
 	if (IS_ERR(rstc) && read_cpuid_part() != ARM_CPU_PART_CORTEX_A9) {
 		pr_err("%s: could not get reset control for core %d\n",
 		       __func__, pd);
@@ -100,11 +103,8 @@ static int pmu_set_power_domain(int pd, bool on)
 		}
 	}
 
-	if (!IS_ERR(rstc)) {
-		if (on)
-			reset_control_deassert(rstc);
-		reset_control_put(rstc);
-	}
+	if (!IS_ERR(rstc) && on)
+		reset_control_deassert(rstc);
 
 	return 0;
 }
@@ -312,6 +312,10 @@ static void __init rockchip_smp_prepare_cpus(unsigned int max_cpus)
 		ncores = ((l2ctlr >> 24) & 0x3) + 1;
 	}
 
+	/* Collect cpu core reset control for each core */
+	for (i = 0; i < ncores; i++)
+		cpu_rstc[i] = rockchip_get_core_reset(i);
+
 	/* Make sure that all cores except the first are really off */
 	for (i = 1; i < ncores; i++)
 		pmu_set_power_domain(0 + i, false);
-- 
2.47.3


