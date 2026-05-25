Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF75CD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 08:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQwBu0YtodeQdy0em6IbiCybI/3ACJDaYdTGPpk8esI=; b=YeH7pFwcuuY3Cs6nMV5y/sgnW9
	lua0mHoXrglng6kMlhHMdyFxJzww+xb7z+4P4RE2NrNPHiSfYa7d+KtZBYujG9dPMyvRdJQa37KAK
	VebZbB+eP9bBFZR1AAb8/A+NoUcBhuGlUBNt7KDJPJSdlqd9+SjI0gRnjUl38E4wndzawRHTVcatn
	mkxxgFtxeiI5oMwsGl0e/5Pe7OyV45Sm/tRXqQZEN7p7qtqndU4Km8MSSVmi/nBU1O4tFz31Fydwd
	sleTPFtbM+tEqoj61N2s5w3GJ3mfeKfjJtI9w8I2Mg031wGpcD06exjCZf5zWP0Gab2WO2gVy1m4m
	3epVGftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQYX-0000000GcnJ-0Moq;
	Mon, 25 May 2026 08:21:01 +0000
Received: from mail-m128174.netease.com ([103.209.128.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQYT-0000000GcjR-2PLV;
	Mon, 25 May 2026 08:20:59 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3fb20c03e;
	Mon, 25 May 2026 16:20:46 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com,
	cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 01/10] dt-bindings: display: rockchip: analogix-dp: Fix hclk as third clock for RK3588
Date: Mon, 25 May 2026 16:20:24 +0800
Message-Id: <20260525082033.117569-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260525082033.117569-1-damon.ding@rock-chips.com>
References: <20260525082033.117569-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e5e38df9203a3kunmb64b982110262f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSUIfVhpPSxhKTktOTU9ISlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=kXMWZuthBp4IhfKD6NwB04lvkb39Ogw5tkdcx+aarzTn5EJRVqAbYDv45bNRaLHiTxvUlCxWsZR3GQq07SDNsJLRlfbTL43Q6PrT0bfCeW6VBWT7vxI0Y4LLXzeEeKrFdcHdk8kQFM7pilY5N8h2Acz6plynxXAMt08WuHDTfa0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=dQwBu0YtodeQdy0em6IbiCybI/3ACJDaYdTGPpk8esI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_012057_876951_88CCCAA1 
X-CRM114-Status: UNSURE (   9.60  )
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

RK3588 eDP controller requires HCLK_VO1 to access the VO1 GRF
registers and enable the video datapath.

Previously, the clock was enabled implicitly via the 'rockchip,vo-grf'
phandle reference, which allowed the eDP to work without explicitly
managing the hclk_vo1 clock. However, this is not safe or explicit.

To make the clock dependency explicit, enforce per-SoC clock-names
requirements:
 - RK3288: 2 clocks (dp, pclk)
 - RK3399: 3 clocks (dp, pclk, grf)
 - RK3588: 3 clocks (dp, pclk, hclk)

Do not reuse the 'grf' clock name for RK3588 because it represents
a different clock with distinct control logic:
- The 'grf' clock is only for GRF register access and is toggled
  dynamically during register access.
- The 'hclk' clock controls both GRF access and video datapath
  gating, and must remain enabled during probe.

Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add support for RK3588")
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Modify the commit msg.

Changes in v5:
- Enforce the correct third clock name on a per-compatible basis.
- Modify the commit msg simultaneously.

Changes in v6:
- Expand more detail commit msg about using hclk instead of grf clock.

Changes in v7:
- List all valid clock names at the top level, and constrain the clock
  count for each platform with minItems/maxItems in allOf.
---
 .../rockchip/rockchip,analogix-dp.yaml        | 34 ++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index d99b23b88cc5..7fe7655c1f37 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -26,7 +26,9 @@ properties:
     items:
       - const: dp
       - const: pclk
-      - const: grf
+      - enum:
+        - grf
+        - hclk
 
   power-domains:
     maxItems: 1
@@ -60,6 +62,32 @@ required:
 allOf:
   - $ref: /schemas/display/bridge/analogix,dp.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3288-dp
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3399-edp
+    then:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+
   - if:
       properties:
         compatible:
@@ -68,6 +96,10 @@ allOf:
               - rockchip,rk3588-edp
     then:
       properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
         resets:
           minItems: 2
         reset-names:
-- 
2.34.1


