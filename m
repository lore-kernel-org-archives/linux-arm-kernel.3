Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158F5E7716F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 00:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0TfKIJhJzBxEoeio8uyUm+I+RQoIvnhme6u8bHSaZ0=; b=h2r3ITsICk+WhDbfZQImXyaJ2P
	HCjYXK9+HZwctxhSYUpuFIwG3bUYeqnt2a746Ah39Y2IXRHSrMnTV62GJYymYBhazOxLL6qzgkCYO
	3ZoYJf0suMUx10o3rbm7AiXUNklVJI3vjL2O5XxBKtSYzu7KlpaPVi8nuewF+UKX3vL/iWlCniIu4
	7vsaDvNQOOSx/goJC099VKp92h6auWGC2XsTSu2Xk/RE8WVYZykoo54CxEpGXl04oRXcFYBOcfPOh
	oAIMiIlQH2g0BrNDTY9R1TLX5OUoYOAgLgc0NXPnYxxgOPZAhgIx6vQGY/XZLGHoIYhxlmBZqyRJG
	GoFvZgZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzNz-0000000EHWo-3ruD;
	Thu, 05 Dec 2024 00:06:27 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzL1-0000000EGzG-3RxS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 00:03:25 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 72197A0E95;
	Thu,  5 Dec 2024 01:03:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=J0TfKIJhJzBxEoeio8uy
	Um+I+RQoIvnhme6u8bHSaZ0=; b=kUx8ZXZIASMhlIZ4TiYdy/pZZQmwnG9HM5Fb
	XQwD6yYUH14Yd/8ACjYsThgwfl6VkLFKGd09+UJOjcsXk+Tcfui2en1+tIGYxAM+
	dUgbwBjmkXn7n1xMZmKpefi/4EkN+Q+63tLQwdB60GeDBrGbt5fagW6oH6H2q6WQ
	jy3MN3sQOPa3L4C68I3LL7xJMfjrix0Oa94D1vR/IUMSSP9LShi9T/LwtYf3TgQM
	8r7gEGN1BgWHDeDgKxBlAFDqcxo/IXQOM3TAWgtKzszQQReM7YmBU6VftyOGaaFI
	ItzZykdSr3dhSDHnN9CnkVpa64IZaVCALFo+tKtFyYPaykk8MNVWh6Q+yG1tgbez
	KXHjWgaue2d/1g3mrnQt9PiLU0GKphI5MDTGZ9IP34mPNo/RIu3KN0IMQzd/eg8c
	HCLz5NmcYDrJx5TQOxqISIy5rxNGL4OSElES0t6RIQIe2ncmZLJkzoHHhae2ZIWp
	K852ZSDaUAqu4V1f9vnZyEy6Afv3qV8a3BdVoSI4q5Z09KmG/hhvGcb/xPXttgV8
	jsHTQPqsIYiBofEDLwjdqTzmU+oQMJ9SyhKNXtGS+64UShbXC/Km8oiJBg6XsZ6K
	kPFhDM2Oh4SlCXLXpCerNt2XJMoZkTl139rhbf/TesigfARmig9awebCOO/XVizn
	BXjKIaM=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH 2/3] ARM: dts: suniv: f1c100s: Add support for Audio Codec
Date: Thu, 5 Dec 2024 01:01:37 +0100
Message-ID: <20241205000137.187450-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205000137.187450-1-csokas.bence@prolan.hu>
References: <20241205000137.187450-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1733357001;VERSION=7982;MC=2297510142;ID=169668;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855627561
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_160324_014254_3970A45B 
X-CRM114-Status: UNSURE (   8.54  )
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

Allwinner suniv F1C100s now has basic audio codec support. Enable it
under device tree.

Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
[ csokas.bence: Rebased on current master ]
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
index 290efe026ceb..e4b41bc93852 100644
--- a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
@@ -336,5 +336,19 @@ uart2: serial@1c25800 {
 			resets = <&ccu RST_BUS_UART2>;
 			status = "disabled";
 		};
+
+		codec: codec@1c23c00 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,suniv-f1c100s-codec";
+			reg = <0x01c23c00 0x400>;
+			interrupts = <21>;
+			clocks = <&ccu CLK_BUS_CODEC>, <&ccu CLK_CODEC>;
+			clock-names = "apb", "codec";
+			dmas = <&dma SUN4I_DMA_NORMAL 12>,
+			       <&dma SUN4I_DMA_NORMAL 12>;
+			dma-names = "rx", "tx";
+			resets = <&ccu RST_BUS_CODEC>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.34.1



