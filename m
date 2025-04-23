Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3B2C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40InifXBR1Nn4Ok408r2KZZj9K1gHZjFaPZAueiG3lk=; b=ukX+g2fYJxQFOE0zGSN02MZJ6D
	k6E95hLkGyygf0b5BbootNFHcanrZAF7es+6IYpgVbPhjMVl50YQfCzGmtm7+8L9WhdL3xVUPSKlF
	8fZ2luWGyUXZ1X+lwUBavqxBb9ZQqTA+xeDE0BxQZLcPaNHpo2QuWHzRZSK5NuAVdXxr0OcU79W3b
	771vj6jn4USQ97tk6AhcksdhwmtIyqpdootrpTLfONjduxL+qMFMLgyECmDSHkkAgmcSaY5tdFRNH
	bgXbDdZQVGX2ur6eb2XMYuPpTCEV/853SH+KUAT+AFl69AAXqOr4e0WWL/m38im4UWwR2Y9qbw69s
	MAMwna5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e5L-0000000BINW-1lJd;
	Wed, 23 Apr 2025 17:40:35 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ahu-0000000AlIG-2wkS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 14:04:11 +0000
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5F3523430F9;
	Wed, 23 Apr 2025 14:04:04 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 23 Apr 2025 22:03:22 +0800
Subject: [PATCH 1/5] dt-bindings: sram: sunxi-sram: Add A523 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-01-sun55i-emac0-v1-1-46ee4c855e0a@gentoo.org>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
In-Reply-To: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=987; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=fNoJRpHuKT1mrda+dXosfcR63wOlI+o2Qg/r3AfmdGQ=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCPM8tzxyRwM5JaEizk2cNclzPvX++EJ0fWumI
 +ET5sc3sJyJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAjzPF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277SdDD/9ZZ0Hso/3o+n/pod
 4Vcz6ad9dd0AuydxpIuJZolPthCKCSHL3oPvWZW3S7D2fVAJ5B8dCw6dAAuv5D7FCEzfEHqUiKq
 c9CPebORx/66nLiB6PZrmdTWtUX/1BXaogZwJjr9sulTEBpRrWTJVoqt842wahV2GIij/JZ6XD+
 01GrOr2Xj+X/BK6C3RrhdqnRgJxOskoBOVhftQcnpFDfSKNSzHhvQaFXpnkwR308xiPhuZE4eLh
 Vl/KWdbEuNhZoyykq2p3x2rayeE16p0UYqz0aSNFvTOWSs/sUGdjF6Jo6fnaLPsewkye6Bi8l/t
 obiKMbLT07Bl2FlfwZuX1rhSZGPu7fCK3RPLcAXgNY2c/BGgYw+7Jj1ZeJCVr+vk7A/U3YYGOJP
 yOWuR7ywl633p5mTX1AWXag0kJWCySDR/OYeNkCtvKlV5wMCzIhILsuayDC9/mdYGo8vpZQvsTS
 qZjmgAYdNfFnkPXdueuwIHNnEvpOShtZHjjHqUANgzLN6mYtQTLfAQgnDX7PX2GVZBtc87tyKBg
 C7I6/cM/WeQCp1o5A2aK1qqYXbAy2AFB82ntCwY0sxf5JzEbEKyzWQgR3beTqVm/mDdfYZChdCm
 HG+FuA4VpsQ3iSIsKsxnBtAzFpU3KQMfyDXjRue9K/gQXz0atGdfd5mCC/JUKe4ZWTnQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_070410_771395_26C0B3FC 
X-CRM114-Status: UNSURE (   7.82  )
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

Add new compatible for A527/T527 chips which using same die
as the A523 SoC.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
index a7236f7db4ec34d44c4e2268f76281ef8ed83189..e7f7cf72719ea884d48fff69620467ff2834913b 100644
--- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
+++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
@@ -50,6 +50,7 @@ properties:
           - enum:
               - allwinner,sun50i-a100-system-control
               - allwinner,sun50i-h6-system-control
+              - allwinner,sun55i-a523-system-control
           - const: allwinner,sun50i-a64-system-control
 
   reg:

-- 
2.49.0


