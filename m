Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878B7C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ilQCMhL0zZkQUGRLRjUKYJt6Qmtnyc4KrCcRajmp7I=; b=gXZpDkGtboS1P2V0yygiNKMYFW
	2dYZsLUxw73+e8r+rNGARz4/WOpbWOwx5onH0ryPLdjyqTUkA5QkTtm04VTVTN2UjvTmfotCwCMA/
	NZce7XbcbdJ93dG9uZmd1xEMav09nz6lAz1YoX632kvAPj2xSmI+RAEI1JJX6h7PWK2ipK3HCOwD2
	XUoGZ6w7UYFvwGszawa9jBRQ4x44OH6nEzMscv/oU4pHQDto2NfftEDcoOLkgUSlKI5HbcNCUW+6g
	gejrkYDM0oQYWtj2kSbfoZZ9Jif0VX8kP39dse37PGnFxML4bO2wS/ElzQSoOWcEoWXeqBgbYP4Z7
	OWjeVVEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFBtg-0000000FAed-0MZF;
	Wed, 14 May 2025 13:11:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFAvK-0000000Eyzm-3B84;
	Wed, 14 May 2025 12:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=1ilQCMhL0zZkQUGRLRjUKYJt6Qmtnyc4KrCcRajmp7I=; b=DPiNOWETtn1sbd2qeoYN1GWQ0D
	LX5mUkisZbQ3yZGTlqyA3EVrFC1f/wQGdWcs2tQ3WlATYNABcCxIYZFPzPPf+NFDQ0mx0JrSPKEgQ
	R6Oo+kRrDyvBB5wKJn3fHZvXZYr/WkwWXR32vpfTRCMXcMj99FdHQFxL1Zv2EJvspqwlyS03h24I7
	Idm2rzTknMeoJlnMp2mMYWbhEZx/KimlWm+XclhZHX2l9SNi6dtWGetq6HDLvoOntMWRIm4pZeg4R
	ENOaOIUTlDop3bSIeCBapVKtiSPd8/wom0EYAM+a2DgihgHvxIVt3HkvycwQ6nh0ubHG+A/bgMXyK
	ncZpdBYA==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFAvJ-0005f9-El; Wed, 14 May 2025 14:09:21 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 3/6] dt-bindings: arm: rockchip: add PX30-Cobra boards from Theobroma Systems
Date: Wed, 14 May 2025 14:09:03 +0200
Message-ID: <20250514120906.2412588-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250514120906.2412588-1-heiko@sntech.de>
References: <20250514120906.2412588-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_050922_794289_236D0BB4 
X-CRM114-Status: GOOD (  10.41  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Cobra are Touchscreen devices built around the PX30 SoC using
a variety of display options.

The devices feature an EMMC, network port, usb host + OTG ports and
a 720x1280 display with a touchscreen.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 650fb833d96e..6435c724e682 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1109,6 +1109,16 @@ properties:
               - rockchip,rv1126
               - rockchip,rv1109
 
+      - description: Theobroma Systems PX30-Cobra
+        items:
+          - enum:
+              - tsd,px30-cobra-ltk050h3146w
+              - tsd,px30-cobra-ltk050h3146w-a2
+              - tsd,px30-cobra-ltk050h3148w
+              - tsd,px30-cobra-ltk500hd1829
+          - const: tsd,px30-cobra
+          - const: rockchip,px30
+
       - description: Theobroma Systems PX30-uQ7 with Haikou baseboard
         items:
           - const: tsd,px30-ringneck-haikou
-- 
2.47.2


