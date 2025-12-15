Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB254D5B17D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QpD1rj5pnqeYh3zI/zjzXyihrxmgnYRzD/mvpoodbXE=; b=xEANDvF1Dlz4Oa
	ksOej4uJbyTqY2wSpYYZZb64atRpulNpr5K0sXNB0hKYtLhm+DsFlUNJ7wyXrShNHOV4DSC57N3Ob
	fqLCxZoiWyTiRp+shZ5TLE3ABC2tBNnumqlqx9FMKUZh/I0Sp5Jajlh+6W3oCtiLNyt5cQiDc59Vi
	Dt215TTX0xqEV6w402rHStG5+Tps3rE8fidWAWdx2OmMxxV94BLsh9UlxfUChZCOj3JExizIMZjWl
	pZSPKWmf8v18gTSupeRsxF94QgszNAxab0S2b/k2BjAZSRQw2ZSOCGZ5NovSyR0eWbMGKlyrL4/Zb
	f/P0orgENoJ3cYV320uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVA9H-00000003rY9-3RoK;
	Mon, 15 Dec 2025 15:06:07 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVA95-00000003rJt-1elm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:05:57 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dVNfT20K4z9ss9;
	Mon, 15 Dec 2025 16:05:37 +0100 (CET)
From: Lukas Timmermann <linux@timmermann.space>
Subject: [PATCH v3 0/3] Add support for exynos5250-manta (Google Nexus 10)
Date: Mon, 15 Dec 2025 16:05:21 +0100
Message-Id: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALEjQGkC/x3MTQqAIBBA4avIrBNSsb+rRAvJyQbCwpEIwrsnL
 b/Fey8wJkKGSbyQ8CamM1aYRsC6uxhQkq8G3WqrtLLycNlwlpxdoBikH9dRd35wvd2gRlfCjZ5
 /OC+lfBhQT4BgAAAA
X-Change-ID: 20251215-lat3st-staging-d9c926d8a75f
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_070555_639976_DF9D34C0 
X-CRM114-Status: GOOD (  15.46  )
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

This patch series adds initial support for the google-manta board, known
as Google Nexus 10 to users. The device is powered by
the Exynos 5250 SoC. The bindings for the notification led are already 
in the kernel mailing list, got recently applied and can be found here:
https://lore.kernel.org/linux-leds/20251125114015.355487-1-linux@timmermann.space/

The first two patches add the necessary device tree files and
bindings, while the last patch makes a small modification to
allow CPU1 to boot, as it requires a call to it's underlying firmware.

This first iteration only provides basic support to get the board
up and running and usable via UART and with WiFi support. We will upstream additional 
features in future patches. All patches have been tested on real hardware.

Changes in v3:
 - Added a better patch description for firmware patch. (@krzk)
 - Reorganized nodes in DT. (@krzk)
 - Fixed memory node to use separate entries. (@krzk)
 - Renamed pwrseq node. (@krzk)
 - Fixed firmware checking for old dt compatible string. (@pavel)
 - Link to v2: https://lore.kernel.org/all/20251125-google-manta-v2-0-0f097cfff39c@timmermann.space/
Changes in v2:
 - Renamed to google-manta (@krzk)
 - Link to v1: https://lore.kernel.org/all/20251120144018.961604-2-linux@timmermann.space/

Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
Alexandre Marquet (3):
      dt-bindings: ARM: samsung: Add Google Manta (Nexus 10)
      ARM: dts: exynos: Add Google Manta (Nexus 10)
      ARM: samsung: exynos5250: Allow CPU1 to boot

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm/boot/dts/samsung/Makefile                 |   1 +
 arch/arm/boot/dts/samsung/exynos5250-manta.dts     | 511 +++++++++++++++++++++
 arch/arm/mach-exynos/firmware.c                    |   4 +-
 4 files changed, 515 insertions(+), 2 deletions(-)
---
base-commit: d5f0e9098499869354aacb5b080f602f0399d396
change-id: 20251215-lat3st-staging-d9c926d8a75f

Best regards,
-- 
Lukas Timmermann <linux@timmermann.space>


