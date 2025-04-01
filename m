Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48368C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 08:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bwf1cKM342nv7A9iJ5fIu0Ril7mFeq2izCWOVw37GCQ=; b=iMrFPzmAO7L3HnnQMR/KfMqobv
	KfcJ4+ESaZVfLmuKfxrumD0WQuyOST3DZ5aUnbNhcXDaQAt/SednBMxZgNKgd2434Pfj6OX54hz5D
	kwFJI7XaFTULNoaHekIwBEeh2NKPSHMDkb/0BWKtoGg+8IfDDM+RpndovoQxx2JpS7yqUncOZEhgB
	KvH0nCwCouPvBuQaYoIjtkaqU5DRxysD6a3DhArHDQFG0725w8SCb8AU6CfPu2sRH2xqPvIt782X+
	FatCEue63rAy2Mj3zZE9LAMvDBh8e/MzGX2S8h2b0NtNAzQst4QmWrZVe0j/b+nnunXrdEZkfgjdT
	53wMuoIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzX58-00000002LCs-07fd;
	Tue, 01 Apr 2025 08:34:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzX3J-00000002Kv8-2wA7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 08:32:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1E064A41951;
	Tue,  1 Apr 2025 08:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605F5C4CEE4;
	Tue,  1 Apr 2025 08:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743496376;
	bh=UqgS99roY25RNojS081Y3MkvepLzF+PS+1yR4MUWOfk=;
	h=From:To:Cc:Subject:Date:From;
	b=ZfOdmqa8+TL4XpP2OBcuwqdpODAS43xk82Qzz6ZrvWnCaju0PcAz2rlS0rfI8Nm58
	 mQq+UV5kHDfZqKVWArgAnnGq5RolcpzvU5O2q1IHSMFCrMgYBDWmDd/Kll8tUvzuIK
	 rID/+gBvNAMktHNqTB0oEEmUVS/OHbnW5gVI/bgh450wxqlLI4hcnpEBEA5z8tbrtf
	 OxaCdAdgqDU4kmCl9UavjHm7iliwZzbfMBxADkVNEeXafLJQYUrTAfWBO2uP5EYtuS
	 bCjWONpOOUNLXkpFgabG/2OeALmVDNoVBP9ZEfhmxmEFTK0x81ZlZ/N9Pp9W62JHoj
	 42mZIZa1tqlnA==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2] arm64: dts: ti: k3-am62p-j722s: add rng node
Date: Tue,  1 Apr 2025 10:32:46 +0200
Message-Id: <20250401083246.3228964-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_013257_908729_877F6B77 
X-CRM114-Status: UNSURE (   8.34  )
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
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 6e3beb5c2e01..7b65538110e8 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -227,9 +227,18 @@ crypto: crypto@40900000 {
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
+			status = "reserved";
+		};
 	};
 
 	secure_proxy_sa3: mailbox@43600000 {
-- 
2.39.5


