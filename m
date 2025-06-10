Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B2FC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LD0MB91z9PfZYAXO24p2qOhAOpp+SjE92SzsACvx/bk=; b=yezfKDCEem64x4gD6Kmyu1u7jf
	NyByk2UASuePlssrr+G3QYUcyorMsZ176OE7BbaN1Ca2IIOHPNE1OtRwBzqhqNmf6HtyrnTKtaaj7
	B5DQqFWdMok0FW6wYzOw/ukSUu+byV+IDY0yD87FxDlzqtPtkPVgrOpWhy5uVs5W4Uq3B3pDT/1fc
	Vg12jYoVi8yl4uZz1nTnXwtdKqt9HX5AQ1EZ6HM2c/wJpvuC7Y46/JRFjOU/LiHWN5VFsWphTH4Qs
	ic/PnFP+/fNGMiVjtpJoVHB6JS6WMN2zsap6eT6JcsGaFhKiSyMh3CSLVkfZtdG7mn9aJNWHdHX4w
	CY4v5FlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7mR-00000008GsR-45FR;
	Tue, 10 Jun 2025 22:49:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4VO-00000007uI7-2rlR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 19:19:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1644743DBB;
	Tue, 10 Jun 2025 19:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D914CC4CEED;
	Tue, 10 Jun 2025 19:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749583169;
	bh=I7LIFG9CUURK/xCFq/gHrynuB0+CqswX9qvQ7HEglvA=;
	h=From:Date:Subject:To:Cc:From;
	b=XJrNhMZqdrAhrqVbb9fCWpGKj8dYMEO2pZFyFCmSLKnaC9XCVpKkbkg0Ae9FQ/BUk
	 MHSxaDFIDnr/d2Zw3qrAl72UadRR7RzA1Be9CMfDltvmv/moUw8r+XtH/KCihwB8Xz
	 WKOHPFf1TyqgrgechlZ5RtaloETFEoLJlqJ/IsEjOY8RcYgRgTAXvfEVzZumsjmUG/
	 MllxaIN/50zCxkrSl9ZdIJ7WPRxHCCK0y5JcX34ZuWQh9rMvzHrtLOchy2AFTGQFeV
	 W6TgnF7HNIgQ3aQPHv2yYOq6H9criwB1LugLWIsbMqSNghHIRAJtcQiEG/Sa9T0VwK
	 erG6UK/e9H4hQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33A8C677C4;
	Tue, 10 Jun 2025 19:19:29 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Tue, 10 Jun 2025 19:19:24 +0000
Subject: [PATCH] arm64: dts: apple: Drop {address,size}-cells from SPI NOR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-apple-dts-warnings-v1-1-70b53e8108a0@kernel.org>
X-B4-Tracking: v=1; b=H4sIADuFSGgC/x3MQQ5AMBBA0avIrE1SqoiriEXLYBKppiNIxN01l
 m/x/wNCkUmgyx6IdLLw7hOKPINxtX4h5CkZSlUaZbRCG8JGOB2Cl42e/SLYOqcbrevGmQpSGCL
 NfP/TfnjfD0gomXdkAAAA
X-Change-ID: 20250530-apple-dts-warnings-8bb373367b54
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=I7LIFG9CUURK/xCFq/gHrynuB0+CqswX9qvQ7HEglvA=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4ZHq73vyvzpddl7Td89/J323EP/7satR+MffagOLGIOf
 jJHK21xRykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiWVGMDGe4rxsafox+V3e5
 TNBZWf31hBIWH7fSc+c/vTaed+N7yW6GX0znghs1Xjwy+cx0J03vVqF8p0DsrLf1FQnLPJ3fXuC
 fwAEA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_121930_752486_C27096F9 
X-CRM114-Status: UNSURE (   8.84  )
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

Fix the following warning by dropping #{address,size}-cells from the SPI
NOR node which only has a single child node without reg property:

spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

Fixes: 3febe9de5ca5 ("arm64: dts: apple: Add SPI NOR nvram partition to all devices")
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/spi1-nvram.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi b/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
index 3df2fd3993b52884d7c00b65099c88d830a7a4c3..9740fbf200f0bcd0e7d1b81885fe9d9ff8f04fdc 100644
--- a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
+++ b/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
@@ -20,8 +20,6 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0x0>;
 		spi-max-frequency = <25000000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 
 		partitions {
 			compatible = "fixed-partitions";

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250530-apple-dts-warnings-8bb373367b54

Best regards,
-- 
Sven Peter <sven@kernel.org>



