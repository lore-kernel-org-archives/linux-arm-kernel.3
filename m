Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8237E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 03:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ao8k9gwtGMU7WrnpCl4HFcUPyAik3QHdJeSVA9XU5fY=; b=Ufu6nhQF4hojCbva79AgH64rpa
	T2kS7gTWNKi2tmDEdTlX/jhhWNn0xZiNuVLwEVIxuEAw62ruVbIXSl5XPtkrD1VNMbg4zRkq422iy
	k0wtsApI3S60WdzbB4TR2a6xLeqaD2CQ3jsddutv+nS2JUtYpwZeSh7QCHV6TqyCdq2qztsXcgCWi
	a34KAKUon1ZH7qHUSJZJ0TzSUD0mxkaejtNl43wRSLXLrZaBp+1B31XTExsAq/qolhaP8y9DXDfwA
	q+skD7gD3RwPIXpiNzvGfKG4h3XX0308N64E25MUZAwTrSj+7JE6nbsRyp3xm4tqnnS9ev1j1J6Na
	rZFTqdAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVjYq-0000000Ae8t-1SGi;
	Thu, 09 Jan 2025 03:50:20 +0000
Received: from mail-m127231.xmail.ntesmail.com ([115.236.127.231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVjIV-0000000Ab52-14r4;
	Thu, 09 Jan 2025 03:33:28 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 82c01a9d;
	Thu, 9 Jan 2025 11:28:22 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rfoss@kernel.org,
	vkoul@kernel.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	l.stach@pengutronix.de,
	dmitry.baryshkov@linaro.org,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	algea.cao@rock-chips.com,
	kever.yang@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 13/20] dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
Date: Thu,  9 Jan 2025 11:27:18 +0800
Message-Id: <20250109032725.1102465-14-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250109032725.1102465-1-damon.ding@rock-chips.com>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkpDQ1ZCS09OT0xLSEIZGk5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94491b20ef03a3kunm82c01a9d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PE06PSo5LDITKRQLS1YUQywT
	K0MKCz9VSlVKTEhNSEJISEtIQ01LVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJT0hONwY+
DKIM-Signature: a=rsa-sha256;
	b=DEjkMKD+mN98AV+36oiYZzyre3vIRLBL40Ptaa2Uz/zPUb5tFXEjHYmVg5hxEERni64WRlt0b6k5+1Fkpz5Um8X4TPqJuJ4q+wQiBl9a0nPCKbg0OIXJeltbZIaDaDJxW2pEnWNqIgfdkU/9tdQqsfF0rAFq9K2hoLGQlC5GfXE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=ao8k9gwtGMU7WrnpCl4HFcUPyAik3QHdJeSVA9XU5fY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_193327_488472_ADDE5069 
X-CRM114-Status: UNSURE (   9.54  )
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
---
 .../rockchip/rockchip,analogix-dp.yaml        | 37 ++++++++++++++++---
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index eaf4e67e232e..3cdea9e63522 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -15,6 +15,7 @@ properties:
     enum:
       - rockchip,rk3288-dp
       - rockchip,rk3399-edp
+      - rockchip,rk3588-edp
 
   clocks:
     minItems: 2
@@ -30,12 +31,6 @@ properties:
   power-domains:
     maxItems: 1
 
-  resets:
-    maxItems: 1
-
-  reset-names:
-    const: dp
-
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -55,6 +50,36 @@ required:
 allOf:
   - $ref: /schemas/display/bridge/analogix,dp.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3288-dp
+              - rockchip,rk3399-edp
+    then:
+      properties:
+        resets:
+          maxItems: 1
+        reset-names:
+          const: dp
+
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
+          maxItems: 2
+        reset-names:
+          items:
+            - const: dp
+            - const: apb
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


