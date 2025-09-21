Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864E2CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 11:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYMZtnyaXfKmtQD1OxiJdY2oaTQJJXMOM9qJkk02h4A=; b=iQv4OpDvgDvWCe8aff73zyrdFT
	H8FqtePPzVxIeQaCA337hwAMm+8pGP723EPbv+zhjm1LBbA0M9BYGeReWN4MoF5TKceGjiOulW2yc
	ImWakYmg5bWOzYbJERcc0Xx7fmU2RgdRayeZNktDSOr3N9JdoQsLfCtDbyTdKZRREPl4Ge1SY93ac
	FV71neSDvhiMPlWZoxAhyPCkf1/I3r5FFdyd5Zt8L1OtZfK+dQBZ78wWK8CqEBwmDkzTlRleUFUL7
	nkuEncHqVbH94y2628+gKFWC6B9ISkNp3ULjorRjfpY6khZEuMYJMnkAKjQeHQNwz38PSFUXPNmQE
	EiaoDLeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Hrg-00000007LV3-3i4z;
	Sun, 21 Sep 2025 11:04:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0HrX-00000007LPx-2dsU;
	Sun, 21 Sep 2025 11:04:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 966DF601A5;
	Sun, 21 Sep 2025 11:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A950C116D0;
	Sun, 21 Sep 2025 11:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758452649;
	bh=ulSPXBA1u1faRv4/f8arTi2w78WVoq/znuBQRkfs6Zo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t56+27g4EaW8nnlv1PZ3Su58UPdFiDAuie2uyPMxsjoXMsAHjpTucLIK9bOBDIqh+
	 hOPhXrFJXSbC0efVuWfAWR7eXSVgn67VtYEq4GaYEOdqqVSc8c1TlF9PpvtqJjpJMc
	 49cqXUyZX9RNUC/qsFCCRLZZQJFyzxUPu2DV0EemhUDp8T9fjmCvMfoip0kyF63n1c
	 iGGIXaXAE6vsAA7nrSz2sLhAN48GmTAXyvdWHH6u+VR/UOIK8DxcfxBKpAKeWmPSx8
	 A+5+VOKGv0ND8GwvuonbgB6E2H4ASAWv/YpmuljOY06Kr/bP7jPZTlQWlUJmHpPF/I
	 y9/Ti4RN2hUVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C82ACAC5A8;
	Sun, 21 Sep 2025 11:04:09 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Sun, 21 Sep 2025 14:03:42 +0300
Subject: [PATCH 3/3] arm64: dts: mediatek: mt6795: drop mediatek,dma-33bits
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-uart-apdma-v1-3-107543c7102c@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758452646; l=1089;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=efNh38U+hbw7SE9tyV1qJBxX+aihILQofpcGc0kC/ts=;
 b=P2Den4CzqXR4nni1RZlcgJUrU+BdnDEx6nZid1RneZyCMn5h8Mysh1cY8Rig6oOMQpbLsXBdS
 golrZUGOoSGA2ZCKjBqltNqDh1rkr621J5L7bYeinB8Sw0aZmqZIF3B
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
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

Drop the mediatek,dma-33bits property and use compatible for the
platform data instead.

Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index e5e269a660b11b0e94da1a1cf362ff0839f0dabf..5123316b21285cf589c0c616c0a12420f0b1ef19 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -547,8 +547,7 @@ uart1: serial@11003000 {
 		};
 
 		apdma: dma-controller@11000380 {
-			compatible = "mediatek,mt6795-uart-dma",
-				     "mediatek,mt6577-uart-dma";
+			compatible = "mediatek,mt6795-uart-dma";
 			reg = <0 0x11000380 0 0x60>,
 			      <0 0x11000400 0 0x60>,
 			      <0 0x11000480 0 0x60>,
@@ -568,7 +567,6 @@ apdma: dma-controller@11000380 {
 			dma-requests = <8>;
 			clocks = <&pericfg CLK_PERI_AP_DMA>;
 			clock-names = "apdma";
-			mediatek,dma-33bits;
 			#dma-cells = <1>;
 		};
 

-- 
2.51.0



