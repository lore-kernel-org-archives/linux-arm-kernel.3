Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D022D6B6A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 12:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gF4/ZNsAK1S1Q0ruvMfpDSairoKQHeLYMeqLyk6oG4w=; b=VlhdlUhKE8klH/rvJB15uz4438
	5eeUE1thu0ORg1ZooiTInvckRCzzLO6MbysTr2vJsGbgA2m5fZ1tGEUIDmXQbpYPo0UYzg2V4vOHz
	xpzrzRlp8U7jps8CEAaRCfpFV5VbpjFs3CZhCshz4Hn0mCIo1y6Cbc5eyzHqEnK8l+JvrvFZW6PqN
	MSDyHzH40EB/npfntv0KxFRucX3iO3s19eK6UteOrPsjdfnjclohWEb/SOCoSjFHwNvlT26DNpm6C
	IW/NECeCjJXdcTCRqkF5UK8r3Eyzz6KnY0EGUZ6Anru35pC+F25itK2jiJqPrHaNZtmnCVC3BHXmB
	25n7YaCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UYX-00000003a7N-2eb2;
	Thu, 31 Oct 2024 12:45:41 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UPh-00000003Xke-0xFF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:36:34 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id DBD25A0FE4;
	Thu, 31 Oct 2024 13:36:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=gF4/ZNsAK1S1Q0ruvMfp
	DSairoKQHeLYMeqLyk6oG4w=; b=MH8FEco4BXaLfFVoFsYXNA9B07e3gVVpr7RI
	b/zFa6vttuWsYqOON5l5UB8Ch0bybpmhMaeWAuXTRSaYuetIWK/+n5Hce/lrYb8P
	NFRKW3wPTp08EmAI2zJg3OIJCz8HoGMbUfQqAyWZAiV1TAqDVerfLnIdX3BSxEQG
	JRpbXH+L7YKEI4DcOy9SjQ0nzkf6YwbfWjxTmy/9Ur44LU2cJqnU3CIllZUMHcXF
	nujleHyZgACIlWcIkf8vNYGISwrhPpekc0ETV5kl1Q1AZGU72rTuU4ZXOB9tOdFK
	B/0L1fd5Q9xjuvsildoaibvQAfcIDPasp2XjJeX+qcJL5R9o24cUfi4P0eM0yyeq
	wjT2XcnkoeA7bbismv1NBS1ooS0rJkUTMFsgowXT1DFq2sbeKEzOPRc8Lytsihon
	jxGri+c/Uu9EW7XWf0ezLioYbEfsWyZamxCNjv15nir/ZTteqoAPa7wJ7ywA91Uq
	eppKgyDAQ6dmjXsh0ceDyEo1SrRvHuGswtJTKw2tacZf6igQsy0teII2KPhrvkG9
	M/4Y+EBTfVwABFYVa5Q95s12q5ybYQTQ0SVMo768G6lR0ItTTTgqCaGJ6r5QgZij
	i1wqOvKOo9Ju5KUPGK2BJgM8KwsKWAfzrQUi1XBBSvyxFy9XITxHkhpHgxpWvDZM
	ZHNUORU=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v4 05/10] ARM: dts: suniv: f1c100s: Add support for DMA
Date: Thu, 31 Oct 2024 13:35:31 +0100
Message-ID: <20241031123538.2582675-5-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031123538.2582675-1-csokas.bence@prolan.hu>
References: <20241031123538.2582675-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730378191;VERSION=7979;MC=4244629093;ID=207185;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855667667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_053633_456433_3BD82021 
X-CRM114-Status: UNSURE (   9.39  )
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



