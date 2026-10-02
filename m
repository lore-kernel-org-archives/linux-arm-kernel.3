Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BA8CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1z1H9ql17Suu/JqFx+e5IfFWW7tOnaxkf0CU9l/FbXY=; b=oEawFdC11BlQ1+jvA7mzrwBL1A
	FSv8UJBfJ4OxHhfeRNmaM1NJjEn3q33zjg/KfXEPmPEI18wWOm5M3besa5olFiMlbmozQWCJMwCPj
	jUFJQyoO2kduoeLXtCT9ZCROnZ1Y/JtvNQfsAk5VKbvzGziBfHs6euo9X0NHY1MecVP6niPu/WT41
	TRMtglV9kbGwZnw2HUbGKElpCq8ZqiP1b8l2OS4R9YtXTIOjjUBfZa1aolyQHFAPl/LdmBYMFxjDk
	aeAxudiIKYAmatFSk6N5yVq7friGva5AHKmbTIQpXSUBnZQjv6DeMHLPFk8qyXJhAD0L46O9o6WS8
	sUHwNBHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCerN-0000000BrQs-1Ycb;
	Fri, 02 Oct 2026 15:07:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCerI-0000000BrNS-44Dt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:07:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 203E316A3;
	Fri,  2 Oct 2026 08:07:32 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90EBF3F85F;
	Fri,  2 Oct 2026 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953655; bh=sXzqmP5MlK+j1Yq6dP9z+/8Nn3NdnH1jYeNuVgR8xAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DY7dMa4ls3OeW4IVZ4rKAhA3JFq3w9JUXxsuZpGkppAJuChPSDO9M9C5lnMxrsZmX
	 AURly6ptP1s7vfiLZb3qEdS9w801Bc9MUCgF4z6OjwbGYWOtKNmCOMy5nr6PmS5zih
	 bgz7NNolNxMjeanRjQ8hfoCxK8YQtvDC/7aDseV8=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 02 Oct 2026 16:07:22 +0100
Subject: [PATCH 3/5] arm64: dts: hisilicon: Drop PCLK from static CoreSight
 links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-3-c3edca1c480b@arm.com>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
In-Reply-To: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790953646; l=1790;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=sXzqmP5MlK+j1Yq6dP9z+/8Nn3NdnH1jYeNuVgR8xAo=;
 b=szTlIePqWbhXyJsQ8PeTJfpBnTmtYz68rIJOpnXuktOfJF6IpYxwG1u3t/HuOYWd9nRB0R5fR
 ngvTMfSU01ECEzY3U1zf1+y8+V6A7ivV2bkOdlhH+JHapA3U6ngxbFh
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_080737_107127_05718AB8 
X-CRM114-Status: UNSURE (   9.32  )
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

The static links don't need to program registers, therefore apb_pclk
reference is unnecessary, remove the pclk properties from those nodes.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi | 4 ----
 arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi | 2 --
 2 files changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
index 4c6a075908d1f8e3b9bba7cf9f0a2220819ea188..629b412d1b9fcc060f1eff9517652d3ddb7db441 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
@@ -306,8 +306,6 @@ cluster1_etf_out: endpoint {
 		/* An invisible combo funnel between clusters and top funnel */
 		funnel {
 			compatible = "arm,coresight-static-funnel";
-			clocks = <&crg_ctrl HI3660_PCLK>;
-			clock-names = "apb_pclk";
 
 			out-ports {
 				port {
@@ -397,8 +395,6 @@ top_etf_out: endpoint {
 
 		replicator {
 			compatible = "arm,coresight-static-replicator";
-			clocks = <&crg_ctrl HI3660_PCLK>;
-			clock-names = "apb_pclk";
 
 			in-ports {
 				port {
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
index 3f387f4cf5e02386cd130da877a62f395173c806..df449c53fb98cbdc11454cea7deabaea6177c68e 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
@@ -62,8 +62,6 @@ etf_out: endpoint {
 
 		replicator {
 			compatible = "arm,coresight-static-replicator";
-			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
-			clock-names = "apb_pclk";
 
 			in-ports {
 				port {

-- 
2.34.1


