Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4960AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 20:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31yd2A2KrJRKEjfaLLciJjaOBpVAtnMtVG3HpORbCUU=; b=BkkSX+1Sjwd33aF8j4mH+yfYdD
	h9GeCZW0vb9LtqB0Wmea2TxPPqMXLc/tax+YdBtHDJoMc7em+PMtohlyDe8eQZvm2fgHtU7M4ofWb
	qsO0NjlDM47pBc1VX1W9Q3GJw04HvyISeSClkSX2BFsu3uYK61hTDlvXpHcJcpTlof8p7WIwcpGXD
	gVsHJEnUDbOU7VSFe5rd38l4fHGTjQEkNAmDVQrt0+wH+qEt/TD/YuGV0532ERQwtA6NyqzMLBWei
	WvYenrtfL9A4q0AuqrYTa0F09jj3/b84ISrnpr7tCPMateahxLAogS8nFVvbb9KlPEJTntvDoq0Bs
	J90eTsow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX4uc-00000003Qkc-0gVy;
	Sun, 12 Jan 2025 20:50:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX4oV-00000003PmL-0f8Y
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 20:44:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8271F5C48CE;
	Sun, 12 Jan 2025 20:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8397DC4AF0E;
	Sun, 12 Jan 2025 20:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736714639;
	bh=y7I3ysTNSviVxSY83s+mUanX/HzCwqOMU6EU00x1sxM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MD4pcNA01r6U1fmamjLGLEXIRRQd8U62BN/TYBr4yzIVRApJEJPR7vnL11O88pn/M
	 f2+p+sWioN4NRCyI5kizdqRmqODomeUS9VDdRgbIK7SKUOeVhVyqezm+5TECIe3pWj
	 NdSgTQOa8YqELOhpkMWDwxyNAojYf07IpYa/skrEiyVZ4kYXPb3ffuq05AGbpo0Ra8
	 qSJifrnFnbsJtfDjZohiLPN7iSIN8oLdhsDnfrL4tnHO4obHiuNKrYOcB7rKKkBG3d
	 iFDn2w3EmpPT2a9gl95YFnDfPiCHT5l44xj0f28TZ+ad7/xKFTkYYVGsndf2xs5Zsg
	 GX8BcWh6t3XYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D09E7719F;
	Sun, 12 Jan 2025 20:43:59 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Sun, 12 Jan 2025 21:43:52 +0100
Subject: [PATCH v3 5/5] MAINTAINERS: Add entries for touchbar display
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-adpdrm-v3-5-c674dc19fa7f@gmail.com>
References: <20250112-adpdrm-v3-0-c674dc19fa7f@gmail.com>
In-Reply-To: <20250112-adpdrm-v3-0-c674dc19fa7f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736714637; l=1377;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=KEf80SVHicxgRXKAdu52Cd2dNEz+kgXSg0wZwqOZ7j0=;
 b=Z6vQ9xWGPgienAp28uq2+kCpuQpCu6k/45FtO0pxfnHFT/eJDa83aXt0knen4AeoNyHpA9yia
 2wsfvQYhsnIDUSugsd+fcOv8bNSbL4PRa7zUR7LIMw6YpEH98MoN04o
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_124403_291233_04F1C8F9 
X-CRM114-Status: UNSURE (   9.76  )
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
2.48.0



