Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A3DCD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bSsFCkjOjYV4eMMEoBW3s+nA0FRIZdtOifY1Ll9jRo4=; b=wuQ31sDMz9iECnpCvwIjxlWM16
	h7/oa8wsQXfURG650rnhBdncq4ZrtH1M7VnqvxsoWe2hGoBV58lDMv4ji5NlgwW0UgvjZ01PTJ0zc
	GF67Joq0Pk0LynaF1LVXbWTj9iN0OYN47hqkR6VcPVQWU0HWaJRK/GdQ3MIqsd2mAF6HmKgfvE8Su
	vn1DvJ0i2dyA+bWYkt+37FRLqQcrVM66dTeoQUCWxkOnV6h/VXSjR0OHrOWQN/GginA1GcRP9zyee
	Yr6z/Ompp2jI8mfxx/f9Xmz6D/SYVf3HMovF63VQPxrhMFPTn5r4O8phpcxyep9AzSpQ6hVXgV2zE
	a5bSAIyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCCP-0000000FgGw-1pbi;
	Tue, 05 May 2026 09:36:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCCN-0000000FgGR-2dRq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:36:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F2D96012B;
	Tue,  5 May 2026 09:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739F2C2BCB4;
	Tue,  5 May 2026 09:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777973774;
	bh=snZU2O2/tFVxCxfE62Jr46UfgTfqqKdl8nNtcogCPMs=;
	h=From:Date:Subject:To:Cc:From;
	b=V3MNQnbZ7QMLO61GDboeAEYlPjXoIOj8gbFxVnLLHxQ5z2zGnEzp21oFZfFmK9p7D
	 aApklVgmg2wIl6jWlM0gI5pK49gIbaHPMYksJKtJyHpY4xlJCDvZAzIl06wTO6Xukt
	 wZgRgWUzSoMccfM9/kWDZ72rboDx7hQ7GxSzIdt8Ut8E1L9iCw0oeqly2NU7hLBHCU
	 QYTaI4Yx2S6GS+w5Lyznp2j8xvye2zJrDumkpSJ3xKMsNMzjoxltli/WVmYtyKdfsy
	 cqwMlxvsjvv9sqiu1dBajWNuOU2C5Hp74Do0UHE88gx38kES0Ng2dASV8zqpk42ZX9
	 29zh7FHVtns9w==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 05 May 2026 11:36:07 +0200
Subject: [PATCH] ARM: dts: ixp4xx: use phandle-based GPIOs in mi424wr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-ixp4xx-dts-v1-1-02f4a92a9697@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSw5AMBRG4a3IHWtSjUfYihgUP64B0os0EXtXD
 L/BORcJHEOoii5yOFl4XQKSOKJusssIxX0wGW1ynelMsd9S71W/i7KJaaFLWFuAQrA5DOy/Wd3
 8lqOd0e3vge77ASqGSd5uAAAA
X-Change-ID: 20260505-ixp4xx-dts-a12be09eaa7e
To: soc@kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mohamed Ayman <mohamedaymanworkspace@gmail.com>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
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

From: Mohamed Ayman <mohamedaymanworkspace@gmail.com>

Convert remaining legacy integer GPIO specifiers to phandle-based
descriptors in intel-ixp42x-actiontec-mi424wr.dtsi.

All other GPIOs in this file already use &gpio0/&gpio1. These are the
last remaining legacy users in the IXP4xx DTS files.

Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
Link: https://lore.kernel.org/20260428191029.809462-1-mohamedaymanworkspace@gmail.com
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
index 9b54e3c01a34..3043ae7232dd 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
@@ -195,19 +195,19 @@ gpio1: gpio@1,0 {
 
 				pci-reset-hog {
 					gpio-hog;
-					gpios = <7 GPIO_ACTIVE_HIGH>;
+					gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
 					output-high;
 					line-name = "PCI reset";
 				};
 				pstn-relay-hog-1 {
 					gpio-hog;
-					gpios = <11 GPIO_ACTIVE_HIGH>;
+					gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
 					output-low;
 					line-name = "PSTN relay control 1";
 				};
 				pstn-relay-hog-2 {
 					gpio-hog;
-					gpios = <12 GPIO_ACTIVE_HIGH>;
+					gpios = <&gpio0 12 GPIO_ACTIVE_HIGH>;
 					output-low;
 					line-name = "PSTN relay control 2";
 				};

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260505-ixp4xx-dts-a12be09eaa7e

Best regards,
--  
Linus Walleij <linusw@kernel.org>


