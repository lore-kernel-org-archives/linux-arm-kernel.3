Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19873E63CBF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 20:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I45PNuBeMSp0a/Uz7+lBtAlgVFs3diZsK36lACYeNH4=; b=KVdL7e3mmkuEyDxcAMuswRQhgC
	/675KCl9abH2luFsobo/lavc8A63cYpltjJgv0FkJPMmCQNQRmzXcDPTuX3stNozk5XlWtDuNn+Mi
	C/iXGf+EEMJ8E9FcyZd3jWJoLIIBtj9DpCROotVkaWqTVq23C8NJhv1tklDZWtvLQlGVOAH6BhvlA
	Fi9+ib4TQFt4CImymVDQ+1cnlHy7x29apunLabnvbw6rXH8KUKTThnz60WWJyxJLxotwDPTmyNKRB
	tKjIllrrN3/stgQUEUIh4tAL91isemU5n0Ybdijw5mCdqAnoVzQ2dYZT/kJSU2j9NyaD284kpNGoY
	cHdrHUag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk6WZ-0000000BTwl-2nyc;
	Sun, 25 Jan 2026 20:15:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk6WX-0000000BTwe-2ixL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 20:15:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD94C600C3
	for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 20:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240E8C4CEF1;
	Sun, 25 Jan 2026 20:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769372152;
	bh=vNxC6UtTj1W10uEOM1GRQMoI9lpOlgXLjmJOV5jRTdg=;
	h=From:To:Cc:Subject:Date:From;
	b=qH1wAXo1pnlVRGhueNSahUtd7XIKbHY9J0IDJfGi6WgdDtCLTW8plx4GoL+1kqrCR
	 jDDDDr4k4d1abxxt2fxw5l14wiMubK/I6yAGJF/U3ckwVhIDlsope7rkHWwyShE8su
	 ocTqpUyQHed3fcB4pHkvRl6bA3XlORmy3VopGT/uYNPdHWzJg3jwK0z7RCvhx7zTk5
	 nC66mNjzBlFE3EVKUei8ojuFqW96ubZDVos/3dLyQggA2Yb5BGNQMM/7c0Sl4kGtTq
	 Cics6VKkxEKUF8JyklzgrwDNOaxJUzLG0Ete8hIe37oy8UrG4PVnXgcuYYSto7yptZ
	 hYrTlXhQZiSgw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: soc@kernel.org
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH] MAINTAINERS: Change Sudeep Holla's email address
Date: Sun, 25 Jan 2026 20:15:45 +0000
Message-ID: <20260125201545.3461463-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Switch to my kernel.org email address going forward.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 .mailmap    |  3 ++-
 MAINTAINERS | 22 +++++++++++-----------
 2 files changed, 13 insertions(+), 12 deletions(-)

Hi SoC Team,

Can you apply this directly ?

Regards
Sudeep

diff --git a/.mailmap b/.mailmap
index 1873cfa15937..584876248c1f 100644
--- a/.mailmap
+++ b/.mailmap
@@ -779,7 +779,8 @@ Subash Abhinov Kasiviswanathan <quic_subashab@quicinc.com> <subashab@codeaurora.
 Subbaraman Narayanamurthy <quic_subbaram@quicinc.com> <subbaram@codeaurora.org>
 Subhash Jadavani <subhashj@codeaurora.org>
 Sudarshan Rajagopalan <quic_sudaraja@quicinc.com> <sudaraja@codeaurora.org>
-Sudeep Holla <sudeep.holla@arm.com> Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>
+Sudeep Holla <sudeep.holla@kernel.org> Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>
+Sudeep Holla <sudeep.holla@kernel.org> <sudeep.holla@arm.com>
 Sumit Garg <sumit.garg@kernel.org> <sumit.garg@linaro.org>
 Sumit Semwal <sumit.semwal@ti.com>
 Surabhi Vishnoi <quic_svishnoi@quicinc.com> <svishnoi@codeaurora.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index a0dd762f5648..17d9472e1f4e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -334,7 +334,7 @@ F:	tools/power/acpi/
 ACPI FOR ARM64 (ACPI/arm64)
 M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
 M:	Hanjun Guo <guohanjun@huawei.com>
