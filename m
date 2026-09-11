Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D75DC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tP9DrYq5u3CtW4MPKLTEWyaMKBFQimD/CVcoo0zV9A=; b=UZ/i7CEq++FTyQIadMqbYtkIAc
	H6VCnQRFWRrRP5hHLop1+dEgqNhLMDRBvODdDJy/5f29/ZqaK/e69tqtW4fi/VVak+H5IFlmUoxvW
	1S8dPHiyYdBU/8hfSAV/eKbhLsdS47YOZIAGiKE/+ds6HobEOa/X+JSkS0tCjgliA7M018CxwjQ0L
	taPC29uNoHzkP/qnP93N2bsRJATg6FHgWqTPtl3bq2zZ9joSwqYhTZSe/fO6Y8kNLAJCXURb9oJ0X
	JymlAjsZZ6aIjV5c66r9G5Qc8OrzUyuNv8RKp4jOPvgU94X6r6LEGeLSkNntgERYINSg6jgGz4QR3
	d9w8Lkgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51cO-0000000GnMV-0prE;
	Fri, 11 Sep 2026 13:48:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51cM-0000000GnLr-1993
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:48:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 027C843B08;
	Fri, 11 Sep 2026 13:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA51FC2BCF5;
	Fri, 11 Sep 2026 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789134517;
	bh=3UBksvgt/qdlKN1s8FeogwlZOBzUwTUkG2h4TW5YjRU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cgDLv0gENhV7b5EzTV5zbTjeUAp+6xlsscIn19l/Q+ZDqKbaf094/wZ3EGRZMe0Mg
	 dKZ/iq5ytadP7Db0ieq8Mv4yGgyYUNc5ojlnbGaLaFtyl8td7wiLeQu9PvV1vfa25I
	 eibb+mt9No6Z1GJsEVN9zbtATDgebuz7CehJ4OB5Z36cslv690ec5nVZy4ZaAprZZh
	 WrwlV/AM6a0Fz41/Qec0ejjRV92YFtCxwlqGetdZYgLfGm16nW2QQw6TYgspqCDF7c
	 FS/m0i75QmdEKCmhBTEpTTJUoGs9ULINowXn+etcaH104nnM1nuzX8bgrSWQD1k2uo
	 VyC/U8cFgGvvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97CCC88E45;
	Fri, 11 Sep 2026 13:48:37 +0000 (UTC)
From: =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado_via_B4_Relay?= <devnull+jcarlosgl96.proton.me@kernel.org>
Date: Fri, 11 Sep 2026 15:48:37 +0200
Subject: [PATCH v2 1/2] dt-bindings: arm: sunxi: Add SPC Glee 10.1 A64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260911-b4-spc-glee-a64-v1-v2-1-ed0b7ff02e0b@proton.me>
References: <20260911-b4-spc-glee-a64-v1-v2-0-ed0b7ff02e0b@proton.me>
In-Reply-To: <20260911-b4-spc-glee-a64-v1-v2-0-ed0b7ff02e0b@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado?= <jcarlosgl96@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789134516; l=1619;
 i=jcarlosgl96@proton.me; s=20260906; h=from:subject:message-id;
 bh=Xzdem3/+TDF7+9mo+NvDiiNz7PMRPxV5UR/Ew2LHb1M=;
 b=YK4WUVsNgqCrbxbQjewYp5t3YdnZ0R53TOZ9mwRj/PuFL8VHGh+KG2mjM7I4sg9EBbzfI5fkH
 N34XWTWhC0BBDG8xkngZKdCmCbrwwK7TrH8DOmzZarDMztSTfI5E8Cp
X-Developer-Key: i=jcarlosgl96@proton.me; a=ed25519;
 pk=2/GzZfrbHAiuUrsA5A4A9ixfHKnypfDfzyE+fToY4Io=
X-Endpoint-Received: by B4 Relay for jcarlosgl96@proton.me/20260906 with
 auth_id=1008
X-Original-From: =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado?= <jcarlosgl96@proton.me>
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
Reply-To: jcarlosgl96@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>

Add the Smart Products Connection vendor prefix and the board
compatible for the SPC Glee 10.1 tablet based on the Allwinner A64.

Signed-off-by: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml       | 5 +++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c6..459a1772d 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -902,6 +902,11 @@ properties:
           - const: allwinner,suniv-f1c200s
           - const: allwinner,suniv-f1c100s
 
+      - description: SPC Glee 10.1 A64 tablet
+        items:
+          - const: onspc,glee-10-1-a64
+          - const: allwinner,sun50i-a64
+
       - description: SL631 Action Camera with IMX179
         items:
           - const: allwinner,sl631-imx179
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..9d864dc56 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1253,6 +1253,8 @@ patternProperties:
     description: Onion Corporation
   "^onnn,.*":
     description: ON Semiconductor Corp.
+  "^onspc,.*":
+    description: Smart Products Connection S.A.
   "^ontat,.*":
     description: On Tat Industrial Company
   "^opalkelly,.*":

-- 
2.55.0



