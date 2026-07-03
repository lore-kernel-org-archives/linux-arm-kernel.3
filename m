Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A90DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 15:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w5XX7Rz3Qelo/FGzxIpNIi997ellIca9U5MUALRAgbw=; b=l21TsO0BP6B5HrBGyNKUtEEdDC
	UneBqWQEsrnSRcInHqZTmgPTWuNRko+kJ011gWLC0vxJ2XpE8fCFIrL27omwSscLfbM+X07qoJi05
	f69OA/aFdgeoPUEnLwBOkyV7+sZ2rof7d3eJn07aduyuGF0IKuIOM+B9jGnc7Km1OfAKFMjNDtAl2
	kjfp2askKH1P7RlV/hFQboj7FEF7a+sowfPOujZ8F7p1OR22lARykte8u7sLfpisREBoz37kiWsDU
	RLUw+zobmma4EKphlPh/ggAQt78CMOH5/+A1loN5xlE0FVMnEHTuSbEIwS7sRCaj04XZIx0cP22v0
	iyFJdDJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfg9w-00000007Rkf-4AA6;
	Fri, 03 Jul 2026 15:50:33 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfg9u-00000007Rju-309H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 15:50:31 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-92e50c5d14cso32941485a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 08:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783093829; x=1783698629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w5XX7Rz3Qelo/FGzxIpNIi997ellIca9U5MUALRAgbw=;
        b=HndeaOd5+YnbX7WPRZi0fuVYDQBaompJ7PD521VhNk3uB+M+tNdrH0kfwQbMp91HZo
         mePH5aIiDaXxTQ+oNe11N5DnEj6pE2y8lpyhs+9kHe57iTCGplzjJPaeBOTMpip1NYap
         bdstinMWJdrEA8H6WvkuIRtLNNTfs4asi2nzYlN8MVe5RgBqIRSsT8tASpggOr7QpMoG
         PxXEFAYaOnsvq6smbtY8JvlGOg9DA4ookktQ93/LUvb5wIAeFj038gF4hDKS4USdcOUz
         wykkC5zi8KE3EMLEReRNtY69/kxyIkbw2TRrfxdNmGzBlA/jnX41gi3h+Fr2Ok3H8iBR
         Cl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093829; x=1783698629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5XX7Rz3Qelo/FGzxIpNIi997ellIca9U5MUALRAgbw=;
        b=IoFBZ5+t3tE9CfrEBeoNSpWy7y9tbwgUlcr5BNxh5+yECHDp6tLmpoWqr6OjTgBAv2
         6Tgr+q6mZr9V60K+fkJ1J3Z88oetHNmOsR3Pek46RyiXmo7U3w22+j8zXob86md7nR59
         dDPPWq9wNYbXbC4YAsxYckjX75EHTYFlhI6PvZ1jblVw2Rt9v6k324CCKHamtw3LOt5d
         /9+qLz9hm6rqu6BWs05eg/hb0IcfEifMjs3UpNNwejrWjmXdCibbTRs1h4MIc6BkTsNb
         3GmlmteW9zkTqp8PAO2tJNGICV4fQPzSnoddrKRMpzGdC3rJpkeE6i6XBWEh+GIV5J3G
         2CRg==
X-Gm-Message-State: AOJu0YwHhAz14IugTOO+faF6mmh+L4i49ZtE3uMFa2Mv1XkQXedtkveY
	ZSPBez5kPuNRa9CAadMijFuX++xEp7HKu9f9/6/J9NIRsVWmpxKPpXIK
X-Gm-Gg: AfdE7cnh2BT7YnqFcsdRVqF8PzkJRWcJD1naDglfEvxCGwGY+VZHKIIHszxOzg7NG3D
	9RB+MZBr6OdaT2E81qVcftYrTlBvyEpzKa6TCzUBjgovvnvp9/LPoPQBUEX0fKnIGjZ+qCBM0pP
	zjsKaICx1vW9fYcakOC1gPJHXtALg4UZI7Wr3pef/v+GwRCuCNPh9fJlu5J3ifumSc0x5rEgl7u
	bkzoiDPqFSC7EX20BVGKoAh31R445aDBbjR2o6CjQ3s2y7h93upz/ne52k6VXAhfINq8Kj1udIM
	lG238h2c1SC21QupiIjFdEoSqod4o8WdN0Ecu34T5Fnlx87846py09ErT7hY1E+iNFF7z3xaw8j
	NSHojTV9rs1DwTsXgjNF+oLKiF3leuVDxcfvJQIULKXrWyhEYn/VIu/kq3c697NcEk3Wiy3wmeL
	xR/JQo3SNsC6vP83to5NarE5jQXWtD7Bw/jr6L+4OLASqmKR2mDILtCfbiRqG9TdmzOj/i6oYLr
	MFsqFPefY/Y4Ts=
X-Received: by 2002:a05:620a:890f:b0:92e:535b:e08b with SMTP id af79cd13be357-92e9a3c1a71mr192985a.33.1783093829176;
        Fri, 03 Jul 2026 08:50:29 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ccde4fsm187435185a.39.2026.07.03.08.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:50:28 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: tegra: Fix OF node reference leaks in IRQ init
Date: Fri,  3 Jul 2026 11:50:22 -0400
Message-ID: <20260703155022.158268-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_085030_754276_92B44064 
X-CRM114-Status: GOOD (  13.92  )
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

tegra114_gic_cpu_pm_registration() and tegra_init_irq() use
of_find_matching_node() for temporary IRQ init lookups, but the helper
returns a referenced node even when the result is used only as a boolean
or as an of_iomap() input.

Use scoped device_node cleanup for both lookups so the references are
dropped when the functions return.

Fixes: 7e8b15dbc392 ("ARM: tegra114: Reprogram GIC CPU interface to bypass IRQ on CPU PM entry")
Fixes: e9479e0e832b ("ARM: tegra: skip gic_arch_extn setup if DT has a LIC node")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mach-tegra/irq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-tegra/irq.c b/arch/arm/mach-tegra/irq.c
index 4e1ee70b2a3f..e5a611dce7e7 100644
--- a/arch/arm/mach-tegra/irq.c
+++ b/arch/arm/mach-tegra/irq.c
@@ -66,9 +66,9 @@ static const struct of_device_id tegra114_dt_gic_match[] __initconst = {
 
 static void __init tegra114_gic_cpu_pm_registration(void)
 {
-	struct device_node *dn;
+	struct device_node *dn __free(device_node) =
+		of_find_matching_node(NULL, tegra114_dt_gic_match);
 
-	dn = of_find_matching_node(NULL, tegra114_dt_gic_match);
 	if (!dn)
 		return;
 
@@ -88,7 +88,10 @@ static const struct of_device_id tegra_ictlr_match[] __initconst = {
 
 void __init tegra_init_irq(void)
 {
-	if (WARN_ON(!of_find_matching_node(NULL, tegra_ictlr_match)))
+	struct device_node *dn __free(device_node) =
+		of_find_matching_node(NULL, tegra_ictlr_match);
+
+	if (WARN_ON(!dn))
 		pr_warn("Outdated DT detected, suspend/resume will NOT work\n");
 
 	tegra114_gic_cpu_pm_registration();
-- 
2.43.0


