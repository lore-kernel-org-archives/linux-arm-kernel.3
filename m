Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27376CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/ejUma0NVT0zYMc+Bs3n8VYLh785FO0VxEzr2T75Tk=; b=oULbT9hsuOGn/oWxxkBY9z68mi
	vGGlcZZgvv+56R8kNn8708+858WUYaqWgtdTnmWfTkNfYtDqB40QJ/hS/K7OvHgcLIvmbHuSY0k2I
	4Fg657kp0VdZEknD0j24kPt95W2GJck2T2TDT0Sm6sG5mfZlqnNeaaBxRFRxv0EIV9PtOm1g6X1wW
	YYB6bW3A+7Yq5tkFQ7ujczi9GqPn8kLNH+IryLJ69xJA6TmgvO5QPxROXZrkUlMzztsOYNelwgx81
	cOOU0m5+qJNZGOXZTtenVMuLg747TkRWvK/juwdAaYvqW4/07g6eMu5D3Nx1cgHCjV8fPUF/4G6T0
	87119I7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCerQ-0000000BrTg-2uwQ;
	Fri, 02 Oct 2026 15:07:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCerN-0000000BrRg-3pbB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:07:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A64C8169C;
	Fri,  2 Oct 2026 08:07:36 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1353D3F85F;
	Fri,  2 Oct 2026 08:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953660; bh=EtEbIevaHoU1h59GeXCFBe5QGE2fZdeAN5/cQyHH45Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QuHgYZXC4DajEwRDu7Xaz72LkmmBmd2tgLKCgx164MsL8yk9drecUUsqxZjK/ebLS
	 boFPzWqd6g5tzJeTMJgekN17q75lpan1Eaq/UHFk90CJ4nWUy6G0dDLXXqEJYn4ibM
	 mQZ/qYiaazKPivD79nTc9MAzluTRsaAp90catOv0=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 02 Oct 2026 16:07:24 +0100
Subject: [PATCH 5/5] ARM: dts: qcom: apq8064: Drop PCLK from static
 replicator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-5-c3edca1c480b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790953646; l=890;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=EtEbIevaHoU1h59GeXCFBe5QGE2fZdeAN5/cQyHH45Y=;
 b=HUjL6TKbkcRHVBOoawur6aFG3yfPZ76e/a59I7QikVzblfgBJKHqlVZUER3WpfmUnv2wkSaBM
 /UndvBEMsLsAIqtfzwyeTfOQFxoT/QvJQrsF+7SPHfFxo8OxKrS5JBE
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_080742_023328_2204C45D 
X-CRM114-Status: UNSURE (   8.70  )
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

The APQ8064 static replicator has no registers to program, so it
does not need an APB clock. Remove its RPM_QDSS_CLK reference.
Other programmable CoreSight devices keep their clock references.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 09062b2ad8ba550c3c2ee5849c96fb68fa2dff4b..d3ae9b835b9f45ce0bf66c850006a6ab149a183e 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -281,9 +281,6 @@ scm {
 	replicator {
 		compatible = "arm,coresight-static-replicator";
 
-		clocks = <&rpmcc RPM_QDSS_CLK>;
-		clock-names = "apb_pclk";
-
 		in-ports {
 			port {
 				replicator_in: endpoint {

-- 
2.34.1


