Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69336CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pB+WivX/bZUDkHW09KVtbKSqgCWyudm5s43tN1s13ao=; b=zmVZqB0+kVPUvmC2Y8OHBrwxoV
	4mOfzP25mjbYrM6t6s4yy+1gPrfPtH8QHcvl6jwF/XlyiP3KQ1LuDVeK0Asi4BdbQAJc8/R2c1eY8
	Bhs8w+38GseKOLOdlkaSLmyAWVALUWo8SOwgbgPexHHpxADqJpv+C2sdnKXhRoXIgPjBe+UQHsVYN
	QwUYUpe/Q7M2a2SvyauISbiyPwOyodt9IuTFGhNQuj8Ua0TsV2cZj0YxcyDdw3HYHWtxqUXQELv/u
	ydJud7oJJLoQ1EQheOUrBd+e6/gu5kr8LneDBEG0km6PYGX2+FzPJkZgG/F9kng3KjW7MlNGXtAsi
	amZWj5gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9TT-00000002dUk-40wU;
	Wed, 13 May 2026 13:18:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9TN-00000002dPq-3GH9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:18:03 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12E782B56;
	Wed, 13 May 2026 15:17:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778678272;
	bh=nPJzcPekfWg8VQk7v3Ppx+7G3lp2WtkHYg/I3DyeH3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RzS/iuzltOIkYsm+50XK8up8jJdktRZg1TJGbU2TUdm0kYaQZUNgHE/y8NhBIxGmD
	 2FYgJ44cOA5pMd9KfixROGdB9BgwiqwyJRBfjNdOwnHcXhz6yS+omEPbafiwuw2rCz
	 0Htc8gRfIdjJpDLlKFa3VFTjfVLNmvnzumGFF5K4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 13 May 2026 16:17:26 +0300
Subject: [PATCH v2 04/16] dt-bindings: display: ti,am65x-dss: Add
 ti,dpi-io-ctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-beagley-ai-display-v2-4-9e9bcefde6bc@ideasonboard.com>
References: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
In-Reply-To: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2200;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=nPJzcPekfWg8VQk7v3Ppx+7G3lp2WtkHYg/I3DyeH3I=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBHn92BRz7sng2d5pS8QB8Ma8t/id1l5MBxGDP
 pKNT1+yzSaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagR5/QAKCRD6PaqMvJYe
 9Vf/EACKrp2Z0E8WBm9BgJ17jayJk9cv+S8+TC4tZs6FEbNZYmosN/YYJYgWSL5j1AAGcwA0+Ec
 fHcuF16HxSg/gN9lRUQX2H6aelw/8oOzM2yQ/6xnzT2TVY2vgc4SVexSTeDBzLM5e7iPAcLjYGM
 yLE0MMNbufp/+ajmWngQvGFZqXySZftX1AW4C/5dJNHbtvu+1g620huAFAz/bTXrysG5wG0YPrl
 UqbBXIZUtk2XuERBzbaRMLmTmKXS/rS/R+LVzRARrisTy2XeRxj+wV4okjldzktE9XZSiz354jp
 mUCepUzy7WmPehQkOJnpaB/+Ppp2haS/PEOTxU1k3zH1H0gc3REi3Pvbj5RohqQKBMRMgQIIRHI
 TkSOjdGOT9Fv6b7FuX7OmLNrJHqe4UdgyGp7BgLsMoN7Mk49sX8ikH9rnlCg1mpRImG/plvboi6
 JMZV6wBwUCELxOfQruJwO0ydigVzG2/4zGKPHkanimMZS70zd1/V9qfZQdDkr8+QYCUtp6mJPf2
 CN+vwGqFrZQ7wOBH8Eb6Ck0JnypiqaPA9IJldd1+2/ZWuO9syJAhtaM2wZgYLAOSedD9tKxMo3v
 wX0eqoKZcrhCLmD5GCkEORydtq6ZXLH+SujPSX36ud7L4dLwDSop1RBp6Htdxs+oOGAtxllznC8
 m404lj4bWA3Wk4w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_061801_966308_47F86458 
X-CRM114-Status: GOOD (  11.65  )
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

The DPI output pipeline in K3 SoCs contains the display subsystem (DSS)
which produces the in-SoC parallel video signal, and a DPI block which
adjusts the signal to the external MIPI DPI output.

The DSS IP has registers to configure whether the data and sync signals
are driven on rising or falling clock edge, and on some SoCs these are
automatically conveyed to the DPI block which needs that configuration
to properly output the MIPI DPI signal.

However, on some SoCs the DPI block configuration has to be done
manually, using an extra register outside the DSS, DPI0_CLK_CTRL in
MAIN_CTRL_MMR_CFG0 block, which controls the DPI block's behavior.

Currently the DPI0_CLK_CTRL is never written, so it's always 0, meaning
the data and sync are always driven on a rising clock edge regardless of
the DSS configuration.

Add 'ti,dpi-io-ctrl' property, which contains phandle to the
MAIN_CTRL_MMR_CFG0 block and the offset to the DPI0_CLK_CTRL register,
so that the DSS driver can configure the data and sync signals
correctly.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../devicetree/bindings/display/ti/ti,am65x-dss.yaml          | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 588d72d4ec0d..902ae2122d86 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -113,6 +113,17 @@ properties:
       and OLDI_CLK_IO_CTRL registers. This property is needed for OLDI
       interface to work.
 
+  ti,dpi-io-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      phandle to a syscon device node containing the DPI0_CLK_CTRL register,
+      with the offset to DPI0_CLK_CTRL as an argument.
+    maxItems: 1
+    items:
+      items:
+        - description: phandle to the syscon node
+        - description: DPI0_CLK_CTRL register offset
+
   max-memory-bandwidth:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:

-- 
2.43.0


