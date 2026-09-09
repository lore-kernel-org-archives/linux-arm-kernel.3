Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6366C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=311691/uGkvvFKIwGpWDg1KsCLWCsJMoqMq4WdR/uMA=; b=aTmg70wbhSQjQG68pLoxXDYdw7
	+0F3khPZo2xRdEG90/p+qrQPkyAHzbvS4CR32NJQUh3QgO4bNTEmqBokB4Baii0rfpuC4Z0OpkyYJ
	s9rbSiiCWvVHlb3Sf6e0uiavyMiB2yqGjy4fNO8EI8pzWRvG5TgJx8Vsw8ztc9P4swgy+LgT0/pig
	43AD25MEEUqSd924pzlar9YJld75kxuZHOZY6kaUV1iYWHFiU2CU6HwR590sKJB94u4HrnZnYNvSD
	EfcGHLaAFISZO3fUnkAPZlMSB/JeIZvNu6zFb0ZMR7KbWPjsc4KU2S3gNb5MjE/rTA5FMYzVxJgTv
	Npzr0qDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ibj-0000000BpmJ-1h9P;
	Wed, 09 Sep 2026 13:44:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ibh-0000000Bplw-3Pcr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:44:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 40FE543977;
	Wed,  9 Sep 2026 13:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1BB1F00A3A;
	Wed,  9 Sep 2026 13:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788961497;
	bh=311691/uGkvvFKIwGpWDg1KsCLWCsJMoqMq4WdR/uMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dPYFSc7zuElgqPOrUvKFlinRxJJKwheHPvZj90jo4KmpnxV33/ufuBhrNpkTSj7xj
	 2RyspHqXkazeIpBw80R2fnKH5h7xSTHlRroygAHqghJUHmdY3lokSSP79WG/GJiDoB
	 oyBdDww+Ucy2ezUGrlZcwr9zvzgw4CaTeveT7WW6/oC56HlygAVyaKSTf4loP/g25/
	 JbuxGE+JuFDJrB1jVccueZ0gS7opSWr84NdE4okUrMy+Eb+npKXAoyFyecgv0dupb+
	 nOt/5qmgDw055SNzS9Q9wTx7telYpSpj52eSu7BEqy7RFlRlIIZ2qyITJuChYmq+Ij
	 Bdwur7Kmdt/Pg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1x4Ibe-00000002Iwf-0E2s;
	Wed, 09 Sep 2026 15:44:54 +0200
Date: Wed, 9 Sep 2026 15:44:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Sebastian Reichel <sre@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	patches@opensource.cirrus.com, linux-watchdog@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev
Subject: Re: [PATCH 09/14] mfd: remove unused lm3533 driver
Message-ID: <aqFi1qGC2QMzMAq9@hovoldconsulting.com>
References: <20260909132153.1596191-1-arnd@kernel.org>
 <20260909132153.1596191-10-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909132153.1596191-10-arnd@kernel.org>
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

On Wed, Sep 09, 2026 at 03:21:46PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This driver has apparently never had any users, as it does not support
> devicetree probing, and no lm3533_platform_data definition ever
> existed upstream.

I don't believe we ever required board files to be upstreamed?

There's also on-going work to enable devicetree support for this one:

	https://lore.kernel.org/lkml/20260617080031.99156-1-clamor95@gmail.com/

Johan

