Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00C8C3600E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 17:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ei1R1XbtM/7Jpvo7XffeVR6Qpxo7UXhh0v2AqV7Yr2A=; b=tKQhEMwjHsUWIPUMVNb8W3WdZ/
	DNY3V62oUUfyQjYc08VExQ85x+b5f1hhhAtAj8v+nxtvVQzUbrHxEh5INdHMzzZwnZ/j63NwsFGLS
	hYxGAxN3m55xrEE4ZNsofi5yuF+OtAXn8oCYJJlxBOPBegpuHz2BfVoDob72QoCBywrU3vCxxDDo+
	0/bV6QJJhSLrtyzFSYUghi1rUeAH2Ojc/ZW0chZtS9gzNfQFLg93Id32N7QqXXTM3ORZgLHJkQA1A
	Suuwi1pPRfS+L9V5ltn+v879UQIFuUe2ZD+PCqxhPluaZd0HwlWpHpI/iXGICQaCUSMSRVmGPSlFr
	URcqwwcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUfs-00000009D6I-1Xd2;
	Wed, 26 Mar 2025 17:36:20 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUe3-00000009CiK-0FM6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 17:34:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15794101CA7A7;
	Wed, 26 Mar 2025 18:34:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743010464; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ei1R1XbtM/7Jpvo7XffeVR6Qpxo7UXhh0v2AqV7Yr2A=;
	b=aoCSDZ6QyTEa707rwWYg/05iFgZV4YFwahmiWRk0077pLaFOMhUV7Yu6wvxTpjpwmvo4P2
	3uWni/5XvUBIGAfWshBYlo2hzx1ov5YNgpv6qXYqrpuR7bTpB7kNn+S43LEChLdEajGkHJ
	SPuLy2ZflfU2mA8swQ5ADwhkdDlSCCc4aMy4slUO/emOnd7ZDtwIM3De8ptgqXqo3qamC6
	0yAbCBK7vcajJuc7YyW4OoAdLTkEzr+NQOSeuWPDIz7yfsmjygizQAmmGXX3kDApw+7X/a
	LQyTbazgErsUtRf/IjsK8WIoCebmWDbxoIsNkV22dyVnuS4kh8v7/TDWlWKqhg==
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH 1/2] ARM: dts: Update common LWE file for XEA and BTT3 boards
Date: Wed, 26 Mar 2025 18:33:59 +0100
Message-Id: <20250326173400.2697684-1-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_103427_240651_8998E87E 
X-CRM114-Status: UNSURE (   9.35  )
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

During development it has turned out that the spidev node needs to be
defined.

Moreover, some crucial for the systems operation, regulator properties
were missing.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi
index 410dfe17f8ca..46858050d0d3 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi
@@ -26,6 +26,7 @@ reg_3v3: regulator-reg-3v3 {
 		regulator-name = "3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
 	};
 
 	reg_usb_5v: regulator-reg-usb-5v {
@@ -33,6 +34,7 @@ reg_usb_5v: regulator-reg-usb-5v {
 		regulator-name = "usb_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
+		enable-active-high;
 	};
 
 	reg_fec_3v3: regulator-reg-fec-3v3 {
@@ -40,6 +42,8 @@ reg_fec_3v3: regulator-reg-fec-3v3 {
 		regulator-name = "fec-phy";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		regulator-boot-on;
 	};
 };
 
@@ -134,6 +138,12 @@ partition@ff0000 {
 			};
 		};
 	};
+
+	spidev2@2 {
+		compatible = "lwn,btt";
+		spi-max-frequency = <100000000>;
+		reg = <2>;
+	};
 };
 
 &usb0 {
-- 
2.39.5


