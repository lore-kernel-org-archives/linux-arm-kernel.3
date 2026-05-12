Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBE1CD4F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 05:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iueo791mRwnG+WFL6ABgwc7zbXDrjkXXtyAJQah+JSg=; b=n5iMLBB8c7duciM8BdnXsm6DNo
	xa8M/DX6PY5YQDdRlJWfMveT8+JNRKT2EGctD+7q0BG2QNJ8KEIbnpCGVHrDgZnupV1496Dv3BRRZ
	3vYaP1rjtsAp69eX58qBh6JhOuc+RImDD/CApqPMS8/DFlXpjd5d8RBrpMGpWdhd2CqALDIkay6Yw
	XtXbjfTtAyQuHfDz8ynaEW85pRkyJPfkwyB4K8u1SqdpcWh3+as3qU6hSpdYNX9wPfwzSpLsX/X61
	5bQ5LoE3nabj6wY9cBjcSvH6dG0eDgD1GYFCRSuayfn+RUGThVUiqokGFe/uUQOxV6+Xf6hJviR66
	q9uCm2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfZA-0000000FZOO-1USo;
	Tue, 12 May 2026 05:22:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfYu-0000000FYt5-2GRD;
	Tue, 12 May 2026 05:21:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED9A944731;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2EDBC4AF1C;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778563300;
	bh=DE9DtCJhXP2BqElPVUX9ed0zgo/XCG9/i5jncW01HEU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ffbE+zGJGCHr1lAYaJIR/6oJ9iU8LBZco0x0Tficx6r89p3Ly9zrEUzOegHrxguyd
	 qHOFT0POxaO7S03I4cgc5yZAMDRAxQMQUTC+PSZMlg7Sc9MqOP47JUX3lhYI8vlfz0
	 1Z1N0vv49imKJnADYpeKZgJ64GuxN+VSrNbwbHBlIPhOt5Gje3Y6ndZwiOjtzacyzB
	 u1OgH0DaQFIpcE3UDC2lkylIhQu73XPQ4DgTiGLjb+ZEPjN/X1oRY5FOEN3IA+X+uo
	 xGyojJehRUPIHVHvqr2OciQ/LU5bh5uM5XXFGg9qkbjq16PyZ+02f0ZpaoCFb7WBCU
	 WJLAoViSUYHIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9373CD4F24;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 12 May 2026 08:18:30 +0300
Subject: [PATCH v2 16/16] MAINTAINERS: add MediaTek mt6323 PMIC thermal
 driver maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-mt6323-v2-16-3efcba579e88@protonmail.com>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778563297; l=692;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=8NVcmhjcZUhwoicnOrm6owXnni+d+cpxkUFwQ33c1Hk=;
 b=WuN6e8eFt0NDrjantucW+k4aytcYOhKb5NQLI+Q1K4YIL4RECU79bvOV8PH7sNGpbJyeE4bU4
 iSn4SKfdH5aBINvQ7Sxh1OHbZdW6DFMOJXAR0+SgjlrMcnNwh/x96mn
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_222144_857042_77F682C3 
X-CRM114-Status: UNSURE (   8.96  )
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add myself as MediaTek mt6323 thermal driver maintainer.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bf2e066f377d..3001a713b083 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16355,6 +16355,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
 F:	drivers/leds/leds-mt6323.c
 
+MEDIATEK PMIC THERMAL DRIVER
+M:	Roman Vivchar <rva333@protonmail.com>
+S:	Odd Fixes
+F:	drivers/thermal/mediatek/mtk_pmic_thermal.c
+
 MEDIATEK RANDOM NUMBER GENERATOR SUPPORT
 M:	Sean Wang <sean.wang@mediatek.com>
 S:	Maintained

-- 
2.54.0



