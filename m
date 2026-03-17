Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7A8FD874A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XzDSib8jEoc1vfE4lmbk5v2Wrp3FeCGOBPB/DyAjANY=; b=xsfcGi4cmirhrb5CSSm3Mre2MA
	DtXq6eerKZM8vvbAdBW5Rk2LJ8V3cIWS/AMa8tZLjMc85zPJDfe/rMTWieCoYFdGbc+f0TTxNSwXE
	kRxoy+kS/5Gea1cuPP41U1N3FWPmi9ap8Z4nTt7yvKvAnbJlvahVkM/3EeyRII+v7wt1CIpcvIyeQ
	IOztdNTugKB3BF8Cq1n/W0Q1OZjcGkRS3ZPZGKSzKIDuPCTmT7Gac0OXWdnjdZPuvpOggueZrgi8O
	sxiK5v40Wa/w2fnsZ0yXp2tHErjBF3d7UzXFfkX6XupUlbm9/kaI+OV7Z3BUBI58v2P7erOTb2FhY
	8Cjiv+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2a-00000006F8H-1qHh;
	Tue, 17 Mar 2026 11:56:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2Z-00000006F7N-2ED4;
	Tue, 17 Mar 2026 11:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XzDSib8jEoc1vfE4lmbk5v2Wrp3FeCGOBPB/DyAjANY=; b=Wgj1c5in7/mdlEbUXh0QY/MXIK
	LWJJIwJHlYbmxW8BfKnxROjZFxE/hFCMv81Zj4y7P7nn2K5UzFYyvBrleqvVV2uoNrSibH3EaKBEr
	2OfGTDdS7NjCbil4Bmmrji7Vs2HPyUs/ouQGkPy0m0kWDJpkib9sARACmAZOVwwMyAESRkKMYRTBq
	Eb/ocqggha3yJkGqtmA2bosPz3JNVkOI1kdXMiM+DME8FwDfXxnwZ/4E92PVLDJsqZyTe+ieOS0Xh
	iEwp78FaOnRtzYOowH8PiG6Yl7EPCma4fHT3TeqVD4AZg1p2Kqu/eURx3KN4pBTwtUG15mJTIt7SB
	VVDn0cdg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2V-00000008taS-2qh9;
	Tue, 17 Mar 2026 11:56:50 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62HBsBJ813851624, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773748451; bh=XzDSib8jEoc1vfE4lmbk5v2Wrp3FeCGOBPB/DyAjANY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=MrwL+E5BUBM0leX5F83sh/VYfnQPesuJzh9ZSLW2/lpZH2o2+xFvYqv1tY74PtyuS
	 VthqCm7YhWU7bMreMzEuhgMhqXFSLd3557NvbmcqDE0bTpog8yem9X8fmuci7oop20
	 QQxFFbzibx2xW6eBlTRAe8R9JRPRd6lc8LY6LV8/ElS7GT98cnGFc9ZtBjA/+EN3I3
	 chTlA8vwsZf3un0Dwi0ea/+3BylqkSUypwUPo/WuWhEC9hvc9zqh6eO6Q2NukYN4+B
	 c1Fl+ND2KCmKKfxuyb3AdGTQDX3FPNB2mUSsLFC0Hp/7niRQFYma4RPd5xBd9OoDrk
	 B/5iUTZjhzgKw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62HBsBJ813851624
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 19:54:11 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 17 Mar 2026 19:54:11 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 17 Mar 2026 19:54:11 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v4 2/8] dt-bindings: pincfg-node: Add input-threshold-voltage-microvolt property
Date: Tue, 17 Mar 2026 19:54:04 +0800
Message-ID: <20260317115411.2154365-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317115411.2154365-1-eleanor.lin@realtek.com>
References: <20260317115411.2154365-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_115648_252803_C43857CC 
X-CRM114-Status: UNSURE (   9.82  )
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

From: Tzuyi Chang <tychang@realtek.com>

Add a generic pin configuration property
"input-threshold-voltage-microvolt" to support hardware designs where the
input logic threshold is decoupled from the power supply voltage.

This property allows the pinctrl driver to configure the correct internal
reference voltage for pins that need to accept input signals at a different
voltage level than their power supply. For example, a pin powered by 3.3V
may need to accept 1.8V logic signals.

This defines the reference for VIH (Input High Voltage) and VIL (Input Low
Voltage) thresholds, enabling proper signal detection across different
voltage domains.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v4:
- Rename the property to input-threshold-voltage-microvolt.
- Add the restriction.
---
 Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index fe936ab09104..ecddb415c06f 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -162,6 +162,11 @@ properties:
       this affects the expected delay in ps before latching a value to
       an output pin.
 
+  input-threshold-voltage-microvolt:
+    description: Specifies the input voltage level of the pin in microvolts.
+      This defines the reference for  VIH (Input High Voltage) and VIL
+      (Input Low Voltage) thresholds for proper signal detection.
+
 allOf:
   - if:
       required:
@@ -177,6 +182,7 @@ allOf:
     then:
       properties:
         input-enable: false
+        input-threshold-voltage-microvolt: false
 
   - if:
       required:
-- 
2.34.1


