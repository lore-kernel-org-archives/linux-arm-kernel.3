Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DC1CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7Ez3Gvxk46GLtRbrf5uSPZVpMhdMrXSSqJHfTrasok=; b=yVORe37/40d19Ii4tV9UC1580x
	lucqmL2tDGFzeYrzMri6Tw14g5M+zaUu00K0hSSjusKcocieaMSQ8kNhyqlkk3nRPIHxGviwMJpUa
	HLQv02djkD4+CAiWkFpMyhBLmPq3ihy/ZXJ6z4ITp3eSK3eD3yxaFmot3dJHITPP3Bhcw8Kjl5FgL
	VVh9Ym4i0UCUuKtOnVJq43gzpcIvT/FZsBnDD78EeSP8u/Eabto2HpahaC013+lmeOckinTAaBBx2
	f0d/6/ZXNlLAdJEQA9VagztSx1IuIc0mSJys3QNS7Clr3NrCV9lJHsqTtpDuCAfiIoKj7CLE3kBKA
	vbY4mmJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXK-00000008iL7-2PV1;
	Fri, 15 May 2026 15:33:14 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXI-00000008iEv-1et0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 15:33:13 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wNuWm-0005OF-0T; Fri, 15 May 2026 17:32:40 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Fri, 15 May 2026 17:32:27 +0200
Subject: [PATCH v6 01/28] media: dt-bindings: media: rockchip-rga: add
 rockchip,rk3588-rga3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-spu-rga3-v6-1-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-0-e547152eb9c9@pengutronix.de>
In-Reply-To: <20260515-spu-rga3-v6-0-e547152eb9c9@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, m.tretter@pengutronix.de, 
 p.zabel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_083312_428642_1BFA4DFF 
X-CRM114-Status: GOOD (  11.92  )
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

Add a new compatible for the RGA3 (Raster Graphic Acceleration 3)
peripheral found on the RK3588 SoC. Also specify an iommu property,
as the RGA3 contains the generic rockchip iommu. While other versions
also have an iommu, it's usually specific to them.

The RK3588 contains one RGA2-Enhance core (also contained on the RK3399)
and two RGA3 cores. Both feature a similar functionality of scaling,
cropping and rotating of up to two input images into one output image.
Key differences of the RGA3 are:

- supports 10bit YUV output formats
- supports 8x8 tiles and FBCD as inputs and outputs
- supports BT2020 color space conversion
- max output resolution of (8192-64)x(8192-64)
- MMU can map up to 32G DDR RAM
- fully planar formats (3 planes) are not supported
- max scale up/down factor of 8 (RGA2 allows up to 16)

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
Changed in v3/v4:
- Dropped Acked-by: Krzysztof Kozlowski due to the added iommus property
  and description adjustments.
---
 Documentation/devicetree/bindings/media/rockchip-rga.yaml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.yaml b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
index ac17cda65191b..7bd92f7336664 100644
--- a/Documentation/devicetree/bindings/media/rockchip-rga.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
@@ -9,7 +9,11 @@ title: Rockchip 2D raster graphic acceleration controller (RGA)
 description:
   RGA is a standalone 2D raster graphic acceleration unit. It accelerates 2D
   graphics operations, such as point/line drawing, image scaling, rotation,
-  BitBLT, alpha blending and image blur/sharpness.
+  BitBLT, alpha blending and image blur/sharpness. There exist many versions
+  of this unit that differ in the supported inputs/output formats,
+  the attached IOMMU and the supported operations on the input. As some SoCs
+  include multiple RGA units with different versions, a more specific
+  compatible name to differentiate the concrete unit is used for them.
 
 maintainers:
   - Jacob Chen <jacob-chen@iotwrt.com>
@@ -20,6 +24,7 @@ properties:
     oneOf:
       - const: rockchip,rk3288-rga
       - const: rockchip,rk3399-rga
+      - const: rockchip,rk3588-rga3
       - items:
           - enum:
               - rockchip,rk3228-rga
@@ -45,6 +50,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  iommus:
+    maxItems: 1
+
   resets:
     maxItems: 3
 

-- 
2.54.0


