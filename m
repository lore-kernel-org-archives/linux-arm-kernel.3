Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F95C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulsyOEAW39KJ8dazOP0K2bOxQjwVOmz/tpx2CID9BOM=; b=1imLrI7poeUDr+wMYw7Zt1604l
	nSziV4Y8FPWNP7EGrRct1MUN9327Gto1vi9h3otlrR3Y8sfvL8unjnuOWhrd0yb6JAVhHSHBzbNTG
	jXEmqfF14YyORMXGSXB4Bm4ULSdZzSZWR3EMgCFkSmW2wP19P2i419jZLOMDywTTmDWxwwda7qMtz
	l8iK/E5iUpVW+o7xkPPIkS5EZ0Dnvp4AYpqyZjJNSSgC/MknBKiU55hv/LL5Y2rECaUZ3L9l5obga
	sw7sGeyujU7HTCDYkSPmP28y+SU+TgBuTuELZ06ofEA3p1/u2BfFE8ThtamMWEH+nwwy0FZTlYQgL
	I7KUBa9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMpG-0000000AGx6-22Pf;
	Wed, 11 Jun 2025 14:53:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJJT-00000009i7y-2AVm;
	Wed, 11 Jun 2025 11:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ulsyOEAW39KJ8dazOP0K2bOxQjwVOmz/tpx2CID9BOM=; b=N1+FRWdofSHazD7y1sDRTEfqRy
	pn53LhunAFS0JTiOkPXxYsa7nu7pQNgQh9lmQQ8PRKoHeOYdxBXDkVwqL8rKLNxwEnCWY5eZDXnZk
	BH8f/f+CrG2oxeUrXWl8vjx73tA49IMGBmeMwpJU62VcTtPWjzkot/MpJfPrhsxBPoTOPmyhFcakC
	Qx3NK71vorQTiLSpch/cjLv+vV8d8ZLxPS6qsLtxtVUL3CxlVRgthEM/xHXpWO6pj5xAcgziQjY18
	ip/KDxMVaUhYaF001LD/RuTJnz51/ECHCT+6348M7KVFKE9h/Qyo1yRuToXAkom2JqQgDuOGwX4HM
	VYAYrumA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJJQ-00000002K9o-3gtY;
	Wed, 11 Jun 2025 11:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749640086;
	bh=eaITpXuq+NtwwWLjQnEGdFQTRjmcpmnkjrOTyBXqJB0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b1HJJ3t/ZvwPoU23FmBr/UWl/DwxGDMZ9LuMNlka4psK9nmRf+kaHi/mDwa5DldTh
	 bYZvxIb3Z/euiUiXq1S7LTq4AA7cpT0RqRw+NrCvUtXpaRjPJs0lYlEoJwIKHbvjYQ
	 SZs4sXyDX3XWa0w2NyMYoATELkd+4wTGgLUwflHkYMOWyCDnIRCu/O8t3qqRiwm9m4
	 Gs/tgpgLdV9PJTMM4FVTNbT1xMy8TAUChyPO5Mu5FpteNdrUA00hvjJoGLv8A+pKz6
	 0C7lURQulStmJR+zxNxfCIN8rX4Muj8pRqClT7LjCPbOtMrOugRK6m8o7iPJg/2XBU
	 3FAFJzGe8+HqQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EBDD917E15C3;
	Wed, 11 Jun 2025 13:08:05 +0200 (CEST)
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
Subject: [PATCH 3/3] dt-bindings: i2c: i2c-mt65xx: Add MediaTek MT8196/6991 compatibles
Date: Wed, 11 Jun 2025 13:08:00 +0200
Message-ID: <20250611110800.458164-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
References: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_120809_049899_61BCB8DE 
X-CRM114-Status: UNSURE (   7.98  )
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

Add support for the MediaTek MT8196 Chromebook SoC and for its
close relative, the MediaTek Dimensity 9400 MT6991 SoC.

Those chips' multiple I2C controller instances are compatible with
the ones found in the MT8188 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 23fe8ff76645..03f621fbf108 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -50,6 +50,11 @@ properties:
           - enum:
               - mediatek,mt6795-i2c
           - const: mediatek,mt8173-i2c
+      - items:
+          - enum:
+              - mediatek,mt6991-i2c
+              - mediatek,mt8196-i2c
+          - const: mediatek,mt8188-i2c
       - items:
           - enum:
               - mediatek,mt6893-i2c
-- 
2.49.0


