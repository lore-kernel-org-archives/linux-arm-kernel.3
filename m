Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B736C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 07:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgchbaVFzPJqQXOWToo7Y9qgw7vfs1kKJJmGUjLFVbU=; b=iyH9j94ajDOt+TOIdKI2IS1BtL
	WB98DUo0ab/Q5V3Ga/rOQskbi/RL4qjEyuKgnZCwxZBENmVbJkogOK8BajsXl5xnHDwPGYHGU8xdD
	Vl86oGs5e5pdr9M5HZZqBOkiB3PJauVUOca1wfUk7iUV8A+1JiYy2Aj72VnN8chKfNiO73w1bXjPS
	vST6lu3pePPfdFhOSkcbPp+uWLb6JCBf8jF3bsmpBBd8BbChym59py94oG8j+awSQzmAsajUCrOn4
	DBg/q7Vx/oonaL11c2bphfkWVE3I0LR+xdgOEQvNqn5TpGGXsiXyBtoPJZUcq+g4HXsbcVc7KdLCk
	mqjb8l0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhFi-0000000Apf7-34fw;
	Thu, 26 Jun 2025 07:42:34 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUh6n-0000000AoRN-31rN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 07:33:22 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 728A025F96;
	Thu, 26 Jun 2025 09:33:20 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ttrd3yj_m4ac; Thu, 26 Jun 2025 09:33:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750923199; bh=azo+dF0/vQXfWfiOeYfh4bE+wwsnpSA8HM+IBY43R8w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BwryadrcGi3V9qOdtqjbsTAsNbxlGTkwycy6VP7YbAqFisQeViuW2pFckeIdxOWZS
	 EJVu68Kuv7kcyr+1CLW/1NVwD6HcdfPYDzg5KvXc6ureq/9L5ErRwqPAA50wq2qPiF
	 wAXTNPWuRANvl0uPJNVtqLJkiu43BVg9FySOoOFa5jImb0VP6NuEbe+5AFf7+FQzRl
	 pBMCoC4q8Abw/B0CxDUlzkmgDFMiBBEKpLiwuhFAu+AXp3tmJOWunfs5zwlfgJ4RAJ
	 lrW8UOejR/maiIYR9VZWzrA94h8lFia6EhIygqA0lFxSWuiF9lFAyZIPT/691wo2iC
	 4a1aLdsfc0n6Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 26 Jun 2025 13:02:58 +0530
Subject: [PATCH 3/3] arm64: dts: exynos7870-j6lte: reduce memory ranges to
 base amount
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-exynos7870-dts-fixes-v1-3-349987874d9a@disroot.org>
References: <20250626-exynos7870-dts-fixes-v1-0-349987874d9a@disroot.org>
In-Reply-To: <20250626-exynos7870-dts-fixes-v1-0-349987874d9a@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, stable@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750923181; l=1280;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=azo+dF0/vQXfWfiOeYfh4bE+wwsnpSA8HM+IBY43R8w=;
 b=6bBR/hVe24hlOvDEHg/XhfcMj1PPn1XlpC7I+O57R0KzlX7oAUaImRFbeywRHbBaGWTyQDu0/
 ca8fmbAZjOAAUkr648+JgB2wQrmbtfncfIOmIITPouAKGnb3Yl2I1GR
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_003321_895350_B0CCA5E0 
X-CRM114-Status: GOOD (  10.78  )
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

The device is available in multiple variants with differing RAM
capacities. The memory range defined in the 0x80000000 bank exceeds the
address range of the memory controller, which eventually leads to ARM
SError crashes. Reduce the bank size to a value which is available to
all devices.

The bootloader must be responsible for identifying the RAM capacity and
editing the memory node accordingly.

Fixes: d6f3a7f91fdb ("arm64: dts: exynos: add initial devicetree support for exynos7870")
Cc: stable@vger.kernel.org # v6.16
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
index 61eec1aff32ef397c69ee3f0cba8050755f74fc6..b8ce433b93b1b488da31bbe4846f8092243611ad 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
@@ -89,7 +89,7 @@ key-volup {
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0x3d800000>,
-		      <0x0 0x80000000 0x7d800000>;
+		      <0x0 0x80000000 0x40000000>;
 	};
 
 	pwrseq_mmc1: pwrseq-mmc1 {

-- 
2.49.0


