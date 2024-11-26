Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5ED7D65555
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 20:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLFDVevhwR8sJ6T6qzO6vKVFKAd7nL/GUnEtM3QHpfU=; b=dO4VjvpgZw48zRs9PC5ZksdssK
	JQXq0NlR9siJy3KbUvpCjYqhcYRTDPKExzlcxt89+JuD1HwWTglrQNQwEAQFgUwe734MUwJZVWmjc
	WMe5311vjM+DOs8raTlHuk7dxgkeq03XF16kuAMml4PXCee7NFPaJG3OE17k1s/zxMO2pYWp3O4lZ
	YKV7gkKT/em35SaTBWfMi7OgSqhN997CphSXkdc6apu+QLAIX/rlp6SWTE81Z3ia1PETupqi45809
	ZGezcF4+XXRVXXM33X7Zv+B/Ub5pvPV4/iX7fJQqrwSC2L3sD0Hv/FZoekkE3TNFhL7Z0p7b7BXhn
	4QrCMCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2XZ-0000000Bgrb-3Rg7;
	Tue, 26 Nov 2024 20:52:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2Tn-0000000BgI3-3MIo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 20:48:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D0923A413F7;
	Tue, 26 Nov 2024 20:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5EDCC4CEDB;
	Tue, 26 Nov 2024 20:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732654094;
	bh=4El0kQkrRlr/CEy5dm9S79SsYdqflPKE+Y43lCIJcaQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UQlEL2RNBHDHMuwoN3QCs0DnB98E6jQ/0NwC8lNh/CXmmPF9CDQjJ7yuVaGp8okjY
	 EpG/qZaYI79Ip7ucaltMasSH1iqdouLfMu0XvFIhMc0CB0opcu5Gy1RBWzkF2h/rS1
	 QFAqGp6PJaFnVuZfWctgi7H6q+IwO81nUl2Ia7Oy6QiOrD/FxrLowQTvTy45mC4iJ9
	 h+AMaxDTVrZOqcW0uwBPOzJPWtJ5Vjeks+sMG/7vfvRVitHaOFw8FnswyVExZl3m2t
	 7bdInh/ZPymcQgOwPM/95BSOTZWWtJvrtrGq6HVkfVlahgnj13QjSnKQrhBH0W+Uj+
	 AsqzTLJsXoReQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA82ED65555;
	Tue, 26 Nov 2024 20:48:13 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Tue, 26 Nov 2024 21:48:02 +0100
Subject: [PATCH 4/4] MAINTAINERS: Add entries for Apple Z2 touchscreen
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-z2-v1-4-c43c4cc6200d@gmail.com>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
In-Reply-To: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732654092; l=1218;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=5VgCgIUSJDHHHfv8AULS59dx+V2ZROTDT6FjcyDo/sU=;
 b=Ir5WYIz0L4uxDNqP4Iy7InHtKEJmKl90BhcHI3EpOmGhvc+koHFn6UlkCO9LEZdWpqqMjrxn0
 bgIC/fxwW36CBu2f+H+IjVj9O1oIm9ZeDSEOaIOg5bBm1onJ8WeFmfB
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_124815_913311_04161C2A 
X-CRM114-Status: GOOD (  10.03  )
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
index e7f0170977013889ca7c39b17727ba36d32e92dc..9f75fff12fa1912b70251cade845d6b3d5e28c48 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2166,6 +2166,7 @@ F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
 F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
@@ -2186,6 +2187,7 @@ F:	drivers/dma/apple-admac.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
+F:	drivers/input/touchscreen/apple_z2.c
 F:	drivers/iommu/apple-dart.c
 F:	drivers/iommu/io-pgtable-dart.c
 F:	drivers/irqchip/irq-apple-aic.c

-- 
2.47.1



