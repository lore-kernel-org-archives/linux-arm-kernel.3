Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DA8E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 00:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gF4/ZNsAK1S1Q0ruvMfpDSairoKQHeLYMeqLyk6oG4w=; b=L2dyofrCBE00qJFGqGXHvwV0n5
	dzo40wyV+37seMe+iQAHZr8KJ2miUkz/KCISiIGLnoj/gg+AHVEdkTuTglLF0yOuEhKFA8LgIBnEo
	LVC/WAm9VbmHMMs2kC8g6uiSIDcK5Xlf5kn2MvEHHwvGKhNWiIVEJCOnbzNCIbMo2sOuqMd0u9zKt
	M/nZ6OCYPdUhXGhlhCUH3aT6ih91H4k9q4J1FLBxop4KBP5Z4upN5UeAfUMq9ubEptEhs1kpy+K70
	NVYU/5m2vX0RLi1yWbyNjfUUYBBQ3Dj81F2DBOLUGAY2QtDY6eM2mutyOE6tx+5EUzoak6y12odNo
	qyCFJGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzM2-0000000EHDz-27yg;
	Thu, 05 Dec 2024 00:04:26 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzL1-0000000EGzD-0EiJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 00:03:24 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 61CF9A0E4F;
	Thu,  5 Dec 2024 01:03:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=gF4/ZNsAK1S1Q0ruvMfp
	DSairoKQHeLYMeqLyk6oG4w=; b=Loe0OhO78keO1ZI0hJt2c3d7dv9aMV2/f/bW
	j6wlV07/b511+kMrUTxWjj8E6ngQB3w96JzFExXs/a3Yq4IJOX8Ux8EaMQyZGNRv
	g+k9PEj3Fa2JLXwlsVXnvUBXFp6/X4EleyuQA198Mi1Y6Bhs2KpjYho0O9N21wGN
	DRTYazKDQmI2uZhVmy2wzkjS3jnI8As5MSka0rb6gpEowm1ybO9wpjdU6JUZgfpc
	++f4+QbZNV0YywfPkFSZuPwAJFb39vGUJvXTsVlZPyXetxaU2ZB4RTWHM4LfYof1
	e44+fYyF2cZjsbggTtRVyEYpE7XzTZrr4+pB34d/UDK86n4GbciicH+iDxIo7LS7
	xWLZREHF4df37jTM0ALS788iBbv9uEA4y3KBxuZIqzxry+AitY9OYTetwm7OMWoC
	ZtlRn9C64p56MwydVX1t/xXzGp1Vg6KZmX9UqjFb1Pq2Puo+Kmgw/g5oopZoQtVZ
	wpufLej3/yn1NriJp/uOUDNBzI/yRdM0CR7dLcNY/uV6utWy7MxbL/HL2hMr/5rn
	xcvWzSYKAwiJCKIvtfTgj8f70tEEKIeAdj0D+6NukwOzO+YdKi1uEIrMms4NP0tX
	29j80spxhvoHQDEe/ySCGYFTEhdwv3oe6+UpqVji3+L1aL9Du2qVClkFlahAW3BP
	a7iQfl4=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH 1/3] ARM: dts: suniv: f1c100s: Add support for DMA
Date: Thu, 5 Dec 2024 01:01:36 +0100
Message-ID: <20241205000137.187450-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205000137.187450-1-csokas.bence@prolan.hu>
References: <20241205000137.187450-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1733357000;VERSION=7982;MC=2619784077;ID=169667;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855627561
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_160323_249814_CAFA80B2 
X-CRM114-Status: UNSURE (   9.40  )
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



