Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAB5F532CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 02:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XmEXoNvQpHnGXXW5vJRRUsAQOh6nBmLz22bOxzyt0Q=; b=DFFpRBSNtewgiUGFIiQoWlVZQi
	aHZ4fAZLFhM0njahvUTSLbi1z2hKQMovmH1+xIWj0JS5DhNvW+kOux62udHiS+FW8mNvkCv/9cB5Q
	NJl4irUcKxopRAgz4zPYcmakT2bZAI14NT6S71BFnSDyWeZEKbothlKGPL2Hf5znLoak4dcFXX2SX
	kQSRZYI1PEjePH/ZoMorXyC1aGI/V+/hl7GwSj2o9kBhqbIQERJh/COkybI2AzUCCTcLwWPKO2c6f
	4iIgwx3Sbn5RtqmdfZtji6UgXP2NGqoYcpX7oFwPw3PP8d/uUIbqMyT3hG1eYTt4ZFOP5/0vFyzl+
	mztvtKxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rwo-00000000Qc3-1cJA;
	Tue, 24 Mar 2026 02:56:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rwk-00000000QZe-0O79;
	Tue, 24 Mar 2026 02:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6XmEXoNvQpHnGXXW5vJRRUsAQOh6nBmLz22bOxzyt0Q=; b=JVP+Vbhsa9RbH2IIsdcl9NMf8Y
	VE5J5/vdiS6oVUqmdtz1wUWyeVoz6UKCVlrUh/Aie58gDe9BcPeND8qeHYRhxk+TvXsrzyy1gTlM2
	E7LG/X6iupz9zjTabLHmYAnEmA52Ke4ObK3THz2tn6/ntkVq/ulFbks8jMRnPAiYbWafU7n9+EHE4
	rQv4Cp2ULJpgLturzR+L2hNJFiyq0Hxsg+HMV8DIumXWKwNkif10EveCRcah6nByvPEWN1pYzQ+cb
	Xixr27uaLLmdFQnGtpJsxm8/PKXBGmiPqpQoukcdU4JGTu29I92MlQz+p6f7hPoptc2JkcAvNBOVq
	m3DRJKzQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rwL-000000035P9-3NHe;
	Tue, 24 Mar 2026 02:56:41 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62O2rWVW1278451, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774320812; bh=6XmEXoNvQpHnGXXW5vJRRUsAQOh6nBmLz22bOxzyt0Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=kQsb/OUYrG/ZFJfcLlp4jjeAeYGxIGiwiqYlhDLxXzsw3nj3rbzHx1BN9fDI0/ZcL
	 13gefIWbAvwCQE+D+n77sxJCQ8EJ+EKAthzNx/5FX02hMmXJbdhsZk7lG38GKtSNdc
	 ixmTiOxnwI2nsLlfpL/s0WCIFivvvQjoGyczLjNmqBszzQIyhoPq6wZnGy3Otqg419
	 8KKlDcsR83DDptJinPGJyut85Eos4+xtAzI3QjvcDVmZgM6SaNERTeRqWV9fckmR7b
	 s4makJc8UALpO1VDw47kJyxyMKwiqArt4KcHq88tjdoha32AtKrWGSMIgJhR2tRG7L
	 Cmxsabc9sdtug==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62O2rWVW1278451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2026 10:53:32 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Mar 2026 10:53:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Mar 2026 10:53:32 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 24 Mar 2026 10:53:32 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v5 02/10] arm64: dts: realtek: Add clock support for RTD1625
Date: Tue, 24 Mar 2026 10:53:23 +0800
Message-ID: <20260324025332.3416977-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260324025332.3416977-1-eleanor.lin@realtek.com>
References: <20260324025332.3416977-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_025625_856298_474C473C 
X-CRM114-Status: UNSURE (   9.17  )
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
Changes in v5:
- Reordered device nodes alphabetically.
---
 arch/arm64/boot/dts/realtek/kent.dtsi | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index ae006ce24420..3f3383872a49 100644
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
@@ -141,6 +150,13 @@ rbus: bus@98000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			cc: clock-controller@0 {
+				compatible = "realtek,rtd1625-crt-clk";
+				reg = <0x0 0x900>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
 			uart0: serial@7800 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0x7800 0x100>;
@@ -150,6 +166,20 @@ uart0: serial@7800 {
 				reg-shift = <2>;
 				status = "disabled";
 			};
+
+			ic: clock-controller@7088 {
+				compatible = "realtek,rtd1625-iso-clk";
+				reg = <0x7088 0x8>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
+			iso_s_cc: clock-controller@146310 {
+				compatible = "realtek,rtd1625-iso-s-clk";
+				reg = <0x146310 0x8>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
 		};
 
 		gic: interrupt-controller@ff100000 {
-- 
2.34.1


