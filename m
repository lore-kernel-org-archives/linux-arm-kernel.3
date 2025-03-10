Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72516C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/jgEld0YWuyA8ypQD6vc8cECMQ47VIivyHQrVFzLW8=; b=nk907gOyrslQdAvztH4WNNzTlN
	g7A5C/CQzuEvN03jPHuTLf2oyR2QKNx+Ox7puNXIdLFm0aftGfbafZc2BQhbJ8gFokuZYTqAt1rVD
	mLi3QtPRAo6bSatQSfi/+B/xat2GQGClnAZ1rjJf7T9ytlXLMnOWFKDuLaHSIM0E8GI9D4H0FxAC0
	EdkmpKHW6drSFYymrM7ACPMydX9wd150E9C2R1ANTrozUHL5kWD5lKZ3EuBYsAkvTSjlWW7MH0KK0
	Mw0V3UytEAZxpsL5FwOzdtt35NL0JMdIbZQ9RnubhQQxeBkpB5D/JDPS6fhzZOP1clE6kH53JjMgQ
	ma7hFoJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tras0-00000002MIT-1LN6;
	Mon, 10 Mar 2025 11:00:28 +0000
Received: from mail-m3293.qiye.163.com ([220.197.32.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1traaW-00000002HoI-3ZbS;
	Mon, 10 Mar 2025 10:42:26 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id dc188291;
	Mon, 10 Mar 2025 18:42:19 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com,
	hjc@rock-chips.com,
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
Subject: [PATCH v8 09/13] dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
Date: Mon, 10 Mar 2025 18:41:10 +0800
Message-Id: <20250310104114.2608063-10-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310104114.2608063-1-damon.ding@rock-chips.com>
References: <20250310104114.2608063-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkwYTFYdSUgfTUsZTB8YTUlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0
	NVSktLVUpCWQY+
X-HM-Tid: 0a957fa5fdee03a3kunmdc188291
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MFE6DTo6ETJLIiMrFTkuPQhJ
	NQ0KCUxVSlVKTE9KTUtISE9KQ0tPVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJT0pJNwY+
DKIM-Signature: a=rsa-sha256;
	b=NNscdC8xikclEGPAktF8uBbNr11WnR49azaZjkIjKxnQvF12Dr7n5mTfCjVOPTe6atmJgNzd5G386uxsakqDx1RMVMPjibDiSEQGOiAe6VnUxMpEZ5OlZwlRXhtkWQ7hI8sif7nBpcrsF91EFNhZ7Atn/Vy/gJsnf2nnW3D0VKM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=v/jgEld0YWuyA8ypQD6vc8cECMQ47VIivyHQrVFzLW8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_034225_061054_0516C167 
X-CRM114-Status: GOOD (  11.22  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


