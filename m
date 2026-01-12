Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F403D26D97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 10:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9S7KxbADflQs8BWuDOzoNEo97XHa/pAvDf9+DOuDfUE=; b=vU567sDaWYgVCZ8hdjLnGzax9S
	y7bSrv3qX/Xj7qLy+GDO77ePriBwOtP0YiKQRlXb+/6I75QiTOyPKapL8+fGNQwDYxtsVIgTyq4Ds
	Lbr5m4Yj5HbpHdg30LpiemOuG67e+e+LCrxNFxEXfnct0QoWNNJCTain7AxjBaCxPKLSMNZoKbJcj
	C8WdH7JdFmzuuM1ubpGKdgu+myN/9UygxCpHFSMj4fqwbsAbbDyuhSq1BEO3q8mEH7N94M2RykqML
	p2lhuEqX5nOVo7DjhDrvkoxBMoqAzaJXQKbuNV9YbAQVM4+oNNd5kWPu+54TNt+gw7H8XD1hulwlF
	9uFVKh2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEiw-000000057BP-24yC;
	Mon, 12 Jan 2026 10:00:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEit-000000057A0-1nvr;
	Mon, 12 Jan 2026 10:00:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC20944157;
	Mon, 12 Jan 2026 10:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33847C19422;
	Mon, 12 Jan 2026 10:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768212030;
	bh=latuIr4yu3n1Qb62/xle1lx8+WDbz53Oapq3nBYcRTs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dclXk0isN4CjPhqrg9d2Cq2uRJLgYhlPKyIQOE0FO6PmY9qtdsoeK+gGfJ4F+WOxd
	 o11QdEReWFu91T1AbfhHpD5hc+Y1Z9CQAhD6JvgVUQL56Fo8D1tl2GWKGjzq7BgigW
	 IBokpxynYfZbD/W2U7BW2ux4+k4gLbuUcKz6cpUKOjwqMNLtnqMM1GEdmeIL4mUaZ1
	 fnH9bewzZqGK+Z6P7P36KI2ne6VNjV2UUK4yr1kQsALxVhAK1XTGkC/crpY0juQcgh
	 n3TRQeticRQ6PeNGIugnOVi7PVVVBPwTAnmV+XzA0FdIS9Uqk4nS+/YXZTELzgICNr
	 2fUWAIsXjabow==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 12 Jan 2026 11:00:07 +0100
Subject: [PATCH net-next 1/2] dt-bindings: net: airoha: npu: Add
 firmware-name property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-airoha-npu-firmware-name-v1-1-d0b148b6710f@kernel.org>
References: <20260112-airoha-npu-firmware-name-v1-0-d0b148b6710f@kernel.org>
In-Reply-To: <20260112-airoha-npu-firmware-name-v1-0-d0b148b6710f@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_020031_614871_228AB50D 
X-CRM114-Status: UNSURE (   7.73  )
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

Add firmware-name property in order to introduce the capability to
specify the firmware names used for RiscV core/Data section binaries.
This is a preliminary patch to enable NPU offloading for MT7996 (Eagle)
chipset since it requires a different binary with respect to the one
used for MT7992 on EN7581 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
index 59c57f58116b568092446e6cfb7b6bd3f4f47b82..e008cf92e0975b43b433030908c35340361bc71c 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
@@ -58,6 +58,11 @@ properties:
       - const: tx-pkt
       - const: tx-bufid
 
+  firmware-name:
+    items:
+      - description: Firmware name of RiscV core
+      - description: Firmware name of Data section
+
 required:
   - compatible
   - reg
@@ -95,5 +100,7 @@ examples:
         memory-region = <&npu_firmware>, <&npu_pkt>, <&npu_txpkt>,
                         <&npu_txbufid>;
         memory-region-names = "firmware", "pkt", "tx-pkt", "tx-bufid";
+        firmware-name = "airoha/en7581_npu_rv32.bin",
+                        "airoha/en7581_npu_data.bin";
       };
     };

-- 
2.52.0


