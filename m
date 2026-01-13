Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87FCD0C84D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cMyQxRxW90HzB5Lgl55ZU/MifENoUzgkvJPyp3LW47E=; b=O8NPfihetnuc6SO9VFLcHHxAPQ
	ajIQByd8GV0cif8XezZjfqQa0VycrxI8krL08GueL4Fo3rW3bQl4vEBY6zRfBRqhB+6qtyZ7tNHEx
	Fky7BY+7dMCyL6njij5l+PJgMy9wA2E0h+WaW6tGQAQUAFBa7gPm45eX0TwYRE/Lddc7aLUiKnqMb
	VHF/CEqnTASKjgWd2RXcSh9ceLwi98Hvkpe2BhfRnKUgr7gPH/8UqiXuqejXhNcEFrNkLd44Cr4cl
	G3p+wMW9B8Q905yfpNy3MDwluqrZdpl8sVJMILgdrFbVQQQXkhCu6SDS+Zp9B26Vl4zF2HJjbJPEa
	6Ra5d/lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc96-00000006xuG-15Me;
	Tue, 13 Jan 2026 11:01:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8U-00000006xC2-3Nj3;
	Tue, 13 Jan 2026 11:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768302028;
	bh=qBHtCmqQf3fbItk/B0xEDhMX4d577DCqnwXvhK6bRIA=;
	h=From:To:Cc:Subject:Date:From;
	b=UdeK7XYqgtDbieCGWK8RucVLb28Foo8tmygpqtX/Ve8owsSKVhhkKVTbLw2AzU80D
	 Q2UaBwL/0eFxC9mqtL7wdeFgZDaJ4Vp3SFbafULWszQFkt24kog3n/3ZBd66NOLk25
	 EhwOpgNt+s4Mc0Rlj6qnlhcM4ZaGwxqMaJoIpuGl6PyZs7aNG1N9OAmYwEa10zvKgN
	 8fq+pnFyoW0Kc0Pa5Fm9P3uzlBLR8mIaBZE3F2WlqZzgOngjhlXhiPM5AKw69fdMBR
	 cduJut5k7pE0oOt437aZ9M6innRx0s17MB11mBTOl4ftlfx/uzVmhsWh8OQJ5z1b5A
	 jyVel3Zc769cg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E5C7E17E10F4;
	Tue, 13 Jan 2026 12:00:27 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] arm64: dts: mediatek: mt8173-evb: Add interrupts to DA9211 regulator
Date: Tue, 13 Jan 2026 12:00:26 +0100
Message-ID: <20260113110026.37032-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_030031_540438_64F826D6 
X-CRM114-Status: UNSURE (   7.97  )
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

Add the required pinmux and assign the right interrupts-extended
to the DA9211 regulator (PIO pin 15).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 51118a4149d8..1049877e6cda 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -117,6 +117,7 @@ &i2c1 {
 	buck: da9211@68 {
 		compatible = "dlg,da9211";
 		reg = <0x68>;
+		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 
 		regulators {
 			da9211_vcpu_reg: BUCKA {
@@ -179,6 +180,13 @@ pins1 {
 		};
 	};
 
+	i2c1_pins_a: i2c1-pins {
+		pins-da9211 {
+			pinmux = <MT8173_PIN_15_EINT15__FUNC_GPIO15>;
+			bias-pull-up;
+		};
+	};
+
 	mmc0_pins_default: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <MT8173_PIN_57_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
-- 
2.52.0


