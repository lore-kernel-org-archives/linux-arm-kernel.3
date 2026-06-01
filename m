Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC78CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 14:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3AoNcnojKs4cAbHWMhEPlTgaq2dqzmJFE1S/9AauT0=; b=fiVGGuYbVhm8lC4B5fJ2aLu3q5
	LAjLT6WzMGybD/3MQq4tWOVhrC99PniMoWmKmlTtE/TNdb3eyjVpzlUQLFElW8tTuduhAO+S5bS9f
	1PBiiDT5S/s2REycRHs2A6HyELigCUpNROurUeBFkmm9Vy0WTWTPagC1/E0el+aWr6k6fT5ROzgQV
	D1wEsH+PivRZpHuUo+o0NsoJkKssGywK8p4YRMfsWUk5XZG0MMGgN6wHnwcSNDtiYzhZFWjVFnY6Z
	59JTTi4I5XyUmUhO88i6Mo/aMnOv8kFCCOpzDe+0UgFKKpv3HKX+VxH/sOaReWhVAw9Om4cFC5WTT
	IRYBBEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3Qz-0000000BGC5-3ak0;
	Mon, 01 Jun 2026 14:16:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3Qv-0000000BG7O-1b4k;
	Mon, 01 Jun 2026 14:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780323359;
	bh=Pa+PA8v51EYbf+V47125p/KH0Zpl+EITvm6DO69UpXA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VL5BVZVPqG2laTq6+DfN5rpqUnzegz0cO+UcSH+j1Spr44Uq/VR5j+dyRkNGKCF2K
	 0Mbh3hBG4gWhFomw21/Jcn2HnVN8Cm8oGr/G5AkAILwUoB/+DWuWF+/cKkbzx+MEJR
	 axVJ8vuzZ45baaU4QdysNKQ3WXE8L1MEd+H112+CUpizo2waAswoz7nmgqJJW/jQZq
	 PPYkmWCL4686s3RbWZ3lSvZJUvXnbbQeHVBsl2QFyZ/z0xlajhkrX0VA20i4rKReQc
	 NwNcVgu9ktnrypvjCUC3+bElNuY9j1Hix1GsE0+liIm1E2FCixZrp8Mb7OkpzzNPHb
	 ytMXGEd+ToLog==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA78117E0DE6;
	Mon,  1 Jun 2026 16:15:58 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 01 Jun 2026 16:15:47 +0200
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8395-radxa-nio-12l: Add MT6365
 PMIC supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-mtk-genio-mt6359-pmic-supplies-v1-3-05750080ba59@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780323355; l=1493;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=Pa+PA8v51EYbf+V47125p/KH0Zpl+EITvm6DO69UpXA=;
 b=vd1g1BQrXWu7S6wkbp9pfGNOg+4EN626LfvC7QvQkYRAguFuisrhS9dDeldeCPENvlGj+IiSj
 cy6hUlRirh/AOiaQuLoo9d03GcDgE8/Y52eLvY5BLm+gik6NfZbQ5do
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_071601_579866_3B04232F 
X-CRM114-Status: UNSURE (   9.09  )
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

Radxa NIO-12L EVK board integrates a MT6365 PMIC, that has a number of
power inputs for its various buck and LDO regulators.

Add the supplies for this PMIC regulators to the board devicetree file.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index b279eed1bfc3..9cf0315da035 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -1033,6 +1033,23 @@ &pciephy {
 
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+	vsys-smps-supply = <&vsys>;
+	vsys-vcore-supply = <&vsys>;
+	vsys-vgpu11-supply = <&vsys>;
+	vsys-vgpu12-supply = <&vsys>;
+	vsys-vpa-supply = <&vsys>;
+	vsys-vproc1-supply = <&vsys>;
+	vsys-vproc2-supply = <&vsys>;
+	vsys-vpu-supply = <&vsys>;
+	vsys-vs1-supply = <&vsys>;
+	vsys-vs2-supply = <&vsys>;
+	vsys-vmodem-supply = <&vsys>;
+	vsys-ldo1-supply = <&vsys_buck>;
+	vsys-ldo2-supply = <&vsys_buck>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
 
 	mt6365keys: keys {
 		compatible = "mediatek,mt6365-keys", "mediatek,mt6359-keys";

-- 
2.54.0


