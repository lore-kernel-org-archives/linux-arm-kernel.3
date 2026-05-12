Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8657FCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 05:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qDuhkE5ZphA3SZEU8GLAGt1zk6Wso165ebmlY7yTxU=; b=Ajfu4aQ1Rh4igB5Q5v2jOqcBB3
	amAEgUrgRTvRJiOz8DyX/2qxv3uq9/nMToXRzedL7/Gh5kxqnqWswOz+VHuntOWPNEvqRNxhRlK+y
	9H7FRVer16doFX0Ljd4/XcGCa9bMSi7DHuztFNJiilmXpyGJmxov0oFYZ1N3ys8V0HGXtu8UdBM+R
	sObS5FsfU8OeqP82avp80LkLTgVEewVWbMysPH3hTvMd350wdUzIZjoUUzwi8vmYK452e2wSS2tPc
	aZTmg6cIZ3Nvzu7ghp5y5kj3Z6ioaUwUOqX3zvl5K2rI9KxnCmECjg2JipCTOBANJlODuSTkHdQV3
	lv28hlPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfZ7-0000000FZG2-1Ttt;
	Tue, 12 May 2026 05:21:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfYu-0000000FYsp-1hmd;
	Tue, 12 May 2026 05:21:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3B794470F;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DEFFC2BCFB;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778563300;
	bh=lNV6rXAaqpbqVOMmN8yGQfNnLkgmGHXvWReklWM53c0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kjiQ+M3/iIvJCzxvEaKJfGX6RfmUNeXp7ryWAP0aNGsLgyKft9KbZh8L5SVnAgN/f
	 59EO50iCinhumsG80zP9BrgawoDXWZ7XbYj0lA1wtsrT3lO5tYYT86MytY/7DpqXU8
	 J/Jy1rxBEVttTFtn3PIlWfdTvKG0ql8LPDrFsT+EQ7tB46LY+D8VUFIuazEgp+h18t
	 QcDLZki+Cqd3LZNF4BW+ohq4ZEk3kLZmEG6aVP1W7sM9Sx0pX4nJw//Ctv7vh2HZiV
	 R2ZkQ5PBb6LoRgM8wKK/tRPblJu+M1k44xfMs9pfQc9m81FcORy78G3WjMv+AS8sx3
	 a2gENiYtRU1Pg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E90CD484E;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 12 May 2026 08:18:28 +0300
Subject: [PATCH v2 14/16] MAINTAINERS: add MediaTek mt6323 PMIC AUXADC
 driver maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-mt6323-v2-14-3efcba579e88@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778563297; l=679;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=hqGkTMsQwUh/P+F47/bfl+NnPVontePTFizlgJu6b+o=;
 b=/IuXBgoCNI59SNyo7+dbcOgJp2OD68fDMCBEnwGLvClBjpQt3xpA5Kc+B7BYuHj2/u+orM3Wz
 dSN1KoFoW2DDKk0aiit1Ik1HCGpOpfCEMyuTruHgXkXG9bMJWv54rpK
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_222144_669417_0A8C6DF2 
X-CRM114-Status: UNSURE (   8.76  )
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

Add myself as MediaTek mt6323 AUXADC driver maintainer.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d1cc0e12fe1f..52249c301633 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16337,6 +16337,11 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
 F:	drivers/mtd/nand/raw/mtk_*
 
+MEDIATEK PMIC AUXADC DRIVER
+M:	Roman Vivchar <rva333@protonmail.com>
+S:	Odd Fixes
+F:	drivers/iio/adc/mt6323-auxadc.c
+
 MEDIATEK PMIC LED DRIVER
 M:	Sen Chu <sen.chu@mediatek.com>
 M:	Sean Wang <sean.wang@mediatek.com>

-- 
2.54.0



