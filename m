Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D4FCCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 19:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yG4r4uRyv0UPrWow01hTUw6r5RgSvWh/QMTnORFITJg=; b=4+coOd3QzOaUvTkbi4VBFjEAAh
	2rdcaYl/JiipS9OCSaHS3cri1rLkm2szjrPFCakjGp0gF+Mx9wiPyD1V2ZvgYsMAGHeRD7jf/SY80
	3t3g/F7ehApeOnuLBHUwSyGW9u4EI1i3cxLOhY/247qbwmGpjrDVhmXMBB8Qhx8rcd9XP72RQUrSQ
	DDHxHWg0G5h2YzZwxP7/fF57qQRoIq17nVftisxeXp/yErgmkCDparNQiyx0niY68jzFrP8Otk7Uz
	2+erINGLufE326E2/RZaGxtBLA6iU/DAJEfwms4BFuGwYnRZ5Q1XyyNrSegIt2MtwHX3CLJ/pwhjz
	I3rt9JgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEvA9-00000006kER-2fLW;
	Fri, 31 Oct 2025 19:51:53 +0000
Received: from vs10.datenmanufaktur-hosting.net ([213.160.73.65] helo=vs81.iboxed.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEv9t-00000006kAv-2eLu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 19:51:46 +0000
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 59VJvKXm001678;
	Fri, 31 Oct 2025 19:57:20 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 59VJvKr9001674;
	Fri, 31 Oct 2025 19:57:20 GMT
From: Alexander Kurz <akurz@blala.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>, Dzmitry Sankouski <dsankouski@gmail.com>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Heiko Stuebner <heiko@sntech.de>,
        "Dr . David Alan Gilbert" <linux@treblig.org>,
        Job Sava <jsava@criticallink.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v7 6/6] ARM: dts: imx53: add imx53-qsrb PMIC power button
Date: Fri, 31 Oct 2025 19:57:18 +0000
Message-Id: <20251031195718.1586-7-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251031195718.1586-1-akurz@blala.de>
References: <20251031195718.1586-1-akurz@blala.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_125138_006593_E779C143 
X-CRM114-Status: GOOD (  10.92  )
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

As described in the board hardware user guide IMX53RQSBRM-R.pdf, the
mc34708 pin PWRON1 is connected to a button "SW6"/"POWER", connecting
this line to GND.
Add support for the imx53-qsrb "POWER" button.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts b/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
index 2f06ad61a766..977dff72b9e2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
@@ -139,6 +139,19 @@ vgen2_reg: vgen2 {
 				regulator-always-on;
 			};
 		};
+
+		buttons {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			onkey@0 {
+				reg = <0>;
+				linux,code = <KEY_POWER>;
+				debounce-delay-ms = <30>;
+				active-low;
+				fsl,enable-reset;
+			};
+		};
 	};
 };
 
-- 
2.39.5


