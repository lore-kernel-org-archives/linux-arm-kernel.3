Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E52CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 03:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XX4NEwG2pnNEjdV2nkzI2Tf9svTHlhEtNdMCwQ6cceo=; b=rUlYx8eBp4U1+7c9QIPLyVcGGi
	M9NOPqdFr5D4Y3KMJURFfc46Pirl3bbzPRRIdpS/NYFK89zImKoiPqMfrahzIMIj+29fhPx150DGN
	HZ+s/1gkUzI2g3YEnOAMmDSI27rK8c4oTfJIAIpYJ4MHl6pnsWTg6WxoFPLm+V72rEmwaj1ixwyKf
	dByIsYIv6UcYu8HctghLAl+XshGalts+gJnS+suBi8nhjkN7BnkzC8rJhk9Ecwuw5X/7EhOEoaUuR
	89ubDgySNT2ESYsqsKggWHW95R6cpjt+qnrSr+NQoplPlhnFSjqf16Z8YUb+sf+hZECq4yrPpBaTe
	GgeGcNYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdt7-0000000FNBx-0oZp;
	Tue, 12 May 2026 03:34:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdt2-0000000FN8o-2cBj;
	Tue, 12 May 2026 03:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XX4NEwG2pnNEjdV2nkzI2Tf9svTHlhEtNdMCwQ6cceo=; b=NXCITh+LrqJCqewPjEodk0UGlL
	0Z0k6ZU8F8rLRPwoB06Gz1WXNPJ40euJJR4Gp4J3M4eImsbzEXGBRTU1R3y91bCB/PFScl+lS4R2u
	2dGyPj9P0w96X+KF6309h6q8uTzyJzt06BYivS3Drgn6vnaVed5M/bT7Pcx/oQviV99M6tF1dvs7B
	nOJqMZy3JlH60lCQuu6L5TCIWgyiG0/d4XlvyrTNz6o54vbr/WkeDfJ5x1eDrn5TEWD1W4e1HX0UE
	0OPZ7a4894Bt1zCtAeXClqDJL5IIQnMjhNH34iluL3lIWIuM8g+Lr2iOumMSZV02+4GlRtU+VD7Kk
	9xgxW8GQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdsw-0000000DYbE-2BM2;
	Tue, 12 May 2026 03:34:23 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64C3XKffC3571945, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1778556800; bh=XX4NEwG2pnNEjdV2nkzI2Tf9svTHlhEtNdMCwQ6cceo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=ctkpsKx1wSZ8AcdhskcrjONKpf1gO0FWaT5CSTMK9bCBCf69seQDVs/wWQz78cHfU
	 fwu1eyyI8cZFhmV+W1jlmuhw9AEV87nCjcm2QxTS4NDIs6h9GG3//DrYIjdqgEGvdp
	 PbhNTM4Qieqxc7r2fO2JV7OLvJVqbSjRcNhpl6r6q3yxO+/9LQS+2NFac9zsfbv5Ph
	 0Zkzw1gmzulo1fHv7ghx+iX1TAbXKE6cUCn91w6Dfya0qiGXioGt3/zIF5nsboGRBk
	 5jb3fRD11TNzIAXoZhdryteR24v3TpZLGvbwK2PkNIkSV0kDUVIc6lXkmuv/qIm7LJ
	 wKUD9RyY/p/dQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 64C3XKffC3571945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 May 2026 11:33:20 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 May 2026 11:33:20 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 12 May 2026 11:33:19 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <wbg@kernel.org>, <mathieu.dubois-briand@bootlin.com>,
        <mwalle@kernel.org>, <lars@metafoo.de>, <Michael.Hennerich@analog.com>,
        <jic23@kernel.org>, <nuno.sa@analog.com>, <andy@kernel.org>,
        <dlechner@baylibre.com>, <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <linux-iio@vger.kernel.org>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <james.tai@realtek.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 7/7] arm64: dts: realtek: Add GPIO support for RTD1625
Date: Tue, 12 May 2026 11:33:17 +0800
Message-ID: <20260512033317.1602537-8-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260512033317.1602537-1-eleanor.lin@realtek.com>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_043420_094026_9F5EF3D5 
X-CRM114-Status: UNSURE (   9.97  )
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

Add the GPIO node for the Realtek RTD1625 SoC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
The changes are based on commit 856540ac9b441a8c0e39f1f1787277edc4097c9b,
which was merged into the soc/for-next branch.
---
 arch/arm64/boot/dts/realtek/kent.dtsi | 39 +++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index 8d4293cd4c03..228b82dfdb7a 100644
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


