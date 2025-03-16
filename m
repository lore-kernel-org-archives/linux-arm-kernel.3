Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E89C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 17:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yx0/axecIJ9CO0OZjIvjDDWcStDKKm3iW/gx4ytCqac=; b=RgImsBCcLge9oNkg8PT8fbkIAb
	DPEIy3TzU9jnngFN+OrdEYjLXwbC3Z0FT/WINDPSEV5YxuUUqbY0SB+GTpSxByeTcWffsirZJJPcY
	iKxn8u+3YOQXFKz44FCkR3kIVUnXF0ptHbS3Tn3R9rd//eYW9g/LjpUntsOMhS+0pLHHWLYlJ/NQd
	wY8j2CY9Fl0EFywdgEtkw821HtcbZH9cYvi/WRJ5fWfEHPeXAHvBgeHJ+zUQPY6H3kQC+sY7NRSOf
	cNC2CCdAYdqGqIE/Hi1d1nyfOMEbwndo1O1Ntnj2p0sY7jd51IiILF/mkHDq2IOxjLWMrQxyI58ai
	vBwKPz+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttrZv-00000000PO4-2w2U;
	Sun, 16 Mar 2025 17:15:11 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttrX7-00000000P4A-3STf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 17:12:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43F734432F;
	Sun, 16 Mar 2025 17:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742145133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yx0/axecIJ9CO0OZjIvjDDWcStDKKm3iW/gx4ytCqac=;
	b=eCd+kXYD71/An7LnPZjEN4Uaew9/P7NEvpJv+fUgf4qJSnHVjvfUb2DmMHFxnhPukmZhTV
	fapxZfVo0GZ+Ko7BOa8WeVWCS78RAIx8B7tj0LWA2UOmbmGH4wOcS05uqmWAF/0RYab+3j
	1HquRWmRWoDBUCFPWhTrKDYv0qiaHMpwTNeRJdQmaTHHNVFGbWIa11fD44OFXDMo0k4GfK
	6yefBCAN50yhQfJ6rWtCFemZ1Zqv4mID/Cu2cQucwfIRoT+skNcHpNGE7V8MXX58P1scgd
	4Wrumzg5JB0zS2sPa9T2Q7h8ENk2EtbWYWN4ySYnEOjF6qnr0ssYfIr1h+4kTg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.15 (#1)
Date: Sun, 16 Mar 2025 18:12:12 +0100
Message-ID: <87wmco99xv.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeejudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteevffejteelkefhveetueeileethfekiefgvdetveevvdelgfdufedtgfeigeevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmeefuggtmegvvgektdemudefvggumehftdehleemrggsvgelmedufeegugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemfegutgemvggvkedtmedufegvugemfhdtheelmegrsggvleemudefgegupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopeholhhofheslhhigihomhdrnhgvthdprhgtphhtthhopegrrhhmsehkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehsohgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehsvggsrghsthhirghnrdhhvghsshgvlhgsrghrthhhsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_101218_501688_BDFA66BC 
X-CRM114-Status: GOOD (  11.08  )
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

Hi,

Here is the first pull request for dt64 for mvebu for v6.15.

Gregory

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-6.15-1

for you to fetch changes up to ed9c2b28ebef3333f25cefdc2ef37ee1f05cad95:

  arm64: dts: marvell: Use preferred node names for "simple-bus" (2025-03-1=
5 11:27:04 +0100)

----------------------------------------------------------------
mvebu dt64 for 6.15 (part 1)

device tree clean-up fomr DT maintainers

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      arm64: dts: marvell: armada-8040: Align GPIO hog name with bindings
      ARM: dts: marvell: kirkwood-openrd: Align GPIO hog name with bindings
      ARM: dts: marvell: armada: Align GPIO hog name with bindings

Rob Herring (Arm) (9):
      dt-bindings: marvell: armada-37xx: Add glinet,gl-mv1000 compatible
      dt-bindings: marvell: armada-7k-8k: Move Armada 8KPlus to schema
      dt-bindings: marvell: armada-7k-8k: Add missing 7040 and 8040 board c=
ompatibles
      arm64: dts: marvell: Drop incomplete root compatible/model properties
      arm64: dts: marvell: Fix missing/incorrect "marvell,armada3710" compa=
tible
      arm64: dts: marvell: Add missing board compatible for IEI-Puzzle-M801
      arm64: dts: marvell: Move arch timer and pmu nodes to top-level
      arm64: dts: marvell: Drop unused CP11X_TYPE define
      arm64: dts: marvell: Use preferred node names for "simple-bus"

 .../bindings/arm/marvell/armada-37xx.yaml          |  1 +
 .../bindings/arm/marvell/armada-7k-8k.yaml         | 25 ++++++++++++++++
 .../devicetree/bindings/arm/marvell/armada-8kp.txt | 15 ----------
 .../boot/dts/marvell/armada-385-clearfog-gtr.dtsi  |  8 +++---
 .../boot/dts/marvell/armada-388-clearfog-base.dts  |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-openrd.dtsi     |  4 +--
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi      |  2 +-
 arch/arm64/boot/dts/marvell/armada-371x.dtsi       | 17 -----------
 arch/arm64/boot/dts/marvell/armada-3720-db.dts     |  2 +-
 .../dts/marvell/armada-3720-espressobin-emmc.dts   |  2 +-
 .../dts/marvell/armada-3720-espressobin-ultra.dts  |  2 +-
 .../marvell/armada-3720-espressobin-v7-emmc.dts    |  2 +-
 .../dts/marvell/armada-3720-espressobin-v7.dts     |  2 +-
 .../boot/dts/marvell/armada-3720-espressobin.dts   |  2 +-
 .../boot/dts/marvell/armada-3720-gl-mv1000.dts     |  2 +-
 .../boot/dts/marvell/armada-3720-turris-mox.dts    |  2 +-
 arch/arm64/boot/dts/marvell/armada-372x.dtsi       |  3 --
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |  4 +--
 arch/arm64/boot/dts/marvell/armada-7020.dtsi       |  6 ----
 arch/arm64/boot/dts/marvell/armada-7040.dtsi       |  6 ----
 arch/arm64/boot/dts/marvell/armada-8020.dtsi       |  6 ----
 .../dts/marvell/armada-8040-clearfog-gt-8k.dts     |  8 +++---
 .../boot/dts/marvell/armada-8040-puzzle-m801.dts   |  2 +-
 arch/arm64/boot/dts/marvell/armada-8040.dtsi       |  6 ----
 arch/arm64/boot/dts/marvell/armada-8080.dtsi       |  6 ----
 arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi |  3 --
 arch/arm64/boot/dts/marvell/armada-ap806-quad.dtsi |  3 --
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi      |  6 ----
 arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi |  3 --
 arch/arm64/boot/dts/marvell/armada-ap807.dtsi      |  6 ----
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi      | 33 +++++++++++-------=
----
 .../dts/marvell/armada-ap810-ap0-octa-core.dtsi    |  1 -
 arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi  | 24 ++++++++--------
 arch/arm64/boot/dts/marvell/armada-cp110.dtsi      |  4 ---
 arch/arm64/boot/dts/marvell/armada-cp115.dtsi      |  4 ---
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |  4 +--
 arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi     |  3 --
 37 files changed, 78 insertions(+), 153 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-8k=
p.txt
 delete mode 100644 arch/arm64/boot/dts/marvell/armada-371x.dtsi

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

