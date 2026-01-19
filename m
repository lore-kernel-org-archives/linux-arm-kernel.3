Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359C8D29C36
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HB6R7Gmcew2iw8/39NUTW86WmrM0qyjj2ra2kHy8/Tk=; b=CKDQ1JeUqx5b88d+GqczEC7bXm
	0TVlAtAWhaWX4bBalMKoePCIU0oBr12JfCHAQYzEcWtE/pkadwWhieLv+ZJDLn1UqloCmletuYerf
	bZp+zKFYU5VzkLtYNBl4jXa0+k8M24uoWF7liORLyIIMgLtpZ5ySpivwVqRpTkHgx8PGYT0y+ct3G
	BheYqqO1kzmc6zAB1nRDwniUOFv1oKXTzfxNlDribfB6X0sRMALMBUmia30uopp3ju5F0unk+hdDC
	Ivi8CJLxH+4Nk2/elIly6HYks5rQe1YeVwQvYlxxC/0yBdJv9b5EjKhrP7xuDTucGs3NrEEuhN054
	2Q4pZIAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrFi-00000002MBr-1LW5;
	Mon, 19 Jan 2026 15:33:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrFc-00000002M91-1ENR;
	Mon, 19 Jan 2026 15:33:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EE0143F45;
	Mon, 19 Jan 2026 15:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD7AC116C6;
	Mon, 19 Jan 2026 15:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768836787;
	bh=4Gg/dHLVhHdOTxKZNMriKqAYLSqjDn9VOo3z8X3R3Sk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YHXwHMcTYDPI2LjDP+ASfDjJQS+uHVDpX0gYJaMZRaA6+i2CtjmaobCMO8Cqvwaxs
	 b1zkayhMCxFj2f7YNVaq8335uuvN//Ra32E9XtCxWF7l+2YeVyUGpX0h4CUpCn7QCM
	 aMtvP2U9qC5R5NxB1Lxy5onGXIY410GZk+OeEaRy6ArvdSjSqYMjKOwHc8nvGxkd/a
	 g9fE1zmiqZKmjgzhChFMyY8ADCHo+83/i25pYGQvq51W9gnIWdaHmFsi5Kys2fvCoO
	 bNSqaJu/MZPZdyvkRme5HV7YoubQRNndz9BsIEPmvHKj25/gZGqCtSZ3srByhO5tnN
	 3im7XsDzcGpwA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 19 Jan 2026 16:32:40 +0100
Subject: [PATCH net-next v3 1/2] dt-bindings: net: airoha: npu: Add
 firmware-name property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-airoha-npu-firmware-name-v3-1-cba88eed96cc@kernel.org>
References: <20260119-airoha-npu-firmware-name-v3-0-cba88eed96cc@kernel.org>
In-Reply-To: <20260119-airoha-npu-firmware-name-v3-0-cba88eed96cc@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_073308_356488_71366735 
X-CRM114-Status: GOOD (  11.28  )
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

Add firmware-name property in order to introduce the capability to
specify the firmware names used for 'RiscV core' and 'Data section'
binaries. This patch is needed because NPU firmware binaries are board
specific since they depend on the MediaTek WiFi chip used on the board
(e.g. MT7996 or MT7992) and the WiFi chip version info is not available
in the NPU driver. This is a preliminary patch to enable MT76 NPU
offloading if the Airoha SoC is equipped with MT7996 (Eagle) WiFi chipset.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
index 19860b41286fd42f2a5ed15d5dc75ee0eb00a639..aefa19c5b42468dad841892fa5b75a47552762a0 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
@@ -59,6 +59,11 @@ properties:
       - const: ba
     minItems: 1
 
+  firmware-name:
+    items:
+      - description: Firmware name of RiscV core
+      - description: Firmware name of Data section
+
 required:
   - compatible
   - reg
@@ -96,5 +101,7 @@ examples:
         memory-region = <&npu_firmware>, <&npu_pkt>, <&npu_txpkt>,
                         <&npu_txbufid>, <&npu_ba>;
         memory-region-names = "firmware", "pkt", "tx-pkt", "tx-bufid", "ba";
+        firmware-name = "airoha/en7581_npu_rv32.bin",
+                        "airoha/en7581_npu_data.bin";
       };
     };

-- 
2.52.0


