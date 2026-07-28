Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FFFC54F4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xo/71goV7oh7w+F8Bf5+6Jailn6SUEgOL2MvIm+2x8E=; b=kF0Tb7SeJGzx0WZBRZHAxGV7u1
	LUY4Y1vOhEg2/UvDxszYPOYhx1H6iRWkeQJmhdd9swH12YcfoK4rco1tMNIS9Rt8J7H4+jOXz/K2G
	JlLSxtCt3GZRiJdVH5eioO2yr8oCawHUhJI3QazvFg3oODGX4WvtBS3Zd9WkSIvGA+onZsDZJ+w8E
	rXBzBQjk5reDk1fp0UCW/rghJManQb2IuoEpgccHeZFYhflS7eeD14yizEgBpVG+Zp3g5rBklaryd
	KgvVSSvSPREY35nTqgKmcGmMxbWag/MRai2V7A3uU73z9+lOQP3IE8Wc8UtY33FMCaVjd9w4g8DaS
	COsU72og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woioC-00000005U52-1okP;
	Tue, 28 Jul 2026 14:29:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woinx-00000005TyU-2vgB;
	Tue, 28 Jul 2026 14:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xo/71goV7oh7w+F8Bf5+6Jailn6SUEgOL2MvIm+2x8E=; b=qEityp0TnoixVgI/hcwYp01eDR
	UKc7lpeudKD6rXcK4F4Z6J99opjyhBstcytlD30LZGsl5zfJ+t50/sKLGwUsNTzm+kUNWk0mF59kh
	HIyAthi1l0wrSk1Q4usJBhEpCaRWUkqA/h2/HwqNg/MHemnSZwwuWkAFiuoBsgcMPkggZFza47w7i
	LSu4F4qT4d0SXgqQLXHZgXmB+y/Rp2CPSQE01lE2Bc37z5Yighz2nT1uIe0RN7YChsiDFuGRFS44R
	H6Kz/3ukXv62iwxe2adp+WwRxT9RSBB9bOis4uEl2Fm1sLc4518e8VFEGfvep6hEXPcnnMJmNOdhv
	r5RsVEEw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1woinq-000000051Af-1l5w;
	Tue, 28 Jul 2026 14:29:11 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66SES8HB03929857, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785248888; bh=xo/71goV7oh7w+F8Bf5+6Jailn6SUEgOL2MvIm+2x8E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=HD4ip/Hpefq6N5GUM7SafXwNy2+H0f81PutuaYU2JGom+1AuTYfgnZF6La2FbH4no
	 NlCv81yyB9LKBWT8Tn7q8DErIB5tW4nzDTnp0PshfHtBJkLqYGx6bosjNN2zlXZJRU
	 MKEaE4FkBhWBEtDG5BwJtaBniCFVWLD20lv0wFTC4dH2ms7WCZM1ux2AGVVOILAhfN
	 rJ9I/xRYWPjELji2F6E12/32TevM+9vTHYU4J8qvrdLklzGRcWiA0uLjcKytuVq+rV
	 XExe1WRVDQT6HXiw1Y5UVQ7NdVfFzQLxjoIGQ37n6itfwFr3w0Ax7N6Nm+nJ1xPOpK
	 4z1S/gGW0PoNA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66SES8HB03929857
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 Jul 2026 22:28:08 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 28 Jul 2026 22:28:08 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 28 Jul 2026 22:28:08 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Jul 2026 22:28:08 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <jyanchou@realtek.com>, <bmasney@redhat.com>
CC: <afaerber@suse.com>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v11 11/11] arm64: dts: realtek: Add clock support for RTD1625
Date: Tue, 28 Jul 2026 22:28:06 +0800
Message-ID: <20260728142806.1954638-12-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260728142806.1954638-1-eleanor.lin@realtek.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_152907_279687_24D37DCA 
X-CRM114-Status: UNSURE (   9.00  )
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
Changes in v11:
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


