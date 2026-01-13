Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0934DD0C84D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klRklgiJSShiARW70Giz3Ol04VpSpUdVzYF8MaiVIn8=; b=cTEkv91y10UmRkviHHt0/VQ24a
	vAhACjRnUvxXLdpTprXfmlZGJh5t6h6aXJPXiBz0hkKQSHwZui99RsThj30JSgoDhyKKneycozcar
	x56JdFz/q5P7z3WeQCLdSbl2zvtB4FQdcRSnfufmOhXAH5fnwkqah080SzpDmO4Eg5Lx7WU7tFww8
	Db4OrbrQgojhmp9OFGri4b5qxVemQ1UM07NU7vxLDmL54NGoDiN9HZpP1Hdru6UCtngh8of6u7I9j
	WfoeWBDSwpQ98R5CrKVOJ5mro3/SlLNOOizUmLjPAYVNKug20ZpeH755bKAnfCF2fqXP/5gmMN2Vm
	mLZycboQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8C-00000006wyv-3HuE;
	Tue, 13 Jan 2026 11:00:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc89-00000006wuI-40Ac;
	Tue, 13 Jan 2026 11:00:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768302006;
	bh=4gfA9VmbxP2vBCiTv/gwlonLU9/zD7M1Pt71XFpBBZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NchR6GiaUooHTre3WtFcSqbZZGslJfanSyStpK9aZzu8lB94FGIXkxyU5sl8QSVq/
	 MHqWHa86C2Yg+GtFFGaFtlmqTQ+5T1BKlHTlbNrx10nb5AKeWePCAGq2xC1WXve7yw
	 PhsLBD7nrxWJTrduInsxO37Y+uscNvonlahaDWRes0haPnGJVLJmzhBYieEgi8wGP3
	 s8waVxtfXmbE4bAjptp7EC8tjTEMJzEQUUfS3RQSJxH6nyXd1pj3/woskLiSiULz40
	 bFg4UucITHsobve8lFAaGJ2WWJgtlUemrFFoI0vlpYaPvuOYXQdsMweXlXOz/jnttu
	 j0kZiyyxaN7Ow==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4847117E1406;
	Tue, 13 Jan 2026 12:00:06 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sen.chu@mediatek.com,
	sean.wang@mediatek.com,
	macpaul.lin@mediatek.com,
	lee@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 2/6] dt-bindings: mfd: mediatek: mt6397: Add missing MT6331 regulator compat
Date: Tue, 13 Jan 2026 11:59:56 +0100
Message-ID: <20260113110000.36953-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
References: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_030010_175334_21B0BF95 
X-CRM114-Status: UNSURE (   7.88  )
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

Add the missing mediatek,mt6331-regulator in the compatible string
list for the regulators subnode.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 6a89b479d10f..05c121b0cb3d 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -90,6 +90,7 @@ properties:
           - enum:
               - mediatek,mt6323-regulator
               - mediatek,mt6328-regulator
+              - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
               - mediatek,mt6397-regulator
-- 
2.52.0


