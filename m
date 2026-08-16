Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E00DC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 11:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qp+Df4z+2pjjWixA5hPnYlkZ/MmiE6mxJUeWxdVpxVw=; b=vXytUoqX1mxF50hGaiYLzuisUx
	EUcHv3bJfsQlc3ucZiN6delWH/x1F106BD/mhLn3p5ESp0jth/bPd3S3iC9RxCAwpyYxFBW31AoMy
	9nnqNX4dgM9bzktWtC0/xAKd+s5bJG2k80x26vtdFWvTvQcCFqStXCwhLU/EsSGMJb9nAXMvyVIB6
	NUMxEcFmrMSiKaIpXIkYjf1Apv7qc7B8tcXLpp8AROh1qACAlKJnShZCV7KfbyRAR2BwJ1lisUuwm
	gwBWa+Ncuov3qKB3lqqplWIPOKWhCiiRy9KE1l8+oci6PQa8unOGohE0EqEbrKTJSGtlYQY9vaf7H
	X6mB6mzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvZBE-00000004it0-3x5a;
	Sun, 16 Aug 2026 11:37:32 +0000
Received: from mail.zlab.su ([109.73.193.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvZBB-00000004is6-1yhQ;
	Sun, 16 Aug 2026 11:37:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A458DBFF2B;
	Sun, 16 Aug 2026 14:37:12 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786880238; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=qp+Df4z+2pjjWixA5hPnYlkZ/MmiE6mxJUeWxdVpxVw=;
	b=qIp0cxSImv3qd5PHPM877Gq6jtaJOUH7zkrr7XJdh8yJCLTZ5gja1QB71K7V+1TAiRKnHi
	iAKnN+wFGAmGBVER04iYyeaDVEAVzswokIWSYgRM/sNLDw6z/ny6XiePQMPFlDI9fXW1lr
	hCkVvUB9NpXDn343M2h+qYURcbSlR9y10t2m1Tw4/ymko2N6hI++px8+v4j46xy0R+wxd2
	ye+IRzI7jnu4RcOiolUePxt5IriyApPsbVeoDA+6qlVLppL7jKzChtw1JPFXvFRmdBPdOB
	qpI8uoR0YZqsIbk3KL5fS+iMDIgxmQ/66R6LvlMgxzcC5cH+wilIJ0tVpM+tlQ==
From: Vladislav Leonov <vlad@zlab.su>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Simon Glass <sjg@chromium.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>
Subject: [PATCH] dt-bindings: iio: adc: rockchip-saradc: Fix RV1106 compatible
Date: Sun, 16 Aug 2026 14:36:36 +0300
Message-ID: <20260816113636.33635-1-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_043730_041561_E031D730 
X-CRM114-Status: UNSURE (   8.57  )
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

rockchip,rv1106-saradc was folded into the fallback enum together
with rockchip,rk3576-saradc, falling back to rockchip,rk3588-saradc.
The two IP blocks are not equivalent, though: per the RV1106 TRM v0.3,
chapter 20 (SAR-ADC), RV1106 only has 2 channels at 10-bit resolution,
versus 8 channels at 12-bit on RK3588. Documenting it as falling back
to rk3588-saradc allows device trees that would bind against the wrong
channel table and report an incorrect voltage scale.

Remove rockchip,rv1106-saradc from the RK3588 fallback enum and give
it its own standalone compatible entry, matching the dedicated match
table entry added by the driver patch.

Fixes: bdba14f6122c ("dt-bindings: iio: adc: rockchip-saradc: Add RV1106 compatible")
Link: https://lore.kernel.org/all/20260810090826.146758-1-vlad@zlab.su
Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---
 .../devicetree/bindings/iio/adc/rockchip-saradc.yaml         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
index f0551d665916..dc56855527b8 100644
--- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
@@ -22,9 +22,7 @@ properties:
       - const: rockchip,rk3562-saradc
       - const: rockchip,rk3588-saradc
       - items:
-          - enum:
-              - rockchip,rk3576-saradc
-              - rockchip,rv1106-saradc
+          - const: rockchip,rk3576-saradc
           - const: rockchip,rk3588-saradc
       - items:
           - enum:
@@ -35,6 +33,7 @@ properties:
               - rockchip,rv1108-saradc
               - rockchip,rv1126-saradc
           - const: rockchip,rk3399-saradc
+      - const: rockchip,rv1106-saradc
 
   reg:
     maxItems: 1
-- 
2.47.3


