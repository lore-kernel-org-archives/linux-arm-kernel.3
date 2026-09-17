Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAF1C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 01:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNkre/XsEQ/EixXkR7zbvFzj9KfeP4IRk7mqlohngNg=; b=JO69IpFLpYUZwJziqHVwS0lWX1
	ZflxnGLKyuW59UX6sfJCou4dts1d95hlj3Rz+D6fvE/OMF4nX5rGts85B3yGljGnA0NjkOO6M3qbS
	xZhunz/JyLEqJ72FDqY8TCpP6KP9v4F7lkgThmUw7zzIyQVTvLG4wCAdmRrL5HWLFIiENaBEK+sd1
	DAR4XaH4dj7X27Duo7F2e/09lcTzFqkbPFJydth7vdX02h7rKPDU20I0bV8Dw0bXR5FydLChkVZ1o
	fHqJrX0CWqsJFaYUoBlF/T+9YpeBrS1aHD1Pc7AeiPWcKOx5LU1YlZntDQ+1d+jfsFRG2VFD9btGV
	LnEXtM0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70cr-0000000AOEs-33y7;
	Thu, 17 Sep 2026 01:09:21 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70co-0000000AODy-3RPp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 01:09:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82DE41048E6;
	Thu, 17 Sep 2026 03:09:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789607357; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=gNkre/XsEQ/EixXkR7zbvFzj9KfeP4IRk7mqlohngNg=;
	b=gvwRGuWbh1mDOkBtM9glMTu7nMJ44NXnSZOl8py9EBgpGIahkp5Li0lzD3D6vv4ybX2uji
	4H2GzROlEgbwVrX17vXoGmqL5fdwq2yPBh9aDqCwHurwvYfumwN5+nWu0tPrCE8Q1MvrAP
	yBmzIG+R88nbiihMfWIxHKkIuQK3UKYOfo4GVyuQCV/YtTaNtFJ0AQceX57djOKR5BP8fu
	CPO0T7sntP59qtrM2OTQYkIY1GdHtt2fgwaW3SFXioAxT/NfBBE0d+4/sCgRnd5c31l8HN
	0Lx2vfjiJoVKLLbovKTfpxrx4yMV9gcCUrjlJeP+8irX2aXCPyajE1OCHFuXgg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: arm: fsl: Document Data Modul i.MX95 eDM SBC
Date: Thu, 17 Sep 2026 03:08:23 +0200
Message-ID: <20260917010906.424049-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917010906.424049-1-marex@nabladev.com>
References: <20260917010906.424049-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_180919_004669_DDDE5CC5 
X-CRM114-Status: UNSURE (   8.16  )
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

Document Data Modul i.MX95 eDM SBC board. This is an evaluation
board for various custom display units. Currently supported are
serial console, ethernet, eMMC, SD, SPI NOR, USB host and PCIe.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Aswath Govindraju <a-govindraju@ti.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-can@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 36e28e0e4ad99..04abae2018043 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1548,6 +1548,7 @@ properties:
       - description: i.MX95 based Boards
         items:
           - enum:
+              - dmo,imx95-data-modul-edm-sbc # i.MX95 eDM SBC
               - fsl,imx95-15x15-ab2       # i.MX95 15x15 Audio Board V2
               - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
-- 
2.53.0


