Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A4BCA5FDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3x2bn/a8NdA4CWa2j0Vm5z91bqnEClcg+9EX4z8Tomk=; b=X+nR5peh0KLuWGksJJ4UNsJWQo
	qbb0F69LlKsNCWrHQ0sm3+Qg69W9sCtSO622soapkLKShnGiWGu7mWv2TdsbG+B7VPyVWKBkztiwf
	HRiUyKT/Tbg1MhdLdCITOd0kbtW/wVWT7o8k4nPEK+f73vzDSHHwnFDVqgWhZBQ8UvTU1MwCxMfhH
	biaEjNa1ucXpHLlulhN49mBj5dSbAFGCXcOkg/U+rM0Uec1BVJm8lUu0w7X2ftOoZqLTfmZW5f3St
	nyv8rT2nYUYd1kH18meWZy3HXA+Qpf7t9vCf4ATUWf3O8dJTu2/AxLgOf/yz2ntR9seKom6CsmSbc
	9qsa1OSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ6z-00000009bBf-0fAj;
	Thu, 01 Oct 2026 15:54:21 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ6q-00000009b8g-0iwv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:54:17 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 378CC1FB9A;
	Thu,  1 Oct 2026 17:54:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790870049;
	bh=3x2bn/a8NdA4CWa2j0Vm5z91bqnEClcg+9EX4z8Tomk=; h=From:To:Subject;
	b=fwJM1d2oe3D8wDuUVQSPv143aWXTdBPoKPcn7bcmOn/9QXaCfVbFEGK4seHPDWrEF
	 GbyIrKvz89E0Jobio5EwcpSb8JpbxTDAzur3fDjDW3+K6S7LTmhK+HUG34O8EF72lv
	 pfUw6IQnKTr7J6lnmaEho+OHwDx7BNZT/hu3uSavPez9Pre7F+kzPqrond9J6hh7/u
	 u1sZD/Zce+4v0k9jtalaBwpBfXuuTiCyAFsB1iP1YRVw3f5vtgpgjtuLB4isVXJ6RP
	 dQ3Kf8Fx956eYfBtVfqN1zlkvNKjKq1KW87J8ajOgCCfxofnrgsUFj5ACukO0wPUCV
	 5W3fChay/1vRw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ARM: dts: imx6ull-colibri-iris: enable SPI
Date: Thu,  1 Oct 2026 17:53:59 +0200
Message-ID: <20261001155401.2584935-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001155401.2584935-1-francesco@dolcini.it>
References: <20261001155401.2584935-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_085413_112188_059B2828 
X-CRM114-Status: UNSURE (   9.23  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The Colibri SSP is routed to the X16 extension connector on the Iris
carrier board, and a device can be instantiated from user space through
the spi_master new_device sysfs interface, so enable the controller here
too, as the Colibri iMX7 Iris device tree already does.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi
index bce6fbf230b3..5e408e54b335 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi
@@ -52,6 +52,11 @@ &adc1 {
 	status = "okay";
 };
 
+/* Colibri SSP */
+&ecspi1 {
+	status = "okay";
+};
+
 &gpio1 {
 	/*
 	 * uart25_tx_on turns the UART transceiver on. If one wants to turn the
-- 
2.47.3


