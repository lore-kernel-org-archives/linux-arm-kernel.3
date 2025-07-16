Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F413C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 09:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A2KxxqWr8JNX9hy2Bf9nMD05wlS7tKZsKHYvufU/tb0=; b=bX/RGxVHOXCK+PdnD3n2aAxIOx
	7aJtBsW483ok0TrWiPi3QsDDPBad8NgaA0iq79eYnUq7HdcitYDYpH0Ue+8B84mLP26BhxRCTvbjk
	8mo0LIXLHT2YkURa1ZHQ7CSYUn3Avc2vowdAubh9FcBuETXdZzRIAHRxyodpyxYvMLSVwSFM+2NPJ
	9FVTGprijzljMjYqhXDCqPnxf6nZvOUR8wmlN0czaqPQiJT4y0HKpS339Hfh62h+PZxErlw2aNpzw
	Nqp5FUzunjPk/57v0CavZ9Nn2a8MSmX8DO+xN0Xb6NV+7sxaYEyVbLL5Fg/lf3cTUYiu97XuL9vUH
	dcfndyNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubyJg-00000007Gne-1mcR;
	Wed, 16 Jul 2025 09:20:44 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubyFY-00000007GDM-0kNv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 09:16:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8904439F6;
	Wed, 16 Jul 2025 09:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752657385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A2KxxqWr8JNX9hy2Bf9nMD05wlS7tKZsKHYvufU/tb0=;
	b=lqRfvKRn46rfX7ZYdAlc+ReKvOCdB7/io2VGMAmSz6p2BZxfdZqYg0hY4TwB22Ng7SsDZU
	/No+bSDoUObLmZ4lyn34bKSVFZQHN8gLHb53ylH+sBKADmw0FG4qId2VohADi00eY9CvQw
	9dEO9TD6Lp6vUD0QAccJ/upeKdG6YOblP4E9SJ66DY+In/PF4BgS48/Vq9pS2APa1quyDm
	W/0EGVGVeo518ugfcJ2uMcfTQCyCuj7TzKwA09w2BxGwsdhQgFx+a3MFj6T7mZYkiB4NdC
	pWx7a8gsp+v9ohzU1Wxg6dhqIM93bRwPAvwZId9J6ePP/idVPmbnB3SiMR7r5g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm for v6.17 (#1)
Date: Wed, 16 Jul 2025 11:16:24 +0200
Message-ID: <87jz48xzpz.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehjeeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkgggtgfesthhqredttddtjeenucfhrhhomhepifhrvghgohhrhicuvefngffogffpvfcuoehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetveffjeetleekhfevteeuieeltefhkeeigfdvteevvedvlefgudeftdfgieegveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemlegvrgdvmeegudgsfeemudgvudejmegrieefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemlegvrgdvmeegudgsfeemudgvudejmegrieefjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepohhlohhfsehlihigohhmrdhnvghtpdhrtghpthhtoheprghrmheskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepshgvsggrshhtihgrnhdrhhgvshhsvghlsggrrhhthhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_021628_360973_3454DF98 
X-CRM114-Status: UNSURE (   6.97  )
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

Here is the first pull request for arm for mvebu for v6.17.

Gregory

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-arm-6.17-1

for you to fetch changes up to 90ec89d68ffaf36d7abfcc14908edd6e4803c4ea:

  arm: orion: use string choices helper (2025-07-07 16:56:04 +0200)

----------------------------------------------------------------
mvebu arm for 6.17 (part 1)

Use string choices helper in GPIO support code for legacy Orion based
platforms.

----------------------------------------------------------------
Kuninori Morimoto (1):
      arm: orion: use string choices helper

 arch/arm/plat-orion/gpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

