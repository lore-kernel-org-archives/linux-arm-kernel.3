Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E677CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uL+7rI/S7IRggYv5dMoEOpOJMH7UH8Cis4v74Sz79Kg=; b=OM6q+xLK2HIEcsTJsiVs5aXKER
	EHCnQmI6aglA7OIzt7gOGI1MNVhQXtfp0y8z7/8uUYHeLnTM+t6uDVuidI80K7SgYoJRTwqKdDgPd
	3uO5dUw4dMBXbJh7Wy49kiNcwE3LE+ZMWKuh3eqLMifkz0sXdmKSfn3b8Z8j57Nx51/SOwyYMqrrh
	esAIdPFFOe6xensq4nPkREgo0DZUu4FCp36kKnjMqLnr0CVd9bTRTXQ5lybDz5c8+5pDZwpjFd189
	NpDSiaqZkCAuVsNsqoExnsofxRVLpLOepldGKiz+8iwRetkcYVAFmEYop2SpnwLbnqBPFIoDbycqF
	/Pa2KwFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfmf-0000000G95v-3uvO;
	Mon, 05 Oct 2026 10:19:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfmf-0000000G95m-2EdY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 10:19:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DD8AA43A76;
	Mon,  5 Oct 2026 10:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE651F00893;
	Mon,  5 Oct 2026 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195540;
	bh=uL+7rI/S7IRggYv5dMoEOpOJMH7UH8Cis4v74Sz79Kg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hS+yNv4lEyG/fNEoV4KOsByq7LdZOdjh84vZLuNL5MfnloMg8fj7M5lFsweDuhmYY
	 Z6knYneKgzJlFcfRLaC4MQkrzbRKxaRcPFMEWv82BMUUz9sNleXKn9qzYwKVjOD07S
	 T/3cdxIkKbndeiBcYs2X5N9XpFsLPvP/E+P+MwkYuWJBw4H0DO6bs7+lbKL2879n25
	 qX92uZjqR5SCqSI82uIg4vTb0wpBsOh/K+i+w8Irto35eTXib9zQO9ox8F9DxXirJH
	 +jbjillNAGTdDPnmBmFJyJ0bfpBQ7xUJDZLBDHZdHkBI0L5jHTgYaP7Q/b30rECyBw
	 ZAJfG8vhLhzjg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 2/4] arm64: dts: samsung: for v7.4
Date: Mon,  5 Oct 2026 12:18:45 +0200
Message-ID: <20261005101845.34752-6-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005101845.34752-5-krzk@kernel.org>
References: <20261005101845.34752-5-krzk@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4239; i=krzk@kernel.org; h=from:subject; bh=pP9mza1S7JpYQtJm98gFZ/urfj0oiqkxRZoH+ma9ShA=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqw3mG78u4KALm3cpSoJq1eRxblXSqDzxEvNycz uaKtW9TStOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCasN5hgAKCRDBN2bmhouD 13VfD/90Rr2PTOZSMo1I+46yiJ/hZmJWNGlEYoSJlO/hP7tVFCcFwV6smC43HQDhIKdU/88jHrx zSgxGkB58nH1O0/ElQdYUsFKRjyjFTNx967e3hYrNomdATDrZgVarc5kkWni4zhLhTjiaDgtjmd IosQg31wye9xoDa5S9DGX3RWSz7ymFPN85AO2/PAb3j5dpDZG6WKtepC23a5GTJsg85E8OcZRyd IX+YH3N166oMQhdGIoyMmiNwSzBv/DNIBA/q3YZd9Kk167ZFyw2UTyzWW4QiavqV90NzNHnekRd KREEd20l7nNaKJ0+SldVwd98efL7MUMULXNxfKhrlUiq5p4yRZMgwn4ru7HTxa7VJ8YV/k3DWjm o6BO3gzt7Rg6z4lJpwa6RY+Le6mu69VBavQh+4GHLo4jFNnLi59zGz9n2kMZ/J7eoYVS0R0dn/7 ElXbnmyFQMk34TVt06GvB2WCoi42WyoWDxlPgHizhBaOCAT24Y/nyGYd9kSjYF3OpYr0U3tTMFi dE4Saw5IGtZVmdx4ObwnheFC3TtmXS3BdyqpqUtsr+7zepvLctZe3qZltUmIA215CyNqrxjhaUs Iu2g7jvxDUMpkOuQoldV9tJTYJT2FN3zj4trVxo8tG9qFFaz5kpx/HeHP25z7PZDei82+8vQvpv j2wXYIPkXbDqpUw==
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

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-7.4

