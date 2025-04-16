Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BFAC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 12:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jrUcKXIp3F5NBewiV5jYWKgoT5EqebF12dH3UBMHpEI=; b=bNMO6rVAZrmOM82/nysTHKXr35
	P8NpmthQg/PiBqBKHGYsnH3tSgiPqPm02kSG8gpVeCxT0x8QgY5UuRRL5WtR+P7Jtmm9CPMM9xH7o
	a1IWUK8YNEq+Cwy0qts7bPF8ls+Ex+9ZcmQgCvsbyFj8in+WaD9MvcdDro8sSy9U5fI3gxcOfkOpT
	Ev1tl0K1qerLer14xnm0IA6zxlsHYKFoO3f0N7XaIdca80JIO7WisAlzbBVDQkwxLBBHFOyRYByzR
	/fuohty8ymB7yoIsn96w5Z8kWhWLylscEhkwRHq5V4tognxvFtgIoO0Bo0glXk5QuwYQsJSN3IO+3
	seN2FrCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51jy-00000009UBp-0ew6;
	Wed, 16 Apr 2025 12:19:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51Tv-00000009QZv-0EPr;
	Wed, 16 Apr 2025 12:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744804985;
	bh=a3Pe3Q3KK3rIPOMbZY0oB2O3qG07DQXIJk6fVXXFwog=;
	h=From:To:Cc:Subject:Date:From;
	b=Zz4KKZpBr6XhCNIn3G4W9V2tJq9uR/eIDxV0hl5bjgYugc+BAJY2ao9E1qy2Z6BcU
	 EZWE+A/SgOnY34qNpfgCOVMVi1AER5BBl6RTN0hw65QDK68s++1pY+06+gJiZ/jFxd
	 N99gie7UbqpU/dqvQEjw3m3FyUb2opbmSKy7JDk/N0i/8lDZ440wXrLkl5SYD8aeY8
	 4PWkCf2Rup1TGTwOVU5zS/ESoTYxCBkNT/D6rvpP9b0MskvEgemk/hANBy6cUBHPMY
	 VlvFl2YgdFtOu8SKYmX8gAhOpHuYJKrm96CASatd8HYp2wiyggiBp1tC5ca0+KrMqx
	 Q0MdBvKB+WvIQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AACAA17E35EB;
	Wed, 16 Apr 2025 14:03:04 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: qii.wang@mediatek.com
Cc: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] dt-bindings: i2c: i2c-mt65xx: Add MediaTek Dimensity 1200 MT6893
Date: Wed, 16 Apr 2025 14:03:03 +0200
Message-ID: <20250416120303.148017-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_050307_266754_BCB187A4 
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

Add support for the MediaTek Dimensity 1200 (MT6893) SoC; this
chip's multiple I2C controller instances are fully compatible
with the ones found in the MT8192 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index fda0467cdd95..23fe8ff76645 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -52,6 +52,7 @@ properties:
           - const: mediatek,mt8173-i2c
       - items:
           - enum:
+              - mediatek,mt6893-i2c
               - mediatek,mt8195-i2c
           - const: mediatek,mt8192-i2c
 
-- 
2.49.0


