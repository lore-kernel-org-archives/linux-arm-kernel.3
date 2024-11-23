Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2193DE6ADF8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 12:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cA+YRD2zmFxMTLKWh4kfww4HyhrJ9ewfYpcfpxYsh5M=; b=YS9NJPSFOG25A1VyPdG+Tqeu5K
	Jn8Xky1b4Kejf5/z8mLs14aBRoqvpXOyq7tJnhT+LtSNkcwPsbFCzOK+RzukStsTjJTh1IC+JccKG
	if/y2Ynprb2RHpHwDpK/T+gimkcQHjapxGE7NErW3XLDCErDOnNdgubyIshvtaK5qq0ypJDys3H8B
	StW3SeyzMleS+RJz/6t4yem7dSYv6gDAMl/+wHA1ezbGZIYyOxFNqRWUS3wEC8NxFizdqhAPnzztE
	X5reaITcCGWcuBcztKmqDiSyCc6ns5zOsgrctIoCb9QXKRo2n5IWrdKyYCOejbi0GA5WI4MVDoGkg
	Jibu9pOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEpXQ-00000004Kka-0muP;
	Sat, 23 Nov 2024 12:47:00 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEpTo-00000004KEW-2lte
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 12:43:17 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 5A2BEA0302;
	Sat, 23 Nov 2024 13:43:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=cA+YRD2zmFxMTLKWh4kf
	ww4HyhrJ9ewfYpcfpxYsh5M=; b=hvTMn4AyHZBgNJn4dKnz1G0TgQhVx0rLX1Ob
	rPR7qN+iyZCA5KYnIj33T3HXi8EQzKPgFBxSTwcOtwYqPJI+srq+w3KsWvCmEbfN
	UoJpLhxXU5xmhvJQIOxsZNZ6IqKd/pu2o2kw1XSAQInnLMvcnvYjzT38+evVqRCi
	dng3JR6Xs+Vt8MunbkXNN5ey25Yyr7tzKw5EGgYUcOzhWBCxIC0nt1sl5qD8goGO
	RqcKP8jiL9YaijhMe4Ou53R/WlbrXwWZ+5ntDNOtVhOGnkoBKJABFyVwPD/fH2JK
	MoxxBWp5Dh+wRVn2pXuz8/YgXu78ibR6/AxUZLDs6xR2pUBCA4kYoM9Pv18JnAQD
	UQ+pGPBfSsbmAEKiuTSmD83jxmbw56VJh1mJ5YGRN7vaDyz3S3ZPIVe1grAVnpic
	IMhquDXdZ8J6QU+s2N80r34iP46Bl/oHVnYCpDBX42eWI04mZfLuvLGG0OADrFca
	iXBB74DmQishEL9PRyoPBzSvJQMdK2dXEMlhpGe/+u6Ep51J2EwV1KQxtCkmz3FW
	lhUrZWf1IONyOLVeNq/yO775oHgMwnws7odgV24URpufb3mA1Da/QWlDB4a5JPqr
	4jS234v9n0krbF1e+Mq9h9wpjQIbhC3PS3X9pI6Ohqu4IsCwOSJGgy4I10IhV6E6
	MsVRuJ4=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v6 4/5] ARM: dts: suniv: f1c100s: Add support for Audio Codec
Date: Sat, 23 Nov 2024 13:39:04 +0100
Message-ID: <20241123123900.2656837-5-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241123123900.2656837-1-csokas.bence@prolan.hu>
References: <20241123123900.2656837-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1732365794;VERSION=7980;MC=3913615124;ID=80956;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD9485560726B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_044316_852707_ACDA1308 
X-CRM114-Status: UNSURE (   8.44  )
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
index 3c61d59ab5f8..6f7a5db8f09b 100644
--- a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
@@ -326,5 +326,19 @@ uart2: serial@1c25800 {
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



