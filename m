Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3B2D68BCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 19:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lfnzNYMPqZwAWrxK6RgZvf+azFIVF/KDFIHnkiHD/aU=; b=DFAEtnowbcaXA8NxH8AEa013tc
	5BiSgSNYnl/RK31XOYKC4cuQA1ajKxgQ5Dbrbee12tXooDEAH9gTTirQ80Q5/nMMHPTWU4/ccPdnw
	Fn9UrsWYadtvyyOynxiV0vTir0thWf772AdIDgQspAFag1ghDOcfy5AK8F2Oo1FlyTqG86PeLG5cW
	DB4lQndYczgssADnt5Hmgg7KbT4dQF+sQnM6wR87T2+et2kGhL2viuW0atp5YIjBiLKbuyOIwXCwC
	A9wZ3d1+FR//eVBPAtK/2uJjqnVWNL2sq9Zsx8EzIeijFXWEPDrL71Ds1UafXsxNy0vD2qb8bGsoz
	mfAyzPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC28A-00000003sRd-29kQ;
	Fri, 15 Nov 2024 19:37:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC25t-00000003rsM-3hPi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 19:35:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4B522A42BC3;
	Fri, 15 Nov 2024 19:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C1BC4CECF;
	Fri, 15 Nov 2024 19:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731699300;
	bh=cmST9DFI8ds26UZFq/m/WSYh7IDIxmikdV0lJCKC9ZA=;
	h=From:To:Cc:Subject:Date:From;
	b=j5UryV3LaOLA3YOK0yVvdYTxviiVdsA1cYD4efiLanuX/gvQCUC3njDN24RsBQAQU
	 8YiRBKYktuisyuLV0G12QIk2H3wK/lH3gQBSAkKT5N4NOSsL5xOHk3ewDwMGNxMXaO
	 bTAovmY260amQh7gVegxljYAB9qS33Df606ajL3j7XFb04lXgQNjUED6eBqYk/1dmS
	 l08WDgyVJHORcgbpYx2tyCq2eNT0Mj7+TyJgAn+Ya7FTpBLCoAZtapa9Q3+/F7q9i4
	 LHFLyfqNnrQnkhB+jgiaKfRi4dlkA4sTqyvDw3rVpGIi2qH2RDZ+m24q7EAI3B3SuG
	 Lac+eGQ1iBPRg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wei Xu <xuwei5@hisilicon.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: hisilicon: Remove unused and undocumented "enable-dma" property
Date: Fri, 15 Nov 2024 13:34:53 -0600
Message-ID: <20241115193454.3619297-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_113501_982444_3CF58B83 
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

Remove "enable-dma" property which is both unused in the kernel and
undocumented. Most likely they are leftovers from downstream.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index a589954c29e2..12f621cedf89 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -728,7 +728,6 @@ spi0: spi@f7106000 {
 			reg = <0x0 0xf7106000 0x0 0x1000>;
 			interrupts = <0 50 4>;
 			bus-id = <0>;
-			enable-dma = <0>;
 			clocks = <&sys_ctrl HI6220_SPI_CLK>, <&sys_ctrl HI6220_SPI_CLK>;
 			clock-names = "sspclk", "apb_pclk";
 			pinctrl-names = "default";
-- 
2.45.2


