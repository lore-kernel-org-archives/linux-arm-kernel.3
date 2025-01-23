Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AC8C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 10:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vvacs6TTd8+7VxkiJviBM48r26FUm4A3QUyHkwS0LAA=; b=H6HEXKT3nzvm9n/iO5O238nTAQ
	IixnIePW1vYeqKppcI8v3Nsp3BHghVJpizNBJeVpHH3hgzGp0KMFpFhriVZ1wgrMzSAA1XNAq31Lb
	YsJeU/9MZY640kkPzig+JJVhW1RRiRsXNEI6cS0JyFCqXub0tdrDX6VRs/GcupWx7emTfu1rQvgVF
	TQxdAfDrNZpsC4v3smMdfpOkO0WV6bRlaLzkfzkjPm0vOySa9a/dtAki6s0G2S+/MPZA2kGfN+4h5
	aZIRnHyLGtMUv0yyEUk3CBXdvhVTSZqlXvLIT57vEQlKVi5tP8gfJ1m0t0IULp4Do7rheIY1u4h8I
	HVxcnwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tauM0-0000000CBlQ-1asN;
	Thu, 23 Jan 2025 10:22:28 +0000
Received: from mail-m1973184.qiye.163.com ([220.197.31.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tau8K-0000000C9fg-285v;
	Thu, 23 Jan 2025 10:08:21 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 9818ae88;
	Thu, 23 Jan 2025 18:08:16 +0800 (GMT+08:00)
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
Subject: [PATCH v6 09/14] dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
Date: Thu, 23 Jan 2025 18:07:42 +0800
Message-Id: <20250123100747.1841357-10-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250123100747.1841357-1-damon.ding@rock-chips.com>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkMfH1ZITUJLTxkdSkhJGU9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9492a2484703a3kunm9818ae88
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nz46Hww6TzILDixMDi9IFB4M
	CzpPFE9VSlVKTEhMTUlNQ0JDSUlKVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSUlCNwY+
DKIM-Signature: a=rsa-sha256;
	b=HbNgYNwVKSz4uYAoKk916Ub9oKRhr4cNCDblGk8bQ8xdJPJoyg5bNMI5mXwgJk+nLx6cQdKmAfIZU86dqme54mFhyXnEOw8SuFt9QnXd5Zf95y8Yh5/z9pQs7ZER/GTV3LlEbU8vlglrhwHoQZXf8S3KvWfrADqazwWB/8iavLk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Vvacs6TTd8+7VxkiJviBM48r26FUm4A3QUyHkwS0LAA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_020820_706305_33CB59D4 
X-CRM114-Status: GOOD (  10.14  )
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
---
 .../rockchip/rockchip,analogix-dp.yaml        | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index eaf4e67e232e..baee021314e7 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -15,6 +15,7 @@ properties:
     enum:
       - rockchip,rk3288-dp
       - rockchip,rk3399-edp
+      - rockchip,rk3588-edp
 
   clocks:
     minItems: 2
@@ -31,9 +32,12 @@ properties:
     maxItems: 1
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   reset-names:
+    minItems: 1
+    maxItems: 2
     const: dp
 
   rockchip,grf:
@@ -55,6 +59,22 @@ required:
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


