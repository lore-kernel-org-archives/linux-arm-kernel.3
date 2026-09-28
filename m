Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4736CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 11:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKdYDG9ZIYreeX+6zz4OdEIf0QBdQg4dPUWI4TSogo4=; b=I2V28ZV33N5oJwGWJoe0Gq+maz
	jM+xsmTUyA13EyHUWWaWqAPjHWKNiFN9+F58dVeHPis81lQ684SKEc7Ynv7XPuD8plT86K+zRafSB
	axu31jtWvPXD+ng4XF9dekdWydBxbCvXCWYxOFP5TrUjkRgNdq/PZH0PisObc+Ggv+EWZKcio0pxG
	w8V/a2DIYMwkGneHXX4m/wffPNNMNeFh8AMV2ho0SsYliQgW2LHme/Spc1FFbxoQj2Ysm03LKnZm5
	q+4y4/ywoeIJ+aH1J99+FckRcvPNIolcCeI/y5g1Dhevp+/w7fwzfCTr04wmS6KBTFBFNuBqdwRZb
	YJRurCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9Qo-00000000RLs-19YQ;
	Mon, 28 Sep 2026 11:22:02 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9Qm-00000000RL7-19ia
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 11:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=pKdYDG9ZIYreeX+6zz4OdEIf0QBdQg4dPUWI4TSogo4=; b=q9dVdBULcJU9xTntkOEVgyhvRk
	WP8wTStXxIMuUwZGJArqEN9cc0S0sVoTReRZ9rz7DP3RRv2sLTQh5ShvL+hhjKIpqy/bLUZI3iWUB
	dsjakAc56PPR6/TTKZFgmk9WLhKDC04PxXyYLd6Me5i1ByEM8twoi7Vs2+69kaLjaJaJN0V5RiGFI
	HqGH4JCscY6x9LxN4DJVyP64pe4sx31r4WYMeYMbxURwjUA2NNG8kKnATRDHf0oeqvPtr5iiAuHDn
	DxSuj01n0Txa4KY+Vj3iRh+KaT1tlKDTsfCTeDtQjiN70YkycdG2QwiWJdjbiQVkzEgJPAP+AF40S
	iAR3EcGw==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xB9Qk-000GDI-13;
	Mon, 28 Sep 2026 13:21:58 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xB9Qj-0006Dd-14;
	Mon, 28 Sep 2026 13:21:57 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: imx95-tqma9596sa: Add thermal zones
Date: Mon, 28 Sep 2026 13:21:42 +0200
Message-ID: <20260928112143.294091-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928112143.294091-1-alexander.stein@ew.tq-group.com>
References: <20260928112143.294091-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28137/Mon Sep 28 08:24:12 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_042200_432908_6C90CA96 
X-CRM114-Status: UNSURE (   9.86  )
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

These PMIC sensors are provided by the SCMI firmware and are independent
from the mainboard.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx95-tqma9596sa.dtsi  | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 456129f4a6825..6ed810733ff2d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -458,6 +458,81 @@ &scmi_bbm {
 	linux,code = <KEY_POWER>;
 };
 
+&thermal_zones {
+	pf09-thermal {
+		polling-delay = <2000>;
+		polling-delay-passive = <250>;
+		thermal-sensors = <&scmi_sensor 2>;
+
+		trips {
+			pf09_alert: trip0 {
+				hysteresis = <2000>;
+				temperature = <140000>;
+				type = "passive";
+			};
+
+			pf09_crit: trip1 {
+				hysteresis = <2000>;
+				temperature = <155000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pf53arm-thermal {
+		polling-delay = <2000>;
+		polling-delay-passive = <250>;
+		thermal-sensors = <&scmi_sensor 4>;
+
+		cooling-maps {
+			map0 {
+				trip = <&pf5301_alert>;
+				cooling-device =
+					<&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A55_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A55_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A55_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A55_4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A55_5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+
+		trips {
+			pf5301_alert: trip0 {
+				hysteresis = <2000>;
+				temperature = <140000>;
+				type = "passive";
+			};
+
+			pf5301_crit: trip1 {
+				hysteresis = <2000>;
+				temperature = <155000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pf53soc-thermal {
+		polling-delay = <2000>;
+		polling-delay-passive = <250>;
+		thermal-sensors = <&scmi_sensor 3>;
+
+		trips {
+			pf5302_alert: trip0 {
+				hysteresis = <2000>;
+				temperature = <140000>;
+				type = "passive";
+			};
+
+			pf5302_crit: trip1 {
+				hysteresis = <2000>;
+				temperature = <155000>;
+				type = "critical";
+			};
+		};
+	};
+};
+
 &tpm3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_tpm3>;
-- 
2.55.0


