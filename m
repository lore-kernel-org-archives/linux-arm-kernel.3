Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E97F1048924
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 00:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkDQW3m0uYKl6XM+u9Qvt0127CCDv/2l0Mb6sOEBzz0=; b=V3mxDTDqjQXI7+EVqCtjbch/Cn
	ckjXatkK4bOD6rvX9VfLbugs3V52RwjmL/EEOnXBuEDAEHAF0YhaQgVhlfRC1+d1hZagdx5FEsL9n
	WJbeVf54rFecJjodIQ/lKO47cZ8Uoj85hk4e2PFicWn8en3BKyP0xGSiZCg0Wu7yNmC7rV4MLrmUQ
	+lab3WJn7TtasqCb6XObo31Gi48MwToob5CHSngjLMm6hCfm/C7YnW2F6LGCV6SoCgkRu6OvxzUBx
	yERPij3QlgRiTKFEFZFcrMiBFtkSTydJ12AWCM7pRxUFvgt/xip1VxkTioaZFnCzaJaA+IHASuFMO
	Pa5c3ARg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7qT-00000009ISG-2DKc;
	Sat, 28 Feb 2026 00:06:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7qM-00000009IO9-0KCl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 00:06:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BFCB4062B;
	Sat, 28 Feb 2026 00:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4BABC2BC86;
	Sat, 28 Feb 2026 00:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772237161;
	bh=kldkEUcsu7/3naZKUYV+6QtB1p++L0wVmQijmSfs19A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AIkf/Om+zd4R1CQfc+hHUdAQjEfKTnOptadEVGaNAFsCzN2aFfniKT8Ty2GcU4AVC
	 81XwNwok9XSHcD3m3ZyYxnvan3sHWyf1btmSuJP/esDUbtyOnpG1jE/9Aa21y9KGlR
	 bmdDM93VnbbBkbERRyfP0s1/iKDGrsxRJLEF672oZ3q3Fqb83FZw0phX0EjdOTYigM
	 mq1ljQeEG1lJFhmmJL1ZZygXua5znX4hEDgEbxHQhwq+Hx1hLqKhWsH0oOdWfaboz6
	 tXl6uM4ciMbtKXee5Ptvcw9CSpOq5a9WZHvij40Nsz5JE3ivOjEt5SCv57Led966Nf
	 nEgiy3mJ9PWXg==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Feb 2026 01:05:48 +0100
Subject: [PATCH 8/8] ARM: dts: gemini: Correct the RUT1xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-gemini-dts-fixes-v1-8-0c6f6d0fb4bd@kernel.org>
References: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
In-Reply-To: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_160602_172053_B33B3DBF 
X-CRM114-Status: GOOD (  11.54  )
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


