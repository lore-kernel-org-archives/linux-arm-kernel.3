Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253CED0C84F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kR9y8vMiTaKwH6rdtmAiNzQ9eqRrJWJwRKc1ydPCgpE=; b=VZNig+AGSTtatF7C6VHQ+XswzQ
	qbBsqMJZY9IPMNeOgawFn8Cd+QZr46pGFK+RENXMR/HJ45APOt/CGqKZmeAwUNP2dty9QCyUnY+bB
	HLR2jrVsZ+VB4FUV9Acguw5RVv/ZGbdeRmtiGB4lyUyEZnml6IatSP7qdj99IKwV452sLzWYXODcl
	VIWjAW8qK3YKAKt2EdLVAQLFYwW3vYR0Rtn+Xj2Cp1mJWNt9rCdNLEEbgnJsJDy2Nnt6XAq4KoTPn
	3LwlcBu0yUMr6Hd3qjgw1aCLdyExllC1aqel5q2lPln+Guth4bDnswEPVYhhxy/r1J6CTvpohPdFk
	2TtIpdvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8w-00000006xk1-2oQa;
	Tue, 13 Jan 2026 11:00:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8T-00000006xBJ-1Kbe;
	Tue, 13 Jan 2026 11:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=kR9y8vMiTaKwH6rdtmAiNzQ9eqRrJWJwRKc1ydPCgpE=; b=ik/8VAjZb1VczHKzhMdZQzrL/+
	/UqB5XZvKsA5i88v44VEw97tONKYmslh0r/ptmvyNfqdHFoGrbwQwFankaHTKkcRBfep3d/vLGhdP
	PkRSLkFmRbzxljccNZh7j8M//zJlfYQEcralAnjDa+jONnIR20nVATmM8lKzate78VxY98tmhTzfK
	OQU1vxH+hHZI8kLzhf7ryyLnS3oLTM/ZA4C6C4HBZ3l84BL+7u1pbqwlQMJNsiJgugTYGpSUC8LBo
	yXYC4c/owfKC0gs29t2iDK7N9w8Z3m40tpH6G2nI1tFkdVrfm0pVGBrqIZVTlQZcSq5llsW5KxpVL
	pmvY9YGQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8P-00000002eiB-3iKZ;
	Tue, 13 Jan 2026 11:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768302023;
	bh=bptASkFhv+DFWmJaUioaR4+nnGLEW+O7QNQvsPtTfRY=;
	h=From:To:Cc:Subject:Date:From;
	b=FRRzpuZsRCG2syqd6Tqb2fUsVzd5AdIvPvCQZ6fqoOt+GnShliDyo5VQ2KnH5WxE9
	 +yHjGsyBVgp8IW1Ws3j4pQLjLIArQ/xTieBSpYOQN8xijIwKNf553Ep3lILwyymD8o
	 t4oLPuOc7+qDIjJ98D1YMMUV3KkkNIE8PHPk8AGs4KdL2jaFzBF0QoKHzwR/zZCQBp
	 4LIozmvDrwo0gwF+rrwdIOrDSw6REscztK4+nUtj9BhA4r8rM3k6bIRMvsLU/BwhC5
	 Cm9x9T5JRp7A04lYKHImRXTa0FIz1piJf/W3nMfPg55nOzTl667ZuRGTeWKCGbP157
	 Edv0ROtmthdzg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF68017E11FF;
	Tue, 13 Jan 2026 12:00:22 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: devicetree@vger.kernel.org
Cc: andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com,
	dqfext@gmail.com,
	sean.wang@mediatek.com,
	daniel@makrotopia.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] dt-bindings: net: dsa: mt7530: Allow interrupts-extended dependency
Date: Tue, 13 Jan 2026 12:00:20 +0100
Message-ID: <20260113110020.37013-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_110026_308749_557EA25A 
X-CRM114-Status: UNSURE (   8.43  )
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

When the MT7530 switch is configured as an interrupt-controller it
also needs an interrupt but, in this case, only "interrupts" was
allowed.

Some devicetrees instead use the interrupts-extended property as a
shorter form, and in place of "interrupts" and "interrupt-parent",
as an equivalent.

For this reason, when interrupt-controller is present, depend on
either `interrupts` or `interrupts-extended`; this also resolves
some dtbs_check warnings.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml       | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 815a90808901..ffeb8d5836fe 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -279,8 +279,11 @@ allOf:
         - resets
         - reset-names
 
-  - dependencies:
-      interrupt-controller: [ interrupts ]
+  - anyOf:
+      - dependencies:
+          interrupt-controller: [ interrupts ]
+      - dependencies:
+          interrupt-controller: [ interrupts-extended ]
 
   - if:
       properties:
-- 
2.52.0


