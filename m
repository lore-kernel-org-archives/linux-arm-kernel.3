Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE719C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 10:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CLlPCIqt0bxLPYhArLNHyn0dKNCw0iRzV2BlY1fQWIY=; b=daiQzG+ys0zwQtsk36IX6Hy6uK
	N0j35wSndJ6PskxcO0HRS1z1fwEbkj5ftyPaGURMOPOuFnlWTPDgoorsOg8czOVRL+xO+wvfGUmI7
	laH/gh7ajoI3+q8L6j/FfWaP0ZuuiJoB6yOBRqFUPyTYqKp+7VhIyHXVkzD+DEVlk0H2ROhiBQfP/
	2ZxpeCftGUAYJdlb0Zwh4aCHoK37EJEpAB48fwIt/B2PX8+EBN1adXkl0yLge4g3i7m9WenWYSDxL
	WQBwvMyzKhxk3Ib3GB4q76rFSIrTK2J5AM+yQ9RjtVKWz7rfCQrG+x9E/+alhfbU+9Iuw/dRTvqXV
	TDD6z11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMqt-0000000BSBE-1I9g;
	Mon, 10 Aug 2026 10:03:27 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMqo-0000000BS9q-2uPD;
	Mon, 10 Aug 2026 10:03:25 +0000
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4968750ad;
	Mon, 10 Aug 2026 18:03:07 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: rockchip: enable NPU on Radxa E52C
Date: Mon, 10 Aug 2026 18:00:00 +0800
Message-Id: <20260810100000.2643814-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9feb203fea03a2kunmb045b936d508a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGUJCVh4aTB5PH0JOS05IQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktISk
	5MTlVKS0tVSkJLS1kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_030322_926851_E418E431 
X-CRM114-Status: UNSURE (   6.92  )
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

Like the RK3588, the RK3582 has NPUs. Enable the NPU cores and their
MMUs, and connect the regulators.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 .../boot/dts/rockchip/rk3582-radxa-e52c.dts   | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
index 854c118418eb..dd29a3ea7031 100644
--- a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
@@ -300,6 +300,10 @@ &pcie2x1l2 {
 	status = "okay";
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	keys {
 		pwm15_ir_m1: pwm15-ir-m1 {
@@ -354,6 +358,36 @@ &pwm14 {
 	status = "okay";
 };
 
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcca_1v8_s0>;
 	status = "okay";
-- 
2.34.1


