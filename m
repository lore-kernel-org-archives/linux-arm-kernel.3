Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141B5D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 08:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NqyhWdtOKMTjo3D66DgZuH8PnsU6W6516xPtdN0UaOs=; b=IwFdBRAejfK44UzJnVSXtl98QV
	WWnm8nTJ8PdPm1ctJiqmaKO70qZSWxSBfM1C4iWJWgMRKTH2QFrKPfkVQv/hVP4lAGnkp1OeBDnFM
	ivNACMx1kpUQHybh526CWPevY20EHw2JCq5ySxZhI1vYL7VblMvLusm1QBdlxKHyh/qjxQqM2bQ+m
	+a0+gDgondN93X1xZklQfQlFxb0Z540uNjYZwKOsoTf6mHwb+WvcQhxM8sbEKTEHg4mF8E5xHyAQl
	ZMlnu+A0myr1RnBmEU9Wb+ShvfgX3UkpkWmKpZmuNXVxgKm2CyjdGnjC2Ct91LKvoowMGHQP5pGYR
	kbvLynIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vStXh-0000000E1Fh-41lq;
	Tue, 09 Dec 2025 08:57:57 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vStXe-0000000E1Ew-3Lgt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 08:57:56 +0000
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 5F7F91FD2A;
	Tue,  9 Dec 2025 09:57:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1765270672;
	bh=NqyhWdtOKMTjo3D66DgZuH8PnsU6W6516xPtdN0UaOs=; h=From:To:Subject;
	b=nzL5fq2NfqqpVsdB7AxEa4oX+jLYUFf/jvxlFWTnhvuaisFNXeDHCJjIJGKhSze6x
	 AsTM4prYesQNBY8cjJHy+vVovD3oSDbgMmqvgwG5+tfCik3EwNl1uN1ySGDEIJl7K4
	 G4shyT2K3aXeomV3uV7Hmlp1W64bpVR+JDZtIJxvgiDWyHv2lBfdiE1SkuVqRQ2CjP
	 JWow4GI7Kgls7FbtjnRB9yXGbJtJI2ps5o6uZoJi6xys/wPcehAc2qEZ2IuD7Sxp5S
	 yLilIaSnZxzQrb9XdM+1rCC7+U0ExvWVJNqCfM8ZY2yFuwVvHGDkf3k0SYfSKW8yiV
	 sDO1t0R4ETL0A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: freescale: imx8-apalis: Add ethernet alias
Date: Tue,  9 Dec 2025 09:57:46 +0100
Message-ID: <20251209085747.39009-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_005754_994001_A0B8634E 
X-CRM114-Status: GOOD (  10.04  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add alias for the apalis first ethernet interface, this ensures
consistent interface naming (e.g. `end0`) and this is used by the
firmware to correctly set the MAC address.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 9153dddfd3b8..6fc82b5eb58c 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -6,6 +6,10 @@
 #include <dt-bindings/pwm/pwm.h>
 
 / {
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	chosen {
 		stdout-path = &lpuart1;
 	};
-- 
2.47.3