for you to fetch changes up to 0e5c0ebc0faeaa52da10feeb159dd8660a0b2f4b:

  arm64: dts: exynos: Add missing space in compatible (2026-09-29 07:48:14 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v7.4

1. Several more or less trivial style cleanups pointed out by
   dt-check-style.

2. Exynos850:
   - Add Mali GPU, SRAM and mailbox nodes,
   - Add new Samsung Galaxy A21s (SM-A217F) mobile phone.

3. Google GS101: improve description of the Type-C and fuel-gauge.

----------------------------------------------------------------
Alexey Klimov (2):
      arm64: dts: exynos850: Add ap2apm mailbox
      arm64: dts: exynos850: Add acpm SRAM node

Amit Sunil Dhamne (1):
      arm64: dts: exynos: gs101-pixel-common: add supply and regulator properties

Krzysztof Kozlowski (15):
      arm64: dts: fsd: Fix indentation of CPU nodes
      arm64: dts: fsd: evb: Correct node order
      arm64: dts: fsd: Move idle states out of CPUs node
      arm64: dts: fsd: Re-order nodes to match coding style
      arm64: dts: fsd: Re-order properties to match coding style
      arm64: dts: exynos: axis: Re-order nodes to match coding style
      arm64: dts: exynos: axis: Re-order properties to match coding style
      arm64: dts: exynos: gs101: Re-order properties to match coding style
      arm64: dts: exynos: gs101: Re-order nodes to match coding style
      arm64: dts: exynos2200-g0s: Drop chosen address/size cells
      arm64: dts: exynos2200-g0s: Re-order properties to match coding style
      arm64: dts: exynos2200: Drop redundant blank lines
      arm64: dts: exynos7870: Re-order properties to match coding style
      arm64: dts: exynos5433: Re-order nodes to match coding style
      arm64: dts: exynos5433: Re-order properties to match coding style

Thomas Turner (4):
      dt-bindings: gpu: arm,mali-bifrost: add exynos850-mali compatible
      arm64: dts: exynos: Add GPU/Mali Bifrost node to Exynos850
      dt-bindings: arm: samsung: Add compatible for Samsung Galaxy A21s (SM-A217F)
      arm64: dts: exynos: Add initial support for Samsung Galaxy A21s (SM-A217F)

Waqar Hameed (1):
      arm64: dts: exynos: Add missing space in compatible

 .../bindings/arm/samsung/samsung-boards.yaml       |    1 +
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |    1 +
 arch/arm64/boot/dts/exynos/Makefile                |    1 +
 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi       |   36 +-
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi       |   36 +-
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |    8 +-
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi |    2 -
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         |    1 -
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |   93 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |  108 +-
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |   39 +-
 arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts |   34 +-
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |   34 +-
 arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts  |   35 +-
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |   39 +-
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  108 +-
 arch/arm64/boot/dts/exynos/exynos850-a217f.dts     |  200 ++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   29 +-
 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts     |    2 +-
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |    2 +-
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |   51 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   96 +-
 arch/arm64/boot/dts/tesla/fsd-evb.dts              |   10 +-
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi         |   16 +-
 arch/arm64/boot/dts/tesla/fsd.dtsi                 | 1162 ++++++++++----------
 25 files changed, 1195 insertions(+), 949 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-a217f.dts

