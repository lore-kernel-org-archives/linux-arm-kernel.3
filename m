Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD10CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 14:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEaOtj32e2olPWSELOxOl2zp6eAYU58oXPVvDPPi0BQ=; b=yELWVB5guWTKCBLGJhn1fetnW8
	hqTtzzeOY0kbkEQJoGidUYLwFAZXPhaGelOMqOt+Fuc2564Bn9JAY7bFfxQDB8qBeGurk+ONDQtJs
	pwU351W6XPpEEhIP6SZO7bnN47PaGits4ruAfULQtr4GgYYCZCu2AR33enhdS2afWuUpAb1UTM6eR
	3VEC1ydgcvjzjiEcjrx//kgTNMvT+6XJEqj3WTMc5OxLaSqLy4aHDQFmquEYtJypVUfHb2cZ1TPCo
	nTNqJ32g81D/XOwBF33wMlM1Wp3wrMyiymSC66OXP4PcimFGkfLYLj3zim3yVeqDFbYgonqeSl2Qm
	PZ/XCVZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3Qx-0000000BG8q-0R5r;
	Mon, 01 Jun 2026 14:16:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3Qu-0000000BG7D-0XSk;
	Mon, 01 Jun 2026 14:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780323357;
	bh=yN2Kv1UwlljiT1zJCR+lRKh6mTllX7hmGBUK3EGGdr4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cO4STWItf6Ri1oD8L59OFsX4YDhHn5bDjWfCKvbrDAHrXx+5Yk18DWgiEegsh42d+
	 m/VInw8oPbmAMk9bM7C1KJkFDjv521CZaN3S03+6Ry2qO9TMkN7v5eeuPXabLE2E5R
	 aDQiSlyK+kyVxo3ltE09qqeKUJTbpfnQo8OFKM8+/Ps0QuKlEmqqw0TxeEuXQ1Re73
	 nqGsBFK6AumYJ2YlRyDmAjLrZigbIlz1e7o4gPWDYv/j4O5OGCPSvTafTlBE4s9rkS
	 vKFjctAJBIFCinzAuU8e2tjlHB8tKnELkBu0YC9VFwsrSBQ/5Z0xVmnLJQThLAnMhJ
	 XQfJiSPLI2gKg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDBE317E0D87;
	Mon,  1 Jun 2026 16:15:56 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 01 Jun 2026 16:15:45 +0200
Subject: [PATCH 1/3] arm64: dts: mediatek: mt8390-genio-common: Add MT6365
 PMIC supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-mtk-genio-mt6359-pmic-supplies-v1-1-05750080ba59@collabora.com>
References: <20260601-mtk-genio-mt6359-pmic-supplies-v1-0-05750080ba59@collabora.com>
In-Reply-To: <20260601-mtk-genio-mt6359-pmic-supplies-v1-0-05750080ba59@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780323355; l=1598;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=yN2Kv1UwlljiT1zJCR+lRKh6mTllX7hmGBUK3EGGdr4=;
 b=L/EBfFNc8pLBvOhNfPNbpebh5fmz+kXrIZvQAP6jJt6kSj2FR7vvDsB9txW9KPfr5yQvcI168
 9V5F3LXPU1LBn+x9t6mOTjq5uS9Q1HJJxjduG6o7rk8VEVr2t9UPIMA
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_071600_316455_9FEB8926 
X-CRM114-Status: UNSURE (   8.61  )
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

Mediatek Genio 510 and 700 EVK boards integrate a MT6365 PMIC, that has
a number of power inputs for its various buck and LDO regulators.

Add the supplies for this PMIC regulators to the board common
definition include file.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index b0c97930a0e6..442205cf0bc1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1304,6 +1304,23 @@ ethernet_phy0: ethernet-phy@1 {
 &pmic {
 	interrupt-parent = <&pio>;
 	interrupts = <222 IRQ_TYPE_LEVEL_HIGH>;
+	vsys-smps-supply = <&reg_vsys>;
+	vsys-vcore-supply = <&reg_vsys>;
+	vsys-vgpu11-supply = <&reg_vsys>;
+	vsys-vgpu12-supply = <&reg_vsys>;
+	vsys-vpa-supply = <&reg_vsys>;
+	vsys-vproc1-supply = <&reg_vsys>;
+	vsys-vproc2-supply = <&reg_vsys>;
+	vsys-vpu-supply = <&reg_vsys>;
+	vsys-vs1-supply = <&reg_vsys>;
+	vsys-vs2-supply = <&reg_vsys>;
+	vsys-vmodem-supply = <&reg_vsys>;
+	vsys-ldo1-supply = <&reg_vsys>;
+	vsys-ldo2-supply = <&reg_vsys>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
 
 	mt6365keys: keys {
 		compatible = "mediatek,mt6365-keys", "mediatek,mt6359-keys";

-- 
2.54.0


