Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63422EB3641
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 23:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xOvgBccEPgIHRjW7JLhRF8m7AtAmIUXTMKnuXsqjv0=; b=MG1hOb+0v8PK3Acx37UZsRA5CE
	i1cYK5U+E/E+G8ZwPZ99MAh1JGr2xcLOkhe5kmQvmfXtA2xsNG7v9j1CVGqiJhUP8g2t01ZKZBp7g
	MCXVfDll01fH268ErPTnRP7CUCs7jVo9+yuWs+ysmTm3GSKpWFHhRN800JzGFjDXPW1lH1wj5m9HY
	lO//3csEip5k4T1RgkkjYnZHX5FhYj1TMu9WAghW52P7VKqGLoPgfIffMEiCnkaoSlqk7QfcQURqh
	zoPoA1AbuC00UFMJbAVDphYseI6LujjPV5CuQv/GAKtoRGvfrorkaIFCM2N/kueTCPLAoM61fs5lW
	cKF2LmOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCGG-0000000EB38-1vJc;
	Mon, 02 Mar 2026 23:01:12 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCGD-0000000EB0V-0hLf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 23:01:10 +0000
Received: (wp-smtpd smtp.wp.pl 22820 invoked from network); 3 Mar 2026 00:01:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1772492465; bh=9xOvgBccEPgIHRjW7JLhRF8m7AtAmIUXTMKnuXsqjv0=;
          h=From:To:Cc:Subject;
          b=uPDCu8EGqedIL+PL3QJTUaKpbw8mc9u4Adh4qLbQ0gOUrYLrxbN+GiEgeKuBjTj/7
           Fi9ba5J7Xp5O8MkXikCaZNTlwlRLa2kv+VACQoaI8BUjWJ4iDGcSperU8oB9lY8OhW
           SnzdCOCb9h8ALncOtIntqzoUiPxnZzr8mzpAiJ2aKU6HVulCWGH4c6E3HfdtY1Piej
           tpFOl0QBybyb8V4DoMysJGU4cNBop9HSlgyrTpEL+mOIqlYKb1L5yRoVuCZ+pXQJto
           bGUPFYEppE5Km6+M+WtdwM6zESP/KV273KVnLhc2cyhHrYJYLAEvSAiKhL799ToRzn
           LoEV4691wW/Yg==
Received: from 83.24.116.171.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.116.171])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <herbert@gondor.apana.org.au>; 3 Mar 2026 00:01:05 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	atenart@kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v2 2/2] arm64: dts: mediatek: add crypto offload support on MT7981
Date: Tue,  3 Mar 2026 00:00:39 +0100
Message-ID: <20260302230100.70240-2-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302230100.70240-1-olek2@wp.pl>
References: <20260302230100.70240-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: c21ac2b7c0b21cfc22d068621eec5de7
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [4Wq0]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_150109_367519_B16B5CC1 
X-CRM114-Status: UNSURE (   8.22  )
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

The MT7981 as well as the MT7986 have a built-in EIP-97 crypto accelerator.
This commit adds the missing entry in the dts.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 4084f4dfa3e5..94c7bf0050fc 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -150,6 +150,21 @@ sgmiisys1: syscon@10070000 {
 			#clock-cells = <1>;
 		};
 
+		crypto@10320000 {
+			compatible = "mediatek,mt7981-crypto",
+				"inside-secure,safexcel-eip97ies";
+			reg = <0 0x10320000 0 0x40000>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ring0", "ring1", "ring2", "ring3";
+			clocks = <&topckgen CLK_TOP_EIP97B>;
+			clock-names = "core";
+			assigned-clocks = <&topckgen CLK_TOP_EIP97B_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_CB_NET1_D5>;
+		};
+
 		uart0: serial@11002000 {
 			compatible = "mediatek,mt7981-uart", "mediatek,mt6577-uart";
 			reg = <0 0x11002000 0 0x100>;
-- 
2.47.3


