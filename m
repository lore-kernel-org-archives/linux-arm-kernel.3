Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9AEC44500
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 07:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQwyXCyV2PJT4RikPbiEx3IVEGUY43jh3uk9m+jiWDM=; b=EVA67GQ96S4b9H0dhGkeREviul
	wuNCKFUdLLiQYSYddHTvA6cU3nj6QufohtFG/lnT7zHzlXpiJCXRbe4lkYPZL4SkZJ19CTuyZKcFR
	TsToLTg52zd8lAaLh37H0ccUJcLZ4BX7Jsd3cge/WosYSAD2RHeIK1CNzNWL2C5Zt8Zlc2G7fzCzY
	oSb2Qir54dn0A2+H28+X0LRqx9BZZ88X/cH/UjrswaucjF5LnsgV5s2U3l7WLXNccJgRhsRb4BWDV
	V8SeGznuhrnuxowrPmHhpxu0E5TwKOEG6ajnllelL9ygkXXD44cXJHJywK9cSoJMDGumRRyeA5Lkz
	B0ItTjLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0RL-0000000ELBA-1eB2;
	Tue, 07 Jul 2026 07:41:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0RJ-0000000ELAZ-1E2c;
	Tue, 07 Jul 2026 07:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=pQwyXCyV2PJT4RikPbiEx3IVEGUY43jh3uk9m+jiWDM=; b=K8wqov0FLWnvSZCw8PWY3vST+K
	Yq8cHvYbn58/ct2vcJKmp1y9CkWhzw6rgoCqmDTWc+cqkFSGrX47X+ezJMe4xtZTUruJyIGS9W0q5
	i05RRBKHlKCWz+9vus3Fl2HdapYqLWXDC5kOJG0f9r2xoB1aHXcs4397brhlqMIPptd3Z59qLFkWB
	Vi4hVN7QnfA5xuhijDTGLLGScZNcuLDatSPa2GxITaJAEclHqxOVsr5Xg5xcH2n/aubDsRvfRErsd
	xWKkAKAvGs/IOSaPIuyXbqjVpuIOd43VNJOGZZnAcq7thzN7sNTtZ02SIv/ARQ/31karQroi7Wf5y
	AN3nsCfQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Simon Glass <sjg@chromium.org>, Fabio Estevam <festevam@nabladev.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Chukun Pan <amadeus@jmu.edu.cn>,
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>,
 FUKAUMI Naoki <naoki@radxa.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Jamie Iles <jamie@jamieiles.com>,
 Jeffy Chen <jeffy.chen@rock-chips.com>, Jiri Slaby <jirislaby@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jonathan Cameron <jic23@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Yao Zi <ziyao@disroot.org>,
 huang lin <hl@rock-chips.com>, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 00/12] Add support for the Rockchip RV1106 and RV1103
Date: Tue, 07 Jul 2026 09:41:41 +0200
Message-ID: <7403763.aoefvbuG5b@diego>
In-Reply-To: <882555c4-e1a3-0a0a-6830-b824b93cf3ac@nabladev.com>
References: <20260706195818.3906949-1-sjg@chromium.org>
 <882555c4-e1a3-0a0a-6830-b824b93cf3ac@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_004157_374282_E58DB7BD 
X-CRM114-Status: GOOD (  12.86  )
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

Am Dienstag, 7. Juli 2026, 00:54:44 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Fabio Estevam:
> Hi Simon,
>=20
> On Monday, July 06, 2026 16:57 -03, Simon Glass <sjg@chromium.org> wrote:
>=20
> > The series follows the structure of the recently merged RV1103B
> > support. The clock driver is ported from the vendor kernel and is the
>=20
> When I submitted the initial version of the RV1103B series, I received fe=
edback to split it into subsystems.=20
>=20
> You should do the same here and submit it per subsystem:
> ARM, clock, pinctrl, serial, mmc, watchdog, and iio.

correct ... ARM + clock can stay together, as that is my stuff, but for a
lot of maintainer it is just way easier to not have to pick apart series' .
(or even realize they are meant to do something)





