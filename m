Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D42606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z6Ay5Sqv;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=b86PGyyn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9sahrKizZzwz9gGVNC8YVWNEiDeaCi+DVsOpzdhg+so=; b=Z6Ay5Sqv9ewN8q
	tyfbhhs3ktyvXyhrXoXgZWgGLKhm9xscH4zJ2g3YpgjcpkCDda9JM3g94QR6JpwWjGsxdruC4a3yc
	O102Sex9JPTINy/pL4F+kygNS2TCODDO1Cc19tFUIlG1RqcXYdXRBcuQIqAE9SgdIkweEoF456eU6
	k+XvfEGJBKUqGa2tZyPiHavrqRIrOGmzsXGI7S7jViHYChGFNkMeJou45NEHylaqa5iw1B1wEQC6+
	sAuOnsjUsB1M/JDx4k6weLBnabKkaJq3kfpWxWX2qL2g1mqkMXlM3Qh9D+SPlH+qfV0VKeBpR8tUI
	s9YsMycBAPdam5b3dA2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgQl-0000000AvFi-2Sn5;
	Fri, 30 Oct 2026 06:49:39 +0000
Received: from mail-m6021.netease.com ([210.79.60.21])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgQf-0000000AvCl-17qd;
	Fri, 30 Oct 2026 06:49:36 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52e796915;
	Fri, 30 Oct 2026 14:49:27 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 1/6] dt-bindings: display: rockchip: analogix-dp: Add support for RK3568
Date: Fri, 30 Oct 2026 14:49:00 +0800
Message-Id: <20261030064905.2248999-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030064905.2248999-1-damon.ding@rock-chips.com>
References: <20261030064905.2248999-1-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa18b920f4503a8kunme14bef99793df
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGUJOSlYdSBhOGU9OQ0
	pJHxpWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSEpKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=b86PGyynkEQltAc3JvkAN9NzXPO4oqeWRkwkQlEFkLjBGbQU3sjxYcHiRUDcLYpZvXjEG3k3A7zJwdhtfstX0mVHWtA/G9lxFSIGZdLqKpzF2OOAKjpnKbC819RBjkqw0YOoxC+le2BUMiZEF4U67vhzl717t/9U2JDJGwixu2A=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=9sahrKizZzwz9gGVNC8YVWNEiDeaCi+DVsOpzdhg+so=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_234933_806118_676D45F9 
X-CRM114-Status: GOOD (  10.17  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the "rockchip,rk3568-edp" compatible.  Like RK3576/RK3588,
the RK3568 eDP controller has the dp/pclk/hclk clocks and dp/apb
resets, but unlike them it does not use GRF registers, so make the
"rockchip,grf" property conditional on the SoC.

Also document the avdd-0v9 and avdd-1v8 supplies, which are needed by
the RK3568 eDP controller.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Restrict the avdd-0v9 and avdd-1v8 supplies to the RK3568 compatible.
---
 .../rockchip/rockchip,analogix-dp.yaml        | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index 39dafe75a680..05b582a864f4 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -15,6 +15,7 @@ properties:
     enum:
       - rockchip,rk3288-dp
       - rockchip,rk3399-edp
+      - rockchip,rk3568-edp
       - rockchip,rk3576-edp
       - rockchip,rk3588-edp
 
@@ -47,6 +48,16 @@ properties:
       - const: dp
       - const: apb
 
+  avdd-0v9-supply:
+    description:
+      A 0.9V supply that powers up the SoC internal circuitry. The actual
+      supply source varies between different boards.
+
+  avdd-1v8-supply:
+    description:
+      A 1.8V supply that powers up the SoC internal circuitry. The actual
+      supply source varies between different boards.
+
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -61,11 +72,25 @@ required:
   - clock-names
   - resets
   - reset-names
-  - rockchip,grf
 
 allOf:
   - $ref: /schemas/display/bridge/analogix,dp.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-edp
+    then:
+      properties:
+        rockchip,grf: false
+    else:
+      properties:
+        avdd-0v9-supply: false
+        avdd-1v8-supply: false
+      required:
+        - rockchip,grf
+
   - if:
       properties:
         compatible:
@@ -100,6 +125,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3568-edp
               - rockchip,rk3576-edp
               - rockchip,rk3588-edp
     then:
-- 
2.34.1


