Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FD9D0C853
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/Q8Ryvk+N7175e/GkC/LhCDTjPnj2Vzd1rAyxjBPSQ=; b=b18G42qtSmTW2rP7pK4biY9D1A
	JJ9O6NOwNAggMxxrXDmrVlbxSFpgpUgC9aDC2oc2LSViIFzs81rZs9dq2FMYfidaFy+9EhNh76EtF
	63V+G2tOsYTcfwQheQsTsCqk6gMM+z6YQ1WQLTfGtXnXvP2q6SFePVk4ZOgqrmuEWRXagrFWIfipL
	CmSJrgY3oE5YY9CNHkpwIAaeZSZ16lg642Q0Ke/Ax4Cq2awSric/OYmWz566Ky2CJKymd+jyHWW/+
	xPUN7v0+Cqa78dEa7wjeiEvZmQgk/sMi/+Io1BTiIm4FL0GIJ2slPJJjXVXQYDSOOHITMv/pzufs5
	/EPiUL5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8X-00000006xH0-1xeK;
	Tue, 13 Jan 2026 11:00:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8D-00000006wyE-3R88;
	Tue, 13 Jan 2026 11:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768302010;
	bh=iLu8EGpNwMkDHk5AQxeZ6JfBZx9ZLm0ms2K34WntBDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GP7Gpq/TXzFCpuqeTMj/2x1hk0ctvVMUF5PMT1wIWdkEc08dF1DEuNCmodjTcGCWW
	 JK+aMMC9Yj4TmoLWjkjmlAD3c8uDGvDGn+vUPUtNH2MVd+gDH1/9zUtUHpifMOUf1S
	 B7r90d5BViySe71qS8MNd07+84BTKIT0XQ3U9ALURrOOyF1K3v/ykjOUW49I/ZaTCM
	 E+TJBJqA7tVidVHcY3DFECAj+20hzyprrHqfyuderRanu8eTN7U6ALMttXjTC5OAUm
	 ktLGN2QL0+N+v8CYEDnYpM5Pv1Au0hJn0CDKuWv3bOLC7U422w7ATOzfdjsPUfEFV4
	 EShM3N31te2Xg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9922C17E1520;
	Tue, 13 Jan 2026 12:00:09 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sen.chu@mediatek.com,
	sean.wang@mediatek.com,
	macpaul.lin@mediatek.com,
	lee@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 6/6] arm64: dts: mediatek: mt6795-xperia-m5: Rename PMIC leds node
Date: Tue, 13 Jan 2026 12:00:00 +0100
Message-ID: <20260113110000.36953-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
References: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_030014_264760_482A6C90 
X-CRM114-Status: UNSURE (   9.93  )
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

The MT6332 PMIC leds node was named "mt6332-led", however, the
binding rightfully enforces using the generic node name "leds".

Change it to the latter to resolve dtbs_check warnings.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index ecd13d089ceb..0e086dd487d9 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -507,7 +507,7 @@ &pmic {
 	 */
 	interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
 
-	mt6332-led {
+	leds {
 		compatible = "mediatek,mt6332-led";
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.52.0


