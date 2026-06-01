Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBB5CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 14:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LKlG4ZlVp2BUdL9qy6kzq11uvqyXIe0OIDX3KKmCTV0=; b=P9kKkRDhDnKlMo
	5McUYucOAZVNtFtA3CauJ15QnMkjVs7rxX8njUfO/dSmowE24L24bfyYz9SucNPC7m/ZZozYd0BXE
	J1JL+c2Osy0OWGxb8KOymaHTEsqLdVW5zEmuhVO+Ratc4bVn9uyu7NpkPJ8Wzwr1sqCQ5fxWYsaDS
	p81PhxPCFAfsJS5ghI52YRoGraW1hmW3elEqkXeX7Pqr/rF57i0dF4xERWtjDqIkSD2/lYKvOyhE2
	+ZSenEv3IQYlcRvmbEWK1cjU2TuxYQ1JtkwY2KO/RjL9Myx0D3v4i4v0QOXomh6fwFRyzNkhPYqry
	6pHSLKwRJulq8N3Le0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3Qx-0000000BG99-0xyQ;
	Mon, 01 Jun 2026 14:16:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3Qu-0000000BG7A-0HP9;
	Mon, 01 Jun 2026 14:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780323356;
	bh=2mlmflu75mdtBiODN+bKBCjJEH/3vnThy91d+Mg/u+s=;
	h=From:Subject:Date:To:Cc:From;
	b=TQqevynxWt7ybbB9ihSdaiBs4YiYH1mkyc8Hz4bAOgPcyv/zjrVrDm8i/3jXk0eDz
	 ILArlOCVNFnH1qCRejVHUpodlzcVyCnAnh2Qb3mw7p5Rjyvwqv/FFbVEYTuL0DmYaI
	 e9sf4IeYIB5lCqdsmRS8KSwMm6138r50DyNRumcJh345xsDyWxIjnOGeFukFyQGGoA
	 YGILQOn+2EEqkcl6kftQpZPi+pv2gJVREv8l6dbEvoLUv1cqsdYT9ChfpAiobSTzRC
	 tbis/2hsJr61i5iFnRncUwC4kwWmeogzcBV32mpJpTRVhe2jr5xObnkLZH1GtXKwpV
	 P24UwsRst1+pQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DBA5F17E06C5;
	Mon,  1 Jun 2026 16:15:55 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH 0/3] Mediatek Genio EVK: add MT6365 PMIC supplies
Date: Mon, 01 Jun 2026 16:15:44 +0200
Message-Id: <20260601-mtk-genio-mt6359-pmic-supplies-v1-0-05750080ba59@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNyw6CMBBFf6WZtZOUKg3wK4ZFLSNOtA/bYkgI/
 24Du3vu4pwNMiWmDIPYINGPMwdfobkIsC/jZ0KeKoOSSkstG3TljTN5DnXpa9tjdGwxLzF+qge
 1sVJ3erop1UGVxERPXo/AfTw50XepnXKe8DCZ0AbnuAzC01rwaLWqh3Hf/wxTizyhAAAA
X-Change-ID: 20260601-mtk-genio-mt6359-pmic-supplies-6ac0686d4228
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780323355; l=1490;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=2mlmflu75mdtBiODN+bKBCjJEH/3vnThy91d+Mg/u+s=;
 b=b0c7tjNI5hl4SC9H1ekB6QEqDOxB922gw9bmkdU1mRhNqWUvmbdea6cnqbX9liXfg0v6iso+J
 2JsHZ77q+vqAj6JqXyQTK8VcaEg/8RT4er/9LPOkao/Intv+5YU1DCf
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_071600_265592_BB20B6BD 
X-CRM114-Status: UNSURE (   7.23  )
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

Several Mediatek and Radxa boards, based on MT8370, MT8390 or MT8395
SoC, integrate the MT6365 PMIC, that is a MT6359P variant.

This PMIC dt-bindings for recently gained property definitions for the
power inputs for its various buck and LDO regulators ([1]).

The goal of this series is to add the supplies for this PMIC regulators
in the following board devicetrees:
- MTK Genio 510-EVK
- MTK Genio 700-EVK
- MTK Genio 1200-EVK
- Radxa NIO-12L

The series is based on linux-next tree (tag: next-20260529) and has
been tested on Mediatek Genio 510, 700 and 1200-EVK boards.

[1]: https://lore.kernel.org/linux-mediatek/20260514091520.2718987-2-wenst@chromium.org/

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Louis-Alexis Eyraud (3):
      arm64: dts: mediatek: mt8390-genio-common: Add MT6365 PMIC supplies
      arm64: dts: mediatek: mt8395-genio-common: Add MT6365 PMIC supplies
      arm64: dts: mediatek: mt8395-radxa-nio-12l: Add MT6365 PMIC supplies

 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 17 +++++++++++++++++
 3 files changed, 51 insertions(+)
---
base-commit: 697a0e31ee66f5ddb929c09895139779fff33f20
change-id: 20260601-mtk-genio-mt6359-pmic-supplies-6ac0686d4228

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


