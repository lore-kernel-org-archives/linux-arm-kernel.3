Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C99BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 22:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqOChaSZ5mNzOHjnrSQyl4fbvGS4SDgoUW14pbM5IrM=; b=DXi6cskko0p701DDpRfG36Q8Cn
	c4RZkLDqR/wOLN2qcSZCa5VK3CwAvqclB4ZCqJ3OzFTG3OKTCqbd/jx+/1wQqMLy+QFOpipZT173I
	1bR9ltMYbdfX7XMlXprznOUD5PTNJVZ7OSvmFB5uoa2HZW4rgTi656+TcXnwD4EUvA6lEVkQOu5lk
	H3KviNiv11HnI+FUEvgGryZ59wm3Fu1UQUZ7quYugTbecljST+FRZWGQW2063uxLIFElfZupL7fyw
	+36scRnVnkqxdRsWf+BP7l8N86GifHlsKjyuk/MrtmHQJKr+rtGdd/VfSj4bXYUBpYodVTQUO5ZQo
	5++dmFhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgsDV-0000000Dkgs-28wp;
	Mon, 06 Jul 2026 22:55:09 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgsDS-0000000Dkfv-16Jh;
	Mon, 06 Jul 2026 22:55:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id A6517118E9C;
	Tue,  7 Jul 2026 00:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783378498;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yqOChaSZ5mNzOHjnrSQyl4fbvGS4SDgoUW14pbM5IrM=;
	b=N91q2DVrLhVhaY1zfNR7RwfRtnj3hnyquGke4MS17FCPbX3MDC1NPENUl8gIPyS2ir68pu
	GgskTiNDkSOU27umVmvh3sZgOXjWOx1S1qcfhEiRprC5tTBDEQSeFcTyhg6OtcfSl5QDRP
	Y6AGozqKXTV7SaaJczcFbneu9i/QrAdQFcAbz5op3wzvCwJT/XH5RlKYa1czGLbFVMy3ee
	DHQQxdb1eohVsJrjMn378/bsPNcLIlf67fbMyk+Fj3GEiS6Mr+j1lR1ecsJHZxwtWi35ki
	h7faeL/UF1XN6SEw23+jcYlADtsCJUr6m+9XvMHkc3AAGqYzp9zRmfsjZ0CUGw==
From: "Fabio Estevam" <festevam@nabladev.com>
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
Content-Type: text/plain; charset="utf-8"
References: <20260706195818.3906949-1-sjg@chromium.org>
Date: Tue, 07 Jul 2026 00:54:44 +0200
Cc: "Heiko Stuebner" <heiko@sntech.de>, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Albert Aribaud" <albert.u.boot@aribaud.net>, "Andy Shevchenko" <andy@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>, "Brian Masney" <bmasney@redhat.com>, "Chukun Pan" <amadeus@jmu.edu.cn>, "Conor Dooley" <conor+dt@kernel.org>, "David Lechner" <dlechner@baylibre.com>, "FUKAUMI Naoki" <naoki@radxa.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Guenter Roeck" <linux@roeck-us.net>, "Jamie Iles" <jamie@jamieiles.com>, "Jeffy Chen" <jeffy.chen@rock-chips.com>, "Jiri Slaby" <jirislaby@kernel.org>, "Jonas Karlman" <jonas@kwiboo.se>, "Jonathan Cameron" <jic23@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Michael Opdenacker" <michael.opdenacker@rootcommit.com>, "Michael Riesch" <michael.riesch@collabora.com>, "Michael Turquette" <mturquette@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Rob Herring" <robh@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>, "Ulf Hansson" <ulfh@kernel.org>, "Wim Van Sebroeck" <wim@linux-watchdog.org>, "Yao Zi" <ziyao@disroot.org>, "huang lin" <hl@rock-chips.com>, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
To: "Simon Glass" <sjg@chromium.org>
MIME-Version: 1.0
Message-ID: <882555c4-e1a3-0a0a-6830-b824b93cf3ac@nabladev.com>
Subject: =?utf-8?q?Re=3A?= [PATCH 00/12] Add support for the Rockchip RV1106 and 
 RV1103
User-Agent: SOGoMail 5.12.8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_155506_522058_9142908C 
X-CRM114-Status: UNSURE (   5.77  )
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

Hi Simon,

On Monday, July 06, 2026 16:57 -03, Simon Glass <sjg@chromium.org> wrot=
e:

> The series follows the structure of the recently merged RV1103B
> support. The clock driver is ported from the vendor kernel and is the

When I submitted the initial version of the RV1103B series, I received =
feedback to split it into subsystems.=20

You should do the same here and submit it per subsystem:
ARM, clock, pinctrl, serial, mmc, watchdog, and iio.


