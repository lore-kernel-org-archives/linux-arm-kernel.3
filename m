Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4696CCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 12:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yxZg21Tdekg69TWZwk8L/j9NSFNsg6bUL3zOhnRkZd0=; b=NZRsUh1bn57tXgxfI9lCNG935x
	Kw/wxvGYVlzgu9O2N3FjFQ9cWFhZAj6wALrz84eKGj+N0RpzlZ4XllOefsSfzZD/evPHz2Ue0adTL
	GgIlRedp9mhQ/C3Va5XeHkcbz2V34RnhmplUQRJD+RCHMDEnreWzZzgQv/uhOTkWiyVN8cH9d5ejC
	fOOkQVsTTNrBsD6lcFsQt1qPzBYa79PgHn6z892fjB86aNNe3zgR0nL/1Sb4Fkzzj7l52ml4kQNWg
	p/0NQY17LjzmK38ce4qGK7rZecxvc/QF2pukFFFySx9efSYApvBj4PdD2di2N6W4VXXil5R0Ta7y8
	qvE3x2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTewr-00000009Z0p-2aSs;
	Sun, 31 May 2026 12:07:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTewp-00000009Z0S-0YW8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 12:07:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 66BAA41A24;
	Sun, 31 May 2026 12:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61471F00893;
	Sun, 31 May 2026 12:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780229238;
	bh=yxZg21Tdekg69TWZwk8L/j9NSFNsg6bUL3zOhnRkZd0=;
	h=From:To:Cc:Subject:Date;
	b=SglFG5odoJ/6xb5Aop5GyujemrKt6wALFTSMV8lh1qRcXrK4WaAuaSsRsCzfZTupH
	 OyNRohGh6hRMEdbwmto4AKEtES4459oncgMVXFT//7NutF4ZjW/98sWSIpSA25JwV1
	 jDEPXGpnSXMgQ19qrNi1ilYea01ff7juwRNM1xyMJJ3xKypc3bksmKWMutCIlknH70
	 GKw8VaWTz3qnpBh05D2fvzqOPi+S8YI1geJE1FmuOodSnGee0LQqdDm4IV/ByEAex8
	 zbkI0b5txmBayA/y/4j+atNapBLnmOCBfPxN7zrpCQczTZWfsUdlQoh7ZXEekABvhB
	 sbTEdSb0j5MmQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/2] arm64: dts: samsung: dts for v7.1
Date: Sun, 31 May 2026 14:07:08 +0200
Message-ID: <20260531120708.21017-3-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2658; i=krzk@kernel.org; h=from:subject; bh=QTutGE9zG2f+Wgcbt0UYC4ZHolWzIcPt+afitFBIpXA=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqHCRskp/GVPLlEa6LJ/D2c64a92TUEdPfVipZ5 N2Xjb6rD8GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCahwkbAAKCRDBN2bmhouD 1+mVEACEUx1fzPAa3nQag29ixTmdAErCVbmGBXIdz2L4VZ9rH14VAt2M60P3xNycu26KLxpINhe BU8IoxsCz/3v3koiZ90t1ok+bWqWluOifzsva3nYu+DIbPIlCVtKhv5vleLDfRB2ShtGpvaN4cB 1gepl1ha3V1Gt68eoWHuZ+pgjh0fJUbI+aQAXvNILPz4UYkB15bAIV9GJmvz+oTvEZR4LXyEHhO 50OYxRTDMg01ENDu+4fJGMJwmSoozyE+UjXVF2dLYzp1nFd5M9BEu14X5YQu/07Iz8DBpn26ZgV Z1USe//lFYP5tFUE0vBJ/Z+aXoq7wX6jx1Na//INJMRueRCkpxNbo/E9y4OdrtgRJKfKbxTLlKo caOTVqpypzWb/wFLD40P8sOhpY5aSvAotRPmbTHszs5Owt/7fuTi8dnJ8qpDYmvAfXp3AaI5EJd G7MUe6jixMEcs5OCKsPr9VciM7ZFyr4z2QQ+Ax+TbBlzr+9ANOUsRiVdcNnAlhb71fps9L8jUE4 4CnVmCWan6/uc+v8JhEJVz7jC7KFmUzGeUNKzJ9Ui0w7w2JXL5DEzYArACYhfnlQ2D8obDfh3UC b9M5twJ/Mrn6oEhJzqiGExTZZWRhvRyYUtKTWaUN+fN0NKndEIIZC5uZjePTRLcgbqOStKoco61 vFu04e4I7R2ji9g==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_050719_212049_455CD66B 
X-CRM114-Status: GOOD (  10.58  )
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-7.2

for you to fetch changes up to 20550601bf4c23effa013a5f37e5250618869e87:

  MAINTAINERS: Add Peter Griffin as a co-maintainer of Samsung Exynos SoCs (2026-05-30 18:27:52 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v7.2

1. Exynos850: Implement proper power off to fully shutdown the board and
   reduce drawn current.

2. ExynosAutov920: Add UFS storage.

3. Add Peter Griffin as a co-maintainer.
   I have multiple subsystems to care of and limited time. Also, with
   joining to SoC team I figured out it is good to plan my succession.
   Or backup.

   Peter shown both time and interest in keeping Samsung Exynos code
   working.  He already works on and maintains Google Tensor SoC, which
   shares a lot with Samsung Exynos processors.
   Considering all this, I proposed Peter to become a co-maintainer here
   (same for pinctrl, which went via different tree).

   I will still be the one handling patches for this and (probably) next
   cycle, but in a further timeframe the roles could reverse with me
   only providing acks or reviews. If this works then depending on other
   duties and amount of work, I might be slowly transitioning to leave
   Samsung SoC maintainership.

----------------------------------------------------------------
Alexey Klimov (1):
      arm64: dts: exynos850: Add syscon-poweroff node

Alim Akhtar (1):
      arm64: dts: exynosautov920: Add syscon hsi2 node

Marc Zyngier (1):
      arm64: dts: exynos: Add EL2 virtual timer interrupt

Peter Griffin (1):
      MAINTAINERS: Add Peter Griffin as a co-maintainer of Samsung Exynos SoCs

Sowon Na (1):
      arm64: dts: exynosautov920: enable support for ufs controller

 MAINTAINERS                                        |  2 ++
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi       |  3 ++-
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         |  3 ++-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  7 ++++++
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |  3 ++-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |  3 ++-
 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts |  8 +++++++
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     | 27 ++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  3 ++-
 9 files changed, 54 insertions(+), 5 deletions(-)

