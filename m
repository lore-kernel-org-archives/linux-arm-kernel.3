Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7EFC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrAzp/8g+0mfl1/QAjhmGhjwofBmZO3MYih+uVzGQ1k=; b=ouaO+cx1lHDKIlou2v1k9HTeO/
	k7dQRxxm55xOBfVP2S+/C8IcGUGAEnOZbV/YvtuLsHU+kkaRb0gK0qaGAQLSEuDocedxMgMM2t+IM
	Gwor4reWIWglU/utUSXCy7i/ygooHrMv51wpw0wX3VikSPJKvBcYPQ8QkOLTuQge2QweJRfmxyIq/
	tuLnVCNkrwmJoNUxJ0UsPMSnmbrqbo5HNS2TtIs8a+RhU/wdHUyT9g6HyPdFj88PV70FlWtJH4jSV
	lw39j9r5C83i6rKc/IeCBtCb7M/Hd6U4gxF2QGBaSaKHekcEKGsEyQNmb+LqTKqYvVBJMXi768fKv
	DDIQlfEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uR0-0000000Dnzn-1BNT;
	Thu, 24 Apr 2025 11:08:02 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tWP-0000000DcX7-3C5q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:09:34 +0000
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7F9BC343016;
	Thu, 24 Apr 2025 10:09:27 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 24 Apr 2025 18:08:40 +0800
Subject: [PATCH v2 2/5] dt-bindings: arm: sunxi: Add A523 EMAC0 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-01-sun55i-emac0-v2-2-833f04d23e1d@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=5l+lKBdeLBoQJDeDwdunSWCv3VLlQKCuI1baaiMgJfM=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCg28uZAZCSSi4mwqc7sIZwc6y+aLe4/0Pz9Ic
 1dXFjTTTpaJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAoNvF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277b2cD/4h+l7YLvA7EAXzKL
 8HoziTK7ZctMgLc2J9Hx8zSOr9UreAxgu7L1CkoAx0rm1k83BV8lbkb+DMXaFThM2HdsoAsCPZY
 0Q551tfrpUSVaYvgq0/jgZZ5vVuh2D9cOTFYYnS+Vq8uiD0agscnOeztT2o4EnMbKJr1nMqb1O/
 oYOuwCRhWIXqJHJb1v9iGVizoJz/wRysE3FjQj+PTVge5Sn5jK0qRpTx8qKDBlEdLVL1iaDzzEP
 JxeG8CDPdUBH5KoEfQQkcZULlOwP9d9PErUI8Bv+y1OpOkJlMtlkcB7a000L8BY5DPF+kujigwQ
 8AvJkQ8XMGRCIoTb0P2qoz+9xdbLIcS82Oyh/loTv8JMFFwb/s6s4IzB4fFnv7GLU90V0jjPeWK
 GM0VvzdOqZ+23JUmF9cZ7yang9hzw58lXGPqmjTCoZ+EPBv7hDvqGHYX/x6Yc6IuFt6kC3ADAzT
 jnnUi0+tz2prfT7A4z5V5zNNfC3dcxhWBiFWZpIbBagzjlvrNbjvhCZw30a8+o3wEwHdgvPxWIn
 QoJ50U+/oPhQACQA0fYq1BU2OhtqSxPJFDGxX85xO8TZ7CXOwemZzs5YNNBCIjilDIMdYBnYckB
 iyimtcEXwQjVHVbqJTXYCSZp6SX++fZlGHmaLGhDb1ngFmwa6xGQ1N4gIj+LY0gqhRjA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_030933_825889_E356A0C6 
X-CRM114-Status: UNSURE (   7.59  )
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

Allwinner A523 SoC variant (A527/T527) contains an "EMAC0" Ethernet
MAC compatible to the A64 version.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 7fe0352dff0f8d74a08f3f6aac5450ad685e6a08..7b6a2fde8175353621367c8d8f7a956e4aac7177 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -23,6 +23,7 @@ properties:
               - allwinner,sun20i-d1-emac
               - allwinner,sun50i-h6-emac
               - allwinner,sun50i-h616-emac0
+              - allwinner,sun55i-a523-emac0
           - const: allwinner,sun50i-a64-emac
 
   reg:

-- 
2.49.0


