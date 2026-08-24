Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501B9C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 13:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wImPK+PnBY1StxudoGW6QgV2zpH3NFY31WFsMZxxyp4=; b=nysR5Hb7s2dso2W932mtuox9bL
	SK7G+HvgX3CfKzoAGvP9ot9sr1BO603C1dTjQd0X1MQRJEv9rXon1Hb+hI6SYTMM89o/OCfCCuwJ7
	hVSwxaPgQKTzwxHNivHiQggNzLHyHOrN7fxT6F9ZkHGSRZkTaYC+HmHISjdY+9+dQInEiFus9gxl/
	Amx1B3Hlez0rLIJeekkhoQ31s2g2rOPVREinwyKSvB9BRPBJViSgLDey1lJW3RvoBQDLMyP0rRp2f
	BoMB+30TAb4D3RuO0C96Mv0cr46T7LPjxwJEHy9iZEN5aoA/2Jki0smKr9CehNJtsQJYbVIoiA1eG
	IbRbLV/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUTR-0000000Gfb3-17hm;
	Mon, 24 Aug 2026 13:12:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUTK-0000000GfZf-27lu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 13:12:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15D0343C3B;
	Mon, 24 Aug 2026 13:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA918C2BCFF;
	Mon, 24 Aug 2026 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787577138;
	bh=YfnNy7H+MKpmvOhS4SoksQSiXwR94LflioldK9T78Ag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PX2O47pqhH/pbt/WC7X8/6B5zZNt44LL++6mowya9jleVdzkb61QM6ZO1UXW5BJZl
	 2/ICBumpdlSkSdY8ihrM8JDH5m5QwbGuER5FaEOsf5dmUd6qCYrRpsA6ReSOgn7T3q
	 IPqcUcw/cJwLJYHLFS8rrdb/ZeuhO1SLUkp+axzt5BS0lGYR1n1EZDZ6km6ylZh49w
	 cqhaJCpCprTYHlsfYafS3laeevPvyGeycyzn46Q9+JnrHGQiRAV0MZeNdMiMt3SsaF
	 9vNHHb7AQNL4EOJ/9i4rgplRB5VGWQnm3jpQBWZ2hhjV/lEjNFb/f9uzBJ14Fq28d7
	 625d8lJXuVqjQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF95C61CE3;
	Mon, 24 Aug 2026 13:12:17 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 24 Aug 2026 15:12:03 +0200
Subject: [PATCH v2 3/3] arm64: dts: lx2160a: fix the iic5 spi3 pinmux
 offset and value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-for-upstream-lx2160a-pinmux-fix-v2-3-0a525d5f4cd5@free.fr>
References: <20260824-for-upstream-lx2160a-pinmux-fix-v2-0-0a525d5f4cd5@free.fr>
In-Reply-To: <20260824-for-upstream-lx2160a-pinmux-fix-v2-0-0a525d5f4cd5@free.fr>
To: Frank Li <Frank.Li@nxp.com>, Carlos Song <carlos.song@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Josua Mayer <josua@solid-run.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thibaut Collet <thbt.cllt@gmail.com>, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787577136; l=1537;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=BZq9iBy9zMULsx08pGD1SDDVGE5pMTVNIR3ADNpa4zc=;
 b=CKuLq+J0V1nANBfd3Gi8NrIBf4GFu2kLUI5rd055oh1iFr2PI2LlUcEnf9TdY1zYJ+Kir0gch
 xK+EtHn0BzvA6Fa/QWghZyvOzPEphZGYwJwkVtej4BrEKqjdvA4wNTp
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
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
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vincent Jardin <vjardin@free.fr>

The iic5-spi3-pins node has both of its first two cells wrong.

The offset selects the register within the node's reg range, where:
  0x0 is RCWSR12,
  0x4 is RCWSR13,
  0x8 is RCWSR14.

An offset of 0x3 is not one of them and is not even aligned for the
declared 32 bit register width. It is the only node in this pinmux that
does not use 0x0, 0x4 neither 0x8.

The value is wrong too:
  IIC5_PMUX is RCWSR12[11:9] and it encodes 0b000 for IIC5,
  0b001 for GPIO_1[25:24],
  0b010 for SDHC1_CLK_SYNC_OUT/IN,
  0b011 for {IIC5_SCL,IIC5_SDA} = {SPI3_SOUT,SPI3_SIN}.

This node selects the last of those, so it needs 0x3, not the 0x2, which
is the value of the neighbouring sdhc1 clock sync node it was copied
from.

Fixes: 284ad7064aaa ("arm64: dts: lx2160a: complete pinmux for rcwsr12 configuration word")
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
index fae705dd07669..bf5d9b671d858 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
@@ -1602,7 +1602,7 @@ esdhc0_clksync_pins: iic5-sdhc-clk-pins {
 			};
 
 			dspi2_miso_mosi_pins: iic5-spi3-pins {
-				pinctrl-single,bits = <0x3 (0x2 << 9) (0x7 << 9)>;
+				pinctrl-single,bits = <0x0 (0x3 << 9) (0x7 << 9)>;
 			};
 
 			i2c5_pins: iic6-i2c-pins {

-- 
2.43.0



