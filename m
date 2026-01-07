Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900D0CD582B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 10:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlJd04IJAS1HvHJY+KzvdyuK4R/B+6CWZR4nebThois=; b=GvPaeMTvo7B+bq2b52N9ZRLrFu
	9chLY89hnEZZ6INhpRwSUIA9m+4r3r1EGKXlngdGjwIs0QbJzg2DU2k8BWeW/aoumJyGP+a10yLE2
	+gsQVedJWul0duUqc3iOjksKrQH56mfIX6ZP6uw/pM0BV8P1OlCO/xcU0nfnqer7AW8HmdrV9uyKB
	7saLT4iTovLeSkTgoK/TmHr2PLQXLwoHS+95xcv2z5NPFTJILeu8lyw2RixHMwLF5v8iC/lFcPf2n
	VzgUQkyeayrCzoSLJcvnJHoqZ4HviljRB/cq97+AyNR2Uju1MJd5KORjnVyYzpM1H0VxooWoiAf/2
	EnPJNcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQUf-0000000EeqP-0Bg9;
	Wed, 07 Jan 2026 10:10:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQUc-0000000Eenw-2uuv;
	Wed, 07 Jan 2026 10:10:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767780615;
	bh=kzz1stJ/eG8rdi6weyOcBPC+8rDtte6uRtWAAV5e9pQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iak5027g0+u2kscZzr7GCHrAOEzDyo9EvhydvzaYnmf8wbaALa35nPI6iCDxk7ngI
	 /5btIx5qtOgtU0563xmZ5wyqtnZIiFVDGEJNkbPboqeE37ZzyJPcMKzWTRFgldj780
	 5LYmKT2Jtg5dSJe4YaT915prHlAzWFtU0QHEOq7zc7PztgK3Q3/fAemstedBZye9Fq
	 T6w4dc9WlzB73GKAMY3Qw9FCuSzhgzsxpRfXha41GNr+LykiTRuKwqBjOOyER9voNm
	 RI67BkzrP4Q2YCshRF0SWRxilhwoDtZz2cfzPOfcI/Pqn2gjVlOTTITMgVyjcai9lC
	 BKbEw376s9QqA==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7e36:2305:d47f:6e43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 02CDE17E150D;
	Wed,  7 Jan 2026 11:10:14 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v11 1/7] dt-bindings: vendor-prefixes: Add Verisilicon
Date: Wed,  7 Jan 2026 11:09:51 +0100
Message-ID: <20260107101005.84039-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_021018_907686_E16DE283 
X-CRM114-Status: UNSURE (   8.03  )
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

Verisilicon Microelectronics is a company based in Shanghai, China,
developping hardware blocks for SoC.

https://verisilicon.com/

Add their name to the list of vendors.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..ce5c413948b1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1745,6 +1745,8 @@ patternProperties:
     description: Variscite Ltd.
   "^vdl,.*":
     description: Van der Laan b.v.
+  "^verisilicon,.*":
+    description: VeriSilicon Microelectronics
   "^vertexcom,.*":
     description: Vertexcom Technologies, Inc.
   "^via,.*":
-- 
2.43.0


