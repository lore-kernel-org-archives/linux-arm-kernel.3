Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAF0E67A8F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 07:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkDQW3m0uYKl6XM+u9Qvt0127CCDv/2l0Mb6sOEBzz0=; b=FDLNYgH6b/ZkMB1PkKRBNigIdF
	7wgERaNhjNXVUGwd7zIeSPbgO9IU+fddVym89aLRaxZUlv6djPa5uwbexmyJL+rIfIntkEC9x3++F
	yV7vHyKOHgCBq4/cA+occZ3atHYPh2T6FEmDN0qa6cF2x1lL10zM+6Ya32w74TpIVSnEXeygasptl
	qbpN0e14JxGn6M1r+pZfU3WfamC6zlLZsdyns73GLdH+QSsYpBUfe2nyCJcmV15T9+fdTdTDny7mT
	GyFm8kXdDm2sA29GEMbV6LK08lWIVNdJR9DfYcSu6Bahbrm+oaA9o0/nMEmf51dyJDFNNMM9UuoHG
	f9xfC7Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKCb-0000000Eg0H-4B9h;
	Tue, 03 Mar 2026 07:29:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKCa-0000000EfyD-2WUl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 07:29:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0EFF9600AE;
	Tue,  3 Mar 2026 07:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0E6C19425;
	Tue,  3 Mar 2026 07:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772522995;
	bh=kldkEUcsu7/3naZKUYV+6QtB1p++L0wVmQijmSfs19A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pq+wJ078AZyFAtOCZvMkU5f2xi1vdEps0XMpkZlgLdx2tKFMbFXl4/yhOqbzjTSKS
	 XL2jZTPEwrQsYPzPg9e8X6zofKicPWI9ALYwxLigb4i0ncpAu2AnsJZle/Dt8ZBMHD
	 VvY4zUS0u0YBW8aIqx2TOFTzYPuafwmqDNIH2Uw0RA0PJAp5tq4Aa4ajNL/0dI+nZT
	 UKN4a2dAiVsVCC4gJvIivw5kiKkdpmfFBCB9ObiyK6tu6mE/M7X+6v8WJkUsu7vtw1
	 NiH+SkKkRRWqetl5ofWl3NDPpH1jXG1BDBm4N4Ka615ot2y1aPYWP1Bf+zuOvcAecf
	 kbyTq+bc3744A==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 03 Mar 2026 08:29:40 +0100
Subject: [PATCH v2 8/8] ARM: dts: gemini: Correct the RUT1xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-gemini-dts-fixes-v2-8-5b92ced841ce@kernel.org>
References: <20260303-gemini-dts-fixes-v2-0-5b92ced841ce@kernel.org>
In-Reply-To: <20260303-gemini-dts-fixes-v2-0-5b92ced841ce@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

Fix two problems with the RUT1xx device tree:
- The memory is 32MB not 128MB
- The console is 19200 BPS
- Activate the PCI
- Disable the unused USB ports

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/gemini/gemini-rut1xx.dts | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/gemini/gemini-rut1xx.dts b/arch/arm/boot/dts/gemini/gemini-rut1xx.dts
index 0ebda4efd9d0..4bdf86bd7c23 100644
--- a/arch/arm/boot/dts/gemini/gemini-rut1xx.dts
+++ b/arch/arm/boot/dts/gemini/gemini-rut1xx.dts
@@ -14,13 +14,13 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	memory@0 { /* 128 MB */
+	memory@0 { /* 32 MB */
 		device_type = "memory";
-		reg = <0x00000000 0x8000000>;
+		reg = <0x00000000 0x2000000>;
 	};
 
 	chosen {
-		bootargs = "console=ttyS0,115200n8";
+		bootargs = "console=ttyS0,19200n8";
 		stdout-path = &uart0;
 	};
 
@@ -113,6 +113,10 @@ gpio1: gpio@4e000000 {
 			pinctrl-0 = <&gpio1_default_pins>;
 		};
 
+		pci@50000000 {
+			status = "okay";
+		};
+
 		ethernet@60000000 {
 			status = "okay";
 
@@ -124,13 +128,5 @@ ethernet-port@1 {
 				/* Not used in this platform */
 			};
 		};
-
-		usb@68000000 {
-			status = "okay";
-		};
-
-		usb@69000000 {
-			status = "okay";
-		};
 	};
 };

-- 
2.53.0


