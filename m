Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC45CCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 16:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqCiYuBW+15Q1NeXqbMpQowl0Lk0kZ/GdF7VyjtQ09c=; b=W4sdStDhK54mzlVTH3+UviQwC/
	fLfd9Gc4TS1MQNOMKmTLMrflmZHizaDn+5lgXwOXba0KvE2+IoQ/z9qR68Ch6wq8bNMrOUqvnNnyb
	W7y07xAxVQxzovJH85tIQnjOIbN3fE6G/E/EpHN2JIJYP1l6gltjgqTg0xuz6PojLROXOirqZewv2
	oxCL9NOGlrZJ7Y92MPIkbZNT7qFH5eDwrvTaIm9DQ/5v56RKe7Nh9TP+DquTweiHcFvG7UmtHQuTD
	B1knBDc76r6VdhwutYvu4G8hztYpMKDsJSIFCIjE/Y1kzil4DGO64VdBCQ0X1r/+ZfT5ZTYxUqpkX
	e3WPaXBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqa6V-00000008fR8-3fTL;
	Mon, 25 Aug 2025 16:31:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZDu-00000008XD7-1XEc;
	Mon, 25 Aug 2025 15:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yqCiYuBW+15Q1NeXqbMpQowl0Lk0kZ/GdF7VyjtQ09c=; b=VjZGsqhcygijYC7WmilL9gqU50
	iV1GL8qadpOEN09KyS8qynLpjpWAobH4BDkFS42nTwjLUkF6j+rfpaqGjFJCHyebiIk2F0nJrsu9a
	M5FZOdPYMxIdOATlY48sPaYyU9W1daXuZzM2g+shNhVH9Zy7GlCtRHNyB3h47vfXdveg0JRw6XF4B
	EtW/0CdJBd5KS68eJXAEZ9sOneY5G6qN+sx6aFMMkAJaX+NNJuIQWPsFoTmgm4WeNJZN/CRmEfKjt
	4vmqXF4J8A1M52yJ+g8WryOx34b/UnKTKdKylhT7BVpy4YwJD1fgq70kbMdQtR9ikaKM3/uSYCLdr
	6HC8JGLg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZDr-00000001ud2-08fa;
	Mon, 25 Aug 2025 15:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756136096;
	bh=guHXFU0f2kzdHH8bw4/i4gGvFNRMxxvXfItx9t7XXpU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IhQcx1yx/cXEMqwbGaNbmqa/ukqqLeX0uEvxrArr8Qvx4tLcIWnWLxwTHLQqP5Tgg
	 NvL8tSNqc0Ldrc7Vtrbirb2/eMtHPGkfyGZSF2kVdHwT56w6Rm9JjKapZ85vx3YQn5
	 YWEuhvTByha7BysZUHu397Pv4mc8TPYBwOK72sJo7+YBS483n6/6j99l5L7FH2YYYZ
	 dYIbD1cXl8/8/1ivF5AphdQYu9M1j8gjY5rmye/hL9pjUq4lvOFHwL2untrR0OzB2R
	 mDre0e+62CSJuTWCNVyqPX+Xxs2OuVi9xrB7vYaXzGslGeXNl4lIP9WYbQ6IoeOYZG
	 Fs1eRchiPeyRA==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:f39:d9a9:8ef1:f69a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F0A017E07FB;
	Mon, 25 Aug 2025 17:34:56 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	jgg@ziepe.ca,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/6] dt-bindings: vendor-prefixes: Add Verisilicon
Date: Mon, 25 Aug 2025 17:34:40 +0200
Message-ID: <20250825153450.150071-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
References: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_163503_287685_BFC59D3F 
X-CRM114-Status: UNSURE (   8.16  )
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
index 77160cd47f54..ef71164ab0ec 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1654,6 +1654,8 @@ patternProperties:
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


