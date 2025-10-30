Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1648CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 19:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQ31QbkcMmuLkiz5CyZPj14+skUWgT8hv/9uZe1MCjU=; b=VT9v1U1F+VR63wOzhPVNQyR3Kk
	RfAfUevY2hJWf2rn/qI1hF9/KQC0FS+XwmysWyF3kyLLF55ipNa+vEn2lVT21JIwxFXWVA4Z9giRd
	Y8aKWrjIP/rJtPMVWIi4FPNYZuESm2triwasozsomF2iD1EekaXLuzkJbcHBIp0kZXfNZxIbBTpJu
	tXcX9uUVpnJmpVCLxisVCqY0m+QsftQbJ3RenAyLb99bzgavapOmD4sdUNtihZbs8tAjgEVJeN6Xs
	SF1HMtmLdxWJF+pjn4UQQmQ0iaoH+m0MN8nE7KOGO9ig7ChUCRM+JJrfzn+aZHFMwwIKyrXpoM/4U
	7SWkqjNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYgZ-00000004iCj-2zYe;
	Thu, 30 Oct 2025 19:51:51 +0000
Received: from vs10.datenmanufaktur-hosting.net ([213.160.73.65] helo=vs81.iboxed.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYgN-00000004i71-2sSr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 19:51:42 +0000
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 59UJvCVD020239;
	Thu, 30 Oct 2025 19:57:12 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 59UJvCCN020235;
	Thu, 30 Oct 2025 19:57:12 GMT
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
Subject: [PATCH v6 6/6] ARM: dts: imx53: add imx53-qsrb PMIC power button
Date: Thu, 30 Oct 2025 19:56:54 +0000
Message-Id: <20251030195654.20142-7-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251030195654.20142-1-akurz@blala.de>
References: <20251030195654.20142-1-akurz@blala.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_125140_121849_E68F24CD 
X-CRM114-Status: GOOD (  11.12  )
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
 arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts b/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
index 2f06ad61a766..2a6d28e9e8f8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
@@ -139,6 +139,18 @@ vgen2_reg: vgen2 {
 				regulator-always-on;
 			};
 		};
+
+		buttons {
+			#address-cells = <1>;
+			#size-cells = <0>;
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


