Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208E3E9D818
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 05:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aXghZoCygeJrBopuhQ5ADnEtlIYNmXUNUX+mGg8e7Y=; b=Fo1tdEWyU5mv79Vqij3gOgsORz
	vwZui8xiY3XPNV56ocBAYjYMMI2UwT+U8xACTXV9eJYKzjRAifBLYfLIQW0PP43yIcqW5slnDzZgJ
	SI1ux8wHomylv8mCSmAIzAxT5AUFWbrT6IjjSNKQA10sXCqQqtJMDRRi9i2wZNfXDljzhzg03N+3U
	pMdpCjrGQWIrcWtGy1+Lx1r9s62Mc1HDHUOb+KVVBsw5npGoNipLeAp1d8Fidni07xW19uf4mKGOc
	5mOHfYY1Ug/jY38X7OlR5i27pKa7Ed6FNEo1RZ7nYVyPVR7h1FydIkLwfFir8tt95E2BLozuuWnBN
	mdyZmGeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9cKc-00000004nYC-2v8C;
	Mon, 06 Apr 2026 05:17:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9cKb-00000004nXo-22ia
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 05:17:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CA2D60127;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AEF5C2BCB0;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775452619;
	bh=2/R8hwVT5UvTjOtMlKMI6RGTlmZeC9oO2S1Skxh7MUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FdQwBZMzgbUuWgWJkYSNCAmV4A2938HAFpmu9KT7qL967o1En5v7M70701nB8oUb0
	 rcIPK40aEMy95A3o68NUfKLG48GVygAq7cIVg0x9hJJaVW8A68zBQcDiCdFJUWt7lp
	 +O0wuZzYwqxamyufJonseCmoANXy6pEYbkSCg7LBs6HVAJLlx6GzsUChtDn077rd78
	 t9g0fGMRV5xFcM4xxhiyXi34WY2U2z8m0qZhL1am1779GRo+4gJAVR5B9bZ4a65ws8
	 mNOeVpqhTyeQsHPpqXYD1YA8wAgGce4ZgtISRWJnbjPZSjoccmBYvXhn1YQMhYaDOY
	 MOzVSKz9GnKag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE28AE9D839;
	Mon,  6 Apr 2026 05:16:58 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Date: Mon, 06 Apr 2026 01:16:58 -0400
Subject: [PATCH v2 2/4] ARM: dts: qcom: msm8974pro-htc-m8: add NFC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-m8-dts-additions-v2-2-c4c4bd50af48@me.ssier.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775452618; l=1054;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=JU0TS6dILZCLSZHyXLFTL6ZYC0tHdKQqnoQppdUf1kQ=;
 b=BwfaQTGnDfue3ZWWdpP2EfasX/7LitrEQGjtuzkKlETFgafs5q6Xw6Y/vx7zos53mjvYL/zT9
 N0o5zj3Y7PQAF4pAL5x5Qr6K1Nhnyh18M1duHV63gO/aetiyzSOFXKV
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
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

Add the NFC chip used in the HTC One M8 to its device tree.

The downstream vendor kernel used an I2C frequency of 384 kHz
for this bus. Use the same value as the vendor.

Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
index 37df271dbdeb..f24882dbeef3 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
@@ -65,6 +65,22 @@ vreg_vph_pwr: vreg-vph-pwr {
 	};
 };
 
+&blsp1_i2c3 {
+	clock-frequency = <384000>;
+
+	status = "okay";
+
+	nfc@28 {
+		compatible = "nxp,pn544-i2c";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 144 IRQ_TYPE_LEVEL_HIGH>;
+
+		enable-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+		firmware-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &pm8941_lpg {
 	qcom,power-source = <1>;
 

-- 
2.53.0



