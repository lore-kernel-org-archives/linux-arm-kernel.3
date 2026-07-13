Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B28EC44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLpRU/GtMKmn6U7lWmf66ahKCho/Wr3IcxlG4U0VeZI=; b=bK+i1jjT74JHiHsPi6z20Bx50w
	7dqXvgxCh2veWX8PzK0HxgeyBji4LbBzfn5HEPLvzJcTbXfiope2ChcK8M+QYIj4JPn3p3kg9StEE
	uv4sKAYOMVbMu2/Wr3OJDhgdeCpCubxO8mMmFYGUHyAdAZ0GkSqLlXCK+Eq1Z85MW4dg+m1GWPQc/
	R2l2CXCZ6xpTbz7fB4qRIRJZQAm3+Q91hP6dJwy+vSVqktX9oVsy2gklPJb7+kEbPLnVoIn/d0sqS
	Q2s9cJ/A6rghhWk+2qPs4zxul72jB76mPK0EOdeWGt1Lunjn+9c1biuLTiLxJKfxKZ2Zy9WjJ+cOr
	54ctAkmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJ2V-00000009rsJ-3pi0;
	Mon, 13 Jul 2026 15:57:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJ2G-00000009re8-2TIE;
	Mon, 13 Jul 2026 15:57:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XLpRU/GtMKmn6U7lWmf66ahKCho/Wr3IcxlG4U0VeZI=; b=RWApEDVHrwpQQvCLLQpgQ6/Pvj
	H5IvUrIkJD4XZqE9yrIdrOn6TAIfMeqf1FJ0mplVSLo4HnfXDcKlJxwRPVKbcyqZOpXmv5B+nRmZS
	mkiOfMswSbbT5nHpFjaox7KetvHiXiNZ1TRM6UoZz9cfXfKTGcN1yEi2EtEGUyALEiXmw+tpVXADm
	HLfKQ0RLwRY1vy0D6qZAld4967q6Z6Qklj7oATWQ5SnrTjco2y8yhtRVdGQvxNIpUcwwtsheLwNw9
	Rssv+qnM3jdJX6V860Z6jkzpdX/Bs+iXpv4YXAlmidw3imu7kEaFizhmeb1C1UKUuRlPctXacKfEg
	/99EPPiw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjJ2B-0000000BoAZ-1Ifi;
	Mon, 13 Jul 2026 15:57:35 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66DFuWDA11489893, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1783958192; bh=XLpRU/GtMKmn6U7lWmf66ahKCho/Wr3IcxlG4U0VeZI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=jRlMiXnIUtFbDD/g6sogclxE1Alt3IV2yWiYL0bnT3vX8sfbr3Yv1N5osYYgHHBv4
	 sU1l32jp5SSpfJy8brSLVbJhFeB38T0DfO12DOrbWhjbiH6SdTU+Pc1wBvCZWqWSd/
	 EnBIJ5M63zzqQG4iSv5le52acVsdp9t15GqBdq2wDGfbTTkXRXP1H5W7PrssUDk+Tu
	 j1wdLTznzDJd+Y2ZNIkrdPyktuRcNgItL78Wq4CvIesesnGLl8L5XpSsb/fn+awhmB
	 zyNyD87SSS8gOjhgTYhSHIa5eI6kBWx1ZapBIqiQUkYRBa3jQJ6PRdxdx3Wgzn/f/s
	 Hy9qVIl3jF6yA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66DFuWDA11489893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jul 2026 23:56:32 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Jul 2026 23:56:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Jul 2026 23:56:32 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 13 Jul 2026 23:56:32 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>,
	<bmasney@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v10 11/11] arm64: dts: realtek: Add clock support for RTD1625
Date: Mon, 13 Jul 2026 23:56:30 +0800
Message-ID: <20260713155630.3054636-12-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713155630.3054636-1-eleanor.lin@realtek.com>
References: <20260713155630.3054636-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_165731_934340_66DE1836 
X-CRM114-Status: UNSURE (   8.71  )
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

Add the clock controller nodes and osc27m fixed clock for the
Realtek RTD1625 SoC.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v10:
- None.
---
 arch/arm64/boot/dts/realtek/kent.dtsi | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index 8d4293cd4c03..409d46a73c91 100644
--- a/arch/arm64/boot/dts/realtek/kent.dtsi
+++ b/arch/arm64/boot/dts/realtek/kent.dtsi
@@ -26,6 +26,15 @@ timer {
 			     <GIC_PPI  9 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	clocks {
+		osc27m: osc {
+			compatible = "fixed-clock";
+			clock-frequency = <27000000>;
+			clock-output-names = "osc27m";
+			#clock-cells = <0>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -141,6 +150,22 @@ rbus: bus@98000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			cc: clock-controller@0 {
+				compatible = "realtek,rtd1625-crt-clk";
+				reg = <0x0 0x900>;
+				clocks = <&osc27m>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
+			ic: clock-controller@7088 {
+				compatible = "realtek,rtd1625-iso-clk";
+				reg = <0x7088 0x8>;
+				clocks = <&osc27m>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
 			uart0: serial@7800 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0x7800 0x100>;
@@ -166,6 +191,14 @@ isom_pinctrl: pinctrl@146200 {
 				reg = <0x146200 0x34>;
 			};
 
+			iso_s_cc: clock-controller@146310 {
+				compatible = "realtek,rtd1625-iso-s-clk";
+				reg = <0x146310 0x8>;
+				clocks = <&osc27m>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
 			ve4_pinctrl: pinctrl@14e000 {
 				compatible = "realtek,rtd1625-ve4-pinctrl";
 				reg = <0x14e000 0x84>;
-- 
2.43.0


