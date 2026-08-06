Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885D7C561E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 08:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAvLULbPSSQvTSKfGB+nlBjLTES/QZ4bBVW89Ko6iuI=; b=0zEb/JAi81vef9oGrjqi5VACEc
	pOAsUcuBpi3nalHstE2ha05FdQDTYNEw6mIEEQkDw+CXH/9eBgnF0/6gHtFzWCPsYm//4lKV1+SHW
	VgRwP+zIy1dCornHLmcT0568YvSitGT/clsuNBp8zk85zVta6VcDX/1JNmDX3tb68GW2u55GbcL8I
	Ssv0UrWtyIxi7Yky36nAfVUXssvCYXsRJEH2JAa8S40mqSE1QPxnCXvtup0hWLZw3XzrephVXCtZ7
	TWk2IvFhz037Y442WKUjaBiRp9hYIlOGIgX9sydo0Ox/OcU5I2pOwLwia0VF4ymZ46yjTtuVt0H7t
	2iF88Emw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtQR-00000005E9j-3RXx;
	Thu, 06 Aug 2026 08:26:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtQQ-00000005E8r-0BvZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 08:26:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9092C40C40
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Aug 2026 08:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383AC1F00A3A;
	Thu,  6 Aug 2026 08:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786004761;
	bh=dAvLULbPSSQvTSKfGB+nlBjLTES/QZ4bBVW89Ko6iuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HWHaDXLOdGjOzvl6S4AwG7u5nFjCsg6gzpd4wEchZG56sMOrjVMOcOx5e20Go6yAN
	 nbwHoI0EF34jEUY7v5OmaBvZN5RHMfQOiP9W8Esl2sg11njFZp70p/kYavUg6FPIu+
	 qageyNElaaCQAG30mXbF7wtRvCYhlvpxUWGAGsdlwq33NyJUr2ahKVyrU1YDQTgOS9
	 aEbeySSGGfGe3B00rMorHEp6dYo0CfOdPUTPAXD6s9tn6Ul5FqjzXrOO/RQJRTtAao
	 kOIYGrNJv41MXsk/zs/2TQv5/hSj/BFajYZHLoN9SJt0cOOFKyj82mhqKCW+wPZ/QN
	 OvpsPx7ve99nw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 2/2] ARM: dts: cleanups for v7.3
Date: Thu,  6 Aug 2026 10:25:49 +0200
Message-ID: <20260806082549.349249-4-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806082549.349249-3-krzk@kernel.org>
References: <20260806082549.349249-3-krzk@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2556; i=krzk@kernel.org; h=from:subject; bh=mIZ45LDE47L2ERnudXZd0THmCJ2DVChCTILjVaS5HMk=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqdEUOy2Lo1CfNWgs5z/tBy8eTLpy4wYNGHrVjB wfkgReFlRmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanRFDgAKCRDBN2bmhouD 1w7LD/4gta+NZmNUozA6ElNqjQ4WW2tDvVBs/PmdRbevJscXWcc9Z5X9J4iDgichSKTu6fRbSoN FMbrNKejSwTRoLkncZEDEAiDZ/7zUufPyOZhCP3h9RzXCU/PtrxqZQZn39734slznRUlBNHs7j4 0kDm6mJGbRv9qk//EUiPw6R6HF3exUBD9/sYAXu1h1IBUDgumFT6djuHfT6+yNHNW+NEyiC6vpG WzFVIYJTQMlltYYBid7Xqsg8T1ZPUN9PfmQYNl+BE6UElujG2cZIThyJxsMF/+hBPPpnviCsICL Gkz46PrbaAFyQQ4tkasaSjvkbNTVgL1mzB9/uboxzYW5qDnQxmzhvi6Mgb9q24E37dr/QgWIk8h eBKo/Br1xTEf0o5WbtWew8rhhknz1YcpN4D6bDSc8Ix1ygxYiakdfVAOP5BvNFBO1sPZMsyjYkk OWR9Nq+PYaiDxArEkLU+STeJn5bhfXdomqWIdVPPH3hA7dxyI485QHXhn52OFwDSpqVXpyo2jMo nOMOIDrIbq6TRa520DPybUylflA8sRca2QAIv0e7ftMvnVZM9jt/P0z9WRvNLTPn0zh4be9kJ// 2y4y9BqdXfqZZfny/drxxb+lqfVsqSoaRY90pwa6XnIlq9ApH+ap72tBwTyv54AvhiiB3WAHdao 7rDQS/cW+qzHGsg==
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-7.3

for you to fetch changes up to e2b3acf8c227beda488f00d06f1266f83b9b5c08:

  ARM: dts: Correct white-space style (2026-08-04 08:10:31 +0200)

----------------------------------------------------------------
Minor improvements in DTS for v7.3

Several non-functional (white-space and style) changes to match with DTS
coding style as reported by recent dt-check-style tool.

----------------------------------------------------------------
Krzysztof Kozlowski (6):
      ARM: dts: sigmastar: Correct indentation
      ARM: dts: arm: Correct indentation
      ARM: dts: microchip: at91: Correct indentation
      ARM: dts: vt8500: Correct indentation
      ARM: dts: nvidia: tegra114-asus-tf701t: Correct trailing whitespace
      ARM: dts: Correct white-space style

 arch/arm/boot/dts/arm/arm-realview-eb.dtsi         |   2 +-
 arch/arm/boot/dts/arm/arm-realview-pb1176.dts      |   2 +-
 arch/arm/boot/dts/arm/arm-realview-pb11mp.dts      |   6 +-
 arch/arm/boot/dts/arm/arm-realview-pbx.dtsi        |   6 +-
 arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts     |   4 +-
 arch/arm/boot/dts/armv7-m.dtsi                     |   2 +-
 .../dts/broadcom/bcm47094-linksys-panamera.dts     |   2 +-
 arch/arm/boot/dts/marvell/kirkwood-nsa320.dts      |   4 +-
 arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts    |   8 +-
 .../boot/dts/microchip/at91-kizbox3_common.dtsi    |   2 +-
 .../boot/dts/microchip/at91-sama5d27_som1_ek.dts   |   8 +-
 arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts   |   8 +-
 arch/arm/boot/dts/microchip/at91rm9200ek.dts       |   2 +-
 arch/arm/boot/dts/microchip/lan966x-pcb8291.dts    |   2 +-
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts  |   2 +-
 arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi  |  20 ++--
 arch/arm/boot/dts/st/stih407-family.dtsi           |   2 +-
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            |   2 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi               |   4 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi               |   8 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi               | 104 ++++++++++-----------
 arch/arm/boot/dts/vt8500/wm8850.dtsi               |  54 +++++------
 arch/arm/boot/dts/xilinx/zynq-cc108.dts            |   4 +-
 23 files changed, 129 insertions(+), 129 deletions(-)

