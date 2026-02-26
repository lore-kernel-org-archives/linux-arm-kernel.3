Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC68FC592B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQwtTkjvjdJTS5hDLTybZ6Vcwu3SaVrGEEvI6hMwRc8=; b=zR1ChC83ngGHtYTNxRbIw5468Q
	owmxtqEsxVVnsij5Ef26JNjZ2NWenklN/0VQFYdYuryCYcl6YXh1CsE1eIakWrYaY1C8plyOauzRy
	a7Ul2q0uHcaQvo00I65ouMm9XSyM8ZjPDjfNvmbMZaqfvpN2N1LX+lh13GSjaQ2asKqvW9qfI/Nuo
	9+uyRvon5P1wNi7Ko3iB0l03VHEpAD9ixBPDzSzYquoS4sQr9fkqcJKazRinqSxHa1h+gs97Zxn6o
	5DWpBBKT/IHQ3dFyc7PwGUiUciKOnZ3x5OvKnHNJfiVSXew37LQtP+KW0OgbkfIDxzMAvCw0Il6ik
	p+uy8ULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYtd-00000005x4k-3Ttf;
	Thu, 26 Feb 2026 10:47:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYtb-00000005x1x-1Jdr;
	Thu, 26 Feb 2026 10:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772102820;
	bh=bYkpLYhhwj5B4o0/14vepvOL5dD82IQeKBivzobWYYA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iqxSzYipJgD9Hk27esWpkrwPH+zXqY0hF2hA5rLyyps9BIH/KzwmGxtBb0VrGQmMg
	 288eM6vpq5B6RFzUeJ5Zx0kxKdsWq957Rr7Xg68mVQAKtSAgjn8+UKfsV/+E7/5Uwl
	 BZwcqsjMfnGeVed+FEpxrmKnl3vLIMsA3WztcRI7382FOSHc3HIa4KRoOBdXhtfqS2
	 K4qFmDM7WpasHe0VO3ffZv94zsA0b7dI59rHZ12iR7H+ekI3S31peFo9l9shv4qBM8
	 /G11mz+tmyPn5lWkWKI/+Xs/ZfXtAmL3l8dUKoNdpk07dhpNIVyGrDFv5+VOydopbt
	 Y0//Qd3zDJeIA==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A65BE17E095E;
	Thu, 26 Feb 2026 11:47:00 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 26 Feb 2026 12:46:53 +0200
Subject: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
In-Reply-To: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_024703_513082_83DBCD9A 
X-CRM114-Status: GOOD (  12.09  )
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

With the introduction of the RK3588 SoC, and RK3576 afterwards, two more
register blocks have been provided for the video decoder unit.

However, the binding does not properly describe the new hardware layout,
as it breaks the convention expecting the unit address to indicate the
start of the first register range, i.e. 'function' block is listed
before 'link' instead of the opposite.

Since the binding changes have been already released and a fix would
bring up an ABI break, mark the current 'reg-names' ordering as
deprecated and introduce an alternative 'link,function,cache' listing
which follows the address-based ordering according to the TRM.

Additionally, drop the 'reg' description items as the order is not fixed
anymore, while the information they offer is not very relevant anyway.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../devicetree/bindings/media/rockchip,vdec.yaml     | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 809fda45b3bd..c513b68d2c72 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -28,16 +28,20 @@ properties:
 
   reg:
     minItems: 1
-    items:
-      - description: The function configuration registers base
-      - description: The link table configuration registers base
-      - description: The cache configuration registers base
+    maxItems: 3
 
   reg-names:
-    items:
-      - const: function
-      - const: link
-      - const: cache
+    oneOf:
+      - items:
+          - const: link
+          - const: function
+          - const: cache
+      - items:
+          - const: function
+          - const: link
+          - const: cache
+        deprecated: true
+        description: Use link,function,cache block order instead.
 
   interrupts:
     maxItems: 1

-- 
2.52.0


