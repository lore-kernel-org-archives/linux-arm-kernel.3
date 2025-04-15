Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4ABC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 05:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g+mEjASylUFx9fn2pmmTmSoWE7P1UK6z/VvOamLA1/s=; b=TO9X0ccOT3LBHShBb8ACIQkCoN
	BLFvelqJ10eLZXEqQG8BMKv3kKmcIle99ezu2lmJXR+w6uKpV4V6I3in2JXW0yF4bqt4Ew53vHney
	B6DMtt+vUNi31oKBvGu0OGe68NUP6yCtJS5C5VqToOUHHrf2yxI34my5mXde2YeHDYdkkkHo9+/Sr
	53TVT2e64alaHyiq7EY54fmxncLJdadvjokEx082c49M/8izFy1xCB/+TNHeiFszVkm9Xi0vFyzfY
	kYDj4ii7KWPn+XrRvXuKoW7plU5ni4TyVMTiZtlwZrkOVJa0C0XBdqefpbfZz0ZZZiNfaSCYlKqxi
	A/SlSBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4YsN-00000004YjS-3vM2;
	Tue, 15 Apr 2025 05:30:28 +0000
Received: from mail-m49205.qiye.163.com ([45.254.49.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4YP8-00000004VQo-2RoM;
	Tue, 15 Apr 2025 05:00:17 +0000
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11e63de92;
	Tue, 15 Apr 2025 13:00:07 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-phy@lists.infradead.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: phy: rockchip,inno-usb2phy: add rk3562
Date: Tue, 15 Apr 2025 13:00:04 +0800
Message-Id: <20250415050005.52773-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ0sdVkJOGkJIH04YH0tJS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9637d1a3b703afkunm11e63de92
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pxw6DRw4GDJDChoYCxMRDEpK
	QiowCRFVSlVKTE9PTUJISUtCTUNKVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUlLTk43Bg++
DKIM-Signature: a=rsa-sha256;
	b=AltgW+jK0JJUfNplT0CLT0w63zWHfOzrDxZzdcHNwmDCZ0cyjgReKmoLn4YVzJXgoH8gPHpqk1nbS0Bf0wLKTyfNKPWuyfCFlyf9glBxs7bF3MKUB6+q4DSopGib8RCZoOG0o+6MGW+iY94a5G4x5sSkBWQryFmLxaAGkhN/Du8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=g+mEjASylUFx9fn2pmmTmSoWE7P1UK6z/VvOamLA1/s=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_220015_142487_B58B8128 
X-CRM114-Status: UNSURE (   5.83  )
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

Add compatible for the USB2 phy in the Rockchip RK3562 SoC.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v2:
- Collect review tag

 .../devicetree/bindings/phy/rockchip,inno-usb2phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
index 6a7ef556414c..6f56e7c70f3d 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
@@ -19,6 +19,7 @@ properties:
       - rockchip,rk3328-usb2phy
       - rockchip,rk3366-usb2phy
       - rockchip,rk3399-usb2phy
+      - rockchip,rk3562-usb2phy
       - rockchip,rk3568-usb2phy
       - rockchip,rk3576-usb2phy
       - rockchip,rk3588-usb2phy
@@ -190,6 +191,7 @@ allOf:
               - rockchip,rk3328-usb2phy
               - rockchip,rk3366-usb2phy
               - rockchip,rk3399-usb2phy
+              - rockchip,rk3562-usb2phy
               - rockchip,rk3568-usb2phy
               - rockchip,rk3588-usb2phy
               - rockchip,rv1108-usb2phy
-- 
2.25.1


