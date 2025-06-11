Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4EBC678DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bc9ItNb4misndePJHAQBHEbXBs/KilkPF3VtC8pEgN8=; b=2LPmio5UmZ40ruJ/tPlKa/2k/7
	9hJpFPv+9jY3VfeuwH7QsRSrdQcDWU1ZHncDZya4oapUJ+Y1Fqu/+8d56pPYcxie8blhikJ2FVgCH
	QQLyHR42RXimcpFPrkuH4bl8V5DMLsmeIXZLnRnKKv9tpffEq66fskoymirAryPUC26cXIgX/pFWM
	ThsgKMI5crMpLD2Ztozclu0V8tFyo1xks5XEKE6+0zjnOSCLPJ8O1IXhzjjsE0o4JxqujxGcHnljy
	VsE48b3horIVsb4KDZRSITaANZOKQfuVZ1JYtIjGWFQIV+Hcmyg83Oytu0v0l8Q4Z6HXUoZmZc+7B
	9i2gbirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMpD-0000000AGrK-1nO3;
	Wed, 11 Jun 2025 14:53:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJJP-00000009i6l-0MDt;
	Wed, 11 Jun 2025 11:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749640085;
	bh=8YPt+10PF3qsZ6u8IevYC2mBMTIJyfGubd5NrtU+ZO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XcSTDEvYeZPzaeqiIX9F1HfT4Ii2n0GuwJQFqHIfokyBqkxfuenyD8lpT6oh3xcQs
	 PFSXwrGIv6kDhbiQRLlVKe7Vm44J5zCnE7YBV7GCNY4vipJEuxdPVTJU3i+dvKYvnV
	 FSX3ozOskQctWNGsxqDcz8hVxgn9wt2u9hCekVRNAXhGu+7C898me3e8bWRheC6L2E
	 vb2m73aIATsBym84a4sK43D58EhkJ8hj4jtM7Ed0qAn1LvopCwCoIaIhdeKY1q3Kor
	 42nHPnlsfi0ML7HqzEzn4dBdZqssxD+oUywb1x8EewIDLGy1/Swge2fotHFk+NrZNe
	 F+9FTidKuDHQQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DFE7917E1290;
	Wed, 11 Jun 2025 13:08:04 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: devicetree@vger.kernel.org
Cc: qii.wang@mediatek.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-serial@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 2/3] dt-bindings: serial: mediatek,uart: Add compatible for MT8196
Date: Wed, 11 Jun 2025 13:07:59 +0200
Message-ID: <20250611110800.458164-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
References: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_040807_265994_09C9C739 
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

Add a compatible string for the MediaTek MT8196 Chromebook SoC,
which UART IPs are fully compatible with MT6577.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index c55d9a0efa19..823ade89d60d 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -48,6 +48,7 @@ properties:
               - mediatek,mt8188-uart
               - mediatek,mt8192-uart
               - mediatek,mt8195-uart
+              - mediatek,mt8196-uart
               - mediatek,mt8365-uart
               - mediatek,mt8516-uart
           - const: mediatek,mt6577-uart
-- 
2.49.0


