Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B02CCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KWakkcnPAiFgfLU7LEKDx8wJs/Rl3RjR0sj8wiSKrsA=; b=iHnsLFfxMspj1wuGtITmDorlut
	RGgfynlY9irBrw686HyJTURAPBf2qDrX1UnDG5dGioW31ga+k01XkXXedGpaDyv1wbuXmkRvCkChZ
	AjDw1TIYEx0Fx1Q9mEX3DvdVuT3FDMR+4G5FLzDxUkLcjvepxgHhPrDQ2CswfukELkTSf2UASMV1h
	EHm4KXKMrl6MXkv9YmSaWKWkA5iV0cWKJvtzsslMcsUeTcheJg2qEb1BXxjPV2q4tIVToEKiL8dWF
	BVPQSAVZ9Ja80Q49A34wbkjeb4Q/R1xjnzBrAXU5M4yh8hhZfe4UxTZpE0PE38qMo3V4ydhA5EZVy
	Zr07z8Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmd8-00000001meg-48El;
	Mon, 19 Jan 2026 10:37:07 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmd4-00000001meN-06eR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:37:03 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 7AC321FEB3;
	Mon, 19 Jan 2026 11:36:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1768819019;
	bh=KWakkcnPAiFgfLU7LEKDx8wJs/Rl3RjR0sj8wiSKrsA=; h=From:To:Subject;
	b=oxt9CaE9CueoNB8KvnYHETcQXZWiTv5nk77HJA2Z1n45cpCZCSQJc7x4sBC2xPVnO
	 ZVnpgH4zUAauzHbw4uyha7mknRxRV8ASpmSwRF9kK3KM74RIqetaBRMEEkG1goP1Tr
	 OHs2f1F4hzSGKIUGdbWclCAZR9cBHguohZ82mwQWgeTVwZ5WEZ+ibUvqHVw2zcA51P
	 eaXsyVVVtY1a8D5bNOe9ziQUxudMHT7qXIgUSY5t1YOKY4tQHZA0lemu0FWufSwOwx
	 HQGxiJLkfzLItmxn4LHPCSE1mmwgHpPAso0MVhYWyESn8yufvozrNZrBsIAc18zZ86
	 pl3KtNsCCkGlw==
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
Subject: [PATCH v1] arm64: dts: imx8-apalis: Remove obsolete TODO comment
Date: Mon, 19 Jan 2026 11:36:53 +0100
Message-ID: <20260119103654.51318-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_023702_284879_B55B40E7 
X-CRM114-Status: UNSURE (   9.58  )
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

The GPU is supported since Linux v6.9, with changes in the SoC dtsi
file. Remove the related obsolete TODO comment.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi | 2 --
 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
index 7022de46b8bf..3dbba219ec9b 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
@@ -89,8 +89,6 @@ &flexcan2 {
 	status = "okay";
 };
 
-/* TODO: GPU */
-
 /* Apalis I2C1 */
 &i2c2 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
index 12732ed7f811..0cae495a68ac 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
@@ -123,8 +123,6 @@ &flexcan2 {
 	status = "okay";
 };
 
-/* TODO: GPU */
-
 /* Apalis I2C1 */
 &i2c2 {
 	status = "okay";
-- 
2.47.3


