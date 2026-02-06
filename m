Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBC1ECD9AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 01:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNvlWzT8mWrGtEkS8XZPXPccT2INKC10nV+IIQWDjAw=; b=eXpaF2urhS6iSYFIBp9CXmihZj
	IaZIBxM2j3lVzwQy/G0xtOpQDzwyY758djL9h5ZMnvtsTKSKc9jm99Q/299/ZZji76j6m4ITeFk9p
	bDkCfpO5dz4n3hlVyrGrBR7FIWuh3SiOZRNx99yY2ITEMfFT6HKU350Jxk5oLu40OPCWXySzPZ6Fo
	r7nMsfbiVYqR1df2k0fhdM36sci/Yx1BvYhr9G/kID+xdWl5czQ6/W2H1tERBpK0aEOgTp+qVJcLm
	7i4Cqc6pcYYlHUYzlC18hjoBekVF6zF4P31g97WIac0F2AiMw5CytmNCf4TLeRCtQYKDfkFIjW5BF
	rDr86anw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voAI4-0000000AgyX-2fVQ;
	Fri, 06 Feb 2026 01:05:44 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voAHu-0000000Ago5-1rmL;
	Fri, 06 Feb 2026 01:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=BN
	vlWzT8mWrGtEkS8XZPXPccT2INKC10nV+IIQWDjAw=; b=jPfqKd66nS05LwIXNc
	ZGsTDZs5+Fa4+6jaGLLpSYILWhTT9pGt53Z5dwZZbEieUdmqMXe1EoWJ7P+egymd
	cLiPa9/VQGhKiYv9UHHGsvfp15nWzKm4lAaPDDVUyp6GnyNf+/ByzlQNDqo6JboE
	LOb7KptdpUrDjMWkuGSRiziGk=
Received: from ProDesk-480.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD3_+0XPoVpQ5VfQQ--.20291S3;
	Fri, 06 Feb 2026 09:04:28 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: alchark@gmail.com,
	andrzej.hajda@intel.com,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	airlied@gmail.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	nicolas.frattaroli@collabora.com,
	robh@kernel.org,
	rfoss@kernel.org,
	hjc@rock-chips.com,
	sebastian.reichel@collabora.com,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 1/5] dt-bindings: display: rockchip: Add rk3576 DisplayPort
Date: Fri,  6 Feb 2026 09:04:11 +0800
Message-ID: <20260206010421.443605-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206010421.443605-1-andyshrk@163.com>
References: <20260206010421.443605-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgD3_+0XPoVpQ5VfQQ--.20291S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr4UWr43Jw4xKw1rKr1ftFb_yoW8CF18pa
	9xC3WDX3yIgry7W3yDtr1kCrs5K3WkA3yjyr17tw17twsxKFWFg3Wagwn8Jw43JF17Aay3
	CF1j9ryxJw42vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jOo7NUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxR1SsGmFPh0NvgAA3G
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_170534_851268_49003AFA 
X-CRM114-Status: UNSURE (   9.33  )
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

From: Andy Yan <andy.yan@rock-chips.com>

The DisplayPort found on RK3576 is very similar to that of RK3588,
but work in dual pixel mode. And itself does not depend on the I2S
clock or the SPDIF clock when transmit audio.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

---

Changes in v3:
- Fix compatible order

Changes in v2:
- Remove unnecessary maxItems

 .../display/rockchip/rockchip,dw-dp.yaml      | 27 ++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
index 6345f0132d43..2b0d9e23e943 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
@@ -27,12 +27,10 @@ description: |
   * Pixel clock up to 594MHz
   * I2S, SPDIF audio interface
 
-allOf:
-  - $ref: /schemas/sound/dai-common.yaml#
-
 properties:
   compatible:
     enum:
+      - rockchip,rk3576-dp
       - rockchip,rk3588-dp
 
   reg:
@@ -42,6 +40,7 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 3
     items:
       - description: Peripheral/APB bus clock
       - description: DisplayPort AUX clock
@@ -50,6 +49,7 @@ properties:
       - description: SPDIF interfce clock
 
   clock-names:
+    minItems: 3
     items:
       - const: apb
       - const: aux
@@ -95,6 +95,27 @@ required:
   - ports
   - resets
 
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3588-dp
+    then:
+      properties:
+        clocks:
+          minItems: 5
+        clock-names:
+          minItems: 5
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.0


