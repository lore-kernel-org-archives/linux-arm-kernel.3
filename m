Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA567105D99B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 02:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByB2NCua2AOa2e3a09GFIdMk1eZywRgOzjPJhvZ9QNs=; b=lU4kIdJdOYyD4flfMm5EjxUxY6
	DUu2lCrcYXHpAM47lhrpjO0XcV6G2gKQz7zL9arxAFNBQWmkvhdPZrAJAgrghfndhSoFPSMlOQyFA
	b0gDHFby9doTx3OLwc5Bwx0jEBhYjJasNhgYEM/ZFzJje9MUETkAy8uvABxWDWrN4H6nzY/5q0Xsx
	5Hjdb+oJ6poJ6erK8mzPP9bp6A6gBeub/TjRb1o6lDuaZIwPKog+lDjt6wc6kiDJig8gdaZ6jI8AO
	BMdVdJhQNe4DLsNw+EeOVctOp7fXjzKZq2bUr7IDvs+6hxTrM2EoQL/LC2jdPDn9JAwDUwjflBUqf
	8lWrErAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ4v-00000008A9x-0Up9;
	Wed, 08 Apr 2026 02:55:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ4s-00000008A7L-3HXw;
	Wed, 08 Apr 2026 02:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ByB2NCua2AOa2e3a09GFIdMk1eZywRgOzjPJhvZ9QNs=; b=GMSlKZ2MBH2KaY5c7mxOdaTktE
	0xl92iHh92OuVp479GD901aSCbXAomcq21K+UIuEp4KTrLOxb57aB1FiqGK89hH6fcuyUTIJF4vA/
	ytII7aIzNfgLAeotVRL7GTVRnMN/lhakLRxntAWlbaw+W0lu6SknPoB0qhSorCNN8Tp906I+57aRz
	GHFxKisbLFGfHjIq8zNruX8peJDYGq9YZXOPhPZJRDPAbFeanBE19HAAUP+XecCw+I0QpOiJ180jv
	XnJ+bKicqiC5GteTZQq6Cas+6WES9k7yVv5tELSj9rCBBwGovI5tdop4Z3YqJDHRhbTOyFMeKfp/g
	3pgvn85Q==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ4n-00000004fdz-2qnU;
	Wed, 08 Apr 2026 02:55:37 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6382qkMO32349162, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775616766; bh=ByB2NCua2AOa2e3a09GFIdMk1eZywRgOzjPJhvZ9QNs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=v+4YAQTYBAURaio4X7Q7zo2+siRblosQymR+PWUvjObRP1gy7djJEpYpO1lJmbzGU
	 jntPL+WDOOWtGsqegVjv9JrK9M0KN7KCFdzTmKK+bOSWx7u7b5YeaBWQlD2XYIonZT
	 3GohHh207EJPKkUBGVC7hqEbeoXZ27nVcFijtDTYPQ8YCHSixKk8ibQ9RRhv14d08H
	 7V2PDqyD1tf097m1dhv3nSX58q7pbNbhka4zd2oESgy4y3j2Jk3F42z4GTO4NHyakd
	 rHTAog9FW+snfPK3mZAF0M4LNKpsKvFgaN8QWiI8Zw82WkdIEl3HUKPUTjNFCJ3j4D
	 LtoCFzwzHXmnw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 6382qkMO32349162
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Apr 2026 10:52:46 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 8 Apr 2026 10:52:47 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 8 Apr 2026 10:52:46 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 8 Apr 2026 10:52:46 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <james.tai@realtek.com>
Subject: [PATCH v2 4/4] arm64: dts: realtek: Add GPIO support for RTD1625
Date: Wed, 8 Apr 2026 10:52:43 +0800
Message-ID: <20260408025243.1155482-5-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260408025243.1155482-1-eleanor.lin@realtek.com>
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_035534_344499_F7E576A9 
X-CRM114-Status: GOOD (  10.74  )
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

Add the GPIO node for the Realtek RTD1625 SoC.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v2:
- Merge two reg memory regions.
- Remove redundant status setting.
---
 arch/arm64/boot/dts/realtek/kent.dtsi | 39 +++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index 8d4293cd4c03..dafe56ce7d71 100644
--- a/arch/arm64/boot/dts/realtek/kent.dtsi
+++ b/arch/arm64/boot/dts/realtek/kent.dtsi
@@ -151,6 +151,37 @@ uart0: serial@7800 {
 				status = "disabled";
 			};
 
+			gpio: gpio@31000 {
+				compatible = "realtek,rtd1625-iso-gpio";
+				reg = <0x31000 0x398>;
+				gpio-controller;
+				gpio-ranges = <&isom_pinctrl 0 0 2>,
+					      <&ve4_pinctrl 2 0 6>,
+					      <&iso_pinctrl 8 0 4>,
+					      <&ve4_pinctrl 12 6 2>,
+					      <&main2_pinctrl 14 0 2>,
+					      <&ve4_pinctrl 16 8 4>,
+					      <&main2_pinctrl 20 2 3>,
+					      <&ve4_pinctrl 23 12 3>,
+					      <&iso_pinctrl 26 4 2>,
+					      <&isom_pinctrl 28 2 2>,
+					      <&ve4_pinctrl 30 15 6>,
+					      <&main2_pinctrl 36 5 6>,
+					      <&ve4_pinctrl 42 21 3>,
+					      <&iso_pinctrl 45 6 6>,
+					      <&ve4_pinctrl 51 24 1>,
+					      <&iso_pinctrl 52 12 1>,
+					      <&ve4_pinctrl 53 25 11>,
+					      <&main2_pinctrl 64 11 28>,
+					      <&ve4_pinctrl 92 36 2>,
+					      <&iso_pinctrl 94 13 19>,
+					      <&iso_pinctrl 128 32 4>,
+					      <&ve4_pinctrl 132 38 13>,
+					      <&iso_pinctrl 145 36 19>,
+					      <&ve4_pinctrl 164 51 2>;
+				#gpio-cells = <2>;
+			};
+
 			iso_pinctrl: pinctrl@4e000 {
 				compatible = "realtek,rtd1625-iso-pinctrl";
 				reg = <0x4e000 0x1a4>;
@@ -161,6 +192,14 @@ main2_pinctrl: pinctrl@4f200 {
 				reg = <0x4f200 0x50>;
 			};
 
+			iso_m_gpio: gpio@89100 {
+				compatible = "realtek,rtd1625-isom-gpio";
+				reg = <0x89100 0x30>;
+				gpio-controller;
+				gpio-ranges = <&isom_pinctrl 0 0 4>;
+				#gpio-cells = <2>;
+			};
+
 			isom_pinctrl: pinctrl@146200 {
 				compatible = "realtek,rtd1625-isom-pinctrl";
 				reg = <0x146200 0x34>;
-- 
2.34.1


