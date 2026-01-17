Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA68C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 18:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=COgdC2VOYj8XwhKoifjIoSPKRejlOH2gqVPcLaRLnm8=; b=1u7try5S8Twwx0bFAwm7TGJOCx
	6tPTMGvXxYg48d421noECm8vLacLds9XrcrenfzLU6DJURw/uiOGCoCUgHTjySmCUlxwhttK6+M10
	BheqA1wLOU1DV6rdSicQOVmOklDknu+rURQW8eXqGMdP3SVxo3CUlaKj1zta6M8twU9o00BzjxEUF
	3iJbgtxiJaBG9FJXHSpbpGwm9hb/MKfXXQst+QyPPBJ0aZkAAFEmZhQzmkGxWRdbQZbcl1g3mI9sY
	O2HPW+UbbmNm/0j31nu9B2x8UDATTy4KKZZChzYZorXurQP2JNkrO9AIGJeSlx+XqeDLzDZrmBRxJ
	uYffh+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAer-0000000Fhvg-2E0N;
	Sat, 17 Jan 2026 18:04:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAeq-0000000FhvA-0Aae
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 18:04:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34A9560127;
	Sat, 17 Jan 2026 18:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15632C4CEF7;
	Sat, 17 Jan 2026 18:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768673058;
	bh=jO4wFN6ADMUPguuADZtQazCJyHY4oOYWBZimBu/NM3s=;
	h=From:To:Cc:Subject:Date:From;
	b=nBUozLfekytpq17arAb5lB+VEyr9T5PJ/BoSbp3hV1sPNnp3KaCoqp6uO8QZrzkOl
	 NgSzk5jmjnNX92wfgGe5knvf0Drp3qAmG/odN7AmEhjafveEGOxue0iBb2Ulo029L6
	 xea+IjLFXc0mkddLEy1WUq3jcRR3tu5eAl3M6eX8siUPjCkNI15umAYIP2X9i8PNuB
	 Li9J5yQgImo7byqIJ/XaMOLENqYl3CRH3O4DHbHdqMtHzKcAMFj0vGge5OrlrIYFAW
	 qdOQ0vamB+OOUFZcJOAa+axrPaLbhMYMpYEffsH/t7PXaVPx085jKaicvo2sUFxuy8
	 Q7teaKTq6ctQg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/3] samsung: drivers pull for v6.20/v7.0
Date: Sat, 17 Jan 2026 19:04:06 +0100
Message-ID: <20260117180406.9361-4-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1972; i=krzk@kernel.org; h=from:subject; bh=jO4wFN6ADMUPguuADZtQazCJyHY4oOYWBZimBu/NM3s=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpa88WVB8MzjIMztTvli95pMIo8VpZOhFHjiuOn 49BbQW8Z8SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWvPFgAKCRDBN2bmhouD 1w3KD/9iZ4ODS9EURgoR8bgjtChO6i+0mkB3+FAIjxW3Ep2mGIVeqBPW9PHMcLELhb8kr5yRhmU 2fI2aTypUe8Tk7DSCXOuKHcXmN9MAVWh36sRYfRt6J9SGvok2x3OGEFCVkVb1KNTtf4d1wi4tB5 sRQQbB7oaIWsv6uC2SmkhmQXuKGmC8+KIzuovh18KEL29c82FwrzK0ydTvUezTD+dhP7QB87lTP 6dDPRpeDUS2CgJU7XqpUQFUQfKjNR9fbHzRxskAA3g5EzEJObyvq95vThHLVXZ9dD7A10fvP6CB o7mE5iKPaYWuvdb3DsSQQ22wjp95hPyB7bU14uQhtx8XBXVh4php3cXqbVHWdDfVR56sr6nOU6s DdT+7JOfQF0Qjn7peFNPtTws7acI2xj1N7LRKMt1gfvF3OS85rzMOSZW/rqa/KOC1SYNNoAuR66 n8hI/C2/w552VBqZ7CaDX08l+XyR5ob2EV6o1Wpi4uIoyAMOy7xkdo1px2VQ8UTi4xGr60tlEBT hv6+NUOwT4J7CPciXOY1JGyIpba1RqIQoCr8sDrGrzGB5/Q7T7vgPlMOz0yuct8isSiJUlDnlXN 4Qv1nWNLtaSm+6ekHnzMq00JAAFKXJf5jgQLguU+b7kOEIjtLyufrC9UcQwIpquiPBZXi4ZktDs uYsm9CphNny7bzw==
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.20

for you to fetch changes up to 900131320bc9a9ec1d84702b2694b813c11c91b7:

  ARM: s3c: remove a leftover hwmon-s3c.h header file (2026-01-14 11:14:31 +0100)

----------------------------------------------------------------
Samsung SoC drivers for v6.20

1. Several improvements in Exynos ChipID Socinfo driver and finally
   adding Google GS101 SoC support.

2. Few cleanups from old code.

3. Documenting Axis Artpec-9 SoC PMU (Power Management Unit).

----------------------------------------------------------------
Rob Herring (Arm) (1):
      dt-bindings: soc: samsung: exynos-pmu: Drop unnecessary select schema

SungMin Park (1):
      dt-bindings: samsung: exynos-pmu: Add compatible for ARTPEC-9 SoC

Tudor Ambarus (6):
      soc: samsung: exynos-chipid: use devm action to unregister soc device
      soc: samsung: exynos-chipid: use dev_err_probe where appropiate
      dt-bindings: nvmem: add google,gs101-otp
      soc: samsung: exynos-chipid: rename method
      soc: samsung: exynos-chipid: downgrade dev_info to dev_dbg for soc info
      soc: samsung: exynos-chipid: add google,gs101-otp support

Vladimir Zapolskiy (1):
      ARM: s3c: remove a leftover hwmon-s3c.h header file

 .../bindings/nvmem/google,gs101-otp.yaml           |  61 ++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           |  23 +---
 drivers/soc/samsung/exynos-chipid.c                | 133 ++++++++++++++-------
 include/linux/platform_data/hwmon-s3c.h            |  36 ------
 4 files changed, 154 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
 delete mode 100644 include/linux/platform_data/hwmon-s3c.h

