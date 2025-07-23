Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801A3C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 19:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3QZ8UpWeh0MVZj2F0Gtz5OdAukQFaHfnnkhgWoxjaA=; b=Tcpijq0IJ5/f6DqY5ycCxBiZXZ
	7iIAsx609EkNAuEhXeHCaRyLBG+apc9gSMdG7VOCogYL2N3PKTFwNzlQbsrUtJqiBaowmzuexV5yM
	3BpjQoD0qIer1C0GscdyfOGGGhwMimoY93Cfau4WdB9V4aRUK3WAzrNiz4dnyxVwHfX1uPk9Eyjzx
	vwNvDUmgSZmPJGT8UGRSEAhjfLQVxqQwsnFbtu1M/awzf7b/+yEVwaadJy+CgwtRLi85Q7HYuZ9pb
	Gy7cSvy8DcUVK5eYU0zoAKgrjK1W+n1ujSUAMR75MqtZOfCexHUj0gfHxnwwFVPe9KN4w4/XA0kQB
	t6QKt+hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueesY-00000005oiv-0gNM;
	Wed, 23 Jul 2025 19:11:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueeq5-00000005oDN-3F4U;
	Wed, 23 Jul 2025 19:09:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=G3QZ8UpWeh0MVZj2F0Gtz5OdAukQFaHfnnkhgWoxjaA=; b=XbxbfasoVHV/i1TT9BOZhP1pCl
	ZbmvSC4YLfZOMypqPDQ6k2MN7iYG5J9eWd/dvrt5+wFjRDFTsnq8++MuUwDlI0zqp8e30zfG3UgMa
	8FTH+cyTTAluSF//16G6+IyJ3n5oqiyCQRwcX3dfrymWVPj8+Bd8tASO+CRgd5iftj3DBR18VMlRn
	WZf0Li/ZvYsxSA3GKV+Z7f2mIsK7UEA4AYRN5WefdDGDiy5V7PS3AezIuaPhDwEC7RKgWChjlNxNU
	QwEqQDq4etSLcjjFbPLe11pVJx5NluJf90dYsV7PjUnWKe8pENnM5hD8AB9KctlaF1MNgRMz9Kisu
	uVeBHblg==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ueeq1-0007Mn-Gi; Wed, 23 Jul 2025 21:09:13 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	damon.ding@rock-chips.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: add RK3588 DP carrier from Theobroma Systems
Date: Wed, 23 Jul 2025 21:09:03 +0200
Message-ID: <20250723190904.37792-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250723190904.37792-1-heiko@sntech.de>
References: <20250723190904.37792-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_120917_845486_C497C5A2 
X-CRM114-Status: GOOD (  12.06  )
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

The DisplayPort carrier is a very simple baseboard only providing serial,
ethernet and a displayport output.

But its main functionality is that it routes the Analogix eDP controller
to this DisplayPort output, which allows to test that controller simply
by hooking it up to a suitable monitor.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 5772d905f390..8dc83263c892 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1164,9 +1164,11 @@ properties:
           - const: tsd,rk3588-jaguar
           - const: rockchip,rk3588
 
-      - description: Theobroma Systems RK3588-Q7 with Haikou baseboard
+      - description: Theobroma Systems RK3588-Q7 with baseboards
         items:
-          - const: tsd,rk3588-tiger-haikou
+          - enum:
+              - tsd,rk3588-tiger-displayport-carrier
+              - tsd,rk3588-tiger-haikou
           - const: tsd,rk3588-tiger
           - const: rockchip,rk3588
 
-- 
2.47.2


