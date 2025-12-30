Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1DBEE57C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 20:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNGhnZ22Oz5GIhXoFUjqoG9pI2DUOYuzczwIS7ZlZA4=; b=rmRp9oM2bfPF+rvA5cOh3KjCBN
	ntokT9InrjE/fXBgozeJd7lwrixlmVA6TxOaDJ4YZum3X6l8ELm+H2lF0OAVjPLtpEWhd0yJLKZLu
	u741GNI6aCPpiS3+Lvu2kKrlx+37fVlc6LEaTw2UoAiwyfYEB33+YaXWLr+WGeLs3sWKJcbU2SYc1
	nyqrRwhTyufQ+/n0qoUgDHU79qvjg60MjL2WYkt8/H46Q7rHqz4kJ76RLgryhHat2bQEpzb6Oe29n
	aWtyoDY6yYEhUTalzZHA6D23kiuPZOlVAvHyBrK3Rub72VFP6TmySZVORJfeoFaC8DM5/WP9BEvCl
	5vxPcvJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vagBz-00000005Git-0AC1;
	Tue, 30 Dec 2025 20:19:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vagBw-00000005Gi1-2ScJ;
	Tue, 30 Dec 2025 20:19:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 58AE560054;
	Tue, 30 Dec 2025 20:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0975BC19422;
	Tue, 30 Dec 2025 20:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767125978;
	bh=jXBJOVSY5/jtRd4MsqkK6D8JPXqyh0CeW8/F1DaF9Hw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BX2PL9hZhZXEok+BI2UGLzRE8L/z/INqLlm6wEPC8sw7arwu/uTY+Lf/UIILOQmIU
	 S5dcOB5NsR74T2XFe5AcDrI83lET+rT2V5nnTbJ2ry0Izvd3U8DFuggSNMEHAFjJmP
	 QVcYfGX9GL13fT2HcPO4GNF1eR3cs14DlPD2glIP2qu2dBnD/I5qqwdYX2nZze1Vc6
	 11SyXzKlqGvjqxgzB4CtiJHGHPKXqKqX8QVZeLWKMabIi22/rgW1GrCcuva1I/kQFV
	 RCIMHArf8zUAQ5SCx5YfURX+caXh0OWS7NhkLs4SThx5aowY51XmZKbdEngqYHYSCD
	 lOnDaY3EiP9qQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC197EE57C2;
	Tue, 30 Dec 2025 20:19:37 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Tue, 30 Dec 2025 21:19:32 +0100
Subject: [PATCH 3/3] arm64: dts: rockchip: Enable the NPU on Turing RK1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-arm64-dts-rockchip-rk3588-npu-enablements-v1-3-d38b182a59e3@pardini.net>
References: <20251230-arm64-dts-rockchip-rk3588-npu-enablements-v1-0-d38b182a59e3@pardini.net>
In-Reply-To: <20251230-arm64-dts-rockchip-rk3588-npu-enablements-v1-0-d38b182a59e3@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=XpijixYvzriBRVOmsT4VQTqyTNHU15VOJMdhO93m6dw=;
 b=owEBbQGS/pANAwAIATteP+Oex+3pAcsmYgBpVDPYIftKqird7Gw+MbUTrhyNE9UgbCwk/G7ts
 4guJBNUd7eJATMEAAEIAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCaVQz2AAKCRA7Xj/jnsft
 6WIrB/0Y+4blBLv5BpU9K90rubcHvJSrE3X3bxnkDdVzGSdn1hIDUnerQd2mBp0UgG4AiLLN0Sk
 ijuK36DfiVNwLOnTZFIggL+Va2OKhz2CovtYshrKJzz/oQ3gQZWf1UwinN5ZEqE01s+ZG+wjIDG
 Za59n6vA7cIiR7RrlVbrSdfGUaqQNM4Ra6w69kBk6oq/LLkZLp343nu1qYwB9Wt8LW4mwk6DUFy
 nPfZF8lrOKEGQpxd/Km0qYRBqH2hTd+gVDAWCrLGi/smXlO7LLQnRGAg33m+6RjuDEKqjqPwEUR
 qtEDnlfTmnvYTEyi/hiRCY7bLRR+Y8TrUqeKM1drX7vIdvRn
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
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
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ricardo Pardini <ricardo@pardini.net>

Enable the NPU on Turing RK1.
The regulator vdd_npu_s0 was already described.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
index 6daea8961fdd6..7b28ec9ce1945 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
@@ -293,6 +293,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	fan {
 		fan_int: fan-int {
@@ -333,6 +337,36 @@ &pwm0 {
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
 &sdhci {
 	bus-width = <8>;
 	no-sdio;

-- 
2.52.0



