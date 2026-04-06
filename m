Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46257E9D83A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 05:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCOYnZPuslJEhMjEr3bgExdhe1+YT3Dai/hpJcXRP6U=; b=y3mLLaSMtWjeUhm8iZ+WbLZ2pZ
	66f/cwVnLu3EbQUrnGAeeN0OJiGfsKSnz4qEIBSZVfxHRavzO2ZiyvUe3JV5dvOIsmAjPz/hNh6t6
	7ZYZT3FlEEdzj7yDAWL8wbpSY1Afoitl+bpdEPAbIcPuI57yl/jxCDx7I+w0Mapt+Flah76rpDUwM
	V0cCD8nrgGfW75TtwtxWlR4bTErz2V0WdzpL4V5ZP0akUsPzQzwIdyGvBIfONk3QxIuPrR0y2KEqS
	/JsJ/8UQyUAQwsV8DIgVCuOa9xe2Dh4p6rIoEMlrC9tzev1R1OqpBEzAH3nIUUWr8wFqccVE6nVJn
	cHsd4CoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9cKf-00000004nZQ-2hhJ;
	Mon, 06 Apr 2026 05:17:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9cKa-00000004nWr-1b6l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 05:17:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F0EB44551;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27305C4AF11;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775452619;
	bh=diflTiFOAqcvYf3crqey6uaDb/lDhFF77VdlL8dJwh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tydBbXyNhHRsQlT+UoWjS4c4ZsjuYKsADuemDDlvtg3uycQRNYV8C6L23UZ1Uq74D
	 oK965UOWaaLK+Kxae/QZrXVH86NB8EaDK36IGLY7bB7UHo1AKDue7fjE7/ScJMyslS
	 Tis5+ch3xgQfs1kqEpOalErzvZD5KKGp5TNgxPnBPCaf2kz6NhYsqPr4tM1dQqY/Fq
	 K9uISVtkIDeGwpu7Zp4oiyE/xIzu6Wnmw8gpJnC7up8Qsa6WWPE37iGIfU1Jr56Pps
	 qbz8qxmg+Vq+ApFy6J4HY7KlPfdZUr3Gb2IIObmouGxK1IcyQWnzPM9HoSsxgmnqBX
	 DNFq2jcxRMT5Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F48AE9D818;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Date: Mon, 06 Apr 2026 01:17:00 -0400
Subject: [PATCH v2 4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-m8-dts-additions-v2-4-c4c4bd50af48@me.ssier.org>
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
In-Reply-To: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Messier <alex@me.ssier.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775452618; l=1510;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=A5B+vqZ179ZaDPlA3FT17LpryB1RKmK0Cto2Yde+kzY=;
 b=XFv28L9PjBz5gSbfK4yWi2aPoBQ1/kpYHiDEUwKx6u1z4TCJiy+e/YO806jiJrDus5Qvnkm1R
 s4N3BEMGiUtAYb1RCQKiqyBKCrtCw7pDynzRajt3cZUG4kNZgNIpTOe
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_221700_497007_D2CC6B0F 
X-CRM114-Status: GOOD (  10.19  )
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

The downstream vendor kernel used an I2C frequency of 384 kHz
for this bus. Use the same value as the vendor.

Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
index 2edf407db567..66ad93e7dd20 100644
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
 
@@ -353,6 +382,13 @@ cmd-data-pins {
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
2.53.0



