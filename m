Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269AFC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 15:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Swk7BV1GveQhBWA5phfXY133aeK5lckY/5jFPBjzJ4I=; b=yOiCObmciQPq6AMvoC7REdG2Tt
	hQMWG2XcVqiau0TPr3Et58q9AqSYtXTgPZcLjU8vISXSM/7nQKuItKcpNCX0rHdU/u9+9IGyXGdj8
	iht0vuwbm8RJI/2koO6Z+Lo8rm27WNxgvHIZ3yoXYK5qqY8mXnJgWSY+DLfw4ZEqORadgd5Ogk7Xv
	RMD48T3eDeyHVyWqQWRrufMtWIYSUu5RXH/6o1uSpjAF79dYZ8ne2mMHtmL8EKB41i6jR764fmocI
	IaiwMjy5ILXGVNZS3O/zCWXPfmejzDeRna9CtpavG5SQD03TzdPC6YbfiZbpdYDnOBB3DxSb2gxjT
	EGmu/ZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2OA-0000000BUPl-2hRD;
	Fri, 28 Feb 2025 15:34:58 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to23u-0000000BPj8-1muh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 15:14:04 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id A3C151F983;
	Fri, 28 Feb 2025 16:14:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1740755641;
	bh=Swk7BV1GveQhBWA5phfXY133aeK5lckY/5jFPBjzJ4I=; h=From:To:Subject;
	b=yhFJR7lkk+SRxRNq5ZgFavLKmhdiDRpXCp9/w7N9LZ6OyK619X97f7JaGPhjweZEC
	 Z6jAvcNuk/7RKwLnU17NiY1zVpFAygG9mt73GW+UekG+S2rHjFV5EkwbsTURl4dRog
	 IrsW+5xRq9y1h1TUpgqikpR+1SlXWjiYtDDx320zcKWExQzNVVLsk6p0eo0IxZZIcu
	 F8NBHH69Qkz8RpsbvGiOol1i3MuTXqemfEysSZwV6saLIkN3zYvzKb/eBOGhRIeRv1
	 o9qqxCcpEQ85QUsF1WM/qlxjDekNwN0mktiSPGM/0GV5g3yUC6Mlnb3XSOnJWw+f+o
	 aN3eLr3UXg/Nw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] ARM: dts: vf610-colibri: Remove compatible from SoM dtsi
Date: Fri, 28 Feb 2025 16:13:52 +0100
Message-Id: <20250228151352.91768-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250228151352.91768-1-francesco@dolcini.it>
References: <20250228151352.91768-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_071402_630186_FE0EC15F 
X-CRM114-Status: UNSURE (   9.52  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The SoM cannot be used standalone, this compatible is invalid and it is
always overwritten when this .dtsi file is included, remove it
therefore.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: new patch
---
 arch/arm/boot/dts/nxp/vf/vf610-colibri.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/vf/vf610-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf610-colibri.dtsi
index 607cec2df861..20aed3946214 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf610-colibri.dtsi
@@ -8,7 +8,6 @@
 
 / {
 	model = "Toradex Colibri VF61 COM";
-	compatible = "toradex,vf610-colibri_vf61", "fsl,vf610";
 
 	memory@80000000 {
 		device_type = "memory";
-- 
2.39.5


