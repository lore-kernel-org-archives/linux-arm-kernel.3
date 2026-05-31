Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF028CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 09:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SP5TNsZJ8t42hPMyJe4CApTucWD6BLADaIHaI2SXdKw=; b=BLGdDjwC6vFZ6rqC0SBcGQ/Jns
	8sKd334z3k2Izsu0BBGzSgM3tu9VszN3pHUew+R0v9jWRwbs5ghUHescejLDJubRaL9sE8S4+9AdT
	dz0RG/uaF6uJA7D2WknEK62+LcRFgy/P/5HAhllVMwv+12DGSc8iwcS89vlZAFFzxu+p1yt80EN6f
	WVmM59sQf7oMJCxB7GyDxQ78sQjFO86K4V2EEL+MoSxw6F54hyrg/lsPDlhWewkA8Rf/oV+d2/Ze/
	ClTp+/fiRCR7vVNCV0tkM6lIT0da09R5BgdWic442G33TFpZ5zfgDZqh+04vXAL+tSW9EI1KRf4oc
	y5OXA+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcCA-00000009PDe-02F1;
	Sun, 31 May 2026 09:10:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcBy-00000009P71-1Opf;
	Sun, 31 May 2026 09:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A0BA43CD8;
	Sun, 31 May 2026 09:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2330C2BCC4;
	Sun, 31 May 2026 09:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780218645;
	bh=fl0iUdi5y/WRY0Tl1PLawS93frhYjgaC429L2//ta2o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vea4tJa6nDmbCYqrfAXD+hOgB1RtiooRwmw05Az9Xgx/6ESpQ0ym5iKQ8/EpIUh8r
	 8dsnqjyk/q6V5YvqKrbvnni166jSXi5mL2fZ5A8iIysD4/0MVdJ7Yvrzo+69pPUCKA
	 iIqdm1TGDbnvsjTWo8//nUlZ8UINgUvOJ7+B++rKzVhk5uHVpV+D1vl/mnkOvfILQZ
	 VzIoRdftWpIcVNNHRrZzIBNVIwEANABBlDpsORaTABq16piTcJyIAKQ2iGe5NJtMcg
	 ymv2zfnO8nD8vN30SP0SP5m98BCe79/yFQPlPBBsgtepMNF17CJfOXZEajIIUndG6a
	 w5dvDX5mxG/4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC6DCD5BD1;
	Sun, 31 May 2026 09:10:44 +0000 (UTC)
From: Yassine Oudjana via B4 Relay <devnull+y.oudjana.protonmail.com@kernel.org>
Date: Sun, 31 May 2026 11:10:42 +0200
Subject: [PATCH v2 1/4] dt-bindings: mediatek: pwrap: Add MT6735 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-mt6735-pwrap-mt6328-pmic-v2-1-dac37bf92894@protonmail.com>
References: <20260531-mt6735-pwrap-mt6328-pmic-v2-0-dac37bf92894@protonmail.com>
In-Reply-To: <20260531-mt6735-pwrap-mt6328-pmic-v2-0-dac37bf92894@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780218643; l=978;
 i=y.oudjana@protonmail.com; s=20260531; h=from:subject:message-id;
 bh=m78Bi8O6FvM9feF/O3ItPJ/iTAy8mD+DaEC7H/m00nc=;
 b=GHskc8UWok3K7CWbObkaLMAe27510F7dQRsRfHaOcFA8ar+qNdXa+Z49m9YRPxOHT2fKv3KCA
 aeM8he7n6ZdA91JPIj0D4ccd0iemNy8Zl39+H42lJVXnk/8NH/Xysnw
X-Developer-Key: i=y.oudjana@protonmail.com; a=ed25519;
 pk=sr7uwnyVqGKAIhvwnIwormkDM3d2VNc3VOTEU1GmsEM=
X-Endpoint-Received: by B4 Relay for y.oudjana@protonmail.com/20260531 with
 auth_id=802
X-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_021046_408176_CB1D577D 
X-CRM114-Status: UNSURE (   8.82  )
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
Reply-To: y.oudjana@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add a compatible string for MT6735 PMIC wrapper.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index e7c4a3984c60..3a5fd46ce282 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-pwrap
+              - mediatek,mt6735-pwrap
               - mediatek,mt6765-pwrap
               - mediatek,mt6779-pwrap
               - mediatek,mt6795-pwrap

-- 
2.54.0



