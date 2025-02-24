Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BE8C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 08:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxBez8DZIwrWCO8EJmDubFkC0E69kmKK5aFcCHqH3DY=; b=FU7m3E9ubz5MTqxuOj6yQ07ux4
	Z49C/1o9vxMiWSf/kKpI/opI1lGC0FKeSfi8tLa6xecB7/9WlK17wSjHaQ61L1XphkPbwbRsHWdSN
	vT5huRPit133JZ54EF7b/OV5srzHdPbfsLB41pojRXXBMiXu8Cb9fM5rSJMGzM52XB295YsbpJNmK
	m5zKyqns3JqieHz6onybOmMsxdqZlofsB9zVZV6gMhL7ftG7lpUqcVTO2ZKXUGxHJG+WR1eotaWTY
	sT9pKvaGEJgPLmFnWe1bMw4X4WcCEXL3/RZyBNkPaoW2hQ3HkZI1hPU1QzI8x0uLsdMdqGAdROM8i
	wDJ54LCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTuH-0000000Ci3B-3eJW;
	Mon, 24 Feb 2025 08:33:41 +0000
Received: from mail-m32117.qiye.163.com ([220.197.32.117])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTbb-0000000CeD3-2dGQ;
	Mon, 24 Feb 2025 08:14:24 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id bfd2882b;
	Mon, 24 Feb 2025 16:14:18 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	dmitry.baryshkov@linaro.org,
	dianders@chromium.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	boris.brezillon@collabora.com,
	l.stach@pengutronix.de,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 11/15] dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
Date: Mon, 24 Feb 2025 16:13:21 +0800
Message-Id: <20250224081325.96724-12-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224081325.96724-1-damon.ding@rock-chips.com>
References: <20250224081325.96724-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ05CHlYfSUMfHR1LS0kdGEhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a95370571bd03a3kunmbfd2882b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mi46Mxw*CzIRLxMpNj4ZESwN
	MAMwCQ1VSlVKTE9LSENPQ01LTkhMVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSE1JNwY+
DKIM-Signature: a=rsa-sha256;
	b=MRCv7FT1aJZkzNoY9zwVPmbn65wZ3DVTOHpDYirRehxNUfeLGi8nhiV+Z1NNV0DLFK00Wb/O2i0U4DtqhAwA027Eb5An5nBZvu6EqCQG50NdWJoa7+jqDuCn043SMlHBJMOlpV1zPDd6GCCCIuPMi2+J22jYpQ8ZzOtS5L+bfFM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=qxBez8DZIwrWCO8EJmDubFkC0E69kmKK5aFcCHqH3DY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_001423_841477_DFDE9927 
X-CRM114-Status: GOOD (  10.52  )
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

Compared with RK3288/RK3399, the HBR2 link rate support is the main
improvement of RK3588 eDP TX controller, and there are also two
independent eDP display interfaces on RK3588 Soc.

The newly added 'apb' reset is to ensure the APB bus of eDP controller
works well on the RK3588 SoC.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Add the main defferences of the RK3588 eDP and the previous versions
  in commit message

Changes in v3:
- Expand the property clock-names, resets and reset-names

Changes in v4:
- Remove 'spdif' clock which added in v3
- Add the comment of newly added 'apb' reset in commit message

Changes in v5:
- Put the differences between RK3288/RK3399 and RK3588 into 'allOf'

Changes in v6:
- Keep the widest constraints and add only RK3588 related constraints
  into 'allOf'

Changes in v7:
- Fix the errors related to 'reset-names'
- Remove unnecessary 'maxItems' under 'reset-names'
---
 .../rockchip/rockchip,analogix-dp.yaml        | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index eaf4e67e232e..d99b23b88cc5 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -15,6 +15,7 @@ properties:
     enum:
       - rockchip,rk3288-dp
       - rockchip,rk3399-edp
+      - rockchip,rk3588-edp
 
   clocks:
     minItems: 2
@@ -31,10 +32,14 @@ properties:
     maxItems: 1
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   reset-names:
-    const: dp
+    minItems: 1
+    items:
+      - const: dp
+      - const: apb
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -55,6 +60,19 @@ required:
 allOf:
   - $ref: /schemas/display/bridge/analogix,dp.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3588-edp
+    then:
+      properties:
+        resets:
+          minItems: 2
+        reset-names:
+          minItems: 2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


