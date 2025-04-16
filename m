Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20801C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 12:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=od2OKx2ZJXmsnoWk78v2vHplll8PUZKTuoQdN4ZuIw0=; b=IGs5csZbCLQxMPbJ3nK05D762k
	HXyb+Pn/MTzDJ3wjvrf3ketbWjmoVhTrTErgTDL+6PfoyhthY9JyyXyQEfK+HZ1U9wHjeuRTHACBv
	EWHmtI3pAfv07Q+mxhZ/nITB0w57hObqv3o5J7kOJ7BdZ+0ZA4gddlbfXszsSFr90mopoK5Lj4SEe
	W9/ed+ELG0jpt/pAv5OMdSsoGezr3YlAEsnve7uF/Ebqxnwl0f+nFrNzcLFk+3AoPY6DaZoPCz8+u
	b2XTpK7DbYfuoaQAnzgvYQYyH8nIUt4yK612vZ1I+KPK6VBGWQsZ7wLgGCt4asrdzYAMStqzpZNXM
	rnE+dE1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51eR-00000009TFs-0ECL;
	Wed, 16 Apr 2025 12:13:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51TY-00000009QTg-2goj;
	Wed, 16 Apr 2025 12:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744804963;
	bh=Hv3UVjNR1RDcGhnznCYyaIgzVAYJBu1yjNcbNUYluO8=;
	h=From:To:Cc:Subject:Date:From;
	b=IipcR+wCUlnrzntXCJbTAoewVyL43rK6RGsvZaZD+2qFtERDEq+iVU0k0zq0d5Qgk
	 fyc0ur+v3Dxj6rk6IMPhoeizr0eVwPM4Jer3Pt6cyynAiyQHv0YE466TDMVOrMMEFj
	 UWP73wqAf9zZAG18TaCzXfKAZWxiUMcxCHdBIEEjUPEy9ONXpXAq1qOcIR7nzYLTUa
	 V/mwhGGK/dQ/zNQgiUMEJFEazNMfqEY2mdC3KUAVgx7uSOUHrm/xXs/c3bQmtAoP9c
	 1BwwSLvFeBONE+ssLIqzDLHItoVJs87+7c4DWRO/AhIQJCPmmNYjUantea5PLAOtQ6
	 bjTUe00kq2HAA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A7C717E3624;
	Wed, 16 Apr 2025 14:02:42 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: gregkh@linuxfoundation.org
Cc: jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] dt-bindings: serial: mediatek,uart: Add compatible for MT6893
Date: Wed, 16 Apr 2025 14:02:41 +0200
Message-ID: <20250416120241.147925-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_050244_825329_99D0FE13 
X-CRM114-Status: UNSURE (   7.08  )
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

Add a compatible string for the MediaTek Dimensity 1200 (MT6893)
SoC, which UART IPs are fully compatible with MT6577.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 1b02f0b197ff..c55d9a0efa19 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -33,6 +33,7 @@ properties:
               - mediatek,mt6779-uart
               - mediatek,mt6795-uart
               - mediatek,mt6797-uart
+              - mediatek,mt6893-uart
               - mediatek,mt7622-uart
               - mediatek,mt7623-uart
               - mediatek,mt7629-uart
-- 
2.49.0


