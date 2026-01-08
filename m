Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35CBD185D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 11:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvt0iFGQJkRBbHPT7vJocdCLv+1O0MuW2MepgeOfYc4=; b=e0VMCl0zpiIJOsiP8kYJfgcULY
	jpr5UtbyMMjpf/hp07f4lekj7+wa/GXZ0gTaTt7XxQzzfiL4xLZ/1lyTg+Sr9OSAWV1ge66xgX7e9
	2jJ/e669hSRoevgj1MGp1P7Ltq6+vVrX+w/v0bJDjDdQ1lM6Q1A7pmdGj2YeuK+Yy10cJ3ywt6uqP
	tOK4gCoz2yNmi3w3okMX3KJSPNLKEZhZwVArndBkUyh3ZcNF38Vtcvd/T0bLRZlxQRfffGSkamHgZ
	Tj2YL6J+FZSYTGCAzkPjGLDWx4IyYmZXPYGiJyvDRU2WIpx8Ng9JpsJJjQFFZFhLYwMqPgxBngGuv
	kgIANdhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnmo-0000000GmQE-1GjM;
	Thu, 08 Jan 2026 11:02:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnmj-0000000GmLT-10ud;
	Thu, 08 Jan 2026 11:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767870150;
	bh=SVu3UQUP3zJMwteVTk/VX4i8DbMJ2CCZ0oIXKhXaKOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S59zDiu4fIt8gfIdKDLAGYlneok9In+4XOVaEIsqpMY3dPK/eNJpNBq0PvMV8GBdK
	 yXshoeqOuTXxmxwnkbBinjcdsgLjkRxoywT7s2KPe+VyAG0J0b/Gm2h/rmow6nSBD/
	 JStpXc+YuGZKpzNoENX5iRaPLiXr9gwSxDLAF8bNtLoLLUcMyYgntxNzfKLY4CqdUR
	 6G/ldA73AssDIUS/IVh7kVfRkk9PHJ6KPsjvacltMZBfv5kPdPi1iht/qEq9+/zhAK
	 6biR4S/ELH/n3IT9bbpRMIfii4ZYodln6w3Hngnqb1jKx3nit5Au/cFnP9TIw8/39h
	 dm2yagH1bmGGw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8201517E150E;
	Thu,  8 Jan 2026 12:02:29 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk+dt@kernel.org
Cc: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	conor+dt@kernel.org,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	atenart@kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 2/4] dt-bindings: crypto: inside-secure,safexcel: Add SoC compatibles
Date: Thu,  8 Jan 2026 12:02:21 +0100
Message-ID: <20260108110223.20008-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108110223.20008-1-angelogioacchino.delregno@collabora.com>
References: <20260108110223.20008-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_030233_433697_AC2EE9BF 
X-CRM114-Status: UNSURE (   7.38  )
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

Add SoC specific compatibles for the SafeXcel crypto engine,
including one for the EIP197B used by Marvell Armada CP110 and
and two for the EIP97IES used by Marvell Armada 3700 and by
MediaTek MT7986.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/crypto/inside-secure,safexcel.yaml           | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
index 22025b23d580..736d675e19ed 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
@@ -12,6 +12,14 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - items:
+        - const: marvell,armada-cp110-crypto
+        - const: inside-secure,safexcel-eip197b
+      - items:
+        - enum:
+          - marvell,armada-3700-crypto
+          - mediatek,mt7986-crypto
+        - const: inside-secure,safexcel-eip97ies
       - const: inside-secure,safexcel-eip197b
       - const: inside-secure,safexcel-eip197d
       - const: inside-secure,safexcel-eip97ies
-- 
2.52.0


