Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3846FCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 21:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DyoZkHragzGjYRDXkuRubZcwRMf3HB12rjM8wii/rqw=; b=gU4Y2DNDYtWkNB1JIOgsJ4Z0Y2
	mGA3uHj6FUpTJE0pCLIBATJuRzxE8lFh3DqICIOB8k6Rgz1QjxTuoYgc4PhhWznv099awC6w1RVOx
	UygQneJ6fAnobiY4mTA8oyNEjxxFJu3roVRkXSh0WnH/8YVBwKOfjBVSObq2fwlO2N+rOjtuACuMU
	zSLzRtHKJOUYgXWbMb9t8cVPULwF7UGVnEfZaQz/4xUuCi95ggblO65UOv70ipqqHwhoMILYqNBND
	wOMWqUqOp8tNK4Y/ZP9XfUEP6jLTp/DBPmAte9uAg+5QPKWWD372uMZFdkEPRAIEngLaPo+ctjBc7
	0aYubDkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVD2-0000000EoNh-3Uwx;
	Mon, 27 Oct 2025 21:57:00 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVD0-0000000EoMX-0buH;
	Mon, 27 Oct 2025 21:56:59 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4BD8E1787;
	Mon, 27 Oct 2025 22:55:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761602105;
	bh=5On+UoBapSqweDSSD07ansJ/Saq05iLJ/eWiTftj8hM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RpCiT9p6Bp3smvkPlgjmqQIoGqfGlLO3vkBKd5L+JyX9KZEqzqSoK2/jAFe/mLQyx
	 sKZJpfyceB+5fPErOhZRIimLcizJCsvmKprfEjLEWaCvClVHY+zG1M1ibHh22r91VR
	 99p9vsnN4v3AJCakEGkC4sKEfTopTWq7qPAIHP5g=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add Orange Pi CM5 Base
Date: Mon, 27 Oct 2025 23:56:35 +0200
Message-ID: <20251027215637.20715-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027215637.20715-1-laurent.pinchart@ideasonboard.com>
References: <20251027215637.20715-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_145658_317177_D4D34B47 
X-CRM114-Status: UNSURE (   7.67  )
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

The Orange Pi CM5 Base board is a carrier board for the Orange Pi CM5
compute module. It has 3 ethernet ports, 2 USB ports, one HDMI output
and 4 CSI-2 inputs.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6aceaa8acbb2..bad4cab75bb7 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1272,6 +1272,12 @@ properties:
               - xunlong,orangepi-5b
           - const: rockchip,rk3588s
 
+      - description: Xunlong Orange Pi CM5
+        items:
+          - const: xunlong,orangepi-cm5-base
+          - const: xunlong,orangepi-cm5
+          - const: rockchip,rk3588s
+
       - description: Zkmagic A95X Z2
         items:
           - const: zkmagic,a95x-z2
-- 
Regards,

Laurent Pinchart