-M:	Sudeep Holla <sudeep.holla@arm.com>
+M:	Sudeep Holla <sudeep.holla@kernel.org>
 L:	linux-acpi@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
@@ -350,7 +350,7 @@ F:	drivers/acpi/riscv/
 F:	include/linux/acpi_rimt.h
 
 ACPI PCC(Platform Communication Channel) MAILBOX DRIVER
-M:	Sudeep Holla <sudeep.holla@arm.com>
+M:	Sudeep Holla <sudeep.holla@kernel.org>
 L:	linux-acpi@vger.kernel.org
 S:	Supported
 F:	drivers/mailbox/pcc.c
@@ -3677,7 +3677,7 @@ N:	uniphier
 
 ARM/VERSATILE EXPRESS PLATFORM
 M:	Liviu Dudau <liviu.dudau@arm.com>
-M:	Sudeep Holla <sudeep.holla@arm.com>
+M:	Sudeep Holla <sudeep.holla@kernel.org>
 M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
@@ -6506,7 +6506,7 @@ F:	drivers/i2c/busses/i2c-cp2615.c
 
 CPU FREQUENCY DRIVERS - VEXPRESS SPC ARM BIG LITTLE
 M:	Viresh Kumar <viresh.kumar@linaro.org>
-M:	Sudeep Holla <sudeep.holla@arm.com>
+M:	Sudeep Holla <sudeep.holla@kernel.org>
 L:	linux-pm@vger.kernel.org
 S:	Maintained
 W:	http://www.arm.com/products/processors/technologies/biglittleprocessing.php
@@ -6602,7 +6602,7 @@ F:	include/linux/platform_data/cpuidle-exynos.h
 
 CPUIDLE DRIVER - ARM PSCI
 M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
-M:	Sudeep Holla <sudeep.holla@arm.com>
+M:	Sudeep Holla <sudeep.holla@kernel.org>
 M:	Ulf Hansson <ulf.hansson@linaro.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@ -9806,7 +9806,7 @@ F:	include/uapi/linux/firewire*.h
 F:	tools/firewire/
 
 FIRMWARE FRAMEWORK FOR ARMV8-A
-M:	Sudeep Holla <sudeep.holla@arm.com>
+M:	Sudeep Holla <sudeep.holla@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/firmware/arm_ffa/
@@ -10504,7 +10504,7 @@ S:	Maintained
 F:	scripts/gendwarfksyms/
 
 GENERIC ARCHITECTURE TOPOLOGY
-M:	Sudeep Holla <sudeep.holla@arm.com>
+M:	Sudeep Holla <sudeep.holla@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	drivers/base/arch_topology.c
@@ -15089,7 +15089,7 @@ F:	drivers/mailbox/arm_mhuv2.c
 F:	include/linux/mailbox/arm_mhuv2_message.h
 
 MAILBOX ARM MHUv3
-M:	Sudeep Holla <sudeep.holla@arm.com>
+M:	Sudeep Holla <sudeep.holla@kernel.org>
 M:	Cristian Marussi <cristian.marussi@arm.com>
 L:	linux-kernel@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@ -23614,7 +23614,7 @@ F:	include/uapi/linux/sed*
 SECURE MONITOR CALL(SMC) CALLING CONVENTION (SMCCC)
 M:	Mark Rutland <mark.rutland@arm.com>
 M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
-M:	Sudeep Holla <sudeep.holla@arm.com>
+M:	Sudeep Holla <sudeep.holla@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/firmware/smccc/
@@ -25378,7 +25378,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
 F:	drivers/mfd/syscon.c
 
 SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE (SCPI/SCMI) Message Protocol drivers
-M:	Sudeep Holla <sudeep.holla@arm.com>
+M:	Sudeep Holla <sudeep.holla@kernel.org>
 R:	Cristian Marussi <cristian.marussi@arm.com>
 L:	arm-scmi@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@ -26530,7 +26530,7 @@ F:	samples/tsm-mr/
 
 TRUSTED SERVICES TEE DRIVER
 M:	Balint Dobszay <balint.dobszay@arm.com>
-M:	Sudeep Holla <sudeep.holla@arm.com>
+M:	Sudeep Holla <sudeep.holla@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	trusted-services@lists.trustedfirmware.org
 S:	Maintained
-- 
2.43.0


