Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0302E69187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 22:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MoejeMAm9Z+Zwo5o/+Ddorw5vIWZRpTkMW/jJhfank=; b=J9JaIs6pN2o0/s4prVtQiuAdPa
	OG+IXuyHySfsKZbxoxEXaqg+t0xU/pI0vLtjfauYH4Csi/lsv48S1AN1WtUQmXOAZOknf1doZMqpC
	8btfV7k89UysPNiZYNCW/vORAEbCSLMjyFz9rJWTIVHCsplftuJE++31saOfuYKdVZaFZL1RwRO60
	2p3XJvMi8xrvS2gCJDZoP32s1hKmida+LmPKO/YoLOZBgBOdbZaxM+fDXnYsvnKWA5Etanu+ZjAGV
	GOtgMCZ40DbzkiX1V8T1Xk+QHAzN+pXXEQ9t52VJuasN+uXgx/QhMG/S4h4XYhlEZ9H4TzPn9yapA
	rgGNyz9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFLCR-00000006ieL-49RD;
	Sun, 24 Nov 2024 22:35:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFL6u-00000006hrm-0O98
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 22:29:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C0D15C57B6;
	Sun, 24 Nov 2024 22:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68FCAC4CEDD;
	Sun, 24 Nov 2024 22:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732487381;
	bh=8Hp9HnlSkudhEMoVTtPB8Mqq7buNaH8Vu6szhwn5uHQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UZGG7rOoUb2MQ5pq0RCgDVD0Uh4+J0lOKGx/2DGhvGu353804u3G9PeRttjYaaK1R
	 sIlF8MKTx4qiCvWgR36Y51xcGHiMhJa7JnXv67wWN4UqUAdkIPRYNn1gXuX0Lba+AN
	 MlPPclHkzD/1KRGxuZqeIy5rKh1m4xuYlUf6fnpXMfi+t4fV3nCen295fy9k3DVHKo
	 qQ3A4PUhAsU5tYBrM1hZHEvusSiMR/gUJOr+ynwe795p5grgl5bzNkDa8qYXGDYJyP
	 80SKszzwUJ6uNkIsTlDUeGscTpO79fnANpJsmGV1LCEpg6mSSDYQMDxaRiDXnZtagM
	 65DlIgKz062ng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A195E6ADEC;
	Sun, 24 Nov 2024 22:29:41 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Sun, 24 Nov 2024 23:29:28 +0100
Subject: [PATCH 5/5] MAINTAINERS: Add entries for touchbar display driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241124-adpdrm-v1-5-3191d8e6e49a@gmail.com>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
In-Reply-To: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732487379; l=1179;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=Zo6z/5ObW5tpoXAd3EL3OeGr9DmJcirQwYT2c5Ljs0k=;
 b=6a+DIWi9GClhX0WByRx54Ur2Q/eMDyfO7632pcDcXF4uq+86V0QRMTAU2VoDMJFZXp6aXA2vH
 AXSUleowlhlDLrepwdiuHmpzTO0gZBEA6pKVWIu+/+sOFSB104Z0Kju
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_142944_225421_A5CC2BBA 
X-CRM114-Status: UNSURE (   9.68  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add the MAINTAINERS entries for the driver

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e7f0170977013889ca7c39b17727ba36d32e92dc..1964bb705cae0b0f12e2174fc96c5cd123d31520 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2164,6 +2164,7 @@ F:	Documentation/devicetree/bindings/arm/apple.yaml
 F:	Documentation/devicetree/bindings/arm/apple/*
 F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
 F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
+F:	Documentation/devicetree/bindings/display/apple,display-pipe.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
@@ -2183,6 +2184,7 @@ F:	drivers/bluetooth/hci_bcm4377.c
 F:	drivers/clk/clk-apple-nco.c
 F:	drivers/cpufreq/apple-soc-cpufreq.c
 F:	drivers/dma/apple-admac.c
+F:	drivers/gpu/drm/adp/
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c

-- 
2.47.0



