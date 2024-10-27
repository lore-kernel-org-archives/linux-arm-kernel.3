Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF194D10C16
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 09:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gF4/ZNsAK1S1Q0ruvMfpDSairoKQHeLYMeqLyk6oG4w=; b=wrpkH6lHw002NIVasAHkMl6pFv
	K8+FZdH/bLS2kyPKnc9wyN5mcJyNdSVmNh01ZDmibTVh4W2pUB4ttRwJh9h1+/PPughLkkWYlYOXv
	Him1hS4rqS47ghiB5jeqT2je8VZyh6Em43NK7ml+WroZ6Ke91QHgLD+QE3Qpk8AFkC6lvgfUcWbfi
	LZNMJR8gvB5vEqLZHNhdWmUJlECkW7xa1Mb6gk1Mf0t0u7EImjfNOGbyVrIeK7UEgMSST1QYUQJ2Z
	JaPbQbiq/AamsmThReASHWI1Jr53/m56qpvHO4Y1/ZyOtPMnLztnagqR4mPhYFitakibT5bU5cGGG
	AzqdtVDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4zWV-00000007tjd-3yON;
	Sun, 27 Oct 2024 09:25:25 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4zSH-00000007stc-1mtr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 09:21:03 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id CF9EBA0727;
	Sun, 27 Oct 2024 10:20:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=gF4/ZNsAK1S1Q0ruvMfp
	DSairoKQHeLYMeqLyk6oG4w=; b=baGeHQDqsgDrw8XDXtru/hqaB85GLzQs+pxG
	DPh83UmEIplzNPbhvy9rAJjQZClXMkJz4AV0sCK+Hqu9jTjcqIjCIcktaxFbxvIA
	nMvvr6Qvz7hZexsPpUGN+cWpICUCRdvOChtNdArZ6RA+a6pfPjA4t1Lgl1ZNqchi
	mrShydZPbVNj/g1XRCpMKM3fudN9/Gxoa/ojZoGBs8tSjrHPhclFyb1wkhZhfIpu
	onECeRHPUFo+l2q7hOagQfQLJavsT4qpYIlVJfq3KVNAvxrNgqqLqdFQt3EGsGZ5
	jQfPgLPE1QKv77L0BD6shshgdvtwprTIpZ0lvybyYkpxw7sgOTfpqkzh7fhkx0aO
	cSA7BpxILhz0ovY282GRBIzAL+VWXpiUyX0aIgZUx/+iJC9RanqKSG8zuIFJt+2/
	nYgSwQ/ydBm9XGt2KSEpGfnuqiq3l8x8hE/Lq7MFXM1dhyP4da81Prr8kTmALnV4
	zCrUxNQ0LqynZi/lgHa1JY9wzYhX8kSd8aULucKR3uoKCcnoaNapY9ON4QzasuqX
	+GxWd4arWZnIf+Iu+AJeQCYt/UsGUPNDyikdyYfzFpgYx88xtzizhhk6LPgxH+Mg
	cPTcZxQv4JGhIksWoqBK/pZkueM9GZIGSEPltyNHpJ25uVHLq8baaCLZBlZoeMhA
	eVX1gHI=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 05/10] ARM: dts: suniv: f1c100s: Add support for DMA
Date: Sun, 27 Oct 2024 10:14:36 +0100
Message-ID: <20241027091440.1913863-5-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241027091440.1913863-1-csokas.bence@prolan.hu>
References: <20241027091440.1913863-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730020859;VERSION=7978;MC=281948352;ID=156041;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855677D65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_022101_683582_B32EC32F 
X-CRM114-Status: UNSURE (   9.67  )
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

From: Mesih Kilinc <mesihkilinc@gmail.com>

Allwinner suniv F1C100s now has DMA support. Enable it under device
tree.

Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
[ csokas.bence: Rebased on current master ]
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
index 3c61d59ab5f8..290efe026ceb 100644
--- a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/clock/suniv-ccu-f1c100s.h>
 #include <dt-bindings/reset/suniv-ccu-f1c100s.h>
+#include <dt-bindings/dma/sun4i-a10.h>
 
 / {
 	#address-cells = <1>;
@@ -159,6 +160,15 @@ usbphy: phy@1c13400 {
 			status = "disabled";
 		};
 
+		dma: dma-controller@1c02000 {
+			compatible = "allwinner,suniv-f1c100s-dma";
+			reg = <0x01c02000 0x1000>;
+			interrupts = <18>;
+			clocks = <&ccu CLK_BUS_DMA>;
+			resets = <&ccu RST_BUS_DMA>;
+			#dma-cells = <2>;
+		};
+
 		ccu: clock@1c20000 {
 			compatible = "allwinner,suniv-f1c100s-ccu";
 			reg = <0x01c20000 0x400>;
-- 
2.34.1



