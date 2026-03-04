Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88E4EFCE4E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 21:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5j250mpyBvwU2YYKbySuOLaQgg3xM9Uuw7N1Vu/2VEc=; b=ubibqrtwvlR7WvWUTZHbkeN8Go
	SD0/0hbh5VdMs2sOWQAtKJx0D0g3uQJAF3BWvjd9k0oMLxWXWQUCwjWG+MOvdJ6Eu+LgtW1+hsUn/
	QpSON+/ohLvvYggH9WdOXLB8i+lFs5XfBm0MbIEbNi34dauU4TqxXOu73Us+sGcv2PnWEYHntvKtP
	3YLC/6XSt/OeBXHQwmG2UPxSkQBFG9BnWWBKRJN+Xv68tWGLU0z8Ue76bRYxmbq22P37dRzD0CmhK
	MG+f6wEw4er7sSDwjgPJ2kcnR5RubIe0VIwp2jKgIg5g/OAM9/D14mE2u6iWetLI0CpfjcmUuOAYD
	4TxOvSFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxtLX-00000000U6t-3gjv;
	Wed, 04 Mar 2026 21:01:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxtLS-00000000U3D-402f;
	Wed, 04 Mar 2026 21:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772658083;
	bh=a/HGKKp36P4xwIgVOjxXKaE5Sm+HcFjvPXuxNlLisNk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kXMJaybAEGK07Gwif/cj2yrNWjboBQUlWFjrANuL0U+WCHbbaka75eAJCcJe3keeE
	 0IBEZPUaecdjQZIYxPqGmNXu+2dinO519xQyrz89pMHVr8MbFUh8s8l4N9L2i8EvC3
	 wjhwG2x5Mf0MOmzydHAvbj9VJ2PU05g6Kn8aW4sYSy6bWJveJrSBhvr6jQVPMfxYv4
	 +MvBsh961jLAW4hTI1E+dV7KzDK5+g/KxTOKcK7+9kQW0EY9/USv5HASeqT5xu2aFF
	 5sE4faByX/1jycDkpaNqTafGhTkf+laH3xDMD/yvScINK6vKInXQEenPdxYhsNfiI8
	 oOveZ5KKhKaIw==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A683F17E108B;
	Wed,  4 Mar 2026 22:01:23 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 04 Mar 2026 23:00:41 +0200
Subject: [PATCH v5 2/4] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-vdec-reg-order-rk3576-v5-2-7006fad42c3a@collabora.com>
References: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
In-Reply-To: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
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
 linux-media@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_130127_146009_2CB3F1AB 
X-CRM114-Status: GOOD (  12.83  )
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

With the introduction of the RK3588 SoC, and RK3576 afterwards, three
register blocks have been provided for the video decoder unit instead of
just one, which are further referenced in vendor's datasheet by 'link
table', 'function' and 'cache'.  The former is present at the top of the
listing, starting at video decoder unit base address.

However, while documenting RK3588, the binding broke the convention
expecting the unit address to indicate the start of the primary register
range, i.e. the 'function' block got listed before the 'link' one.

Since the binding changes have been already released and a fix would
bring up an ABI break, mark the current 'reg-names' ordering as
deprecated and introduce an alternative 'link,function,cache' listing
which follows the address-based ordering according to the TRM.

Additionally, drop the 'reg' description items as the order is not fixed
anymore, while the information they offer is not very relevant anyway.

It's worth noting there are currently no (known) users impacted by these
binding changes, since the video decoder support for the aforementioned
SoCs in mainline driver and devicetrees hasn't been released yet - it
landed in v7.0-rc1 while all DTS updates resulting from this will be
handled before v7.0 is out.

Fixes: c6ffb7e1fb90 ("media: dt-bindings: rockchip: Document RK3588 Video Decoder bindings")
Fixes: a5c4a6526476 ("media: dt-bindings: rockchip: Add RK3576 Video Decoder bindings")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../devicetree/bindings/media/rockchip,vdec.yaml     | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index dc4ebb50b316..42022401d0ff 100644
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


