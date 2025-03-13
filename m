Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E90C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 15:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ahKNJ1K4cQrASC6eYVYW0EeOemqP9AADaDfTU2W6hM0=; b=kwcdX+FM69lf3imBw4g9joNd8U
	Mp2DkgwjCXIdrztqkjdPZBB6NAh4shbyDP5uYp5XCEDo75n8fG6lqQnMnKNt93uMT+mc3sJi9hFR+
	Mt6hcmFjHkrL5c7GM+kxIWHCMCo46HuzoDknOCAAtI1V4GAWWdniWrAYZ3P8GDggeMesX3+tCBka+
	DxJh7RzYCuYT61WMr9OMxtDf+v5nC3LfxiNkSBIA8+p95BB9W13juEqWQG2v808Seo7TbV0v1/HsD
	Vsj38nAx+O9736XS011OaB1BhXjRCK07rnOjde0THSTe7gCSttG6zjhRYfL/z4ob1+KcLzmej2ypM
	j7Tb5BCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tskpm-0000000Bi5t-1IET;
	Thu, 13 Mar 2025 15:50:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjl9-0000000BZNq-2Wnr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 14:42:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 793F5A47524;
	Thu, 13 Mar 2025 14:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4141C4CEE5;
	Thu, 13 Mar 2025 14:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741876926;
	bh=OqmxZ0VZnr16HlRT5VfWg8ZyCe63kc9gmBUWsIt79+8=;
	h=From:To:Cc:Subject:Date:From;
	b=WPn4BgYoeIEGfTC75rPPB0YmdhCcuNobSsfJMMyruuDpY4eR2et6+TZnf4/0LXQSr
	 tfYu1KOuAzHpCuW296x+tDsESkQR3TO3vGqjRtHLo+EykkQSBv+dTaxIh5VJuRoWqb
	 pK/gOpPQBnN4T4pCtIgQwz7Ki3QmWHDF1YXMsQOD4DXq25LarnKdfgMuiwBIummy+4
	 +rnHug5ThUP9ZYWI5pUqsBVFuOIeaQxCCMCq1Sq2gISZhs8euORfjsLsTg860i1H3c
	 B9W2Vi4aAQfJK3u/ihs1aIuPdBcXmC3zlbeTBB+4aRWzSlpAbyCD3q6+3cXPaY6d7o
	 LJRPovaOPkQUQ==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-am62p-j722s: add rng node
Date: Thu, 13 Mar 2025 15:41:55 +0100
Message-Id: <20250313144155.2382316-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_074207_701704_2B4A7572 
X-CRM114-Status: UNSURE (   9.46  )
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

Add the node for the random number generator inside the crypto module.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
This was tested on a J722S/AM67A. Also, according to the TRM this is the
MCU instance of the SA3UL. But it's defined in -main.dtsi. Is this
correct?
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 6e3beb5c2e01..e868e006318e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -227,9 +227,17 @@ crypto: crypto@40900000 {
 		reg = <0x00 0x40900000 0x00 0x1200>;
 		#address-cells = <2>;
 		#size-cells = <2>;
+		ranges = <0x00 0x40900000 0x00 0x40900000 0x00 0x30000>;
+
 		dmas = <&main_pktdma 0xf501 0>, <&main_pktdma 0x7506 0>,
 		       <&main_pktdma 0x7507 0>;
 		dma-names = "tx", "rx1", "rx2";
+
+		rng: rng@40910000 {
+			compatible = "inside-secure,safexcel-eip76";
+			reg = <0x00 0x40910000 0x0 0x7d>;
+			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 
 	secure_proxy_sa3: mailbox@43600000 {
-- 
2.39.5


