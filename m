Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43B4C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 15:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9IuIIWMF3nn6MhJn3nVioRG/vLkyDShB0IZOzPkMNg=; b=c+K8lCXpQtQhRzv2opppKVocgI
	zvffTDCUWVSDjZXwTap4ZK81swP7m9iqRm8xKsb2bmiAqsxHDGdXIhOH3mdCNzHHEZKOhHR6uF4JG
	vfS8QfZEIJUyyUr75pvq9H5Ab3W5yX7s85tw5e97Y2Yll3CS1AdG3oZxqdngvCbTflV15tDmWas1F
	LIodJEkuKGaklP5WYcN65Eg4w5MhQE0pmmi9nlKpbbTpgybl+emqeGsp19qDB+RaOC2m032Jzj04+
	8hYcLgN+eHEAORZA9RKAsBYJxaEAVnN27Dz9DIUR7/0dcKgNG5t2MZ1DFZl/lRaECHsuxPbJsVC8M
	JZfLGX3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDDB-00000005Bnf-2X6H;
	Fri, 10 Jul 2026 15:32:21 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDD8-00000005BlB-2rDH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 15:32:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D14AAC2C64F;
	Fri, 10 Jul 2026 15:32:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2B3C60349;
	Fri, 10 Jul 2026 15:32:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2ED1D11BD1C3A;
	Fri, 10 Jul 2026 17:32:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783697529; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a9IuIIWMF3nn6MhJn3nVioRG/vLkyDShB0IZOzPkMNg=;
	b=ZqfRHd86BxzR2ZmpA+iEZqyUSwZ4jKH7irfqT/PLD/Z3wNaT14yrk/8uGu+fqQy4TnV+/w
	CQxcEwnpJUx0dz/adEgEMoHKYi0htAmh5WfQtMIN8EBfQ2SZs4/oMEbhGLR8TS6zp4lFe1
	KC1629eorzgZwZyxBZmqbWDKIaZ4J8990+RMjECCsCzwnCMaQYtiznf+2vIzvgVIMUxujM
	ejZfj6Pw9mp9pDQZ1A3GwfKXGYpuBUGVnZMtQgHSjDnGrZMw1pGJTXJceaGeaouTSrSG8+
	wjS2edXdd9rSyZx7RJ1LDIUrt5iUOd1MHNIMTAsaL3mnb70hbcz78a/RImkflw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 10 Jul 2026 17:31:36 +0200
Subject: [PATCH 3/5] arm64: dts: hisilicon: hi3798cv200-poplar: Import
 optee node from u-boot device tree
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-mathieu-uboot-dts-import-v1-3-ffe0210e50c9@bootlin.com>
References: <20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com>
In-Reply-To: <20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Wei Xu <xuwei5@hisilicon.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org, 
 Tom Rini <trini@konsulko.com>, Peter Robinson <pbrobinson@gmail.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783697511; l=911;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=bQvA7RaITKm0leFu4CsMz36juYaBIh9nm8WiAQHba6s=;
 b=Oqct+rYQmFQ9UaEQYPTA/h45y/vpgN4kx9+02R3tfwH61DyYi/90YdCukwryl/7UV/W/o4He2
 c5uJcIP/MmfDIvDbxx3YziqtaedaIjLApZQNcodt2GfUJaXvWPDqjyL
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_083218_921979_B902DDF3 
X-CRM114-Status: UNSURE (   8.77  )
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

U-Boot is defining its own device tree for this platform. Among all
differences, a firmware node to enable communication with OP-TEE is
added. Importing this node here will reduce these differences.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts b/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
index 579d55daa7d0..f20fbfc1c954 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
@@ -70,6 +70,13 @@ reg_pcie: regulator-pcie {
 		gpio = <&gpio6 7 0>;
 		enable-active-high;
 	};
+
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
 };
 
 &ehci {

-- 
2.47.3


