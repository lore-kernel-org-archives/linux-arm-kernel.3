Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F033AD58CCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etK4mKfjiybgFKjNxyR/aXssaSmyesNM9uARzXLJhCk=; b=tEJBTlY53D9/g5Dwmcij8SdokD
	j8bKViFY0fETl2grTRAAxPX2blhORi29QwA+7ZNauyWxvzTcgdbT40F4orvgAZXcjwDupyIF6QFOR
	c26dT/DlAvf4aIk8j0pHUjv/jzUhOQZ+Yr1OZmMmmqcCkG5JF5jJYPbV1zZujr1nxFKzw5e4+BW05
	aU93xZiu0cSahZ5Kx+WK2hKCcmtOmWeaHUw47s3fWuQ9Ho4g/fFZHcC3eBMDaDe75lfWvLERX6Zlf
	8lKQ5zC3bWxS6y1KFl/mdUliH5dHXD+y4l96zGaJBcx6kpTnOl2wN/NgKwa2gYi3AMhONTXIun427
	aD0fuT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51LR-00000001Sok-0DLK;
	Tue, 24 Mar 2026 12:58:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51LN-00000001SnB-20s0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:58:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EDC764366A;
	Tue, 24 Mar 2026 12:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A078C2BCB2;
	Tue, 24 Mar 2026 12:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774357128;
	bh=MmcCA5Xn9PA62YuIE5jDTBc2W5syVFoV8J1qc1fPQns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JNyjyfHg1q9gc4LNo95m9wuvtIcvxoh+ZWwK7KzHBerV8X6xqtyDEgPcIct/gWhwk
	 Be0fr8PUgmMAFBHy1hV6zEycCaa8m/10Oxg6U5/yGOIscwmRfZBVtobcoOVIDrGHyk
	 lja863xoTCUyKTv8il7wD0hOcq4i2sJpaWgr+htr/ZoxobSn6lmNceAGEVtF8TKQa5
	 p0GFQyQW/O+0UFCsqUrk2AD8R+klmVgg0VVZdDkzTvDFlvoV3hZV2zHd5G+6n28QhK
	 h53muFOHDucdnA3ZEg3DP3pg44sOPgqLUwOqS8riO/GwqiUn72kGa0wK1XjXIM52kZ
	 ZtD2txvSqLd+g==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 3/4] ARM: dts: samsung: dts for v7.1
Date: Tue, 24 Mar 2026 13:58:23 +0100
Message-ID: <20260324125821.59728-7-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260324125821.59728-5-krzk@kernel.org>
References: <20260324125821.59728-5-krzk@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1746; i=krzk@kernel.org; h=from:subject; bh=MmcCA5Xn9PA62YuIE5jDTBc2W5syVFoV8J1qc1fPQns=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwopvK/4FJb1yvGeHFMyO5wN7HbaXqwV9HXacC +oZxxJesiSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacKKbwAKCRDBN2bmhouD 1198D/sEqmYlYF62mX4tuDHVj1Amc3BEBdB60QsT9WIGFLEWwPS41j9MX5ku/yAxyOUQfAdw6qC HHgTBLdQzUj2G9hI0dNLZ7oFjztQniAr7cBfybp7+3mZvb326R9F3Ian1XLnPMnftgT1GPQefBl 1joPW04ZtSWgCWzTiECnfN6cuFZTAk2BCBPZrrBhadtIqzIbvkeIL59uRbv18Q8D967eyMusLB1 06q+/MTbmg44/UPAxiBhQSIiWuDUGE1Mcin1s4bgf2vRKjKIsDBX7xphdiE9h4ctvUDnbh4FiDH Ig8v9+xNrgXVuj5vZStnLxCXmqQNDq1t0e+1IqBZiwbF5P89Z4zXSo5TJoNebG0AAT8WLik5Oc8 S57Cn/HvzomWikKYnKYRquipSPZ6MD3qzl6jfpeCi0SdNUE7bJwECQYPxuJJIPCZFoJnJ184KKG +rAravE3x3WxooiXeILiwOYWKBa+gOJAZcKIOXMvaTiByoEJcRLzEyMPChMRmmD0XL/pU1w1m8b 6r9O8FouwkgoRRoZP6wuTyzonOm/w5jWx4WTQCpc2etl/eTKY0Xu8e8inl0ivkrjurm27JrWNUO +XpktjFV+iqYcm7FfEWZ9H1Vu+WIPrPH+Xnq+57KC4lwJmwiVgWZlby/20bI0izREO+WsMKGUNv SPMyhAbnZD7Dw/w==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_055849_563951_4BD7F1EB 
X-CRM114-Status: UNSURE (   8.58  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-7.1

for you to fetch changes up to 44ee52a030a6dd2f6e0ecb3632ecf8b263114619:

  ARM: dts: exyons4412: Drop duplicated I2C address/size-cells (2026-03-10 17:03:43 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v7.1

1. New board: Exynos5250 based Google Manta (Nexus 10).
2. Few cleanups.

----------------------------------------------------------------
Alexandre Marquet (2):
      dt-bindings: ARM: samsung: Add Google Manta (Nexus 10)
      ARM: dts: exynos: Add Google Manta (Nexus 10)

Krzysztof Kozlowski (3):
      ARM: dts: exynos3250: Drop duplicated I2C address/size-cells
      ARM: dts: exynos4210-smdkv310: Drop duplicated I2C address/size-cells
      ARM: dts: exyons4412: Drop duplicated I2C address/size-cells

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm/boot/dts/samsung/Makefile                 |   1 +
 arch/arm/boot/dts/samsung/exynos3250-artik5.dtsi   |   2 -
 arch/arm/boot/dts/samsung/exynos3250-monk.dts      |   4 -
 arch/arm/boot/dts/samsung/exynos3250-rinato.dts    |   4 -
 arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts  |   2 -
 .../boot/dts/samsung/exynos4412-itop-scp-core.dtsi |   2 -
 arch/arm/boot/dts/samsung/exynos4412-origen.dts    |   2 -
 arch/arm/boot/dts/samsung/exynos5250-manta.dts     | 564 +++++++++++++++++++++
 9 files changed, 566 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos5250-manta.dts

