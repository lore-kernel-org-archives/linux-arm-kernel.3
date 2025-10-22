Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B36CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 00:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RsCiTjfAJVGKd8jls9/TBL277kk9xNpzA5VJ2++/V68=; b=4pXMuvQDQn8rezGDlbOzSjOe0E
	OXFSSXTWh2BpCIxMmIPQGljv9JxjhSPCW10eC9Sl20T7z5wBBTi5pXwFI02380uATHZpwaWnV2iwJ
	4xmfK5elh6JmRt0kvScDu5rlbTdlpSGDOw8fhSZM4TPkatKBh2HYd++U5wEVGWfZFCPVgwe0rPCYW
	KDK1KcxGFPfPN4ssM40LsOKDlpSPIfLdXObgxOfxZwRtSHSWm8tVRpzwJYDUTgqcc5qjVBNC0EDni
	YFTMrgWTh+ne2wScsGfVKSI8JjlLoRsqpBHavekVsh0PVACvV2pgi+RikmwL5+zn4nZoRPI56JZ8K
	6GTE7W3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBMvW-000000014CV-3BxD;
	Wed, 22 Oct 2025 00:42:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBMvV-000000014Bp-11He;
	Wed, 22 Oct 2025 00:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=RsCiTjfAJVGKd8jls9/TBL277kk9xNpzA5VJ2++/V68=; b=ZOq55LUqsOYpHtsTa8MaDcX+xO
	MWsY9mqJYPBQLKWK0jBiOqVABz8CCKXIdOlnZbJ/jChV/HH3dxjEExavHZsP4ixZL7yL/78kJXuWW
	iqw/d5lbXy7Q/bs3kZzWa5xdZMUZzoQYT9DdKDnzxBU2b7mJaQTlVNMpXlpinoTJ5h3G+CVeToGAS
	/IkJGwW++ZpcQTNLFTaLmjPHjdbC8xnWrRuMWRkQazqLafdKH9xutHlcXEJnU1LfdByJPCPX87Uye
	IDJ/x85EeC1MjNm5QwLJv36Vrjjpbkk8leqpIsj3lmO9TvBoS+UAO+29vVUCBYV5+jGyxECr6XnRY
	uc96Ttkw==;
Received: from i53875b19.versanet.de ([83.135.91.25] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vBMvT-0007Tx-2P; Wed, 22 Oct 2025 02:42:03 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: spi: spi-rockchip: Add RK3506 compatible
Date: Wed, 22 Oct 2025 02:41:59 +0200
Message-ID: <20251022004200.204276-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_174205_303934_798DD111 
X-CRM114-Status: GOOD (  10.56  )
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

The SPI controller found in the RK3506 SoC is still compatible to the
original one introduced with the RK3066, so add the RK3506 compatible
to the list of its variants.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/spi/spi-rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
index 748faf7f7081..ce6762c92fda 100644
--- a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
@@ -34,6 +34,7 @@ properties:
               - rockchip,rk3328-spi
               - rockchip,rk3368-spi
               - rockchip,rk3399-spi
+              - rockchip,rk3506-spi
               - rockchip,rk3528-spi
               - rockchip,rk3562-spi
               - rockchip,rk3568-spi
-- 
2.47.2


