Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543B6C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 08:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u18d0TAQrgGkGJgo2/pqjGTY0PNHW4fsBRHe5OIMRK8=; b=Kte7it/mBDS827aN4CyJrUU76M
	4FqM+pq0tLX4lgWcJtQAcWruBjq03O+K4xOg4EgBhUXN+aKsGXj2madZ37tcVZj+QlqlMO+UZDLgq
	P+ETZXbc8VhfFo6blbQkMV+aCoMDHiovm4KfEZA7LKnpFFOCgs82c8Csdc1klw1+/iv7iADnopU5+
	lw8vSgBmhEYvbDbBucSZKZWYRtvl4oRuUtZMQ+FiyDGNg4Trbi+UN1GTbUxYUHqvEjnDmV7+vbUbv
	0dImslIRCUj5Dm1q7+Pyj7mi9ZVzzoDOy4HKTnS37X4MgprQVUXXxIZv5TPIMuUQcgoEzbW8yqz+J
	U01UYWLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqHp-00000006fU7-2Rgf;
	Thu, 22 Jan 2026 08:43:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqHo-00000006fTw-10cd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 08:43:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53DFD600C3;
	Thu, 22 Jan 2026 08:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DDB4C116C6;
	Thu, 22 Jan 2026 08:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769071407;
	bh=vTwi/NHZEXCw8rQu6gDRc7cezwzkz+PlJrNrSxFuyc8=;
	h=From:To:Cc:Subject:Date:From;
	b=AsrB5/y4IELmNV85mprWCwbOfZcQjFBmRNqpt8p5c6PX9mdMaKmpjYt9FZZq3390J
	 bm+QwFU1ebCuZBKq5EF/oKXHfOYp/n78Z01vriAFeqEoh2/mdCWa/KrEvl0IbkMTDw
	 oEw1g5sxrFtfLP6kHTFloHn2yDJNrsRyclW4CCiQ7EyMgdzcvDUlShSqGB6oEnn1lH
	 /hU+El7E2us7zlWV/paJN1+qANdXY97RwqFfQ+dRkcvPhugNcrI2nyyruTLZmyU6VY
	 GROXszF1gTBsC865B11qEAPdUBv0HfPfz1dvfKei2CJMkRgaTYznoFpb15B9GDerVx
	 OEjW3dcup1/bA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64: dts: samsung: dts for v6.20, part two
Date: Thu, 22 Jan 2026 09:43:21 +0100
Message-ID: <20260122084321.20861-2-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491; i=krzk@kernel.org; h=from:subject; bh=vTwi/NHZEXCw8rQu6gDRc7cezwzkz+PlJrNrSxFuyc8=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpceMpEY9BpcVQTRSK8N/qEzFBd9x5yxM0Exjzf faLCT6yKTuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaXHjKQAKCRDBN2bmhouD 15fFD/9CMh4H0Pyi2zGifs2Who2Sm9eAp3+0CQiPzpVUXj1sCnH9NSlR7RwJz37L/+qR1a2E3lT zrtXsKaiDg2bCtE3xXT3RBXb0q2ijO+BiQE2vQFEEPt3UGnj29hdTadjbrcaDhF9pBQkVrhJq59 pblvipcGom4IuC56GzyR+eSDkC9CH10OntYn6kJALtSDGYzyfjA9jGti+7m4WnEZTPlFj+CjzHN licpRLI5Zq+mqaD291CjQBtHTgbPrHTs7KmpPpinFhS+C9vwq6eX8hQ1CQD2WsAHxtSBXZqJ2sX a/hSiRfMi6SYHgrz2+B8LPl1PCXeDXs2TaNo5QR8yGQZsOXNEcUej/c2TeYVjTJ5vxGZaL+rTSX o+e0fwspdPt1UQu333RGtcxCCQDWH1Iq4sTUvtXDKgCbdDHwkWIHY4Y6fS9+Mg9/qUeVCYkOy5/ F7JtBgtFVV/O6pcLiGDSubfsGB9br9/Mwgmt8BKMZjlvZpBforLa4YXc2QBmXFzx6pqQCgK3VcU DIl4n/4Ske0aJtfXRMnq/ry95wjKuAkc6jGkXq36t4lSvSJgVfv1xd/63EGkhn7iL2ILpWsklMU 39wd3RNgcmfCbJpKzd36Ep+TEJ+hMJdCFf+skOrX49pOmGHpn097xRmwdqFXsZ8BOACXTkm6PSw aUVoncaoBE6La+Q==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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

Hi Arnd and SoC folks,

On top of previous pull request:
https://patchwork.kernel.org/project/linux-soc/patch/20260117180406.9361-5-krzk@kernel.org/


Best regards,
Krzysztof


The following changes since commit 9afdf3e1a59e23180540ecb1fe3287c308cc8113:

  arm64: dts: exynos: gs101: add OTP node (2025-12-28 12:32:42 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.20-2

for you to fetch changes up to 024d8f4aa35970c4563c6ef0c4170133719b2103:

  arm64: dts: exynos: gs101: add cmu_dpu and sysreg_dpu dt nodes (2026-01-17 20:32:20 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.20, part two

Add DPU clock management unit nodes to Google GS101.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      Merge branch 'for-v6.20/dt-bindings-clk' into next/dt64

Peter Griffin (3):
      dt-bindings: clock: google,gs101-clock: fix alphanumeric ordering
      dt-bindings: clock: google,gs101-clock: Add DPU clock management unit
      arm64: dts: exynos: gs101: add cmu_dpu and sysreg_dpu dt nodes

 .../bindings/clock/google,gs101-clock.yaml         | 21 ++++++++++++-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 17 ++++++++++
 include/dt-bindings/clock/google,gs101.h           | 36 ++++++++++++++++++++++
 3 files changed, 73 insertions(+), 1 deletion(-)

