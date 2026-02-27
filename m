Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7366BFD5301
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 07:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+OyIG8L5lUnSzqui3PDiKfJWcI2MdpJ6ykHpARa30cU=; b=SQJeXki+YI0RMKJqtKNmpafoEY
	pFV2gtKWknuFVYvEKuyxNNbhTQbKweGcvNQoXVkIg/YcuzY/G3W2QIFvWRA4cD0Z12tTcaalfpXx9
	5FfauoUhTQ7fQ574irCMcVbrMg71cBNQvmLea7dSSAAG4bLT0GGdi2WDDWqkp2y7tjYtrUZ7WTYfI
	BAm1Ydc2mf38ykfN5FdOCnuiKVWphdQX4D4/pnxtYLbvXpoohYOxfOhPFMjL+kLreZuGxcAvP1o6d
	52ht8WTDrCBT3wnkeh3dvJN1BgOjVnea/Oi9cdHzw+XM3b2NmNiBYJiIKPlSci0FCJG621Ztg70U0
	ue1u+fyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsB2-00000007sDY-1aK6;
	Fri, 27 Feb 2026 07:22:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsB0-00000007sD0-20jO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 07:22:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 245E5442E3;
	Fri, 27 Feb 2026 07:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D81C19421;
	Fri, 27 Feb 2026 07:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772176938;
	bh=z+dkaNvhlWyuSR+41jisptO92s8T16Uh6hMmGKmav1s=;
	h=From:To:Cc:Subject:Date:From;
	b=bSzmV6TpnkDmJfT6r9mzcs6qtvqJPsnKKJDn9LxJasfEBXGAys6x3ddF1dWJClGs+
	 M8T1TtID6NI2glSAzjEgh3kIfXsnE05IUlXy2qevGQ6nvE7Ave9NBIRxPR91vvlWJK
	 dOZsO5KXwkjQb+QWsKyPIuZQa/wYe88sfAHWqwchEn2MrClmIBbS+MYmU8KNaIOgKQ
	 uN5kInDTt8FX61J6WN78MjE5/C4gTz8CAe0bAihoYo3wmh06Zec6jRoKvqRJUTADzS
	 NySHkJpEVsVjmrEAezvdtVgi1QDjHLZZPwijJLRxHEg+YfXNTTWSpjr+RnpMgilv1V
	 vCCWzP0zSJalg==
From: Shawn Guo <shawnguo@kernel.org>
To: Wei Xu <xuwei5@hisilicon.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] arm64: dts: hisilicon: hi3798cv200: Add missing dma-ranges
Date: Fri, 27 Feb 2026 15:22:10 +0800
Message-ID: <20260227072210.1350159-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_232218_539678_5C539507 
X-CRM114-Status: UNSURE (   9.30  )
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

Reboot starts failing on Poplar since commit 8424ecdde7df ("arm64: mm:
Set ZONE_DMA size based on devicetree's dma-ranges"), which effectively
changes zone_dma_bits from 30 to 32 for arm64 platforms that do not
properly define dma-ranges in device tree.  It's unclear how Poplar reboot
gets broken by this change exactly, but a dma-ranges limiting zone_dma to
the first 1 GB fixes the regression.

Fixes: 2f20182ed670 ("arm64: dts: hisilicon: add dts files for hi3798cv200-poplar board")
Cc: stable@vger.kernel.org
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
index f6bc001c3832..2f4ad5da5e33 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
@@ -122,6 +122,7 @@ soc: soc@f0000000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0xf0000000 0x10000000>;
+		dma-ranges = <0x0 0x0 0x0 0x40000000>;
 
 		crg: clock-reset-controller@8a22000 {
 			compatible = "hisilicon,hi3798cv200-crg", "syscon", "simple-mfd";
-- 
2.47.3


