Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5227C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 07:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uy3Up9+VL/2AsL+aZ5eo5DfBzY9pu8UsnO2LpuewdHE=; b=vR/BmFjlcXChxLlRjqqGDk5n6P
	xE3HahPBUr0QV8nqu4mjIBp4piynAykSo3X8BmoirpQrTVCma1dMRgo9UIIh2iOZI7B4mKgc8UvsH
	wDMpgunxdqrWFO0fWUEH7RUvhhG1VV5vdHYgeqHG7nTTIt3vZTHxybqWbFCCq+VG8x6t5+yrAM2Qj
	KeA0bp/EWO0YDUIFUuizFlBUhhPy8kV+rhpNyKH6Q0USfwWI4UbZm62myfKHOoOvIXpMZd8i30ENk
	Y+wZgogL4Kh3Kx59ffWSJmx/zzQ23ULOKJeculO95zuUXowLFezXUb8DWVD54b8AS3o+ucryIOyRc
	YlSwxHLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78Px-00000006BKY-3prh;
	Tue, 22 Apr 2025 07:51:45 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77hA-000000063ym-1X94;
	Tue, 22 Apr 2025 07:05:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=uy3Up
	9+VL/2AsL+aZ5eo5DfBzY9pu8UsnO2LpuewdHE=; b=Jex7O9ogF3CNCOu8eviey
	be0347Ae1rSkyFNyg+SkQTgOQnrseUN5fHeSxKQZa5rd/K/ACBnySoT8l6jqBzyM
	ARF9N97ZGnA/mLfuKsZHAkdN2r7+awFFz/Bagfm4JA/KIMp0bk9Tjmv6XxZ/RXyw
	T1H3/4rdixSoEpBhtINvmw=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCHACaZPwdowMxzBg--.7474S4;
	Tue, 22 Apr 2025 15:05:04 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	knaerzche@gmail.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/7] dt-bindings: display: rockchip,inno-hdmi: Document GRF for RK3036 HDMI
Date: Tue, 22 Apr 2025 15:04:41 +0800
Message-ID: <20250422070455.432666-3-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422070455.432666-1-andyshrk@163.com>
References: <20250422070455.432666-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHACaZPwdowMxzBg--.7474S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZryxWw47XF1UAFyxtFyrZwb_yoW8XF17pa
	sxC3srWFyxGFy3X34ktr18CrWYgF97Aw45JFW7Xr17Kr42gan5Ka1agwn8ZF4UAFs7ZayS
	9a17CFy5Aw4Ivr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07je-eOUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBE3XmgHPY1Z9wABsY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_000528_779686_573F5DFF 
X-CRM114-Status: UNSURE (   8.18  )
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

HDMI on RK3036 use GRF control the HSYNC/VSYNC polarity, but this part
is missing when it first landing upstream.

Document that it is mandatory for RK3036 HDMI.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v2)

Changes in v2:
- First included in v2

 .../bindings/display/rockchip/rockchip,inno-hdmi.yaml    | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
index 9d1e7f894ea54..290376bec079a 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
@@ -56,6 +56,12 @@ properties:
       - port@0
       - port@1
 
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to GRF used for control the polarity of hsync/vsync of rk3036
+      HDMI.
+
 required:
   - compatible
   - reg
@@ -75,6 +81,8 @@ allOf:
             const: rockchip,rk3036-inno-hdmi
 
     then:
+      required:
+        - rockchip,grf
       properties:
         power-domains: false
 
@@ -103,6 +111,7 @@ examples:
       clock-names = "pclk", "ref";
       pinctrl-names = "default";
       pinctrl-0 = <&hdmi_ctl>;
+      rockchip,grf = <&grf>;
       #sound-dai-cells = <0>;
 
       ports {
-- 
2.43.0


