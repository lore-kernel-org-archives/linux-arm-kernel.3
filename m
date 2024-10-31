Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0851CD74958
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 12:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0TfKIJhJzBxEoeio8uyUm+I+RQoIvnhme6u8bHSaZ0=; b=m8AhUhDCNNJjDJVGpuu8rcMstv
	1m50yiaeFPmhTI3zEPRS7BXaxLJONvsNAJ0456iHfzb9yvJGklAMd3dZy5Bz/gDoK44RGZ0lmFg9x
	4Si1A6Eb8Ch9MB2voTdujNyeFSWl4GMucJ9mT9MyKk0sBlVMYYMbdZapRN712zrcD21azvuZVq6zE
	2JY4l/HxagNpzDDtzKYhSs08wNngypO7Avnmws4KLuS46G8bYMHrdyD+hH1P4D9T/Dp+zr2IVrs3N
	cFxMf/NO3mQt4oOL/VtM9FO843pZsind2xoWLdCLQxtYsfojXyhSrguuaNkBLdj4XaD+Qvj5eyEiV
	6vGCKVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UdS-00000003bAS-0RGm;
	Thu, 31 Oct 2024 12:50:46 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UPk-00000003XmY-3el2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:36:38 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 90C44A0E1A;
	Thu, 31 Oct 2024 13:36:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=J0TfKIJhJzBxEoeio8uy
	Um+I+RQoIvnhme6u8bHSaZ0=; b=GB+Rf7nebvz+E7tlkHBg5DQFDa8CMcF3/5c9
	vC5hLQJq0hAjMgltfYlM+3jntLqj9YQr7w+/5rlyDbkjFSfFb9hwGcA7H6jJx8Fy
	HqsZDYCpWiJvXsmBXpQDJhQMXe1nI8DR7nTnYe5r3SrtQWLiwUtW1OMD4rRCbY5+
	2uMgBTX7HqzjCHRRm/kcyPebsdK7L8+BvN7CFM+4H1s27+1u4Bb1ZR2eCy7VB7WR
	BD5pzKjE8qXm6wPnMvMsvb+zsd9IPVo6LckquWcHxmrIYQE117dgTbFpAyYBMUHO
	Xg/lRR45SJkT2htDIPulZEX99MCTURD9PxR0Ph8OVw/ID239Z6rsKaC/55FAmuRm
	lGU7LUCfqOUODmrab0Fe/JZz1ZxDuswwS1yQGCRENgMswrn47DtDeb+pYRNLspmR
	2RxKTq4qEEYe6v/uRwbxAKEhRFcg2qSctEjl0Rk8vToqWaz5xeK2H5VG/qU1psuB
	/Op+Kh3zdZL8HK1x1ITRkb7LQ47jIGfGA2+Fkhaqdo5A/mJ8ltcQJGtlICX9G37m
	phO+UNX2eMGWQlmwGMuvQfrD4wnWswqgXPED+ggKoUJVe1Aeb0d98wADty2w1YG7
	ddoYzZjhesKtBfPqxGJCNdyVm6OaCamMXVK5SntzotpVIM3jHTyGPBKK2kX6BukO
	BFxt++Y=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v4 09/10] ARM: dts: suniv: f1c100s: Add support for Audio Codec
Date: Thu, 31 Oct 2024 13:35:35 +0100
Message-ID: <20241031123538.2582675-9-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031123538.2582675-1-csokas.bence@prolan.hu>
References: <20241031123538.2582675-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730378194;VERSION=7979;MC=1362339620;ID=207189;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855667667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_053637_089455_E93F152B 
X-CRM114-Status: UNSURE (   8.52  )
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



