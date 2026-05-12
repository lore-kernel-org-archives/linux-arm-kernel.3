Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE2ECD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 05:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIEXW/BFAtwXfWqD0NCtIzXlZTuKF+sJ2Ux3fsvSZKg=; b=YU3QMQbBcxHIkWQnHSdxmuU0WD
	eaQ6T4psCitoFAKVBxgIyT5+EJ7JO1bKNBTrWd6yNjo5k4RVbaCiUkn1naCcCg/JquOBUFXDJ7dik
	W8C1MYsQ9Nuth74Tvbu42FTEwrInJl+lcRJtsnqcTGQvg7d6zCDuPx0jwo6K6EZSl1+riOYuH6t5+
	YHPAjwW1WNJsBxp/3LtAWVk1E4UooaLeMPHPoL+QnBZK5uIj8er/n/8TC4hWOjpHOWbWkBnMKa0Mo
	jHFhscgpiDDxU0fjm5JSyeZP+mFPjWgP6jY9Onhic8EjWhyPnN6rRox3lE8ZoWz1M8Ulboi4qVH0m
	p5y0LuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfZ9-0000000FZKk-0Wx1;
	Tue, 12 May 2026 05:21:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfYu-0000000FYt4-2GeW;
	Tue, 12 May 2026 05:21:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DAC834471B;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0CACC2BCFF;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778563300;
	bh=/p49E0kAapVpqQ1BgFexwVmJgZuamoRVrgCb0GktNF0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BYbypev2x5JtDrd4+d6s8Ho7D0IWs5Usrx4GoMBnCzSay+xzBy93KS4+abYQIq5Sh
	 WQ+9iZdy6yGA3PyzBHLMai6yZ6wn5NzxhQVEop79lWL3bdwtv5KXogNHuolj5sMnzK
	 tLVefGnlshaJNqpRrUd1Mt2CT2Ea3WxoCOv23uuRNzMbsg/Ir5sW3D4IvCqL3ay/Co
	 wo8aTpQrfPx5SJ0HnNxN0KpcjSQOhv8vZQJ8gOuNkPFNi0eLlvb5t0ERokCXmfd1U+
	 fjGTSUBCIroPp3bV3v9ExL1YvZmI2fCZvkSkkDRjumn4wOWpkMJpM8DmHRYP8WrsqQ
	 ijnB8d2Z0+NVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7993CD4851;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 12 May 2026 08:18:29 +0300
Subject: [PATCH v2 15/16] MAINTAINERS: add MediaTek mt6323 PMIC EFUSE
 driver maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-mt6323-v2-15-3efcba579e88@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778563297; l=660;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=if+Z5Y6WKURioqoOXDX0bP25C/WqfsUOAvh8ArrZ0l0=;
 b=+PAUp2rRKc2hyayPgfig+OPswFCKcw28umi1pE1EWA6SDbjVe3GbH5skbIdrNjk7zsueqwEVp
 d5k57KXidBsBi/AozWoFEn2srmGWDGSdvcBo7MvcyL/d7SE5A2BBF8s
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_222144_790951_38801E21 
X-CRM114-Status: UNSURE (   8.48  )
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

Add myself as MediaTek mt6323 EFUSE driver maintainer.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 52249c301633..bf2e066f377d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16342,6 +16342,11 @@ M:	Roman Vivchar <rva333@protonmail.com>
 S:	Odd Fixes
 F:	drivers/iio/adc/mt6323-auxadc.c
 
+MEDIATEK PMIC EFUSE DRIVER
+M:	Roman Vivchar <rva333@protonmail.com>
+S:	Odd Fixes
+F:	drivers/nvmem/mt6323-efuse.c
+
 MEDIATEK PMIC LED DRIVER
 M:	Sen Chu <sen.chu@mediatek.com>
 M:	Sean Wang <sean.wang@mediatek.com>

-- 
2.54.0



