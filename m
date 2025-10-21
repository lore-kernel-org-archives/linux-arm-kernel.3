Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05014CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 22:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YdGTN73HXBg8W33BsNyg4SyUFHDBd3hNuDk5+fJC1G8=; b=aqlPwKtFxzPOwUuaS36c54D/la
	1350fZb4x8i4UYS4qp1B4VDM09tg/Sx2jMHoIAelIN2bQ9PeReJaH+6WDcP79o1pP6lbdYdWRk6b1
	5h4SPM7pZ2CGOGLS65GzU1ooySC7AtIM+BIy8ha0WbZydNYniLglsrXqHaUQP9dd4Yg1BR4XZcHpj
	rDf/Mt6feI1hlR96A9qnW7Kvny7k4aZZWWm94W0o6uxU1pNwjkIlZ+jdhRzDc0V/+4vd6qXihGz/T
	LTqnEmwsTIy4VOF9ERgKeyfRawzEM4Vr7PP/s0C52QcVmXy/M6SmATcCiY3VmI5f1jBaKbYYgmQQ/
	KrGQuljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBKqm-00000000nRc-08rs;
	Tue, 21 Oct 2025 22:29:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBKqj-00000000nRD-3rZI;
	Tue, 21 Oct 2025 22:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=YdGTN73HXBg8W33BsNyg4SyUFHDBd3hNuDk5+fJC1G8=; b=eZw6EgdNfTYTKcWZ9YWJCPUurN
	WTX2zniT1zGBHYkaOqPa75uh/+SxFulTqwQ15IBM+JBTwgLl8PckPZK/DlkL0rVLHY2ZHvH2u8rBd
	RDuP/tJjwwJ9TMBzdU6OolTkUlROv9eNm9OU7JOQ8HVGOBXpxYNAydftKoL3SWOgUln8DyBbb096i
	Nw2hwspMPPi1igjKLRkBlXaeVZRgYldduuC4OfGV9A3hObW/aBaRb1OwizN9XUGFkiQx0jekomQXB
	+KCP+1LxgFDSZXrHJZb0MPdi06zmnps3SnTqhO/VRfchy6yH0wWS2pAuQ2lSMg9MhJToe3+HZecN/
	zBGO5vpA==;
Received: from i53875b19.versanet.de ([83.135.91.25] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vBKqg-0006gf-SS; Wed, 22 Oct 2025 00:28:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: andi.shyti@kernel.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3506
Date: Wed, 22 Oct 2025 00:28:53 +0200
Message-ID: <20251021222853.193224-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_152902_003724_61071B14 
X-CRM114-Status: UNSURE (   9.68  )
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

The i2c controller in the RK3506 is compatible to the variant first found
in the RK3399 SoC, so add the RK3506 to that variant list.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index 4ac5a40a3886..91805fe8f393 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -37,6 +37,7 @@ properties:
               - rockchip,px30-i2c
               - rockchip,rk3308-i2c
               - rockchip,rk3328-i2c
+              - rockchip,rk3506-i2c
               - rockchip,rk3528-i2c
               - rockchip,rk3562-i2c
               - rockchip,rk3568-i2c
-- 
2.47.2


