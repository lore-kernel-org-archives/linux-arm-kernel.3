Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B9FC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 22:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTWoRw2iSsewPQT7X5eHJhq6GbfO2CGB+KPOd8JCej4=; b=UBCH787BWLgvOvZR7pLlQ3yhXo
	IR40Ujut2nX4C144wbaBbBBO5SFklKUOKaBCTLdvvU3V74c88OJRInLXeLCX2/9SZypBMlHTpAjSk
	YzVZEBWLlQ74CMYfIapvYwP28xOg4hnMIeAUxbqop9Ioo8ZszLedY1T3JXc14RalbxGaL69Of3TWq
	3eiuUUOg3qmm4ZdXiSBaDWAhhEl6N06T3m0MPTLGaNHGVZwuMSS29cmVP7xoWKbzbuP1i4AO0HXfT
	5sRs0Rq+qEuO7DSKFZ3wo8FBGuD99/k3D9N7HX9CTX3KbwI/RuauzB+2PuOJX8DNesB0KTp4THZpx
	5j37MC+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfniV-00000004i46-1tls;
	Wed, 05 Feb 2025 22:17:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnbm-00000004gxM-1GKE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 22:11:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ED2BAA439D1;
	Wed,  5 Feb 2025 22:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38A05C4CEF1;
	Wed,  5 Feb 2025 22:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738793456;
	bh=KBAQykQ4ZDZEmyMlD0bA/wR0zXcfdnw5uGSkiP6UgNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=P1aPk5VMgO9FM7GziHJXiUdBW1aYh2bI4C3MtnEF/P2O0ZSevDFF2eqj8XNq2gbmY
	 tnN2gbvfGErFbwyEYlRhzgq2a2L/q1Pb87GbgiotcFtTTwgX+ba3YIez+ngqH8lVY5
	 hAjm0KCSt4Psq7LUvKvxxsXRkOBr+vkFLCrpgHTuYx/vTNov0H5h9lDksWOG0w8xg6
	 9MhBDA8FBmAePRlnLAB3NZTwchA8BwskyEJF+2JJOyLLdoW2MtLtIdzZ5Jqnq3vEE5
	 AwVmS8FCzXV1vAfGmZJUPnjOGFush6StsvxC7Jcjgi2A7c5LYVsRgCChu9hKPXxBn6
	 xnSlerAyw1CdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1E1C02192;
	Wed,  5 Feb 2025 22:10:56 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 05 Feb 2025 23:10:54 +0100
Subject: [PATCH v5 5/5] MAINTAINERS: Add entries for touchbar display
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-adpdrm-v5-5-4e4ec979bbf2@gmail.com>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
In-Reply-To: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
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
 Alyssa Ross <hi@alyssa.is>, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738793453; l=1420;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=0u4/uYjoe2DaEvjc/SQO9Hc50mMhOj/1inT7JrKfgM4=;
 b=iAMCyaTdmzX1to9BPOpiGdbLwmYaf21Tj+jU8faAlxYBgzUog2CBJHwJlymHwnkcf2pdBVZWX
 brf8vMNRwbmALTFpuP+AeYGeHZYvLNPSfAWlvQkJ+mR5O2b46RC7K0F
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_141058_472547_DC948444 
X-CRM114-Status: UNSURE (   8.95  )
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

Acked-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a87ddad78e26f28ffd0f3433560d6db1518f9f95..4ce0d3bcf67910d909ba41261535dcb14a24a7b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2189,6 +2189,9 @@ F:	Documentation/devicetree/bindings/arm/apple.yaml
 F:	Documentation/devicetree/bindings/arm/apple/*
 F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
 F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
+F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
+F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
+F:	Documentation/devicetree/bindings/display/panel/apple,summit.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
@@ -2208,6 +2211,8 @@ F:	drivers/bluetooth/hci_bcm4377.c
 F:	drivers/clk/clk-apple-nco.c
 F:	drivers/cpufreq/apple-soc-cpufreq.c
 F:	drivers/dma/apple-admac.c
+F:	drivers/gpu/drm/adp/
+F:	drivers/gpu/drm/panel/panel-summit.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c

-- 
2.48.1



