Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC631FD374D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 12:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqkhyIG8YSc1/MWvhsPMUBdOyqqhujHZIwamGJKys3k=; b=Dj9YPzBR3VuRaOeST1/rhOot7M
	ptv5XAQOK61YuMaIT2YvN8P51uaLARUXbpN7dj3AbxymF2wiQb0Gq7yCRxmBPXU8Ien1RJmf1PKrL
	/ae4I7w2MYUrFyojP9xJDRce16HPRsyPJC9lOJ8MOQeFyxK7XkeoU0Ky0dnwrxe8u/7kfGlidu91t
	2Mud4tR/E47wJlkaVYPNJz5r1rpyASdFY8QUVOoezTPIJRc6bS2quk+bcZKiWhWceJFZnlb9Vinqf
	x/rubfIw+9mMOSQ3Rs0apxS8a87YTUIbHVO6FIMjju8n5iFnxPVjbOSYC+F/Mrl0El380r4rggFs2
	JDFFZ7Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDs6-00000003yr0-2gm0;
	Wed, 25 Feb 2026 12:20:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDs4-00000003ypE-0Rlb;
	Wed, 25 Feb 2026 12:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772022001;
	bh=5vb/63Vg1zh5nED3D61MNyCtaS3psPO98Y/6tkPDleU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ikhbhifTL9C/xEAfLs7iQbQPAdqG6wRoodYW1tBAHNtAoWWBL1JfXJJappgxqrsaM
	 Q2qfANnTW+rkaTH/LYWzl0+yT8R9We9IPPEigv97tmyWLYlMsbaaaZJ6QKetXMUNee
	 dWeWLbQsgV9BQdGZwnLXRvnYj2CVChAejRXV4/midgxe8f7v6AN1nr564flS9U63Sw
	 66GeMZYPFVliyqr43WN23NIe1rEY8cYiH8fwm9wTTLfUiZgdo6a8dQPyNqPpoZAlcL
	 +CXcxBxfOFjTX/ePdfPwnLMdoc9a9acuIjj64dSnkK3//jYUZVGOw4yLZnVoMF0UmA
	 ZmdAzOM3y/kcA==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E3DD17E04C4;
	Wed, 25 Feb 2026 13:20:01 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 25 Feb 2026 14:19:57 +0200
Subject: [PATCH v3 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-vdec-reg-order-rk3576-v3-1-5a2ebe1b11a8@collabora.com>
References: <20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com>
In-Reply-To: <20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com>
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
X-CRM114-CacheID: sfid-20260225_042004_294309_35D43FE8 
X-CRM114-Status: GOOD (  11.39  )
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

With the introduction of the RK3588 SoC, and RK3576 afterwards, the
'link' and 'cache' register blocks have been provided for the video
decoder unit in addition to the existing 'function' one, which now shows
up in between them (from address-based ordering point of view).

However, the binding does not properly describe this hardware layout, as
the new blocks are listed after the old one.  Therefore it breaks the
convention expecting the unit address to indicate the first register
range.

Since the binding changes have been already released and a fix would
bring up an ABI break, mark the current 'reg-names' listing as
deprecated and introduce an alternative 'link,function,cache' one.

Additionally, drop the 'reg' description items as the order is not fixed
anymore, while the information they offer is not very relevant anyway.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../devicetree/bindings/media/rockchip,vdec.yaml      | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 809fda45b3bd..3f6072e8baa5 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -28,16 +28,21 @@ properties:
 
   reg:
     minItems: 1
-    items:
-      - description: The function configuration registers base
-      - description: The link table configuration registers base
-      - description: The cache configuration registers base
+    maxItems: 3
 
   reg-names:
-    items:
+    oneOf:
       - const: function
-      - const: link
-      - const: cache
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


