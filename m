Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82F4CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 13:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0iifLvTx2I1NvbTVPkxTfIoIccnSTeVcgYfAe87Lp9E=; b=vnIzHO1nCyczdUG7a0P79IprL4
	mBKCty83C03PBTtJNunuRTw5THTWfZfc1FxR7f1ErR9VcuSAfm3TbvASssS1PAsHT8q9sqcTN88H1
	QbqvwRhz/6KE0pc/Xn7fEuAfj+6Fgh+Pyi5iQ/3RXHQcrnol5E6qzb0G8AmMWapr2R3x1GS8NgOh+
	aP+bLPV3PiFoMQ9kSS72dFf+jZxXyH2Ml4n3phGxAhF1Nx2cd4Ap+0ceNOFTaW7q3SF4/IGnEwE3h
	Mxr/yKxipvIBHOPShnAgtRHXCgnVeBDtxZAsOOaEcPGEcq/XzjFA1TeO3AgPX9s5aeI08SSu2yx28
	SCS5NqbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR8Ca-0000000ExwQ-3Lea;
	Sun, 24 May 2026 12:45:08 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR8CX-0000000Exvd-2fSa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 12:45:07 +0000
Received: (wp-smtpd smtp.wp.pl 45103 invoked from network); 24 May 2026 14:44:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1779626698; bh=0iifLvTx2I1NvbTVPkxTfIoIccnSTeVcgYfAe87Lp9E=;
          h=From:To:Cc:Subject;
          b=FeIfMi3PI53+q04ACVXWYEVdeHMiTTAFgMOGjqkR9ZIXAxIP9c61E7znW9XbxB/TG
           uKR3ijiyJHxCDnPuT5ptDeHvdRBlusqrm55pZEoHnr7GTAIrqyhCSX3PCpF0bpMgFr
           CfMBRCjFFFaXM+7CbYcqh8NIE4W8gsWEh3jYxJ35XLCwtFODx7irQf1H44HfHIaAmN
           AXh1hPSrl/rUD7k3ZDDaaoZuURkK3AmZdYr8mjW8u1RMUIPg70lxcl3t0phBB0eunH
           IixxOqQuGIvffCIDeqF+Q1heK5KpsWD++92Rtd4kSR36NYgM3vE7f4k+nI170zSzcC
           vZD8zzPniwoyw==
Received: from 83.24.127.64.ipv4.supernova.orange.pl (HELO abajkowski.lan) (olek2@wp.pl@[83.24.127.64])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <andrew@lunn.ch>; 24 May 2026 14:44:57 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH] arm64: dts: marvell: armada-37xx: mark EIP97 as dma-coherent
Date: Sun, 24 May 2026 14:44:53 +0200
Message-ID: <20260524124456.350659-1-olek2@wp.pl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: b0c944afc73a131fdd57242ef64c7d1a
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [YRPE]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_054506_122395_1EB67215 
X-CRM114-Status: UNSURE (   7.05  )
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

Armada 37xx has coherent bus, similar to Armada 7k/8k. Cache
synchronization consumes a lot of CPU cycles. Enabling coherent DMA
increases IOPS performance up to 4 times. Some numbers:
					Data length
Algo		MB	   16	  64	 128	 256	1024	1424	4096
DES-ECB		1	+21 %	+5 %	+5 %	+7 %	+7 %	+3 %	+20 %
AES-ECB-128	1	+21 %	+6 %	+6 %	+6 %	+9 %	+8 %	+22 %
AES-CBC-128	1	+21 %	+5 %	+5 %	+5 %	+6 %	+7 %	+23 %
AES-CBC-256	1	+23 %	+7 %	+8 %	+6 %	+11 %	+13 %	+20 %

					Data length
Algo		MB	    16	    64	   256	  512	  1024	 1420	 4096	 8192
AES-GCM-128	1	 +44 %	 +42 %	 +31 %	 +32 %	 +27 %	+30 %	+32 %	+30 %
AES-GCM-128	8	+319 %	+326 %	+163 %	+148 %	 +75 %	+72 %	+74 %	+41 %
AES-GCM-128	4096	+123 %	+128 %	 +90 %	 +83 %	+116 %	+59 %	+38 %	+28 %

					Data length
Algo		MB	   16	   64	  256	 1024	 2048	 4096	 8192
MD5		1	+21 %	+15 %	+29 %	+25 %	+50 %	+16 %	+20 %
SHA1		1	+24 %	+22 %	+27 %	+22 %	+18 %	+20 %	+20 %
SHA256		1	+30 %	+24 %	+25 %	+26 %	+21 %	+41 %	+19 %
SHA512		1	 +4 %	 +3 %	 +8 %	+10 %	+24 %	+10 %	+11 %

Tested on Armada 3720. Platform passes testmgr selftests.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index 360fc24fdde2..8418777042b8 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -437,6 +437,7 @@ crypto: crypto@90000 {
 				interrupt-names = "ring0", "ring1", "ring2",
 						  "ring3", "eip", "mem";
 				clocks = <&nb_periph_clk 15>;
+				dma-coherent;
 			};
 
 			rwtm: mailbox@b0000 {
-- 
2.53.0


