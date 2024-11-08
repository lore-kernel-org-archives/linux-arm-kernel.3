Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E043D5E149
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 09:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gNP71UrXuvynxgrvdBRMLqCWlumcTTVVhYh5Lzrpocc=; b=Qv+JIZBZYzMiSwDN0yweeLVXAP
	vn+oPhMZBe47CiEF0UU/fiwtA+nNVI8A2X5mmPT6O0tJeMoKppVLK09FB45KUuhkcr5vvdqBCzEOI
	O7vdkv8w4VCYmA6W8EqoH7h/nHNSqbHa/iLnKibAoxKWRC4w6C2/SygcX5DLLELdvgNGJ4hdJVZCu
	57D+ls//MnttTetj759nk1/Wv+9PmL+cN6IPcvOtTe8j+t/Wja4+JeVANc1FRbQ+AAoYxzce11qke
	HRDsrmGA6dTASJW8oNuo/eQ84vgm1dAiA6QGOxTne2Z1gnVtfPniNRgB8S4k7HxdLuknl29xHlNhO
	lSc+ElrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9LRb-00000009ywV-0Q3A;
	Fri, 08 Nov 2024 09:38:19 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9LOw-00000009yM2-05fe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 09:35:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44ED460002;
	Fri,  8 Nov 2024 09:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731058531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gNP71UrXuvynxgrvdBRMLqCWlumcTTVVhYh5Lzrpocc=;
	b=RrOHBp+NB1piwCJpl++yMngy104p79U8ApZrPNilufrCF2mTng+4vQZmu6teAZZ0td1p9G
	HablM257ErUbPC19ABEHPr6a322nYfWU4KSWtQB8H0xcJ9Nu/GmkA7CLz5JpfVxnJ6rlpI
	+DyC7Exb8z/g8AjEFPxqI5LEtlyBFBKXbohPjYRN0g2HA0NfPbh0sUIwDgsdnpDM0zRwVx
	kEtoJppcP+UMN3hVapw/DoicAZJGaXrL28JVrabVGeOkMfpfTlABS0OkImy+fuGIkxMWE0
	eRXtiZ9Z1TwlM1OVb7MaLrUPMP7e+ujfRnfgPLwUf6ga3r/Dx/K0fZpUjr7EUw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.13 (#1)
Date: Fri, 08 Nov 2024 10:35:30 +0100
Message-ID: <878qtu83vh.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_013534_217298_286355D6 
X-CRM114-Status: UNSURE (   6.35  )
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

Here is the first pull request for dt64 for mvebu for v6.13.

Gregory

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-6.13-1

for you to fetch changes up to facbe7092f8a92dd991ef8c1162136f7767ee3c4:

  arm64: dts: marvell: Drop undocumented SATA phy names (2024-11-05 17:28:0=
3 +0100)

----------------------------------------------------------------
mvebu dt64 for 6.13 (part 1)

armada-*: Drop undocumented SATA phy names

----------------------------------------------------------------
Rob Herring (Arm) (1):
      arm64: dts: marvell: Drop undocumented SATA phy names

 arch/arm64/boot/dts/marvell/armada-7040-db.dts             | 1 -
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts       | 2 --
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 1 -
 arch/arm64/boot/dts/marvell/armada-8040-db.dts             | 2 --
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi         | 1 -
 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts    | 2 --
 6 files changed, 9 deletions(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

