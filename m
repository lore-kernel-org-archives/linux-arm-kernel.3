Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157A4CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 11:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PIV+PSd59pGkB2RNg0S3z2hpD5UHpBIiPJJILvglq14=; b=tULrOjAnHQwP1QmWbhq+Qve1Tb
	CyEMkbR6NUhRaQt3ZXlJVnKAu3m66g9XyohhUHvTd1xr75PNWI+UEv/CuQ8QNY+PUmOkeWOvIPp5g
	YPcI14qlWN9HhXJr4uU571hO4ZVZb8GWimkfsqNKTmCLdBekbmfI4hITe+6/HjJ4asN4ReFX5jnTa
	BquWOACiwF6RZv+Lwkg2s7Z22F3XWbokzHf6e7/Ho3kMzDMo3JEBDk+TNgzXdDDyehpI/KxkISR+h
	31iEufLuV4bKIEjnpPmDErU4rSHGW5YdWA1wZF5hArEiRrwdCcO4MsXb9vy9jFU8g3JDr1ijuatZv
	DWWsSqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0HrY-00000007LQb-2wl2;
	Sun, 21 Sep 2025 11:04:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0HrW-00000007LPM-0vmx;
	Sun, 21 Sep 2025 11:04:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B70C435D5;
	Sun, 21 Sep 2025 11:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11332C113D0;
	Sun, 21 Sep 2025 11:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758452649;
	bh=qZbUvkV3I4SIv7OEUq7HXI4u9eGtm6gZMNg1T88s4O4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mxPSD9yuN4VkI3XvPm6joul3OHUgxWhxFiAwPiYFVpf73ekd7v76P/MvQcRV4Q6gO
	 v9nj6kYaTHwiQC0kT30tKhEwAQ0Yk2b99NuvwtrOe12EoomB9ww4PUwLzThWAPYUh9
	 lFg0fIUktkCAERlPUjEHiaFm4X9wg0AioWJ/PyqTJfP5TmjbPnRk1EIXwTJIoBTEn7
	 QCh2H57CmcXFurQUVC9lFJiVxH98EgkURes4T9AbJS4hAXoKUovPgm9UIld64hKyHV
	 38Zfm+FD0XCXtY4ACezhPd4BYh32i2l+1/4YrG9v81C0/i948xsZH38ZYsmUngfCt0
	 +aBCzqBFOliNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F66CAC5A7;
	Sun, 21 Sep 2025 11:04:09 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Sun, 21 Sep 2025 14:03:40 +0300
Subject: [PATCH 1/3] dt-bindings: dma: mediatek,uart-dma: drop
 mediatek,dma-33bits property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-uart-apdma-v1-1-107543c7102c@proton.me>
References: <20250921-uart-apdma-v1-0-107543c7102c@proton.me>
In-Reply-To: <20250921-uart-apdma-v1-0-107543c7102c@proton.me>
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Long Cheng <long.cheng@mediatek.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Max Shevchenko <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758452646; l=1846;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=TB4BCx1QYYV4SmqIa8ENnGfC/AB4i29OQtOF7WQHovg=;
 b=I3qa4PxpaBPKoU6fi7fhLxPcD3csXcw7CPfWSXpq7UuMv9OoZ9NtUPgrB3r4Fe5nltPitCZXj
 UCi2HFiDvpIDS0qTK6ZmeNqloia69Lkev+R2nCbnT8xCU05mNgjYFlI
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_040410_311710_AF82734B 
X-CRM114-Status: UNSURE (   9.29  )
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
Reply-To: wctrl@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Max Shevchenko <wctrl@proton.me>

Many newer SoCs support more than 33 bits for DMA.
Drop the property in order to switch to the platform data.

The reference SoCs were taken from the downstream kernel (6.6) for
the MT6991 SoC.

Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
index dab468a88942d694525aa391f695c44d192f0c42..9dfdfe81af7edbe3540e4b757547a5d5e6ae810c 100644
--- a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
@@ -22,12 +22,14 @@ properties:
       - items:
           - enum:
               - mediatek,mt2712-uart-dma
-              - mediatek,mt6795-uart-dma
               - mediatek,mt8365-uart-dma
               - mediatek,mt8516-uart-dma
           - const: mediatek,mt6577-uart-dma
       - enum:
-          - mediatek,mt6577-uart-dma
+          - mediatek,mt6577-uart-dma  # 32 bits
+          - mediatek,mt6795-uart-dma  # 33 bits
+          - mediatek,mt6779-uart-dma  # 34 bits
+          - mediatek,mt6985-uart-dma  # 35 bits
 
   reg:
     minItems: 1
@@ -56,10 +58,6 @@ properties:
       Number of virtual channels of the UART APDMA controller
     maximum: 16
 
-  mediatek,dma-33bits:
-    type: boolean
-    description: Enable 33-bits UART APDMA support
-
 required:
   - compatible
   - reg
@@ -116,7 +114,6 @@ examples:
             dma-requests = <12>;
             clocks = <&pericfg CLK_PERI_AP_DMA>;
             clock-names = "apdma";
-            mediatek,dma-33bits;
             #dma-cells = <1>;
         };
     };

-- 
2.51.0



