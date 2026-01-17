Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137B7C98330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 18:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DQ1UZ5d6hZvSGaJAakl+LIo9CMDZTgGbZirkxx1IJw=; b=4UI/H/FVhrCiUF3CAsrmterBxS
	K5D+u2FlS8YUVkLs/ULGArebiAOSpcnwODxVaAvQ5CgLJ2/damweK1IAXTVNd8y1ltI5sQXIEjDIj
	aD04XjpbojjlpuFJSP7cWT8SiBEnvhHp3Ftjp2x/L8MZNGjpTRvTaoKcoMckGncx+qfw7xYVJnWCK
	Z6jrIuY8Qrbz97DCH/LlsSRqT8uPRFCKgbRfTtRjHcNntFoQUsmg0nP5+3dIhFIvVWhfN4PyWIRf3
	vJsmU2C7aHGt0XHzKhlUztahqw5jgaI2NE3Xy0kUzMF07K2tV4BA0m9dE3wkguWmiAAR2yLhrspLg
	ZWNUEbIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAet-0000000FhwI-3Zfw;
	Sat, 17 Jan 2026 18:04:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAes-0000000Fhvf-0FTo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 18:04:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CBF743B42;
	Sat, 17 Jan 2026 18:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA86C16AAE;
	Sat, 17 Jan 2026 18:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768673061;
	bh=OWhg/pEqUPGozImiioTmX8XNel+VdkhQ8IkPCXkMRh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EhAPzpjztCRVVsQAU83G1aVtlFzaEcbnoll9gJiF4EJFLoklr5wNIsO6O+LquolJ6
	 vM5jRngSre3XXxYeggyMAUzD6cYz7RSqSaCWccKVT1m3AkXDnXb7akby8OCA9JQv7w
	 79X4B5mSvh6uz0jMp3D+CussG1NVjLZXm2wt/xZNcVuVhV0wwaI0uMCFVH1OiEY/w0
	 iZpQQSm/1g9tPGh1S49Lw8tf7YMfC2f0MS6l69FjXAGwi6c7SiaQlxv6+HC0sThxqR
	 vaYWoUVRWziXrjD3uDE2XJwU3/4MSUL54jEJ/DViuieLrsLu01XfMVUcjw6fsGEpP5
	 1RoPUYzxCGSzw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 2/3] arm64: dts: samsung: dts for v6.20/v7.0
Date: Sat, 17 Jan 2026 19:04:07 +0100
Message-ID: <20260117180406.9361-5-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260117180406.9361-4-krzk@kernel.org>
References: <20260117180406.9361-4-krzk@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2053; i=krzk@kernel.org; h=from:subject; bh=OWhg/pEqUPGozImiioTmX8XNel+VdkhQ8IkPCXkMRh0=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpa88XVatkRFfUq5L2hMZCXdnIrgISwAdClVPl6 4eQq5mex/GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWvPFwAKCRDBN2bmhouD 1wiLD/458kcAelJIwUwXIHt6vcKlCBPzxVn51okptDwbjSCNuXikrlZxdD1QEPKpQ85sMzi3MVt 7iGtolf4VfeJOpIcEfO3YGCRG+n8KbTRGeLR3cDEY22+ojPJij9Q9VbGr1brQwpiWckOO5N5gpR j2keEQXmhlYNMNzXYMhiw3yxnl5VmmS6r+j9EW6gmbwxvkIAXyw08aND9s+c1EECtSZR/8pkUKu 9OZGS7lMS5POCHII1eN53tM+tRAVrfgyZE6z81/1RAOdqJ/IacUZT9BSt2Qc4OSUm4eLs28+3ou bHCUOX6kmV0GlBEXYnmzUUs0X9YO7bjEhb1l5ZbwN4qoEhuG98b+XvHRqYka+PEYP8ry+ZK8ymv iLMN5sHSZCeYfOLhXvlTFsU0jIYGhr/w/PXv3GreKQtefgf0dVNO+n5Cn5rYmXeTIhTggdQZ8MT L04CPa0fzW/01X9/rrgeN+T7JvAYTMl8cSb/tdD8ITQsG3RYV6wc45UwwrgCJLoVYWw0YGD1oEj b0tuCzOX+OyWrlIaOvzsipLY4TFFkzj0cg3LDQluUMsvANYksmc+d3T1UO+VALVXHFSuTe0medD Qa/B9HbU46+upsqGo6REffHbwfkRumLIwGqMCKGI8ijVdKcNTVZWajUSElYIYNiTR95r2EHAIP+ jLA99GEkRqfbYvA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_100422_150668_96291AA2 
X-CRM114-Status: UNSURE (   7.11  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.20

for you to fetch changes up to 9afdf3e1a59e23180540ecb1fe3287c308cc8113:

  arm64: dts: exynos: gs101: add OTP node (2025-12-28 12:32:42 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.20

1. ExynosAutov920:
 - Add MFD clock controller node.

2. Google GS101:
 - Add True Random Number Generator (TRNG) and OTP nvmem nodes.
 - Correct the PMU (Power Management Unit) compatibles by dropping
   fallback to syscon.  The PMU on Samsung devices serves the role of
   syscon, however on GS101 it cannot be used via standard Linux syscon
   interface, because register accesses require custom regmap.  It was
   simply never correctly working with "syscon" compatible fallback.
 - Add phandles to System Registers SYSREG blocks in clock controllers,
   necessary for enabling automatic clock control later.

----------------------------------------------------------------
Peter Griffin (3):
      dt-bindings: soc: samsung: exynos-pmu: remove syscon for google,gs101-pmu
      arm64: dts: exynos: gs101: remove syscon compatible from pmu node
      arm64: dts: exynos: gs101: add samsung,sysreg property to CMU nodes

Raghav Sharma (1):
      arm64: dts: exynosautov920: add CMU_MFD clock DT nodes

Tudor Ambarus (3):
      dt-bindings: rng: add google,gs101-trng compatible
      arm64: dts: exynos: gs101: add TRNG node
      arm64: dts: exynos: gs101: add OTP node

 .../bindings/rng/samsung,exynos5250-trng.yaml      | 13 ++++++++---
 .../bindings/soc/samsung/exynos-pmu.yaml           |  3 ++-
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     | 11 ++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 25 +++++++++++++++++++++-
 4 files changed, 47 insertions(+), 5 deletions(-)

