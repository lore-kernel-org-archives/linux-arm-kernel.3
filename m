Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AC3C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 15:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hba3OPddqmnGuDnES7XnqkDAeIm8Aq9AiYitH82aoGY=; b=gKo+4atqlQ+lGcwFGCdKM/h1cN
	/eq+uzBdnJF796Mbfm7tjaATmwmR12YRws6DTWIgi0c325QgZpCbP1fYO8AaXzuJVLgTyu0YSIQh+
	r7LT0W7MWzPjJOpbK4CpMpfGyzN0ZmivlaFkNlk6xS/1UGlxc7FCdWrgMvqHsxdvO+zjKnZD4eu4a
	QEyJm268VTt2CkRkr/7IVXH0/CflUhXhVFhBa9ZR8rBzyXAliXaU5TlKK2DzhwyTZWFdOG8/uU48J
	VaGY/rL1yydeWzS8Oha2y1u6Xh+pAclJ/llP//4AbaWK6pakRmfN0bPkL+m1ECZV8YOwegn6ZrjRD
	knrV2rjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2JY-0000000BTbs-1vRH;
	Fri, 28 Feb 2025 15:30:12 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to23t-0000000BPj3-2CuW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 15:14:03 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6C9221F9D8;
	Fri, 28 Feb 2025 16:13:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1740755639;
	bh=Hba3OPddqmnGuDnES7XnqkDAeIm8Aq9AiYitH82aoGY=; h=From:To:Subject;
	b=bEJ31olJuMURWHkviCt3MCT+NaBg2GBhN+P0kQLpFhkLzKmYUl+G2XcdKdLLvYrv4
	 K/2cuaZNo/EWQ7zkde/wW7UI0g78yucskujp0lCrXSHYuNMFQUuEvSl8lxzNi/2/0A
	 KkWAaAdDux/p6pV9EI8juHId4Iled9ceox3HOJL1D1IaorWyQPEX26pxJycpFqTbBZ
	 uAQhdWb9d3vUYGOFwE5LT4nyhoXao/GcqlOcZ6hUDVkavfP3CCebfiBlSEn6pkN/YQ
	 r88gUhxkfIuh+clbdgEQmSo2mkqd5EMeqVe0YVV8mPrH2orgDo6EeyE0zaVgzDWDo7
	 eia7dNDQhyQlQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] ARM: dts: imx6qdl-apalis/colibri: Remove compatible from SoM dtsi
Date: Fri, 28 Feb 2025 16:13:50 +0100
Message-Id: <20250228151352.91768-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250228151352.91768-1-francesco@dolcini.it>
References: <20250228151352.91768-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_071402_164994_0B563F0B 
X-CRM114-Status: UNSURE (   9.95  )
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

The SoM cannot be used standalone, this compatible is invalid and it is
always overwritten when this .dtsi file is included, remove it
therefore.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: new patch
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi  | 1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index dffab5aa8b9c..e42a553bdd3b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -10,7 +10,6 @@
 
 / {
 	model = "Toradex Apalis iMX6Q/D Module";
-	compatible = "toradex,apalis_imx6q", "fsl,imx6q";
 
 	aliases {
 		mmc0 = &usdhc3; /* eMMC */
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
index 9f33419c260b..fc61d5866b09 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
@@ -10,7 +10,6 @@
 
 / {
 	model = "Toradex Colibri iMX6DL/S Module";
-	compatible = "toradex,colibri_imx6dl", "fsl,imx6dl";
 
 	aliases {
 		mmc0 = &usdhc3; /* eMMC */
-- 
2.39.5


