Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D0A106FD9E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 08:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUIRwDRLqnHgtlC5DhqIs5z86/XmY8KuyoDsiTpfYU4=; b=jFhNlmmnwPOmQQKizpMNq2ElJY
	1aStwPW34ZIFo1d3FMJ5KLt7OujpWMazBh6PjHkyh47ZkJGVX+wBcakLeGT/tMXupF+l3IgB+J0iP
	AvjGXLO2189uFzkBJ91jzIVQfqppHt7Zjsy5m7qBbh+uCW3sOJaqUyp8yV4oVfiK4pXcxqSCELe2S
	Jt62fgd9kM8C9n3sv2YjsrVuN71iVs/5JTDKU4icUx9EpvaDMqBLMV431elIVb+ZKMChkZqKqwdJy
	GZ5DC+a7ugfLgLRaTpfkLKFjw3I4VNQGLkv/09Y7aK7I3U8VgjsH4Z4/2nTHQEvwy5orS2PL23Wb8
	HKy7uJoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xeU-0000000HC4o-0Ddd;
	Fri, 13 Mar 2026 08:13:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xeM-0000000HBxZ-49UT;
	Fri, 13 Mar 2026 08:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZUIRwDRLqnHgtlC5DhqIs5z86/XmY8KuyoDsiTpfYU4=; b=czOb40EAU7WN9TjKugmyuXysvU
	ysc3WNU6AYw4UO5JSktpnxfyRX5NhWAbFsWNBmMI/lA+LftfrxVqSAR4y4NKgIAVzpQFxOn0do7ir
	YU894NcJ5FiyMbdd0Pg4DMvhQGZgi5T0W38c6vG+j4yMMJYJ5BZVMtUvWVi6+YQVqchy03YXPAzf9
	nZ98HPfgXFllgJifcmZSOb1zzYnBwDpKXQHlHbs7H/twhsKCy7zsPTYuD8SusAbzbfuqMrkAFQZ3y
	0wtDjFm25r47Ys7LIYVPrnD7fllZNj4oYIFftRY7hickZud39M4EOIAwan6zZbFqrhYPQYceFLXDD
	488tC92A==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xeG-00000002pFx-0Puq;
	Fri, 13 Mar 2026 08:13:37 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62D8B14U0053079, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773389461; bh=ZUIRwDRLqnHgtlC5DhqIs5z86/XmY8KuyoDsiTpfYU4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=FKp6fK+zdQ/Dw12153fvS+XAtYmZIkJoqif3WYLhSPcqLRgJdL22t5TB0bC8CeOk+
	 6fGwpLL1c+EVAa7HE8gJs+ulEqmFNU4Ob1jUWZNBLPqZlC7kBUORSFlUJqJ5qeH9Py
	 s5k9+aicQFv37YnsiGhkIMWwn/9jPDNMJM+C4O8P/d003brqkEdFBOcIIcuZ8xCtk8
	 DLcl+LwYQCJ+PlXSuV1Pxw8Q6jn+qbgVsaPNosxpxg5uD3HcPbNQCBjzsk6P6UFzpm
	 XNgHQ08x9iPNrY3lZ5UCQp//Y5UZ678hkAm+g+4+FCxJKIVUj/44THqjcH5nh9WcCP
	 K8FYoZJGURnfA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62D8B14U0053079
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Mar 2026 16:11:01 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 13 Mar 2026 16:11:01 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Mar 2026 16:11:01 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v4 02/10] arm64: dts: realtek: Add clock support for RTD1625
Date: Fri, 13 Mar 2026 16:10:52 +0800
Message-ID: <20260313081100.596224-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260313081100.596224-1-eleanor.lin@realtek.com>
References: <20260313081100.596224-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_081333_038794_560B0F97 
X-CRM114-Status: UNSURE (   8.96  )
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
Changes in v4:
- This is a new patch.
---
 arch/arm64/boot/dts/realtek/kent.dtsi | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index ae006ce24420..eaff586c1806 100644
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
@@ -141,6 +150,20 @@ rbus: bus@98000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			cc: clock-controller@0 {
+				compatible = "realtek,rtd1625-crt-clk";
+				reg = <0x0 0x900>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
+			ic: clock-controller@7088 {
+				compatible = "realtek,rtd1625-iso-clk";
+				reg = <0x7088 0x8>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
 			uart0: serial@7800 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0x7800 0x100>;
@@ -150,6 +173,13 @@ uart0: serial@7800 {
 				reg-shift = <2>;
 				status = "disabled";
 			};
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


