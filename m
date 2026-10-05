Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E81CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2zyOcfzlZ960YepIjOmi+MAl7sJytSI8WiZwfw/tvc=; b=hftiWlpMkd1glvRxos/CCnvGBN
	mfdD5mvbYyGgSjNQ3oZhTQ6Da/Fc7RDmVjq5dHARiD9zsyAlbcX/DvFYp2+ILoyUPaugxxEdZf0iT
	a+mjjxjCgu1yJfXYQW4LEMz6bKhaA36FPWoTSXRODdJ1rwkU1rLhs3KkkEfZWXcNUuG9+7Z+yuopJ
	VcrIn4/jrKb/GXBE7aWh2gWDZv/pcY3uqQc5XwA7cCwaahtszEVmJlQjPfImcd3EfkWXapRTmc0S0
	8wlq1pJP3bvuWBg54e4PAx6eppE/ce3x3owQUFFCih1bQlBkITC6e/DpvaPNsf7aGjM4mvDVv0SpY
	WB/lQ0Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfmk-0000000G97W-0Mgs;
	Mon, 05 Oct 2026 10:19:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfmh-0000000G96f-3Mje
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 10:19:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F2F44435C;
	Mon,  5 Oct 2026 10:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646C81F00899;
	Mon,  5 Oct 2026 10:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195543;
	bh=N2zyOcfzlZ960YepIjOmi+MAl7sJytSI8WiZwfw/tvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CAg4CSY+/oGaUQiqZgqOH0WCm1eAgDQyfK3ziTitLoeIM6M8UzaKm/aV4nT3dtuuC
	 gYDaAxSFdc/tvivZgdS7yPWTWDFANjgD/e794tyCpr5XWLHzgzHGOcHFm7bapD0KRD
	 k6Xbwaw4uo45rPsdOpo3WwmTxbvmzDTaVbJes62aOCJhnUj8t9oo1Lz9SAef4Wc1cT
	 db0xpuNu02iuuxcO7YB+iNfWavSIUzQ6DZK/RqXKIgdn7Kvuehk2Ce7w4jrrgRWWPZ
	 fXmYIuYhqLSTYPMob87jiQJMt5vq/pjXJ1jg1GjaRm9wHyPTlCpPlMHWKdwCPgxkiG
	 bY1erMxpc4brA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 3/4] ARM: dts: samsung: for v7.4
Date: Mon,  5 Oct 2026 12:18:46 +0200
Message-ID: <20261005101845.34752-7-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005101845.34752-5-krzk@kernel.org>
References: <20261005101845.34752-5-krzk@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1338; i=krzk@kernel.org; h=from:subject; bh=ni6oVuqL8P0j2f132xZcCrMzmrIkFVC8sbgHtLofdV4=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqw3mHzihfkTnL+YZmHOF2J181E0N3vcvsWpLwe sznDRCY766JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCasN5hwAKCRDBN2bmhouD 146mEACK2xkIcNSzsC/toWThjk3ygKaVqjb1jTeNHLN7hiOTIPXos2OlXtdX6C+38udIAjg1J5+ 2nWo+fwqK8zJFw7bZd/WkQw1iWq+ODoV3CDRU+ZcqtGE1N6t0d0snirFXoiFb2XU7LW/LSoLekV 2YItkbzj5iheeYnmg5H3kfg1OEVyku82Q+0MJHvbsOegVZ79M3ybcUqYLbe19pYszr9ghtmfOJ6 yynsCOEfkix2B6ENFRJyuNrD0gPZn8EUud2FmXsPLVLQAweid35dgRImqqcKRvDbZHeFBRD16+b a0EylL2dMp2p3hnKmq2bQ7uCB3I2alTDijkFs47dFWlk4IpKktU3EWtqy8klJM1YckXMOHsD4MD R0JWfSAVAMLDSlQER0cjBu8hCQIlPedyFygyqONj9KoCF3NrfKnF7IRYpmEuwBCc/gIxsxjKDvB g7md2JfneZ43n3UJsf6JdM+2t0aVZxK8oBkRww8H71nN3PMS4bod98tqbRcYEXHLJu0fX1oBjAL k1pkd1aS6JWc7pm0wpb0COiyP1bznIUdjj+E3XPuZekrjGytxv9yKWRh5oShAPWaD7gMuVUFYDW neW8fafdSmyBE3tCc+cN1qAvn/92i8EILy/ULZyiV1KEtqksXDAsUZltcLGWSQCKVS4GYfE3n7e xriLX3/ORzovkBg==
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-7.4

for you to fetch changes up to b47faa6004d86ade16b90d24fa1e1f179e6f7230:

  ARM: dts: samsung: exynos4210-*: Fix Bluetooth nodes (2026-09-24 22:17:10 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v7.4

1. Cleanup of clock-frequency property in favor of assigned-clock-rates.
2. Fix bandwidth of Bluetooth on Exynos4210-based boards.

----------------------------------------------------------------
Laurent Pinchart (2):
      ARM: dts: samsung: exynos4210-i9100: Replace clock-frequency in camera sensor node
      ARM: dts: samsung: exynos4412-midas: Replace clock-frequency in camera sensor node

Paul Cercueil (1):
      ARM: dts: samsung: exynos4210-*: Fix Bluetooth nodes

 arch/arm/boot/dts/samsung/exynos4210-i9100.dts          | 9 ++++++++-
 arch/arm/boot/dts/samsung/exynos4210-trats.dts          | 5 +++++
 arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts | 5 +++++
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi         | 5 ++++-
 4 files changed, 22 insertions(+), 2 deletions(-)

