Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118521061B3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 11:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3Td0wZotLaBngEl3nbtygM4AkeeYKfycbQUwc+pVNg=; b=BmjZHk2ISjPaWOto054BT5ZPLY
	8Zf9BPjO/5Dz1VDxe0WWGSVPrU61gm7ptbpnoHbUJy/5gPv7VVOob6oQXQ5QKfXaVSmBKkQ3lKmRX
	5XgHRAcDXemi2wxHOPYjJJvut9fghgcX+E8k8h08JFhfpgwfuAZI1uuOIczmyXog6tf0PX1TzV1qQ
	gZugD8ZO5znvHQYhzvVCjTnzsS82yGkO+gz0+LncIrqxWQln3o7NNYR8n7wgHFeVS/mAjNG8iIugF
	mF90g1MwIu9XTCSpxkQSNm9jenGxArvil0hvP+awLqyRyE0Ifoj/HT5KwL+m7NUkdCVTYygrFqiPg
	ZbvVsHTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7XTJ-0000000CtFO-2Y3b;
	Tue, 31 Mar 2026 11:41:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7XTI-0000000CtF4-0PyZ;
	Tue, 31 Mar 2026 11:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=F3Td0wZotLaBngEl3nbtygM4AkeeYKfycbQUwc+pVNg=; b=Q0NQZX7s8r8FK2lBvkmXlw43TU
	YKyAk2NzNkj0KokNgfAMvz3F9+afTrXkHRRWCOSl/cpwel/shqSpdptz15sAWQh3uLz/w+paSC5cS
	oOxb1FHHYdQXmuiOdeCgX/eETWcUn4IGZ8mTO47imQBieKf3Efs0nMgky28Czo+uxVB+Luisml6aC
	5qKffXgafSKskOgAKSy631+a4E3zs8fa47SHbz04oz61nTM2BKGi8h1IcjHnIt9fhcBEpLUfUm4bX
	SK7EQu2I+LtGR6D1sDxKPnWpVKb59S6oknoAAa/ER+iWnkBP97tV6j1HphJAzjGSXWEgXW6v9cCN7
	hreOGqiQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7XTE-0000000FnPq-2VTo;
	Tue, 31 Mar 2026 11:41:23 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62VBcZKj93149082, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774957115; bh=F3Td0wZotLaBngEl3nbtygM4AkeeYKfycbQUwc+pVNg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=mdipEE9ipau4+TnEm7a93c2XOTuWXIFVPMA0RjmWseac5V7/xy19G0tgjxIYdjqiI
	 THlp+9ksq8GUUheKDxIQe7eaW7Fk8wB33Ajg3WuVwDs/QtovjJOgaasdhkD57Sl1ih
	 VKXEX5bWeTrnAGHj/sH3U/POpopW1e+A6d12Qh/EWQQvUbPe40UHbV3nNECkfofTS8
	 zSgFDs70LvgRJocguUmiFE/RYQoAYMQpnzDyNOr/p2w4tviRII4A//uOdpis65yCiE
	 tBBBvylYo1yCMvK8xnQ0n4mHjsw78jJNx22FVKhooL/zOwz4FyOZymXH6xuuiK6ZGv
	 Oml9kaiVTZo6Q==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 62VBcZKj93149082
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Mar 2026 19:38:35 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 31 Mar 2026 19:38:36 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 31 Mar 2026 19:38:35 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 31 Mar 2026 19:38:35 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <james.tai@realtek.com>
Subject: [PATCH 2/3] arm64: dts: realtek: Add GPIO support for RTD1625
Date: Tue, 31 Mar 2026 19:38:34 +0800
Message-ID: <20260331113835.3510341-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260331113835.3510341-1-eleanor.lin@realtek.com>
References: <20260331113835.3510341-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_124121_283173_381C3FFB 
X-CRM114-Status: GOOD (  10.18  )
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
 arch/arm64/boot/dts/realtek/kent.dtsi    | 43 ++++++++++++++++++++++++
 arch/arm64/boot/dts/realtek/rtd1501.dtsi |  8 +++++
 arch/arm64/boot/dts/realtek/rtd1861.dtsi |  8 +++++
 arch/arm64/boot/dts/realtek/rtd1920.dtsi |  8 +++++
 4 files changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index 8d4293cd4c03..746932c26724 100644
--- a/arch/arm64/boot/dts/realtek/kent.dtsi
+++ b/arch/arm64/boot/dts/realtek/kent.dtsi
@@ -151,6 +151,39 @@ uart0: serial@7800 {
 				status = "disabled";
 			};
 
+			gpio: gpio@31100 {
+				compatible = "realtek,rtd1625-iso-gpio";
+				reg = <0x31100 0x398>,
+				      <0x31000 0x100>;
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
+				status = "disabled";
+			};
+
 			iso_pinctrl: pinctrl@4e000 {
 				compatible = "realtek,rtd1625-iso-pinctrl";
 				reg = <0x4e000 0x1a4>;
@@ -161,6 +194,16 @@ main2_pinctrl: pinctrl@4f200 {
 				reg = <0x4f200 0x50>;
 			};
 
+			iso_m_gpio: gpio@89120 {
+				compatible = "realtek,rtd1625-isom-gpio";
+				reg = <0x89120 0x10>,
+				      <0x89100 0x20>;
+				gpio-controller;
+				gpio-ranges = <&isom_pinctrl 0 0 4>;
+				#gpio-cells = <2>;
+				status = "disabled";
+			};
+
 			isom_pinctrl: pinctrl@146200 {
 				compatible = "realtek,rtd1625-isom-pinctrl";
 				reg = <0x146200 0x34>;
diff --git a/arch/arm64/boot/dts/realtek/rtd1501.dtsi b/arch/arm64/boot/dts/realtek/rtd1501.dtsi
index 65f7ede3df73..ae246a01f126 100644
--- a/arch/arm64/boot/dts/realtek/rtd1501.dtsi
+++ b/arch/arm64/boot/dts/realtek/rtd1501.dtsi
@@ -10,3 +10,11 @@
 &uart0 {
 	status = "okay";
 };
+
+&gpio {
+	status = "okay";
+};
+
+&iso_m_gpio {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1861.dtsi b/arch/arm64/boot/dts/realtek/rtd1861.dtsi
index 44c3de8f1f48..b5f08bdd9f17 100644
--- a/arch/arm64/boot/dts/realtek/rtd1861.dtsi
+++ b/arch/arm64/boot/dts/realtek/rtd1861.dtsi
@@ -10,3 +10,11 @@
 &uart0 {
 	status = "okay";
 };
+
+&gpio {
+	status = "okay";
+};
+
+&iso_m_gpio {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1920.dtsi b/arch/arm64/boot/dts/realtek/rtd1920.dtsi
index becf546216e9..94c8a43916a8 100644
--- a/arch/arm64/boot/dts/realtek/rtd1920.dtsi
+++ b/arch/arm64/boot/dts/realtek/rtd1920.dtsi
@@ -10,3 +10,11 @@
 &uart0 {
 	status = "okay";
 };
+
+&gpio {
+	status = "okay";
+};
+
+&iso_m_gpio {
+	status = "okay";
+};
-- 
2.34.1


