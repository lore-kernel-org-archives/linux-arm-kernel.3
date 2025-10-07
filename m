Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1341DCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 05:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKFawoGyE56Il7R2ZBManCYmTHDMeRCPCtZ8r/FsLt8=; b=EQBgkRu3jogr4Y6IHkXjn3JXjD
	rgNJFMMe0GPsKwy003Qz3O3p5h+1k19JfENozr4uoWCOFV64qT/4mKVRvgZ2EWdDOusnIhxIwRLCr
	1ZjmFn2cWNmI+XJc4tJJq6EwlBhrrbSctKdpvjpNAWXRcbUfBZLCfUpb68XU/AOSGDHgUSBS2BhVt
	6q7HTLrtpUGXkhGkcdBnclRaQvMVJskjeQWubDhxp/0l8gU1x/dA43pljdS0hG7UAgq/w6GIPuYTZ
	bhAY9tr6cNqqmwUi5sTU93iYpgZhgETndpIV0lokMvBEDTMJNQT/j03oU3Kz8EOZfTJzZnBxQ3y9H
	hIH4MVTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60fw-00000001JUH-3BRg;
	Tue, 07 Oct 2025 05:55:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60fu-00000001JS1-14NK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 05:55:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5478346929;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FC6BC19421;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759816549;
	bh=zllb+3NvwJkSAIh2p+SIfQifQPmEwRZvoLAixcWzz0E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=isR7iKQchEFp5G+QojRUOl5eUNtDqlaWT8mKlVNVJLOTwrfBH8bSdqz5QbuF8dM10
	 vpnhcfZDdGfkFysr2JaleFx98N07/jFIGw69GOkbxkFh1mvD/DEjMpO+tj3pTOla8q
	 cEFGozztCcEgUS3AHgGDkCQeuMjLvB0oPVU1rEec3Ch0RhJasV7LV3NjbXB62c9CHx
	 1fYlfpsJQR9+au6VhkBOQbt94el7JvygD3dcWhroPX4TyW7jXI2J4TE3FDA/euNbxi
	 b7wjgCbIMRb1PD6SXDKYHrLOGLjJn+bnpyE4UfADAFonkqGDHWlmrWEzZftB/SEiqe
	 +OS5Q411S0c3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C85CCD184;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Date: Tue, 07 Oct 2025 01:55:45 -0400
Subject: [PATCH 4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-m8-dts-additions-v1-4-53d7ab3594e7@me.ssier.org>
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
In-Reply-To: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Messier <alex@me.ssier.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759816548; l=1396;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=hdecRNJtpjZw0ZFJpTZCDbMGZMkzuTJDOFqG18sWriY=;
 b=upDMWCpKVS6TzPDV0IXurlo/SWZvnQRUjFVv2F6MvD841N+5VeyizVu42f8yrfyUfvHsGTJcb
 DQQ744yTtVVCTTcOgpkwKuY/iNhAp23aL5tX4I3TqR0vY7Bx8BiQAVY
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_225550_354235_2AF090AF 
X-CRM114-Status: UNSURE (   9.80  )
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
Reply-To: alex@me.ssier.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Alexandre Messier <alex@me.ssier.org>

Add the touchscreen device node for the HTC One (M8).

Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
index 36eb42f0f3d9..040a256f9465 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
@@ -65,6 +65,35 @@ vreg_vph_pwr: vreg-vph-pwr {
 	};
 };
 
+&blsp1_i2c2 {
+	clock-frequency = <384000>;
+
+	status = "okay";
+
+	touch@20 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x20>;
+
+		interrupts-extended = <&tlmm 18 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&ts_int_pin>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rmi4-f01@1 {
+			reg = <0x1>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f11@11 {
+			reg = <0x11>;
+			syna,sensor-type = <1>;
+		};
+	};
+};
+
 &blsp1_i2c3 {
 	clock-frequency = <384000>;
 
@@ -358,6 +387,13 @@ cmd-data-pins {
 		};
 	};
 
+	ts_int_pin: ts-int-pin-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	wcnss_pin_a: wcnss-pin-active-state {
 		bt-pins {
 			pins = "gpio35", "gpio43", "gpio44";

-- 
2.51.0



