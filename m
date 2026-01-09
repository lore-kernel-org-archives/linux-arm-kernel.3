Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB03D1681C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+WHnaMpB+lZP9QNZfE37iZJmJd2kQxDJtZLQP/mRkQ=; b=aoqyopD85fmbR94i3N8gipnvJB
	1NvkV/VTYhVVUnk8QIJ6bNm7Vc1bPMpfqFULI00ApU/N+NozfzPqyZzLNS6ZuaqYo6oqcpQAiEF3N
	w6YeYux+M5SSakK+Q0Yt+UFfh8Rqd3x0oUmutqOAB3KBJg2fpPjAXZtyOLwfw79j6l2ttWbBX6SCY
	an/f2ROLnpqn4HILUiZ/CNTZpLR6OZA4z34xPBBOyJEoayXt5eeUaa+yeqkd3YZbqt1/EWFi+W8oP
	aypSOIBnEx7IsL5zp+c00OPLK4a6yhwfMb4aSy+8N1y+ANqRhNvjpbIsLU4zFFeR9esTK3QZijMBj
	RUCp7ISw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyR-00000002F7o-2BvX;
	Fri, 09 Jan 2026 11:48:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyJ-00000002Ev1-3ZWH;
	Fri, 09 Jan 2026 11:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767959279;
	bh=IiHlkRaUYC1xMqmP8zbNGMQQRpV7g2G84fXDM1/h9E4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C4cFJP65tGmHJQXop5NeElYaWRURkScFOBeoUaNisD/Ha/aesK9eLThdAbyO70pVJ
	 I6NI2XC2WM9Ygd7c/bL1OZN66MIR8ZlEIGDfsjAMfx+67IcXKP30xADH4l/dpDd1ee
	 E76PXcc6CHlR/658DYSgMYHWq9ZOVzqCIkglQM2aoqKUz/LY+OIe6vAdJzRvV2QWQX
	 YJjaR4ZvRX9v/XsJnbJm+mBlZ1CVDzRJAwrQtS5vUr37bePnoFNaE6QWeXeXAzptwI
	 D+PtS6DOxFpVa0jUMYXAMT6HanlFe4hEefTSeYju/ZUDJagv+IFWghzOBUL/BpagDs
	 hzZJApNTPWgBw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F65117E1513;
	Fri,  9 Jan 2026 12:47:58 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sjoerd@collabora.com,
	hsinyi@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 05/11] arm64: dts: mediatek: mt8183-jacuzzi-pico6: Fix typo in pinmux node
Date: Fri,  9 Jan 2026 12:47:41 +0100
Message-ID: <20260109114747.37189-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_034804_087328_7AFC6477 
X-CRM114-Status: GOOD (  10.53  )
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

Rename "piins-bt-wakeup" to "pins-bt-wakeup" to fix a dtbs_check
warning happening due to this typo.

Fixes: 055ef10ccdd4 ("arm64: dts: mt8183: Add jacuzzi pico/pico6 board")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
index cce326aec1aa..40af5656d6f1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
@@ -91,7 +91,7 @@ bluetooth@2 {
 
 &pio {
 	bt_pins_wakeup: bt-pins-wakeup {
-		piins-bt-wakeup {
+		pins-bt-wakeup {
 			pinmux = <PINMUX_GPIO42__FUNC_GPIO42>;
 			input-enable;
 		};
-- 
2.52.0


