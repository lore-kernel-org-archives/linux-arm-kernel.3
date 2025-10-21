Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1C4CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 22:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EIppjaamqtI6FQ1cWOda/fD6vDYDpKq8nIuZLe1f+YA=; b=Jc3/khg/KYjqbRhPSozDfvjQ91
	11tUk+hC9gcXrcgJTO66EvlCksTKru8oes6WTUgYnhLPujRZJUsCdKZQWlkD/xDaKZZo0hQYy0QdT
	TogPF+H7qG4R42nXCj22WPbgvWWvFxSnGKPufINgX6UZKsWFekFHYHchlfY92QFTVkW+uZMFYmsGB
	2buPmO+poq7yobGUW5bEbhSPxQRJDJv120svXMmhEp9gOw6hSJVyDK5ZUGoldydYoUVPCVG6qUqNc
	8ZoNuKhf+LQHf2qfltw0k3yRb7jgS61GI+UA1Qc6amlnFdRagV81f/cqegaMJDlHXKjGVDkvz5K6R
	8teVEzfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBKsx-00000000nr8-1Hbk;
	Tue, 21 Oct 2025 22:31:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBKsu-00000000nqQ-42oi;
	Tue, 21 Oct 2025 22:31:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=EIppjaamqtI6FQ1cWOda/fD6vDYDpKq8nIuZLe1f+YA=; b=axApdpjVP+mz5kUBmS/Q99032+
	qeJu4WZAhGej7RAJwVfV9ArlixJLfnmSzHP3u4Tf2FlafbmounvmVPIDGFRcMk4FxPfAZLz8AnIAC
	t4HJqyO8em+7upOfjmMNYYGCX+eAOb5PtVnZ7/UWqpQyWBunVK4OcBpWkPnhCtpYYJaWXxAFCidPP
	FB9VH/XPrtiD+5916PEIUKYnIgzBOufvObTqlTc2ziPwiYIcwJUI9dt3iUHMNI9vqxxno9YjcWHHm
	h8xO0DE55d846bJQyCVeWZsebL66jt6r+MMGLfnCXRtwuQ55K95hsYJJRPoTlgMQuxBcIdTG9GZ7h
	QtASuugA==;
Received: from i53875b19.versanet.de ([83.135.91.25] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vBKsp-0006i2-ST; Wed, 22 Oct 2025 00:31:11 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: iio: adc: Add rockchip,rk3506-saradc variant
Date: Wed, 22 Oct 2025 00:31:07 +0200
Message-ID: <20251021223107.193453-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_153116_998370_AEA1520E 
X-CRM114-Status: GOOD (  10.15  )
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

The SARADC of the RK3506 is similar to the one found in the RK3528
in terms of number of channels and the other implementation details.

So add a variant compatible for it, that reflects this fact.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
index f776041fd08f..6769d679c907 100644
--- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
@@ -16,6 +16,9 @@ properties:
       - const: rockchip,rk3066-tsadc
       - const: rockchip,rk3399-saradc
       - const: rockchip,rk3528-saradc
+      - items:
+          - const: rockchip,rk3506-saradc
+          - const: rockchip,rk3528-saradc
       - const: rockchip,rk3562-saradc
       - const: rockchip,rk3588-saradc
       - items:
-- 
2.47.2


