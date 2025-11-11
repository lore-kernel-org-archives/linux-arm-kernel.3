Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04CCCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 17:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lc4prR/NRmqGKWAu+uVdSjtexRWIrS4oe1SpF5Crh2Q=; b=O2xFlZ3aI0YXIkG3ss2Nhylj4I
	U5c4KrLNedGyldeL85cjNAk6qniaQUk0jVvbmlyH8LYmYKU4DaC+2r2zT4uYchAa0pvA3zBJGHRjr
	rVVe5KoLjkFQOgGP7CSBDnt6F7XlfY8Frbhla80WVWJQu0JKs4fQM9eJQGHOBbtQ9sUqRi+yM2CsC
	IA0IGJYyJloukkLc4ni5ia7UnSXOGFH5KnHOxkisI1AIoz5B7WZ2eCGsL2iHcdvjH87M1Z3kNlzgH
	IGLwnZI2R1vtkSnC09qNN6r1RR8vRtSJugvG4ZZAEhpeiG04Y4mmjbdFdGx4k9M+5dzp+8lGwGAkX
	I2SxjCRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsaS-00000007Z1z-3dBE;
	Tue, 11 Nov 2025 17:55:24 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsaR-00000007Z0q-0zci
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 17:55:23 +0000
Received: from localhost.localdomain (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id EFAE41FE49;
	Tue, 11 Nov 2025 18:55:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1762883721;
	bh=Lc4prR/NRmqGKWAu+uVdSjtexRWIrS4oe1SpF5Crh2Q=; h=From:To:Subject;
	b=kp1Ewgr9MmL+UCnCFdMl3c6gW86+uQrCbK/AM7Henkbe/haZMpGJBHaqsXiETkqKY
	 mbKzfaigcq4/iSqH6oinnGtzCq+Bki/Tv7jtajtvgzqmOzvLWmQn7DoSx7GuzYx86i
	 h+HCl4Mb4hDLSIXyJN3ecbds76iI/IsV3/r7N49gcTrF9tXu1VdCBuJNmYZaSerDRD
	 PC62EVPnmsM1hZhwOnUWay4bdJ36xUaihoJFz3gMg70qma+x3M/bQmDDu/XCOH3bQq
	 suZU0vsphlXt8WDcdu9Zc6Oq17jqwIqtu6BFgy5aBljQ3sGl/0hH24XtHgYRsAGTGx
	 69jDxLyAOzITw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: ti: add Toradex Aquila AM69
Date: Tue, 11 Nov 2025 18:54:57 +0100
Message-ID: <20251111175502.8847-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111175502.8847-1-francesco@dolcini.it>
References: <20251111175502.8847-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_095523_430952_3FD77A91 
X-CRM114-Status: UNSURE (   7.91  )
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

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

Add DT compatible strings for the Toradex Aquila AM69 SoM and its
supported carrier boards: the Aquila Development Board and the Clover
carrier board.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/ti-am69
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover
Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v2: add conor acked-by
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 2e15029dbc67..c6eb72462bef 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -158,6 +158,14 @@ properties:
               - ti,am654-evm
           - const: ti,am654
 
+      - description: K3 AM69 SoC Toradex Aquila Modules and Carrier Boards
+        items:
+          - enum:
+              - toradex,aquila-am69-clover   # Aquila AM69 Module on Clover Board
+              - toradex,aquila-am69-dev      # Aquila AM69 Module on Aquila Development Board
+          - const: toradex,aquila-am69       # Aquila AM69 Module
+          - const: ti,j784s4
+
       - description: K3 J7200 SoC
         oneOf:
           - const: ti,j7200
-- 
2.47.3


