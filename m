Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51B7F47CC7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 19:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZ5ElGs4yDjDl9zUzhOrvjxZKl8oYf69gNiHnYY/vp0=; b=dVTZ7M/MKg+PRLLucACYXFHpiq
	oFRuh/JspZAQK5N9PxgI+kAyOim20wmDHHsd9uzRidNN/1brywSduqDycl2uI1BQLKEW2dk2TZxqD
	u+xQyHAeezmrwshlULbjsFm40c6xY14hz3JOSeXWJTI1+IWEt9qkWlAytluh0zL5JApDYi3jKWhkW
	tvbFeOpdLhJNx9SyxivDJ9LfETAhPDM80W5XtRaFTxEHKp9UTmDdLyikOjEHvxZ+lhiOhyjKUvDy2
	CUeSlrULmsWN9zaHWaMocv8+0lgrZokcSXh+/TsQ0MwENA2KSDJ954ScnJyEbYYnF9I9HyqoX15uy
	vaSr8GYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEqo-00000002UH1-3UZr;
	Thu, 05 Mar 2026 19:59:14 +0000
Received: from mx3.wp.pl ([212.77.101.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEql-00000002UFa-3Qh8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 19:59:13 +0000
Received: (wp-smtpd smtp.wp.pl 18178 invoked from network); 5 Mar 2026 20:59:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1772740748; bh=UZ5ElGs4yDjDl9zUzhOrvjxZKl8oYf69gNiHnYY/vp0=;
          h=From:To:Subject;
          b=KwhuQA6G1v8VHcwAdkzeKB0Jd617Ax7zMA450fs72GLxUEvDqepotNfJVqNqmUrxb
           WZ544pJS6d7bKpb4AdvpXUgYCbyWjwYP88O8h/JAN+MNdDR4jnVJBWnHHN1bzdFIrI
           uoB1p74t1ZEVy0SR47a3NRmYQll4R7moXSRXygHGH3j0xJjQO1Jz1/BmKkpA2Df2CT
           //3gM3tmEPSmVC1m4Ja8jSZjhtLVzbBxRbX0NdTWHeoQ7yr/cTdKWvd4tnoA5NR6Qc
           QHseuxno8SequcRZUlFOgpFgduN6lo1v+jPE0Xz1ZY34EHmC+PgmYz6xdunD3AqaVV
           4U+vuhftNLRmA==
Received: from 83.24.116.171.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.116.171])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <ansuelsmth@gmail.com>; 5 Mar 2026 20:59:08 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: ansuelsmth@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lorenzo@kernel.org,
	olek2@wp.pl,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: airoha: en7581: add crypto offload support
Date: Thu,  5 Mar 2026 20:53:11 +0100
Message-ID: <20260305195903.59776-2-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305195903.59776-1-olek2@wp.pl>
References: <20260305195903.59776-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 303be36492603e776a8e2b4ea6b63e57
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [Ido0]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_115912_317903_21F67B4F 
X-CRM114-Status: UNSURE (   7.96  )
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

Add support for the built-in cryptographic accelerator. This accelerator
supports 3DES, AES (128/192/256 bit), ARC4, MD5, SHA1, SHA224, and SHA256.
It also supports full IPSEC, SRTP and TLS offload.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
v2:
- drop extra new lines between properties
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ff6908a76e8e..5621473f5155 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -300,6 +300,15 @@ rng@1faa1000 {
 			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		crypto@1e004000 {
+			compatible = "airoha,en7581-eip93",
+				"inside-secure,safexcel-eip93ies";
+			reg = <0x0 0x1fb70000 0x0 0x1000>;
+			clocks = <&scuclk EN7523_CLK_CRYPTO>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&scuclk EN7581_CRYPTO_RST>;
+		};
+
 		system-controller@1fbf0200 {
 			compatible = "airoha,en7581-gpio-sysctl", "syscon",
 				     "simple-mfd";
-- 
2.47.3


