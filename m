Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D809BC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 10:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0Ty8ygpMz+YxjUuGF5UxB/sAndQF0xXzIqZXszBklw=; b=z1Tt3y/wej7wVmyJxSfGnQaoL+
	C+HMAsfhO0KBREe1ku0lnI6P8TF/3KmmVIK8KWHeHqclBgzUHg3etuX3vIOxWlTqoQMC7VUl/FfNh
	8SMKF6PWgbEuRCZ7PNTTntXSD927cSNeQLdrjHmULmipqbNGuJRgSd6VIq0OFFCjPj3GfKAbM56wL
	Ednm7UNFkyLGJDcrSce6kK4EcZ7rx0yUKg3Zn82uKUjo1FZR1iXKnt36hhU/hIDQDWWMLl61m3f47
	SJtn3AsgZNOvsfhUfk6zIFrcEsBM/Jc7JIR7IhiKVdVQJhvvDSFlJHMO/8rGU8rqjSb+o50xN3KIH
	neyzBcwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQdA-000000097uM-46Mv;
	Mon, 12 May 2025 10:43:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQZC-000000097TE-0QM0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 10:39:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B0463A4CA77;
	Mon, 12 May 2025 10:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC58C4CEE7;
	Mon, 12 May 2025 10:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747046364;
	bh=Gf25hQtLrP64X1RkCZBTbVL8CRFWFn58eYwvwpG9HwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ljdEIkqmukAAosQc/JKWrVJRPrf8u4b5uFIfnTgIMMIhaSLKJjpVmqjj3RqNCyATj
	 JQBmfCIOee0tCB/339L/wMTf5TATKwUk8XkOm3iMiNv00rxN0y+ReoAukWiawHbbDE
	 Xf9Nf5L1MNovAJYW6g22Kicm1JKjxoQO9APFpH2dZpqIAAvMw3yLO7NpKb150wkgUR
	 /6h4p0FoaoxLz255j34+KvDQTTFTiVN3sjcY80EdhjZY4Zs4OCEOfmGdEY147WT4y5
	 jlRmmBq2BOqQugZKr5oZHJUwC+9yj1eMIMNWfrWqSlAfKwfYTSIdCCrCenII7fej9t
	 JQsTUykO0GURg==
From: Shawn Guo <shawnguo@kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] i.MX dt-bindings change for 6.16
Date: Mon, 12 May 2025 11:38:55 +0100
Message-Id: <20250512103858.50501-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512103858.50501-1-shawnguo@kernel.org>
References: <20250512103858.50501-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_033926_208872_A8AF0CF4 
X-CRM114-Status: UNSURE (   6.24  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.16

for you to fetch changes up to b20c69cd708b8f1b61e311cf05632fefe583f1c4:

  bindings: arm: fsl: Add PHYTEC phyBOARD-Nash-i.MX93 board (2025-05-09 22:50:37 +0800)

----------------------------------------------------------------
i.MX dt-bindings change for 6.16:

- New compatibles for TQ Group boards, i.MX943 EVK, Nitrogen8M Plus ENC
  Carrier, phyBOARD-Nash-i.MX93 and phyCORE-i.MX8MP FPSC from PHYTEC,
  and Toradex SMARC iMX8MP SoM/carrier

----------------------------------------------------------------
Alexander Stein (1):
      dt: bindings: arm: add bindings for TQMa95xxSA

Jacky Bai (1):
      dt-bindings: arm: fsl: add i.MX943 EVK board

Markus Niebel (2):
      dt-bindings: arm: add MBa91xxCA Mainboard for TQMa93xxCA/LA SOM
      dt-bindings: arm: add TQMa8XxS boards

Martyn Welch (1):
      dt-bindings: arm: fsl: Add Boundary Device Nitrogen8M Plus ENC Carrier Board

Primoz Fiser (1):
      bindings: arm: fsl: Add PHYTEC phyBOARD-Nash-i.MX93 board

Vitor Soares (1):
      dt-bindings: arm: fsl: add Toradex SMARC iMX8MP SoM and carrier

Yannic Moog (1):
      dt-bindings: arm: add imx8mp-libra-rdk-fpsc

 Documentation/devicetree/bindings/arm/fsl.yaml | 61 +++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 2 deletions(-)

