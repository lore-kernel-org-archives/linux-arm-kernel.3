Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C52CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 22:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHcjTGHeFUn5M5ubUmRoUJaXj26i1Xu+TfXfxhkwXnk=; b=V58MYUpi0ST03FTBMDWyWf/9d7
	1J06BpRdhUIN9bhhx9OPHp3X/qMImNcTwPiznwyHvRMevS4kZ9KsfNgnV34R0vYu9fETDne3KxlKb
	76kQ1zy3Tnf+jeUHqJZhhGlcixTA1hnK5tpiSsx5T7yZL2M6ap5LegDntcOBe0H+1hdk1071QGF1L
	N3GKLn2UAOc+ifZ63d12VCBf9lUfHuKAju7v1xpfG+k9Cy+DLwYaCxOeLeJqkTuFxIBPBmBa0MAw2
	p9YI27Fm7EK7gha5Rn+Pgx0zlOZdQTQpYpyI3wIbKGNyG57Jy6hf+G2oMEkHcMePvT8uq7jRKq0NY
	4KXq4AWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6zTc-00000007Gov-0IE8;
	Thu, 09 Oct 2025 22:51:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6zTV-00000007Gnu-484k;
	Thu, 09 Oct 2025 22:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=xHcjTGHeFUn5M5ubUmRoUJaXj26i1Xu+TfXfxhkwXnk=; b=y25mSncAFQ/Y19TkctDzvC8gPr
	IbNA76rL9qiWYwjTh+AxgcV1Cdhy85aRcroC6UrTd+an1qix7JgFB+1BukTBc8kNG34NaiKj3Pd3m
	Emtz8ddtU5PAHq4UtfNkcKlsKK4LUMx/pxru1S/HV/R2Pd1A0gndf7IiPzi8y13HJIXpx+VaMpWY/
	rHFY1nV9Nck/JjY7nsxQ/ajFcrLluoQbTRyjcDn3FG6cGqsPnNU2Ps7LtjZep+dpm0cG97nmfdcpf
	kcFm9CymjspFAJwIBPgfLW6xzS1TAt/d1jESE/QeLrm5dRyccR5XFImbtdQNyVEgOfmJ9HPNY9+vV
	/C6Loo7A==;
Received: from i53875bdd.versanet.de ([83.135.91.221] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v6zTS-0007iZ-Ko; Fri, 10 Oct 2025 00:51:02 +0200
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
Subject: [PATCH v4 1/2] dt-bindings: arm: rockchip: add RK3588 DP carrier from Theobroma Systems
Date: Fri, 10 Oct 2025 00:50:49 +0200
Message-ID: <20251009225050.88192-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009225050.88192-1-heiko@sntech.de>
References: <20251009225050.88192-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_155106_038560_B37F8285 
X-CRM114-Status: GOOD (  11.81  )
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
Acked-by: "Rob Herring (Arm)" <robh@kernel.org>
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Link: https://lore.kernel.org/r/20250723190904.37792-2-heiko@sntech.de
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6aceaa8acbb2..1bf459890c64 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1221,9 +1221,11 @@ properties:
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


