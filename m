Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4250D0D170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 21:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BpWE3Hs6vzoZBQrNVgZ1UNE0abJIcxAWoNomZr74Cno=; b=oleFMiwKXx7svIC2qDP6axmZT3
	lSeNP0ktm03qW2SfwYBo9SHyGrNVVwxzA+EEI8gEg96+qGSztgQXwitaGGlOKM95IcxdgG8HY5chZ
	UN+JL9Gf9J+wMGjRRLWxIbKQQAKgUQOtcZLL8UDyfLZ4gBvA06iOqHqxVoIPFrW7GB8G0jKHPGBca
	bC0AmNDs3PklQ4ZaE0Iq/RzuHj+Yh/nA5JGD/1iFggDFjktlC0NS9z5pB06pzMtZ797TVgO/gNZd0
	CB8sFyzTphASmNL/xtWfXG+il3wPYdKoyW3mmfnNKy+rStVgwUtvoHLXnCu/QLxTlDo2ePJkXr8us
	F8kLlhHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdbD0-0000000Ffd6-3wfu;
	Wed, 07 Jan 2026 21:36:50 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdbCy-0000000FfcY-2uvC;
	Wed, 07 Jan 2026 21:36:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D96DE103762;
	Wed,  7 Jan 2026 22:36:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767821802; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=BpWE3Hs6vzoZBQrNVgZ1UNE0abJIcxAWoNomZr74Cno=;
	b=SoXUufbtnXmRm6YUY41NiJeKn5GhnIvcleP3F2g9Mo/RzByzwhKST3/taMxOb5Yy+F4Dw+
	PnYtxl0oA8vOdg88/75obM0aO7UJrCfKJiw+CvykRdGi9etFXAzZKYflJkje1TZSpva9Qz
	sxC0YkmRmQzZCVg/nseQjN6A4ouJfYR5wIqmC3tUh5RrL63GwpstZNXPuhKuzXn/2hnJrX
	S5AEb9ZB3qqndiOxu23GKBTpRzqhwMZEVgCSXT75DYJT/mC2u5Qwrto0MATtM1MwjY0JeC
	L54uRVtmO5xaFrB3Pukhalp7tyooEJSe2VXwymME0uDXg37amEc2rRfnGqsJCg==
From: Marek Vasut <marex@nabladev.com>
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH] regulator: dt-bindings: rpi-panel: Mark 7" Raspberry Pi as GPIO controller
Date: Wed,  7 Jan 2026 22:36:25 +0100
Message-ID: <20260107213638.505319-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_133648_977832_321643C5 
X-CRM114-Status: UNSURE (   9.34  )
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

Mark the Raspberry Pi 7" Display 1 ATTINY based regulator
as GPIO controller, because the hardware behaves that way
in addition to being a regulator. Add fixed gpio-cells as
well.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
---
 .../raspberrypi,7inch-touchscreen-panel-regulator.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml
index 41678400e63fa..6c23f18a32c6c 100644
--- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml
@@ -24,6 +24,11 @@ properties:
   reg:
     maxItems: 1
 
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
 additionalProperties: false
 
 required:
-- 
2.51.0


