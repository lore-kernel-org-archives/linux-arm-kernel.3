Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAE3D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 10:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47ZmwW/BOc+kBsPwx7J+8IwUDN7/dhO0nAYOJEBo/3I=; b=er9eMlSkS8YVoTZIhi37WR0Mff
	KIjGQU2CN27E3KBYnzMLuCbFU5atcsofZiKYOr/sZ7Ti6dQUqh6DPmPHRk6OA6GUebd+9hNVrdqj6
	f5z33yB4+hecIn13UOr7OqY3Q+WwmblNLIThcWAc4rWhTKWn2ZNA0JhmXC9WRKqT1rPZ474BvHTTa
	35+bnRiJtGPpq4WkWwRSoqP/iikAhPOrVOuoyvr7jdDjHQ6/FJnb4yDR0IQSEqZ+3/f+vu2FuUgYz
	GJFBKdoW8S5B+mcrFNzKCYDDArY4uSAFslpKX6ij/9WIv0eCH+rGAZmNEP05AMQX+/3OXCdhDr4cm
	4UyU3FOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8o9-00000003bRf-1FbC;
	Tue, 20 Jan 2026 10:17:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8o5-00000003bNl-29gq;
	Tue, 20 Jan 2026 10:17:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ECBCC60018;
	Tue, 20 Jan 2026 10:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A11C16AAE;
	Tue, 20 Jan 2026 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768904272;
	bh=EMBL9zhbP2np+rXwfdAlIRd+meq4aIVMy3iGLvieQwU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W/Y98pDhna0GDpK8N81FlPJoG0hk2lUQUtkaa/b0OV5QFoMB/T6Xd2a/+pGk8/T0D
	 jy2wJI/SCwbiqy7fi1ca21h1HQwWAi/s9C3rXQdjwJyH/Eji02ShKlKEYGgzCNoRLB
	 x6dHQVylROWRQm1+WT/OekQBgR8m00EAamiwXaQktSXDsv5yYd0WXfKKZigEojbNSa
	 RA23e/FoHTg3lDwEHmrnt9JPa65YYP+46dGyEFL2P+hrl4KDebUTxW95L8pxtKI+c/
	 F32M2vpkgtStHSdVVZEMsTZnwqtT68goupK5Cmig+uM1BGIZNUn5VRVSkJ4OUJPfYJ
	 /ivT3rkxELtpA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 20 Jan 2026 11:17:17 +0100
Subject: [PATCH net-next v4 1/2] dt-bindings: net: airoha: npu: Add
 firmware-name property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-airoha-npu-firmware-name-v4-1-88999628b4c1@kernel.org>
References: <20260120-airoha-npu-firmware-name-v4-0-88999628b4c1@kernel.org>
In-Reply-To: <20260120-airoha-npu-firmware-name-v4-0-88999628b4c1@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Andrew Lunn <andrew@lunn.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


