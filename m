Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50211D16819
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g2F0eV3n9YsEIZ8zAY/78l+vztA5IyWH1QImA4ZCWwU=; b=WYtcRlBVQt4mxeNm/WDWDl5b8U
	s1yT3C44FXEoyVFO1EWIUNgX031EiJHFsnZqOQtbFJoim/8Tvy165Odpm2dhUuK2Olx6FTp9B0kZH
	qjisN2kCqaMRx1DhZ1n39YyYdxNTvUCweikSUx090P/qXO3kvxXVFiG45Nf4DnNfmyOJSUFO/CVUg
	PSzBOAWdsBJswjEYqSeO4ZtwkFYb3scH+WZPsrdhB9UfaRj6tRDOFHy4hrtWihvZavCcWdnZaX9Y6
	HLGzbPX8frWRgL3ILzQrxBc8UfKT469UTl1oIFdwLK6LHLkWV7K9w0ehGzgQtS2TNHcQ90t7K4jMD
	s+PO4oew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAue-00000002EjD-1i9m;
	Fri, 09 Jan 2026 11:44:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAub-00000002Eir-43q7;
	Fri, 09 Jan 2026 11:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767959050;
	bh=TtLlgylOkTFKzSw6a6/2PGbha2rjuDo428nB5/mFAMQ=;
	h=From:To:Cc:Subject:Date:From;
	b=WNSvGJ/+rRA+IXjIOw4SPhHbcUGrASMHQvw88vQzGgH/9SLqP0zMS9uzvdoY/vZ3W
	 s2E9BRy0XLBfwavE+whw9iGoPbR956iNJxyNGzhWhzqDVyCAbA/UngjgfEDEFqSZk8
	 rWB1qu9Zb7e5yXpcsPE8vbRFKk38nl6EuhXamBH/RXMQLZ2ynqMVzCdB+OXHUx43ln
	 7jhHolf6YmIx5/LS0PYAkR0k5LfFYg3GfLMhVN45DiEq/SxmEKYylbqFkRYZl88ESM
	 mf307Qx6km0NbnAUL/VICqiCi7V7B5Vg6ICa65CA5euVuzMKj6qK4NQVCjkqLpj/KU
	 YKdiTKImENVlQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 417F017E0FF0;
	Fri,  9 Jan 2026 12:44:10 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sjoerd@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] dt-bindings: mfd: syscon: Allow syscon compatible for mediatek,mt7981-topmisc
Date: Fri,  9 Jan 2026 12:43:56 +0100
Message-ID: <20260109114356.36454-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_034414_253035_DA07AD49 
X-CRM114-Status: UNSURE (   9.96  )
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

Commit a95419ff9f21 ("dt-bindings: mfd: syscon: Add mt7981-topmisc")
added the mediatek,mt7981-topmisc compatible to the `select` block
which is used only for compatibility with older dtschema, but did
not add it in the actual block allowing to specify the "syscon"
fallback compatible, which is required for such node to do anything
meaningful in the end.

Add the mediatek,mt7981-topmisc compatible in the right list to
allow specifing compatible = "mediatek,mt7981-topmisc", "syscon"
in the relevant devicetree node.

Fixes: a95419ff9f21 ("dt-bindings: mfd: syscon: Add mt7981-topmisc")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 55efb83b1495..fa023959e791 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -195,6 +195,7 @@ properties:
               - mediatek,mt2701-pctl-a-syscfg
               - mediatek,mt2712-pctl-a-syscfg
               - mediatek,mt6397-pctl-pmic-syscfg
+              - mediatek,mt7981-topmisc
               - mediatek,mt7988-topmisc
               - mediatek,mt8135-pctl-a-syscfg
               - mediatek,mt8135-pctl-b-syscfg
-- 
2.52.0


