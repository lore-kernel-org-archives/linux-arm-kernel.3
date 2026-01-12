Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A7BC9EC8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ORbOVJnhKpDO0EtTgHMREJVrPbwxmai6+8BZUWWjPc=; b=U0ot5ibjj8HqHwFSUbzyQ9cSX9
	Xp2AlC8YQJvgTlsylGeHnshsCEzDvcxbX/lgZSZlBoZyd/JL6MlwsGB/3hTyqeXuadgDPbIt7n1ux
	9p0vnL40C51fQ8lnG/OccpMyp/I2KniN8CrTCCrX1Uj+Kl2pH5/tCIzKyWymdlQhbhDsGhdeaFaCf
	sOfMybDwFgI9fNVycbE08gd7aG7RSbW0Xs4fW77s6T4/EVHiZa4h3mE5/E7gbuXatDXGKZ/FkNMVP
	dqbuc6dRek8g4oQ0hKtWUbvmPkmKGEhzel/xRnpbai4qVzd2IeIoF8L+HMkF8UXE+Mt3Vl2M5AwiV
	NOqOSZhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJL1-00000005aFK-1H9L;
	Mon, 12 Jan 2026 14:56:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJKv-00000005aAA-2EQU;
	Mon, 12 Jan 2026 14:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768229762;
	bh=vlvXyyMDvUQ3cBZtzqbSzYWVueI3kVASVe8Vv4U//o8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pVmFxJFrLP5MLO84m5NvMAk90DmW4brET7ieoKwWNqZn/RP+f78En/Rj7ZldJ41YI
	 /Z7vh3xRucqO4hZwJrqYGoDIPKv1+/ubo4UJJFqXFOJDs/T0tQcDTyVScuQHQ1rLZz
	 6QaCDiQxFV9f2LBHYFZvjMZYXFnYMjoB/SFEynD6+tImizDnzy596Hjgy/VIeOOlp9
	 jqHTzZX7FkM6LdXOmAHVc4UIcbewUSr5zY6SSujiMCi1mn52pU3WVO6VSkdD1GKh0u
	 mJ7FBdP37b8fe69OR+wSQJAYyhCZCrM96TK76Ez5UAKpFMNsl+Ggv4JRVa3D3eCotN
	 aZcMEocEessXg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D40517E0456;
	Mon, 12 Jan 2026 15:56:01 +0100 (CET)
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
Subject: [PATCH v2 1/4] dt-bindings: crypto: inside-secure,safexcel: Add SoC compatibles
Date: Mon, 12 Jan 2026 15:55:55 +0100
Message-ID: <20260112145558.54644-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112145558.54644-1-angelogioacchino.delregno@collabora.com>
References: <20260112145558.54644-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_065605_719510_E7E8A822 
X-CRM114-Status: UNSURE (   7.56  )
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
index 343e2d04c797..1c8bfd6c958d 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
@@ -12,6 +12,14 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: marvell,armada-cp110-crypto
+          - const: inside-secure,safexcel-eip197b
+      - items:
+          - enum:
+              - marvell,armada-3700-crypto
+              - mediatek,mt7986-crypto
+          - const: inside-secure,safexcel-eip97ies
       - const: inside-secure,safexcel-eip197b
       - const: inside-secure,safexcel-eip197d
       - const: inside-secure,safexcel-eip97ies
-- 
2.52.0


