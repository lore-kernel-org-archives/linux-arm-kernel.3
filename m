Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C170C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 09:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XKdPjGREMhHnPm2jzF6U9g4NxAEYWuR7203feVL7b+I=; b=4a4Atti6lts+3Q+4ngqdOlVgCh
	VtwR9g+wqdCr/zeqVf9giNkYNldJ6PEe/gkfTQyZ37XVojX3CrNclZnI86rK+ivWZd7MHnqWWNrkT
	MpkbN040E7s/n6TNmPR4BXeVz5w2mIwtyHsQucSUOchGj4wE7k+Y4zmzSfjdcT65zCWncwX7hVwcx
	L628CVXoCbgXbP63kVGY1gGjhwYf5DDV7VG/NV7cGeqBry+5J+iAc4DIfX4nX12cyhl/1ZJ4nCNjM
	im1rWdcf0j6qx2YOm8Nc0BcW1s80WxDo1kJLsstdNC/Kz69/jxz3shAs0bo5WDg51N5tRlAM76d4f
	3Zkb/OsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubyHH-00000007GQo-2nkv;
	Wed, 16 Jul 2025 09:18:15 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubyEq-00000007G5P-2PRV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 09:15:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8FAE43910;
	Wed, 16 Jul 2025 09:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752657340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XKdPjGREMhHnPm2jzF6U9g4NxAEYWuR7203feVL7b+I=;
	b=fwo+84hiEy//cwSOvSatw5mHuBYtrqDF7qWkUdjGdCBlngiPm3iivjTK7KxIfzBBso0/g4
	L9W5vbs3BueM5L5G8CM6TJTm7sxEGS62JlURuMBdHraajnFLdJM/VcwB4mSd4vZoerNdKk
	gaRuy72r56zS8NyXQC7n5bm62zamnGwrMOSRI9WbS7y2ZVm1F9S7MWoZfscnJl+DYp9yXs
	cfuruP5hz/nKTVuXCYRMx7SgRVZudSLodeD9Jmt19sGrWmazb6JgQbHIaP9nPMx+iPBB5b
	wiuXH9AxAhoSYdZOnhQCl7Kah04LDe433eaW5E+g2j7bhQx3+iei3FXa3EGeWg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v6.17 (#1)
Date: Wed, 16 Jul 2025 11:15:39 +0200
Message-ID: <87ms94xzr8.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehjeeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkgggtgfesthhqredttddtjeenucfhrhhomhepifhrvghgohhrhicuvefngffogffpvfcuoehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetveffjeetleekhfevteeuieeltefhkeeigfdvteevvedvlefgudeftdfgieegveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemlegvrgdvmeegudgsfeemudgvudejmegrieefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemlegvrgdvmeegudgsfeemudgvudejmegrieefjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepohhlohhfsehlihigohhmrdhnvghtpdhrtghpthhtoheprghrmheskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepshgvsggrshhtihgrnhdrhhgvshhsvghlsggrrhhthhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_021544_746661_A7BD9911 
X-CRM114-Status: UNSURE (   7.16  )
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

Here is the first pull request for dt for mvebu for v6.17.

Gregory

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-6.17-1

for you to fetch changes up to 28254bcf96bf93b9089540490c2f8081bf4e4d45:

  ARM: dts: marvell: kirkwood: use recent scl/sda gpio bindings (2025-07-07=
 16:58:42 +0200)

----------------------------------------------------------------
mvebu dt for 6.17 (part 1)

Use recent scl/sda gpio bindings on kirkwood boards (Keymile ones)

----------------------------------------------------------------
Wolfram Sang (1):
      ARM: dts: marvell: kirkwood: use recent scl/sda gpio bindings

 arch/arm/boot/dts/marvell/kirkwood-km_common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

