Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88798D5E14A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XntAqJuL0NV1KX+kzLWD7QKp8DgAkKe6PX7aJGRi2j8=; b=pVq9TK36w0RwHaIzlN0QRCSXPe
	b9m7rEAJANSewWD9c4MzcdmlfbCbChwOD3oX6aT68J6dv0c5X8fRTJuKtzbYEmm6OB0ZsOAgcNjCv
	MTRMXGoqmYzvHaYeynPHs+Cjdw0Tb2wS0KB/GRzaIsb77yOgZ5X/OivrPGoSLhlCjpVkvV7P1Ugoi
	LXLijsvAlo2bami/n6YB6rz+au8jYTleS6kBAI1gBCtfFlsVaWs1sjmCojk5Nm+hu1b6qXg5KYM/J
	cUyt7qzj/VmmcFprKJYab2ome1gOltWWUGCKlq71tv9dly7YMl2r3n0pU0VUTf32cR77x/ToY8tSc
	5NhmBinQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9LPr-00000009yUa-1Zbg;
	Fri, 08 Nov 2024 09:36:31 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9LO4-00000009yBq-1Ywq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 09:34:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 828A31BF204;
	Fri,  8 Nov 2024 09:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731058476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XntAqJuL0NV1KX+kzLWD7QKp8DgAkKe6PX7aJGRi2j8=;
	b=ZLZn9Z7ihEzf16221kXvKJ2zd5NJ3tBbw7EC5QnHf7DNoRvy5thrU1+/c4aHyf8iGesIAs
	tkNEMMMSj/ENr8Q7VriTXzXFjwGSWnrINp7CQhjwhj3xRuAzmr5CvSgZODWdLbn57CoU3R
	U30tffKL+Nqn0/FxCVDB/CERWCEytSkqHK1kGXrPmqb0Oi3KamosSlLwSsGJCO4rGzqDJ3
	geJKqxdbeI2Mm7IqwOeiNcKHabLNKruzYfsYnYNNJhG6duJ7caYXfQwtmZzsKcxB223URV
	p0UXXquom9oeKxX+adqQt2YVELRxTFU04AGAwGKv/SfE5owjoBewt4YavoMF7A==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v6.13 (#1)
Date: Fri, 08 Nov 2024 10:34:35 +0100
Message-ID: <87bjyq83x0.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_013440_710598_D9401A0E 
X-CRM114-Status: UNSURE (   8.39  )
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

Here is the first pull request for dt for mvebu for v6.13.

Gregory

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-6.13-1

for you to fetch changes up to 68bc6a71f56875a7dbde4f44aa4404c214651e1c:

  ARM: dts: turris-omnia: Add global LED brightness change interrupt (2024-=
11-04 17:00:41 +0100)

----------------------------------------------------------------
mvebu dt for 6.13 (part 1)

turris-omnia: prepare device tree for LED brightness change detection
kirkwood: fix at24 EEPROM node name

----------------------------------------------------------------
Marek Beh=C3=BAn (1):
      ARM: dts: turris-omnia: Add global LED brightness change interrupt

Rob Herring (Arm) (1):
      ARM: dts: marvell: kirkwood: Fix at24 EEPROM node name

 arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts | 1 +
 arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

