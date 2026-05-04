Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99599CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 18:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RezveeSHmVKQfaZnPyF1ZHq6+Ev3IZ6Lje0vrzfwFm0=; b=I9fpGFEtoMYerTJ50K5NT4FjUx
	m85JHidmS3XZ24Lc8jaWmq3YzV/kgm25As3tuGUbDQKwHOhzsKHzW4xxJADpETtn9dqK0iq8IKTQG
	pHU/ZubDImSuziJ913JZYWwFlZwr2+yiTFd1Ysuul4kssyXjzKuRHj561Pm8u2lUpchnGptNZxMhE
	TEBJuLuljwNZoXTylxsTX14nM5hkGXzDAbu9Y0koQNUfmYwRY5Qq7DThTzQVZ9hbZ0LGqMGFUFHNs
	XWRaU9N+SWgY7G+8+2GiqmC7e7zIwoLOfUHnTrgSpfvSnNvZFaGbQuV4CwYpI1QwPNYi2Yr/xixWw
	p2qKf/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyp-0000000Dyiz-0J2S;
	Mon, 04 May 2026 18:25:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyZ-0000000DyHI-1dBy;
	Mon, 04 May 2026 18:25:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 956D1446FF;
	Mon,  4 May 2026 18:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68059C2BCF7;
	Mon,  4 May 2026 18:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777919099;
	bh=GU4QVvFihDtlJ6mm+kq5xGELKC7sNPpkFTI44o4I8MI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X9Ag+iZ6EZ0Y9BhoLfKnpEnIALv2h9odzKx1MQa6gN3R4nPeT+Mg14hbROmo6pYpX
	 1D/rwHCrc6C3HDrW5T2Uy3rBEJV20kI/nGEzGDOEes1136K3j2CmnIoxmb8teJYgCU
	 g5e09B5HRQTa/k4t/rT5faGXoxmrjN68/cuzWxk0V8e0YvWVPkfjJbXP9yuRfgVu7w
	 2opD4o562Jl+PugOLcz1xFjac8bFQZVNiayyEPWj+1GzL4M6MGDw3BD8fOmKDFVdvm
	 x2bAriTyQYWJvKlNmU4bSg120cwOwYHVqVkuFR/Wtg+L61wSjRgZwugJGYgZbntZ5o
	 82ZsExigdrvIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B48DCD343B;
	Mon,  4 May 2026 18:24:59 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 04 May 2026 21:25:05 +0300
Subject: [PATCH 13/13] MAINTAINERS: add mt6323 drivers maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-mt6323-v1-13-799b58b355ff@protonmail.com>
References: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
In-Reply-To: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777919095; l=1438;
 i=rva333@protonmail.com; s=20260325; h=from:subject:message-id;
 bh=IVcMJZ09jRgz+N+6u0mZ3SGFnZp8AgopNcJEHOCTJNc=;
 b=sGOiE3hgm56BrjQDzKGAj+m/O2IVz15/wAVId3APq3ZRUTQQDfaPwGa8RgJBYGeN7nDaBwYvr
 f0PDwqQvQRvBN/Or0xUv3NBMufyq8nsAz59qQxiQOJSsQ4iB3uMLrae
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=euuVBZGtA2Cqb8Dju84qpQPhvwxyUirJlXpqEPQWKBM=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260325 with
 auth_id=695
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_112503_580003_2B613357 
X-CRM114-Status: UNSURE (   8.27  )
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

Add myself as MediaTek mt6323 AUXADC, EFUSE and thermal driver maintainer.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 MAINTAINERS | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d1cc0e12fe1f..53493a24d00a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16337,6 +16337,18 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
 F:	drivers/mtd/nand/raw/mtk_*
 
+MEDIATEK PMIC AUXADC DRIVER
+M:	Roman Vivchar <rva333@protonmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/adc/mediatek,mt6323-auxadc.yaml
+F:	drivers/iio/adc/mt6323-auxadc.c
+
+MEDIATEK PMIC EFUSE DRIVER
+M:	Roman Vivchar <rva333@protonmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/mediatek,mt6323-efuse.yaml
+F:	drivers/nvmem/mt6323-efuse.c
+
 MEDIATEK PMIC LED DRIVER
 M:	Sen Chu <sen.chu@mediatek.com>
 M:	Sean Wang <sean.wang@mediatek.com>
@@ -16345,6 +16357,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
 F:	drivers/leds/leds-mt6323.c
 
+MEDIATEK PMIC THERMAL DRIVER
+M:	Roman Vivchar <rva333@protonmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/thermal/mediatek,mt6323-thermal.yaml
+F:	drivers/thermal/mediatek/pmic_thermal.c
+
 MEDIATEK RANDOM NUMBER GENERATOR SUPPORT
 M:	Sean Wang <sean.wang@mediatek.com>
 S:	Maintained

-- 
2.53.0



