Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7656C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 12:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fOAmXLgFxWZ+ulX7KAiIBOK6edcQA4gcgth7a0IxJXQ=; b=K15KP8ar2f1UzdCDZ6wOjJG5an
	g4e3VPbYezOaQn75ENbUvG1YOYZs31SAMX9ESG9oMFBCvhhfXOoCn0sysBUCovUg61Lvr4yLG4f9+
	KArgLCbDWxdwLBImxQElgk9FMY6ASXmORkFFTzeFC6LfhTM8ZfEh+CoAnZzO5q618VN/rr8IvDKoa
	aKCi71Ck+2bMoWNlSfPxNsES8tcPEPbvPRkTEobv6Ud3DowXfcn1+UOh/C5yKCL/xPKvDDnyZwO2g
	L3K9Mg196CHkrpj5K0DCQPSTjSFz4gQHG4NdQ2R59HF15eIFJfsuEMJxwmeau0Sb/sEMSfdx3gpm/
	s2OwCFBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmBZk-0000000B9JE-0Llv;
	Sun, 23 Feb 2025 12:59:16 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmBYF-0000000B9BP-2osN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 12:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1740315458; x=1740920258; i=wahrenst@gmx.net;
	bh=fOAmXLgFxWZ+ulX7KAiIBOK6edcQA4gcgth7a0IxJXQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=a5zNDwgSdiH9Xy5GP5f5p3dc+kxcUXKfevPR0EjMSqimbkQQlGpQ1hmGba3V2DDn
	 DjdTIr3iO1gsFUyaf4aYEuoGWHovl1xlZdrxZsIL87Wh56BruOyzqWlJBTNCRkcJu
	 62HS8NJG/I90koyN0YR8nQwEmx5m0fsUQQvcrwD2RcBpkFzUQ0AETobj9EgBSHYgE
	 aDWrsTB4OPm4xlRh0BgzxrSCJz1p6knF1vc7Km/jfvt5NeYokrx5AKRvmpW3gLJGM
	 RjK+lpIqPw3+0aQXnf3zjrKn4MDqQZozshUeAUvY07bAgmVc6QcT2htFNiIwEHSJG
	 aipjBKAQVSCS2J6A0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mel3n-1tDxC84AlR-00hs2w; Sun, 23
 Feb 2025 13:57:38 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Phil Elwell <phil@raspberrypi.com>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 0/2] ARM: dts: bcm271x: Adjust PL011 primecell-periphid
Date: Sun, 23 Feb 2025 13:56:12 +0100
Message-Id: <20250223125614.3592-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5hVBDRw1GpkiLmHAzwcsX/ABqcqVS33Z/ILCNuN+T3Mylbvytnu
 VcEI8FQ2RlfLy0Iv7Oq8OXRlJwRAMBtelpklzok96aPHGTiLaLth8N6lYM54Eo3XMC73wb2
 qdNltJI6tJSMmbwU2/5bwbdhNijJqdbQGuVDh8NzKVY8mx6fEqDhG7t4nRoAYl2VrBrDkHq
 brbfuTaX2rloBS9Hy1IwQ==
UI-OutboundReport: notjunk:1;M01:P0:g7GFx7o6EPs=;ikqmq2U+l61LaW7FF0Lx97feNLK
 qEetAqPlgu/4G6jmyFsS5hjIKXqA4i1bC4avXH0YXZm4e+t6zeBqSkk18Ze3X6Gk/exLy0G67
 kWNGAgrErZZT10s7+DprO3WvcGh0PLSBjRgFzwL3gByP6V86k5+nze7x7qiiUl3OQbKUpopAW
 ksKEVvAyq90EHjzmpqZ8yY2SzJe+vdlvirQSrVSBbl/RhyBPp9qlh4stANSMbTHAL0eGBSZ4F
 rOBabopxG89Wh++sAVyo060/cpbYeRcr9rLcCneeVVu47+/FH5/2WleHrIPndPdwOhgLzDe8h
 3zvg/+7t/sRuviR8nOu1wJhFuFyRGjNYhEZmtYCbnwhwGjBszkCGfU8YlwdUNCfgtvwHvEFL+
 MxSEdSCZoicaum3BkhPB6oj3pFGJ76DbVWJp4VVB/PEa5K6ER6lYigGe4stF8yEsOwGr888/o
 o/yN3S9ojAKMnyG0ZYajO7dnTQNrCgwso3kaZdyhMR5MSqdfz7mkGVyILrF0e/JMsR++NXa6F
 7W7TDzrRxbGlG31rcwDb8jgu+2czzk0POJXAaJrusiymTzgWrKEgL/qLJJc/C64wcQRdgbJ3U
 Kbw28mtNczNEDVCmcG2UUCdi5qTDzCDZfJVsdlfkBHyHrFIydUxYx9CCWfht/1uGU8A8c9LL8
 /l4YLUZtR+wWBLzGn0pLbp/QdQ8rckytpg48wKJqAQ5lIlG6IRsI++fF4hH9hDIuUnv8sErSN
 yyeoMNayhzF3lzDIGs2XOhrFDro3LVXhHvNPWXCFOCL/qxS1tyqLN1iYgO4n8a5EiqC09VcdD
 oSvOQi2vGGdSZ6OQ1MIJzeuRv+6WLy8I0+wwvb+7l8111GZfgTGTQg08VWZkGaJdWASpbOvux
 jNH4ody4bOsR5+IO+bVy+rpneA8FCHFryMQ+nBDkBfqkGZWkH0B79HgCLbR1sqxl3Kg43/C2P
 fyYpvhwNfsSrReRzSmhETX4ykmTVKGF5H5unm3cCqmWdBhrNN0vRVY0H2CDJyhHXG95d11Y9Y
 giu8DhDZYcNqcvTwDwrOCE+qSWW2VNbOfNL13oFOUvc2K4epdKgMqZqXtOQp0Xz4aaPsvWR2/
 HgFWblID83wVpnmWEVK4zRUKmJfK1D5tXToYShFXH6GO3QX5l0nSyPjwl+Zodo1uix9F2Sqtv
 DulgympQ/+7ZJww9DfRKcOdZaqYITEVhw7RQ+Xx6bfJlWa4dCdOMOv9P1YWtGlgcjveOETBWO
 4+TET/uM2x4SnHN98ugSwgyA//9hCYPQC7HCeDzuHy6Tz0SjwdkRHaMFthdlSx0tUw/8DDACe
 UgPguX3mGLj0hP45jeWc8IJ+iYOvFBOZguZKPVq/MJNhv35kXwdiAQ84Lj/lTrUgAlBNo+Q+i
 lYmphBAYY4APe9V6ndjAxtkSCufGEF0WAwuDFREUcmRb0O9QDe4OgKX1iQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_045744_080658_B7FB31EF 
X-CRM114-Status: UNSURE (   8.18  )
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

This small patch series adjust the PL011 UARTs primecell-periphid for
BCM2711 and BCM2712. This has just been taken from the vendor tree.

Phil Elwell (2):
  ARM: dts: bcm2711: PL011 UARTs are actually r1p5
  arm64: dts: bcm2712: PL011 UARTs are actually r1p5

 arch/arm/boot/dts/broadcom/bcm2711.dtsi   | 9 +++++----
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

=2D-
2.34.1


