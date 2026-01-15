Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91063D4116C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7znxV4iHygEQsdw5X30g1M+0yJ8aZwO2X2LkzHXdX08=; b=oyzBVetNvtfAAbILOhkAasLQI2
	A7IkLpvGJdqO1769CcJ+AJKOmLVgHDEId5uLMZBD84byxVhd5aPrei7sE30okdduCEY4XHytJEanK
	s2UhU4r3vWeZsRZL2Yai94Gk69pyRQ3znOmKS7kos3QSLAjaLX+2a3EOXSnRkXykHiKqAuUKu8Ppy
	3savat8SdLkvNANvSICqhc0UOrFKgSf+5bVEJBbUmIzGKxa5EFtY9rz0WbPkScEnfKlwR+bp4kCTb
	zisDwtKRn2/tJfWxkNOykW4EBGHJ2RZMBq+S43vZgpniiqzB6Jwmqk5cv0rqR/3pjxYiyKp2UMIFK
	UN68a9LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLeF-0000000CEZ2-2flx;
	Thu, 15 Jan 2026 11:36:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLeD-0000000CEYS-0vA2;
	Thu, 15 Jan 2026 11:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768476973;
	bh=2838NbiS+1I9aTZDaFkizTzSaYb5pk5Dt6Y8NWiwHvs=;
	h=From:To:Cc:Subject:Date:From;
	b=YH/+Oh2Sn6E8FX9gjDRLpQxpEiu4eghAuxWK4GQUOjPW39tWQ+OyjPq38gSq1ofMB
	 XCFO9JZeEA/girDwkQfCPaUZcdzAkikPemTM1X5kS9x2AcNwLLcF3gT8rPOhS95Nuc
	 1p4trT55hIO2OepyiRJ6qaOpfQfuWanKI4Wle+YItrfbU0DHFkkOwOpQ5tbq25XuBL
	 nEc6yU7NSEGFzhH3z5yFQ78YpAPlRJaUCS5e685rCmQlw7/y84eLCct0X09U5bLlxz
	 3K+2sniULZLkZOgqR47ylgaJECTNDwQ3zPpM2S//ZwrsztZGRdMmsRAsJA5Px1v1/e
	 qlDl+eOx2A+/w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B8A317E01E7;
	Thu, 15 Jan 2026 12:36:13 +0100 (CET)
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
Subject: [PATCH] arm64: dts: mediatek: mt8186-evb: Add vproc fixed regulator
Date: Thu, 15 Jan 2026 12:36:08 +0100
Message-ID: <20260115113608.64817-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_033617_436314_416958AE 
X-CRM114-Status: UNSURE (   8.78  )
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

This board at the moment has no support for PMIC regulators, but
the CCI requires a vproc regulator in order to both stop giving
dtbs_check warnings and to actually probe.

Since vproc is a system-critical regulator and the bootloader
enables it at max voltage, model it (at least temporarily) as
a regulator-fixed and assign it to CCI.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186-evb.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-evb.dts b/arch/arm64/boot/dts/mediatek/mt8186-evb.dts
index 2667a7424200..a941a931a07c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8186-evb.dts
@@ -22,6 +22,19 @@ memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
 	};
+
+	vproc: regulator-vproc12 {
+		compatible = "regulator-fixed";
+		regulator-name = "vproc12";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+};
+
+&cci {
+	proc-supply = <&vproc>;
 };
 
 &i2c0 {
-- 
2.52.0


