Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D562FC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 00:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zLdpP19Mu2XQ4DhhliW0hw7B1A+rIntpseF+jaY/gw=; b=Ycwg/u0JpcRBgJkN9FTxt1V2Gw
	7BHzaOEWuD82FitFkeswdcl0Ehf9mo5pzyxmolhYloFL/M4fbAWmMf4wEWUXKF/3MJRdiIZp1/4GG
	tToH1cmrSUA2o2SqFx3TyPCy24B/FYWwDgtHyJH9Ueh3czOp2Bhj6I+D+17H/orImBzBim7jNbYlN
	YxADksRqQ4MQR66IRKLK4JhShbNj5UdTmU95oImJc3IomAyag2TkkxgV+6Aykp2WnaHBNHwKNeAbX
	Yh3OkCdRgsRNeJVAUb3Dj/Q3jyyooy+1wd0dx1Vm6f9yu5gs1zIzVbCuLjdql600R1qpiMm0e962g
	fs+lPluA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Rro-00000000dBK-2IGO;
	Mon, 21 Sep 2026 00:26:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Rrn-00000000dAy-2Ls2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 00:26:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 011AC43F7E;
	Mon, 21 Sep 2026 00:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8405BC2BCC7;
	Mon, 21 Sep 2026 00:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789950402;
	bh=xE4iQ0PrzGa2C9UPEClrIlu7Uo4/8EFZTS/HoDiSOJU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pcL0WDjjlOTmxNTeTMmYeqior8sRZ8hh/cp7PPmru5W4RgaygzG/Lo3YngNmzWe+B
	 /4kCoTRskG2Wdc1TALZ7tTKhKwJidCnyx+4jyOW3cDg/6Wh2v2pCNntaHAlF4RAKRU
	 5OCfkMu0EWRGEl13OG7FZpBAV8P9DOqW+OeNyDiL9Ic6eH8yiZTvLfiRuXvFI4V1dQ
	 or/szAhbfpxqBBHRmUEO3jSbEpILrqENxjiwzNxsv3cEuLyMBa46LF1frFWRP8mLfH
	 iyMvwbdC7m6IQ+Iazf7dPRrUQdYl/ADHVKRkzCz4NvXLqiLWlX7SYaBnQSnk5N1NjI
	 I0IVCIm3iiNYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D0FC982D8;
	Mon, 21 Sep 2026 00:26:42 +0000 (UTC)
From: Nicolo Giuliani via B4 Relay <devnull+nicolo.giuliani6.studio.unibo.it@kernel.org>
Date: Mon, 21 Sep 2026 02:26:42 +0200
Subject: [PATCH v2 2/3] dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-send-dt-v2-2-fb6b81002ad7@studio.unibo.it>
References: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>
In-Reply-To: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789950401; l=1394;
 i=nicolo.giuliani6@studio.unibo.it; s=20260919; h=from:subject:message-id;
 bh=lyDMMre6EWQH7CiEprIS9UxuPjln7GFy4OUwneOalSI=;
 b=XH+pUXfYOL6RW3KhZLUS9vw02g1QOZ+Wz32F90LYLT2qMP4KyByADqVmYEIGFa+Qe97WHG1ga
 XawU60uusXPAG7FuzKQHL2L5NiNGzRHI9893tueFqx6qbKkK7RiRPSd
X-Developer-Key: i=nicolo.giuliani6@studio.unibo.it; a=ed25519;
 pk=D652ecdT01GkA1eoFWNFNX85xIg5ZnFwUWyjfestgQw=
X-Endpoint-Received: by B4 Relay for
 nicolo.giuliani6@studio.unibo.it/20260919 with auth_id=1040
X-Original-From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
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
Reply-To: nicolo.giuliani6@studio.unibo.it
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>

The Sophos XGS 87/107 desktop firewalls combine an AMD x86 host with a
separate network processing unit (NPU). The NPU is a Marvell Armada CN9130
SoC with its own eMMC and SPI NOR flash, connected to the x86 host over
PCIe. It serves the front panel ports through a Marvell 88E6193X switch.

Document the compatible string of the NPU board, with the CN9130 SoC
compatibles as fallbacks.

Assisted-by: LLM
Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
---
 Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
index 7e77310da6..130128c462 100644
--- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
@@ -118,6 +118,13 @@ properties:
           - const: marvell,armada-ap807-quad
           - const: marvell,armada-ap807
 
+      - description:
+          Sophos XGS 87/107 network processing unit (Armada CN9130 SoC
+          with an 88E6193X switch)
+        items:
+          - const: sophos,xgs107w-npu
+          - const: marvell,cn9130
+
       - description:
           SolidRun CN9130 SoM based single-board computers
         items:

-- 
2.48.1



