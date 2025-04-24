Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D315BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7RmSBdjRbbotr7bXpNonzw0kb0neUW4NIQRqC//KbM=; b=EbzJOHnuEIuPqnqu617QED0aC+
	PEiLoXae3ZAP5ZSpPdlapB/9AuJN5EOhw7rk4MRg/7gauWbrT4sr5OdNwwue/H/2su5DoPOGldtWn
	EYwubBLAYD0BQHpl7NjxVNNh5+6GRrokD7i8tJVTWmCfDP8srKJq8Nw9+UTTbqEO0phhJU2VBSZZ/
	llSgHlBLhQAPJcNFHj+vOxApzj8ibW+VsvowEzTAyxsN0fpeEQU98P9LEVOiI6YlJWxHYs9tcrDD2
	s1FUs0ChnMs8myrTXxjkSmCrgGPx2JsOyfhnyKD0pcNkGNIyGT4aLUkeFtWQmsQfyV05b6QLVw9Gq
	f4Ap3JqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uPA-0000000DnOJ-0ced;
	Thu, 24 Apr 2025 11:06:08 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tWJ-0000000DcVq-1ecm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:09:28 +0000
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4E723343024;
	Thu, 24 Apr 2025 10:09:20 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 24 Apr 2025 18:08:39 +0800
Subject: [PATCH v2 1/5] dt-bindings: sram: sunxi-sram: Add A523 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-01-sun55i-emac0-v2-1-833f04d23e1d@gentoo.org>
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
In-Reply-To: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Corentin Labbe <clabbe.montjoie@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=SZdtmllnLkE/VhdsaTzS9ljZiaw8YmMflpw3nLGy6P4=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCg25Dfr5AniqH6ubA2NLvTbfb63kRxV604lla
 0zli1tpok2JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAoNuV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277fj9D/9s1kg601z7xkamgA
 M9vOaomlxHDjhAqLtTFqF1sRu5+APkyrC/BBZyzgzz1KvxgM4Amm515sp9m669vA5BX8ea9ggZF
 X7eDxzgrsYriVEyRZ4GxImqmkC2A87CnleaVUUj/CqY2oUq3m1ME7sKe0j1k5k8ekM5E2x3zemr
 XR7De57g6ermiWmJT75lPfxAEKPVCf5vjWNxVc2uyQDkjdmBwRgaYpbaUnsirezD0fzQkg5ArKE
 T7OzWcIv/HOfgvgwUapLgjabog+kQ+erHEVC2vxN/o6XsbyklNWNbBbo+Mz2u7hGtQrPX9FyHDy
 dPq6ZOLpSDx26tLB54kJOYHSgMxy8S3kHMWKYmQVGDSwB9VGYV1U8+VhfcT+IwQVDFRXEn4i4WN
 Ratatjad3iWajGpuv0ZyV5wO6ltI8q1c5AupYsBG6WgyRyV+v0Yduqdcln/E57XU0s3TgKwsBFw
 sAp9BCclQaMWkYdGutMFt2NqhbrqbKavMYA14YeXiCDpFJWdXNcr6S4BS2/Yuihu5byqyRE2H51
 s+QHIooZdgOGWj5VSs93v54RYeJ2Ip3HXlF57eNMnsjf/VEfe6hQDOVAlK9f2uQ010bk/F07fwb
 /nJUb8wmNDsnVVGLpC4utsUGuD15YZC7tdS5BMcMmcqfmdOaJ/omYJmTohdidOYUa8Cw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_030927_457947_3C48699A 
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

The Allwinner A523 family of SoCs have their "system control" registers
compatible to the A64 SoC, so add the new SoC specific compatible string.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
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


