Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C12AC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7zJ0YMWeCxiz69RUpFjzpIYlW/9jMemkPNPbCPfYxVM=; b=XwJAT12WbHpQYX2VI+bjBPTHym
	Bf66UFEEcS92yXfIwL0knkMSW70SUwFWdmfzyuOGPmtG6aR0jS5T1MvOe439pmDxtMQ1o8AbywH6o
	AE1bs4l0ZFVuppyVL3Ok5b1wpCSjMybME+mqDBhOHiPmsWNmy7LsacS2DbdryJmv4qbVhgLQFYSFg
	7cuget3sy6UJ46b9Al/wKOnYFM0/ScqE0jlJWR5y3ocf0w/pGWhDJw9goQ18NSjwHUxw+qgbbAzDn
	uD4khnscvjWngCRfS1hvXJ2MLlwyWNcFCM2F7wrJhRfAAne3yZy7/Uih/gjJ3BU0vV3qnjPZd4dkq
	1R6HSizw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwYy-00000003ldM-46kN;
	Fri, 16 May 2025 15:01:28 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFw6G-00000003fnd-0COj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 14:31:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23D0943B63;
	Fri, 16 May 2025 14:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747405905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7zJ0YMWeCxiz69RUpFjzpIYlW/9jMemkPNPbCPfYxVM=;
	b=pvloXY/Yhu5p/KpjsQCONOIYpbm13sppl0IsaNP03tYfcBA9SqkZpImFghVveO75vAAEfT
	8ivH6vk0Vm+F34axgEQBqCTqXfv8dx027EAVKRv8+RXayrmEJGH1Ks+XyjYewpsslQvHde
	JCn/Bj7yGVhFqc/mzZ+UZy2+qlfM0auB1IqH4ruWwPUg42c6x1IE1+u9gCahD9pZQycSdM
	+boJ2ftxNXzKwaL6Lu/TdkU3ypQG6Ek9XrRi7oBwnLTufMh1pBmh0pzMnk+Cn7oGcQGgz1
	jtWfe4Ugosfd45V4HP0Lm2vaaHUaNvEt1kJGSIhjxpsDK3ns5yg4MOKoy0f08Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.16 (#1)
Date: Fri, 16 May 2025 16:31:42 +0200
Message-ID: <87tt5kpqy9.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteevffejteelkefhveetueeileethfekiefgvdetveevvdelgfdufedtgfeigeevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegrfeehmeelleehtdemvggttdefmeeiudehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemrgefheemleelhedtmegvtgdtfeemieduheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegrrhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsohgtsehkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehsvggsrghsthhirghnrdhhvghsshgvlhgsrghrthhhsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_073148_218367_E6C644A9 
X-CRM114-Status: UNSURE (   6.73  )
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

Hi,

Here is the first pull request for dt64 for mvebu for v6.16.

Gregory

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-6.16-1

for you to fetch changes up to 9179e4a26bf25722714afcdb6a1e632ad52e443b:

  arm64: dts: marvell: Drop unused "pinctrl-names" (2025-04-14 16:32:17 +02=
00)

----------------------------------------------------------------
mvebu dt64 for 6.16 (part 1)

Clean up unused pinctrl-names in pca9555 nodes

----------------------------------------------------------------
Rob Herring (Arm) (1):
      arm64: dts: marvell: Drop unused "pinctrl-names"

 arch/arm64/boot/dts/marvell/armada-7040-db.dts | 1 -
 arch/arm64/boot/dts/marvell/armada-8040-db.dts | 2 --
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi     | 1 -
 3 files changed, 4 deletions(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

